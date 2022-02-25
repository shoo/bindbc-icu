/*******************************************************************************
 * umisc.h
 * 
 * C API: misc definitions
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * This file contains miscellaneous definitions for the C APIs.
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/umisc_8h.html
 */
@("icuuc") // this actually doesn't have a library associated
module bindbc.icu.bindings.umisc;

import bindbc.icu.bindings.utypes;

extern (C):

///
struct UFieldPosition {
	///
	int field;
	///
	int beginIndex;
	///
	int endIndex;
}

version (UCONFIG_NO_SERVICE)
{
}
else
{
	///
	alias URegistryKey = const(void)*;
}
