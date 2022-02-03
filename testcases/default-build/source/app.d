import std;

import bindbc.icu;

///
string guess(in Char[] textbuf)
{
	auto status = U_ZERO_ERROR;
	UCharsetDetector* detector = ucsdet_open(&status);
	enforce(U_SUCCESS(status));
	scope (exit)
		ucsdet_close(detector);
	
	ucsdet_setText(detector, textbuf.ptr, cast(int)textbuf.length, &status);
	enforce(U_SUCCESS(status));
	
	int found;
	auto matchers = ucsdet_detectAll(detector, &found, &status);
	
	foreach (i; 0..found)
	{
		immutable confidence = ucsdet_getConfidence(matchers[i], &status);
		enforce(U_SUCCESS(status));
		enforce(confidence >= 10);
		auto encoding = ucsdet_getName(matchers[i], &status);
		enforce(U_SUCCESS(status));
		return encoding.toStringFromAscii();
	}
	return null;
}

///
string convToUtf8(in Char[] buf, string charset)
{
	auto status = U_ZERO_ERROR;
	auto cnv = ucnv_open(charset.toAsciiCstr(), &status);
	enforce(U_SUCCESS(status));
	scope (exit)
		ucnv_close(cnv);
	
	auto app = appender!string;
	UChar[512] dstbuf;
	auto srcbufp = &buf[0];
	auto endsrcp = srcbufp + buf.length;
	auto dstbufp = &dstbuf[0];
	auto enddstp = dstbufp + dstbuf.length;
	while (srcbufp !is endsrcp)
	{
		auto dstp = dstbufp;
		ucnv_toUnicode(cnv, &dstp, enddstp, &srcbufp, endsrcp, null, true, &status);
		if (U_SUCCESS(status))
		{
			app ~= dstbuf[0..(dstp - dstbufp)].to!string;
			break;
		}
		enforce(status == U_BUFFER_OVERFLOW_ERROR);
		app ~= dstbuf[0..(dstp - dstbufp)].to!string;
		status = U_ZERO_ERROR;
	}
	return app.data;
}

///
string toStringFromAscii(in char* s)
{
	import core.stdc.string: strlen;
	auto len = strlen(s);
	// ASCII only == UTF-8
	return s[0..len+1].idup[0..len];
}

///
const(char)* toAsciiCstr(in char[] s)
{
	return (*((&s[0]) + s.length) == '\0') ? s.ptr : (s ~ '\0').ptr;
}

void testUloc()
{
	char[16] language;
	UErrorCode err;
	int len;

	len = uloc_getLanguage("ja_JP", language.ptr, language.length, &err);
	enforce(err == UErrorCode.init);
	enforce(language[0 .. len] == "ja", language[0 .. len]);

	auto iso3 = uloc_getISO3Language("ja");
	enforce(toStringFromAscii(iso3) == "jpn");

	enforce(uloc_getCharacterOrientation(ULOC_JAPANESE, &err) == ULayoutType.LTR);
	enforce(uloc_getCharacterOrientation("ar", &err) == ULayoutType.RTL);
}

int main()
{
	enforce(loadIcu() == IcuSupport.icu);
	scope (exit)
		unloadIcu();
	auto textbuf = cast(Char[])std.file.read("../.testresources/sjis.txt");
	auto charset = guess(textbuf);
	auto utfbuf  = convToUtf8(textbuf, charset);
	utfbuf.canFind("ほんとうに人間はいいものかしら。ほんとうに人間はいいものかしら").enforce();

	testUloc();
	return 0;
}
