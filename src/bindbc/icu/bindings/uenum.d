/*******************************************************************************
 * uenum.h
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/uenum_8h.html
 */
@("icuuc")
module bindbc.icu.bindings.uenum;

import bindbc.icu.bindings.utypes;

extern (C):

///
struct StringEnumeration {}

///
struct UEnumeration {}

///
void uenum_close_74(UEnumeration* en) @system;

///
int uenum_count_74(UEnumeration* en, UErrorCode* status);

///
const(UChar)* uenum_unext_74(UEnumeration* en, int* resultLength, UErrorCode* status);

///
const(char)* uenum_next_74(UEnumeration* en, int* resultLength, UErrorCode* status);

///
void uenum_reset_74(UEnumeration* en, UErrorCode* status);

///
UEnumeration* uenum_openFromStringEnumeration_74(StringEnumeration* adopted, UErrorCode* ec) @system;

///
UEnumeration* uenum_openUCharStringsEnumeration_74(const(UChar*)* strings, int count, UErrorCode* ec) @system;

///
UEnumeration* uenum_openCharStringsEnumeration_74(const(Char*)* strings, int count, UErrorCode* ec) @system;
