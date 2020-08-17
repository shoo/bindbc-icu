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
void uenum_close_67(UEnumeration* en) @system;

///
int uenum_count_67(UEnumeration* en, UErrorCode* status);

///
const(UChar)* uenum_unext_67(UEnumeration* en, int* resultLength, UErrorCode* status);

///
const(char)* uenum_next_67(UEnumeration* en, int* resultLength, UErrorCode* status);

///
void uenum_reset_67(UEnumeration* en, UErrorCode* status);

///
UEnumeration* uenum_openFromStringEnumeration_67(StringEnumeration* adopted, UErrorCode* ec) @system;

///
UEnumeration* uenum_openUCharStringsEnumeration_67(const(UChar*)* strings, int count, UErrorCode* ec) @system;

///
UEnumeration* uenum_openCharStringsEnumeration_67(const(char*)* strings, int count, UErrorCode* ec) @system;
