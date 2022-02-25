/*******************************************************************************
 * parseerr.h
 * 
 * C API: Parse Error Information
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/parseerr_8h.html
 */
@("icuuc") // this actually doesn't have a library associated
module bindbc.icu.bindings.parseerr;

import bindbc.icu.bindings.utypes;

extern (C):

///
enum U_PARSE_CONTEXT_LEN = 16;

///
struct UParseError
{
	///
	int line;
	///
	int offset;
	///
	UChar[U_PARSE_CONTEXT_LEN] preContext;
	///
	UChar[U_PARSE_CONTEXT_LEN] postContext;
}
