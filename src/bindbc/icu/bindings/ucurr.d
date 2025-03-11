/*******************************************************************************
 * ucurr.h
 * 
 * C API: Encapsulates information about a currency.
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/ucurr_8h.html
 */
@("icuuc")
module bindbc.icu.bindings.ucurr;

import bindbc.icu.bindings.utypes;
import bindbc.icu.bindings.uenum;

extern (C):

version (UCONFIG_NO_FORMATTING)
{
}
else:

///
enum UCurrencyUsage
{
	///
	UCURR_USAGE_STANDARD = 0,
	///
	UCURR_USAGE_CASH = 1,
}

///
int ucurr_forLocale_74(const(char)* locale,
	UChar* buff,
	int buffCapacity,
	UErrorCode* ec);

///
enum UCurrNameStyle
{
	///
	UCURR_SYMBOL_NAME,

	///
	UCURR_LONG_NAME,

	///
	UCURR_NARROW_SYMBOL_NAME,

	///
	UCURR_FORMAL_SYMBOL_NAME,

	///
	UCURR_VARIANT_SYMBOL_NAME
}

version (UCONFIG_NO_SERVICE)
{
}
else
{
	///
	alias UCurrRegistryKey = const(void)*;

	///
	UCurrRegistryKey ucurr_register_74(const(UChar)* isoCode,
		const(char)* locale,
		UErrorCode* status);

	///
	UBool ucurr_unregister_74(UCurrRegistryKey key, UErrorCode* status);
}

///
const(UChar)* ucurr_getName_74(const(UChar)* currency,
	const(char)* locale,
	UCurrNameStyle nameStyle,
	UBool* isChoiceFormat,
	int* len,
	UErrorCode* ec);

///
const(UChar)* ucurr_getPluralName_74(const(UChar)* currency,
	const(char)* locale,
	UBool* isChoiceFormat,
	const(char)* pluralCount,
	int* len,
	UErrorCode* ec);

///
int ucurr_getDefaultFractionDigits_74(const(UChar)* currency,
	UErrorCode* ec);

///
int ucurr_getDefaultFractionDigitsForUsage_74(const(UChar)* currency,
	const UCurrencyUsage usage,
	UErrorCode* ec);

///
double ucurr_getRoundingIncrement_74(const(UChar)* currency,
	UErrorCode* ec);

///
double ucurr_getRoundingIncrementForUsage_74(const(UChar)* currency,
	const UCurrencyUsage usage,
	UErrorCode* ec);

///
enum UCurrCurrencyType
{
	///
	UCURR_ALL = int.max,
	///
	UCURR_COMMON = 1,
	///
	UCURR_UNCOMMON = 2,
	///
	UCURR_DEPRECATED = 4,
	///
	UCURR_NON_DEPRECATED = 8
}

///
UEnumeration* ucurr_openISOCurrencies_74(uint currType, UErrorCode* pErrorCode);

///
UBool ucurr_isAvailable_74(const(UChar)* isoCode,
	UDate from,
	UDate to,
	UErrorCode* errorCode);

///
int ucurr_countCurrencies_74(const(char)* locale,
	UDate date,
	UErrorCode* ec);

///
int ucurr_forLocaleAndDate_74(const(char)* locale,
	UDate date,
	int index,
	UChar* buff,
	int buffCapacity,
	UErrorCode* ec);

///
UEnumeration* ucurr_getKeywordValuesForLocale_74(const(char)* key,
	const(char)* locale,
	UBool commonlyUsed,
	UErrorCode* status);

///
int ucurr_getNumericCode_74(const(UChar)* currency);
