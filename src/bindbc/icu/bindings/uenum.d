/*******************************************************************************
 * uenum.h
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
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
void uenum_close_69(UEnumeration* en) @system;

///
int uenum_count_69(UEnumeration* en, UErrorCode* status);

///
const(UChar)* uenum_unext_69(UEnumeration* en, int* resultLength, UErrorCode* status);

///
const(char)* uenum_next_69(UEnumeration* en, int* resultLength, UErrorCode* status);

///
void uenum_reset_69(UEnumeration* en, UErrorCode* status);

///
UEnumeration* uenum_openFromStringEnumeration_69(StringEnumeration* adopted, UErrorCode* ec) @system;

///
UEnumeration* uenum_openUCharStringsEnumeration_69(const(UChar*)* strings, int count, UErrorCode* ec) @system;

///
UEnumeration* uenum_openCharStringsEnumeration_69(const(Char*)* strings, int count, UErrorCode* ec) @system;
