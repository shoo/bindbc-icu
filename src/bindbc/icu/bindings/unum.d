/*******************************************************************************
 * unum.h
 * 
 * C API: Compatibility APIs for number formatting.
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/unum_8h.html
 */
@("icuin")
module bindbc.icu.bindings.unum;

import bindbc.icu.bindings.utypes;

extern (C):

version (UCONFIG_NO_FORMATTING)
{
}
else:

import bindbc.icu.bindings.uloc;
import bindbc.icu.bindings.ucurr;
import bindbc.icu.bindings.umisc;
import bindbc.icu.bindings.parseerr;
import bindbc.icu.bindings.uformattable;
import bindbc.icu.bindings.udisplaycontext;
import bindbc.icu.bindings.ufieldpositer;

///
alias UNumberFormat = void*;

///
enum UNumberFormatStyle
{
	///
	UNUM_PATTERN_DECIMAL = 0,
	///
	UNUM_DECIMAL = 1,
	///
	UNUM_CURRENCY = 2,
	///
	UNUM_PERCENT = 3,
	///
	UNUM_SCIENTIFIC = 4,
	///
	UNUM_SPELLOUT = 5,
	///
	UNUM_ORDINAL = 6,
	///
	UNUM_DURATION = 7,
	///
	UNUM_NUMBERING_SYSTEM = 8,
	///
	UNUM_PATTERN_RULEBASED = 9,
	///
	UNUM_CURRENCY_ISO = 10,
	///
	UNUM_CURRENCY_PLURAL = 11,
	///
	UNUM_CURRENCY_ACCOUNTING = 12,
	///
	UNUM_CASH_CURRENCY = 13,
	///
	UNUM_DECIMAL_COMPACT_SHORT = 14,
	///
	UNUM_DECIMAL_COMPACT_LONG = 15,
	///
	UNUM_CURRENCY_STANDARD = 16,

	///
	UNUM_DEFAULT = UNUM_DECIMAL,

	///
	UNUM_IGNORE = UNUM_PATTERN_DECIMAL
}

///
enum UNumberFormatPadPosition
{
	///
	UNUM_PAD_BEFORE_PREFIX,
	///
	UNUM_PAD_AFTER_PREFIX,
	///
	UNUM_PAD_BEFORE_SUFFIX,
	///
	UNUM_PAD_AFTER_SUFFIX
}

///
enum UNumberCompactStyle
{
	///
	UNUM_SHORT,
	///
	UNUM_LONG
}

///
enum UCurrencySpacing
{
	///
	UNUM_CURRENCY_MATCH,
	///
	UNUM_CURRENCY_SURROUNDING_MATCH,
	///
	UNUM_CURRENCY_INSERT,
}

///
enum UNumberFormatFields
{
	///
	UNUM_INTEGER_FIELD,
	///
	UNUM_FRACTION_FIELD,
	///
	UNUM_DECIMAL_SEPARATOR_FIELD,
	///
	UNUM_EXPONENT_SYMBOL_FIELD,
	///
	UNUM_EXPONENT_SIGN_FIELD,
	///
	UNUM_EXPONENT_FIELD,
	///
	UNUM_GROUPING_SEPARATOR_FIELD,
	///
	UNUM_CURRENCY_FIELD,
	///
	UNUM_PERCENT_FIELD,
	///
	UNUM_PERMILL_FIELD,
	///
	UNUM_SIGN_FIELD,
	///
	UNUM_MEASURE_UNIT_FIELD,
	///
	UNUM_COMPACT_FIELD,
	///
	UNUM_APPROXIMATELY_SIGN_FIELD,
}

///
enum UNumberFormatMinimumGroupingDigits
{
	///
	UNUM_MINIMUM_GROUPING_DIGITS_AUTO = -2,
	///
	UNUM_MINIMUM_GROUPING_DIGITS_MIN2 = -3,
}

///
UNumberFormat* unum_open_74(UNumberFormatStyle style,
	const(UChar)* pattern,
	int patternLength,
	const(char)* locale,
	UParseError* parseErr,
	UErrorCode* status);

///
void unum_close_74(UNumberFormat* fmt);

///
UNumberFormat* unum_clone_74(const(UNumberFormat)* fmt,
	UErrorCode* status);

///
int unum_format_74(const(UNumberFormat)* fmt,
	int number,
	UChar* result,
	int resultLength,
	UFieldPosition* pos,
	UErrorCode* status);

///
int unum_formatInt64_74(const(UNumberFormat)* fmt,
	long number,
	UChar* result,
	int resultLength,
	UFieldPosition* pos,
	UErrorCode* status);

///
int unum_formatDouble_74(const(UNumberFormat)* fmt,
	double number,
	UChar* result,
	int resultLength,
	UFieldPosition* pos, /* 0 if ignore */
	UErrorCode* status);

///
int unum_formatDoubleForFields_74(const(UNumberFormat)* format,
	double number,
	UChar* result,
	int resultLength,
	UFieldPositionIterator* fpositer,
	UErrorCode* status);

///
int unum_formatDecimal_74(const(UNumberFormat)* fmt,
	const(char)* number,
	int length,
	UChar* result,
	int resultLength,
	UFieldPosition* pos, /* null if ignore */
	UErrorCode* status);

///
int unum_formatDoubleCurrency_74(const(UNumberFormat)* fmt,
	double number,
	UChar* currency,
	UChar* result,
	int resultLength,
	UFieldPosition* pos,
	UErrorCode* status);

///
int unum_formatUFormattable_74(const(UNumberFormat)* fmt,
	const(UFormattable)* number,
	UChar* result,
	int resultLength,
	UFieldPosition* pos,
	UErrorCode* status);

///
int unum_parse_74(const(UNumberFormat)* fmt,
	const(UChar)* text,
	int textLength,
	int* parsePos /* 0 = start */ ,
	UErrorCode* status);

///
long unum_parseInt64_74(const(UNumberFormat)* fmt,
	const(UChar)* text,
	int textLength,
	int* parsePos /* 0 = start */ ,
	UErrorCode* status);

///
double unum_parseDouble_74(const(UNumberFormat)* fmt,
	const(UChar)* text,
	int textLength,
	int* parsePos /* 0 = start */ ,
	UErrorCode* status);

///
int unum_parseDecimal_74(const(UNumberFormat)* fmt,
	const(UChar)* text,
	int textLength,
	int* parsePos /* 0 = start */ ,
	char* outBuf,
	int outBufLength,
	UErrorCode* status);

///
double unum_parseDoubleCurrency_74(const(UNumberFormat)* fmt,
	const(UChar)* text,
	int textLength,
	int* parsePos, /* 0 = start */
	UChar* currency,
	UErrorCode* status);

///
UFormattable* unum_parseToUFormattable_74(const(UNumberFormat)* fmt,
	UFormattable* result,
	const(UChar)* text,
	int textLength,
	int* parsePos, /* 0 = start */
	UErrorCode* status);

///
void unum_applyPattern_74(UNumberFormat* format,
	UBool localized,
	const(UChar)* pattern,
	int patternLength,
	UParseError* parseError,
	UErrorCode* status
);

///
const(char)* unum_getAvailable_74(int localeIndex);

///
int unum_countAvailable_74();

version (UCONFIG_HAVE_PARSEALLINPUT)
{
	///
	enum UNumberFormatAttributeValue
	{
		///
		UNUM_FORMAT_ATTRIBUTE_VALUE_HIDDEN
	}
	///
	enum UNUM_PARSE_ALL_INPUT = cast(UNumberFormatAttribute) 20;
}

///
enum UNumberFormatAttribute
{
	///
	UNUM_PARSE_INT_ONLY,
	///
	UNUM_GROUPING_USED,
	///
	UNUM_DECIMAL_ALWAYS_SHOWN,
	///
	UNUM_MAX_INTEGER_DIGITS,
	///
	UNUM_MIN_INTEGER_DIGITS,
	///
	UNUM_INTEGER_DIGITS,
	///
	UNUM_MAX_FRACTION_DIGITS,
	///
	UNUM_MIN_FRACTION_DIGITS,
	///
	UNUM_FRACTION_DIGITS,
	///
	UNUM_MULTIPLIER,
	///
	UNUM_GROUPING_SIZE,
	///
	UNUM_ROUNDING_MODE,
	///
	UNUM_ROUNDING_INCREMENT,
	///
	UNUM_FORMAT_WIDTH,
	///
	UNUM_PADDING_POSITION,
	///
	UNUM_SECONDARY_GROUPING_SIZE,
	///
	UNUM_SIGNIFICANT_DIGITS_USED,
	///
	UNUM_MIN_SIGNIFICANT_DIGITS,
	///
	UNUM_MAX_SIGNIFICANT_DIGITS,
	///
	UNUM_LENIENT_PARSE,
	///
	UNUM_SCALE = 21,

	///
	UNUM_MINIMUM_GROUPING_DIGITS = 22,

	///
	UNUM_CURRENCY_USAGE = 23,

	///
	UNUM_FORMAT_FAIL_IF_MORE_THAN_MAX_DIGITS = 0x1000,
	///
	UNUM_PARSE_NO_EXPONENT = 0x1001,

	///
	UNUM_PARSE_DECIMAL_MARK_REQUIRED = 0x1002,

	///
	UNUM_PARSE_CASE_SENSITIVE = 0x1003,

	///
	UNUM_SIGN_ALWAYS_SHOWN = 0x1004,
}

///
bool unum_hasAttribute_74(const(UNumberFormat)* fmt,
	UNumberFormatAttribute attr);

///
int unum_getAttribute_74(const(UNumberFormat)* fmt,
	UNumberFormatAttribute attr);

///
void unum_setAttribute_74(UNumberFormat* fmt,
	UNumberFormatAttribute attr,
	int newValue);

///
double unum_getDoubleAttribute_74(const(UNumberFormat)* fmt,
	UNumberFormatAttribute attr);

///
void unum_setDoubleAttribute_74(UNumberFormat* fmt,
	UNumberFormatAttribute attr,
	double newValue);

///
enum UNumberFormatTextAttribute
{
	///
	UNUM_POSITIVE_PREFIX,
	///
	UNUM_POSITIVE_SUFFIX,
	///
	UNUM_NEGATIVE_PREFIX,
	///
	UNUM_NEGATIVE_SUFFIX,
	///
	UNUM_PADDING_CHARACTER,
	///
	UNUM_CURRENCY_CODE,
	///
	UNUM_DEFAULT_RULESET,
	///
	UNUM_PUBLIC_RULESETS
}

///
int unum_getTextAttribute_74(const(UNumberFormat)* fmt,
	UNumberFormatTextAttribute tag,
	UChar* result,
	int resultLength,
	UErrorCode* status);

///
void unum_setTextAttribute_74(UNumberFormat* fmt,
	UNumberFormatTextAttribute tag,
	const(UChar)* newValue,
	int newValueLength,
	UErrorCode* status);

///
int unum_toPattern_74(const(UNumberFormat)* fmt,
	UBool isPatternLocalized,
	UChar* result,
	int resultLength,
	UErrorCode* status);

///
enum UNumberFormatSymbol
{
	///
	UNUM_DECIMAL_SEPARATOR_SYMBOL = 0,
	///
	UNUM_GROUPING_SEPARATOR_SYMBOL = 1,
	///
	UNUM_PATTERN_SEPARATOR_SYMBOL = 2,
	///
	UNUM_PERCENT_SYMBOL = 3,
	///
	UNUM_ZERO_DIGIT_SYMBOL = 4,
	///
	UNUM_DIGIT_SYMBOL = 5,
	///
	UNUM_MINUS_SIGN_SYMBOL = 6,
	///
	UNUM_PLUS_SIGN_SYMBOL = 7,
	///
	UNUM_CURRENCY_SYMBOL = 8,
	///
	UNUM_INTL_CURRENCY_SYMBOL = 9,
	///
	UNUM_MONETARY_SEPARATOR_SYMBOL = 10,
	///
	UNUM_EXPONENTIAL_SYMBOL = 11,
	///
	UNUM_PERMILL_SYMBOL = 12,
	///
	UNUM_PAD_ESCAPE_SYMBOL = 13,
	///
	UNUM_INFINITY_SYMBOL = 14,
	///
	UNUM_NAN_SYMBOL = 15,
	///
	UNUM_SIGNIFICANT_DIGIT_SYMBOL = 16,
	///
	UNUM_MONETARY_GROUPING_SEPARATOR_SYMBOL = 17,
	///
	UNUM_ONE_DIGIT_SYMBOL = 18,
	///
	UNUM_TWO_DIGIT_SYMBOL = 19,
	///
	UNUM_THREE_DIGIT_SYMBOL = 20,
	///
	UNUM_FOUR_DIGIT_SYMBOL = 21,
	///
	UNUM_FIVE_DIGIT_SYMBOL = 22,
	///
	UNUM_SIX_DIGIT_SYMBOL = 23,
	///
	UNUM_SEVEN_DIGIT_SYMBOL = 24,
	///
	UNUM_EIGHT_DIGIT_SYMBOL = 25,
	///
	UNUM_NINE_DIGIT_SYMBOL = 26,

	///
	UNUM_EXPONENT_MULTIPLICATION_SYMBOL = 27,
}

///
int unum_getSymbol_74(const(UNumberFormat)* fmt,
	UNumberFormatSymbol symbol,
	UChar* buffer,
	int size,
	UErrorCode* status);

///
void unum_setSymbol_74(UNumberFormat* fmt,
	UNumberFormatSymbol symbol,
	const(UChar)* value,
	int length,
	UErrorCode* status);

///
const(char)* unum_getLocaleByType_74(const(UNumberFormat)* fmt,
	ULocDataLocaleType type,
	UErrorCode* status);

///
void unum_setContext_74(UNumberFormat* fmt, UDisplayContext value, UErrorCode* status);

///
UDisplayContext unum_getContext_74(const(UNumberFormat)* fmt,
	UDisplayContextType type,
	UErrorCode* status);
