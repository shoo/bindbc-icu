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
	enforce(U_SUCCESS(err));
	enforce(language[0 .. len] == "ja", language[0 .. len]);

	auto iso3 = uloc_getISO3Language("ja");
	enforce(toStringFromAscii(iso3) == "jpn");

	enforce(uloc_getCharacterOrientation(ULOC_JAPANESE, &err) == ULayoutType.LTR);
	enforce(uloc_getCharacterOrientation("ar", &err) == ULayoutType.RTL);
}

void testUcurr()
{
	UChar[16] curr;
	UErrorCode err;
	int len;
	UDate date = SysTime(DateTime(2020, 1, 1, 12, 0, 0), UTC()).toUnixTime!long * 1000.0;
	static immutable wstring[] expectedCurrencies = ["PAB", "USD"];

	int currencyCount = ucurr_countCurrencies("es_PA", date, &err);
	enforce(U_SUCCESS(err), err.to!string);
	enforce(currencyCount == 2, currencyCount.to!string);

	foreach (i; 0 .. currencyCount)
	{
		len = ucurr_forLocaleAndDate("es_PA", date, i + 1, curr.ptr, curr.length, &err);
		enforce(U_SUCCESS(err));
		enforce(expectedCurrencies[i] == curr[0 .. len]);
	}
}

void testUformattable()
{
	UErrorCode err;
	auto v = ufmt_open(&err);
	enforce(U_SUCCESS(err), err.to!string);
	scope (exit)
		ufmt_close(v);

	enforce(ufmt_getType(v, &err) == UFormattableType.UFMT_LONG);
	enforce(U_SUCCESS(err), err.to!string);
	enforce(ufmt_isNumeric(v));
	enforce(ufmt_getLong(v, &err) == 0);
	enforce(U_SUCCESS(err), err.to!string);
}

void testUnum()
{
	struct Test
	{
		string locale;
		wstring currency;
		wstring expectedPos;
		wstring expectedNeg;
	}

	UParseError parseError;
	UErrorCode err;

	wchar[64] bufferPos;
	wchar[64] bufferNeg;
	UFieldPosition position;

	double pos = 12345.6789;
	double neg = -12345.6789;

	static foreach (test; [
		Test("es_PA", "PAB\0"w, "B/.\u00a012,345.68", "-B/.\u00a012,345.68"),
		Test("ja_JP", "JPY\0"w, "￥12,346", "-￥12,346"),
		Test("de_DE", "EUR\0"w, "12.345,68\u00a0€", "-12.345,68\u00a0€"),
		Test("nl_NL", "EUR\0"w, "€\u00a012.345,68", "€\u00a0-12.345,68"),
		Test("en_UK", "GBP\0"w, "£12,345.68", "-£12,345.68"),
		Test("da_DK", "DKK\0"w, "12.345,68\u00a0kr.", "-12.345,68\u00a0kr."),
		Test("en_UK", "USD\0"w, "$12,345.68", "-$12,345.68"),
		Test("en_US", "USD\0"w, "$12,345.68", "-$12,345.68"),
		Test("fr_CH", "EUR\0"w, "12\u202f345.68\u00a0€", "-12\u202f345.68\u00a0€"),
	])
	{{
		auto fmt = unum_open(UNumberFormatStyle.UNUM_CURRENCY, null, 0, test.locale, &parseError, &err);
		enforce(fmt);
		scope (exit)
			unum_close(fmt);
		enforce(U_SUCCESS(err), err.to!string);

		int lenPos = unum_formatDoubleCurrency(fmt, pos, test.currency.dup.ptr, bufferPos.ptr, bufferPos.length, &position, &err);
		enforce(U_SUCCESS(err), err.to!string);
		int lenNeg = unum_formatDoubleCurrency(fmt, neg, test.currency.dup.ptr, bufferNeg.ptr, bufferNeg.length, &position, &err);
		enforce(U_SUCCESS(err), err.to!string);

		enforce(bufferPos[0 .. lenPos] == test.expectedPos, text(bufferPos[0 .. lenPos], " != ", test.expectedPos));
		enforce(bufferNeg[0 .. lenNeg] == test.expectedNeg, text(bufferNeg[0 .. lenNeg], " != ", test.expectedNeg));
	}}
}

int main()
{
	if (loadIcu() != IcuSupport.icu)
	{
		import bindbc.loader;
		foreach (error; bindbc.loader.errors)
			printf("%s\t%s\n", error.error, error.message);
		throw new Exception("ICU not loaded correctly");
	}
	scope (exit)
		unloadIcu();
	auto textbuf = cast(Char[])std.file.read("../.testresources/sjis.txt");
	auto charset = guess(textbuf);
	auto utfbuf  = convToUtf8(textbuf, charset);
	utfbuf.canFind("ほんとうに人間はいいものかしら。ほんとうに人間はいいものかしら").enforce();

	testUloc();
	testUcurr();
	testUformattable();
	testUnum();

	return 0;
}
