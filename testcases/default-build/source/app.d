import std;

import bindbc.icu;

int main()
{
	loadIcu();
	
	auto status = U_ZERO_ERROR;
	UCharsetDetector* detector = ucsdet_open(&status);
	enforce(U_SUCCESS(status));
	scope (exit)
		ucsdet_close(detector);
	
	auto textbuf = cast(char[])std.file.read("../.testresources/sjis.txt");
	
	ucsdet_setText(detector, textbuf.ptr, cast(int)textbuf.length, &status);
	enforce(U_SUCCESS(status));
	
	int found;
	auto matchers = ucsdet_detectAll(detector, &found, &status);
	
	string[] results;
	foreach (i; 0..found)
	{
		auto confidence = ucsdet_getConfidence(matchers[i], &status);
		enforce(U_SUCCESS(status));
		
		if (confidence < 10)
			break;
		
		auto encoding = ucsdet_getName(matchers[i], &status);
		enforce(U_SUCCESS(status));
		
		results ~= encoding.toStringFromAscii();
	}
	
	results.canFind("Shift_JIS").enforce();
	
	return 0;
}

///
string toStringFromAscii(in char* s)
{
	import core.stdc.string;
	auto len = strlen(s);
	// ASCII only == UTF-8
	return s[0..len].idup;
}
