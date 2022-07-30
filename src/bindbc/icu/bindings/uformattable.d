/*******************************************************************************
 * uformattable.h
 * 
 * C API: UFormattable is a thin wrapper for primitive types used for formatting and parsing.
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/uformattable_8h.html
 */
@("icuin")
module bindbc.icu.bindings.uformattable;

import bindbc.icu.bindings.utypes;

extern (C):

version (UCONFIG_NO_FORMATTING)
{
}
else:

///
enum UFormattableType
{
	UFMT_DATE = 0, /// $(LREF ufmt_getDate) will return without conversion
	UFMT_DOUBLE, /// $(LREF ufmt_getDouble) will return without conversion
	UFMT_LONG, /// $(LREF ufmt_getLong) will return without conversion
	UFMT_STRING, /// $(LREF ufmt_getUChars) will return without conversion
	UFMT_ARRAY, /// $(LREF ufmt_countArray) and $(LREF ufmt_getArray) will return the value. See also: $(LREF ufmt_getArrayItemByIndex)
	UFMT_INT64, /// $(LREF ufmt_getInt64) will return without conversion
	UFMT_OBJECT, /// $(LREF ufmt_getObject) will return without conversion
}

///
alias UFormattable = void*;

///
UFormattable* ufmt_open_70(UErrorCode* status);

///
void ufmt_close_70(UFormattable* fmt);

///
UFormattableType ufmt_getType_70(const(UFormattable)* fmt, UErrorCode* status);

///
UBool ufmt_isNumeric_70(const(UFormattable)* fmt);

///
UDate ufmt_getDate_70(const(UFormattable)* fmt, UErrorCode* status);

///
double ufmt_getDouble_70(UFormattable* fmt, UErrorCode* status);

///
int ufmt_getLong_70(UFormattable* fmt, UErrorCode* status);

///
long ufmt_getInt64_70(UFormattable* fmt, UErrorCode* status);

///
const(void)* ufmt_getObject_70(const(UFormattable)* fmt, UErrorCode* status);

///
const(UChar)* ufmt_getUChars_70(UFormattable* fmt, int* len, UErrorCode* status);

///
int ufmt_getArrayLength_70(const(UFormattable)* fmt, UErrorCode* status);

///
UFormattable* ufmt_getArrayItemByIndex_70(UFormattable* fmt, int n, UErrorCode* status);

///
const(char)* ufmt_getDecNumChars_70(UFormattable* fmt, int* len, UErrorCode* status);
