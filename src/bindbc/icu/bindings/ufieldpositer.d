/*******************************************************************************
 * ufieldpositer.h
 * 
 * C API: UFieldPositionIterator for use with format APIs.
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/ufieldpositer_8h.html
 */
@("icuin")
module bindbc.icu.bindings.ufieldpositer;

import bindbc.icu.bindings.utypes;

extern (C):

version (UCONFIG_NO_FORMATTING)
{
}
else:

///
struct UFieldPositionIterator;

///
UFieldPositionIterator* ufieldpositer_open_69(UErrorCode* status);

///
void ufieldpositer_close_69(UFieldPositionIterator* fpositer);

///
int ufieldpositer_next_69(UFieldPositionIterator* fpositer,
	int* beginIndex, int* endIndex);
