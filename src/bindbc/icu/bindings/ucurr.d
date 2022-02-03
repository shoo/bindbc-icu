/*******************************************************************************
 * ucurr.h
 * 
 * C API: Encapsulates information about a currency.
 * 
 * License:
 * COPYRIGHT AND PERMISSION NOTICE (ICU 58 and later)
 * 
 * Copyright © 1991-2020 Unicode, Inc. All rights reserved.
 * Distributed under the Terms of Use in https://www.unicode.org/copyright.html.
 * 
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of the Unicode data files and any associated documentation
 * (the "Data Files") or Unicode software and any associated documentation
 * (the "Software") to deal in the Data Files or Software
 * without restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, and/or sell copies of
 * the Data Files or Software, and to permit persons to whom the Data Files
 * or Software are furnished to do so, provided that either
 * (a) this copyright and permission notice appear with all copies
 * of the Data Files or Software, or
 * (b) this copyright and permission notice appear in associated
 * Documentation.
 * 
 * THE DATA FILES AND SOFTWARE ARE PROVIDED "AS IS", WITHOUT WARRANTY OF
 * ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 * WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT OF THIRD PARTY RIGHTS.
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER OR HOLDERS INCLUDED IN THIS
 * NOTICE BE LIABLE FOR ANY CLAIM, OR ANY SPECIAL INDIRECT OR CONSEQUENTIAL
 * DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
 * DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
 * TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
 * PERFORMANCE OF THE DATA FILES OR SOFTWARE.
 * 
 * Except as contained in this notice, the name of a copyright holder
 * shall not be used in advertising or otherwise to promote the sale,
 * use or other dealings in these Data Files or Software without prior
 * written authorization of the copyright holder.
 *
 * The ucurr API encapsulates information about a currency, as defined by
 * ISO 4217.  A currency is represented by a 3-character string
 * containing its ISO 4217 code.  This API can return various data
 * necessary the proper display of a currency:
 *
 * <ul><li>A display symbol, for a specific locale
 * <li>The number of fraction digits to display
 * <li>A rounding increment
 * </ul>
 *
 * The <tt>DecimalFormat</tt> class uses these data to display
 * currencies.
 * @author Alan Liu
 * @since ICU 2.2
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

/**
 * Currency Usage used for Decimal Format
 * @stable ICU 54
 */
enum UCurrencyUsage
{
	/**
	 * a setting to specify currency usage which determines currency digit
	 * and rounding for standard usage, for example: "50.00 NT$"
	 * used as DEFAULT value
	 * @stable ICU 54
	 */
	UCURR_USAGE_STANDARD = 0,
	/**
	 * a setting to specify currency usage which determines currency digit
	 * and rounding for cash usage, for example: "50 NT$"
	 * @stable ICU 54
	 */
	UCURR_USAGE_CASH = 1,
}

/**
 * Finds a currency code for the given locale.
 * @param locale the locale for which to retrieve a currency code. 
 *               Currency can be specified by the "currency" keyword
 *               in which case it overrides the default currency code
 * @param buff   fill in buffer. Can be NULL for preflighting.
 * @param buffCapacity capacity of the fill in buffer. Can be 0 for
 *               preflighting. If it is non-zero, the buff parameter
 *               must not be NULL.
 * @param ec error code
 * @return length of the currency string. It should always be 3. If 0,
 *                currency couldn't be found or the input values are 
 *                invalid. 
 * @stable ICU 2.8
 */
int ucurr_forLocale_69(const(char)* locale,
	UChar* buff,
	int buffCapacity,
	UErrorCode* ec);

/**
 * Selector constants for ucurr_getName().
 *
 * @see ucurr_getName
 * @stable ICU 2.6
 */
enum UCurrNameStyle
{
	/**
	 * Selector for ucurr_getName indicating a symbolic name for a
	 * currency, such as "$" for USD.
	 * @stable ICU 2.6
	 */
	UCURR_SYMBOL_NAME,

	/**
	 * Selector for ucurr_getName indicating the long name for a
	 * currency, such as "US Dollar" for USD.
	 * @stable ICU 2.6
	 */
	UCURR_LONG_NAME,

	/**
	 * Selector for getName() indicating the narrow currency symbol.
	 * The narrow currency symbol is similar to the regular currency
	 * symbol, but it always takes the shortest form: for example,
	 * "$" instead of "US$" for USD in en-CA.
	 *
	 * @stable ICU 61
	 */
	UCURR_NARROW_SYMBOL_NAME,

	/**
	 * Selector for getName() indicating the formal currency symbol.
	 * The formal currency symbol is similar to the regular currency
	 * symbol, but it always takes the form used in formal settings
	 * such as banking; for example, "NT$" instead of "$" for TWD in zh-TW.
	 *
	 * @stable ICU 68
	 */
	UCURR_FORMAL_SYMBOL_NAME,

	/**
	 * Selector for getName() indicating the variant currency symbol.
	 * The variant symbol for a currency is an alternative symbol
	 * that is not necessarily as widely used as the regular symbol.
	 *
	 * @stable ICU 68
	 */
	UCURR_VARIANT_SYMBOL_NAME
}

version (UCONFIG_NO_SERVICE)
{
}
else
{
	/**
	* @stable ICU 2.6
	*/
	alias UCurrRegistryKey = const(void)*;

	/**
	* Register an (existing) ISO 4217 currency code for the given locale.
	* Only the country code and the two variants EURO and PRE_EURO are
	* recognized.
	* @param isoCode the three-letter ISO 4217 currency code
	* @param locale  the locale for which to register this currency code
	* @param status the in/out status code
	* @return a registry key that can be used to unregister this currency code, or NULL
	* if there was an error.
	* @stable ICU 2.6
	*/
	UCurrRegistryKey ucurr_register_69(const(UChar)* isoCode,
		const(char)* locale,
		UErrorCode* status);
	/**
	* Unregister the previously-registered currency definitions using the
	* URegistryKey returned from ucurr_register.  Key becomes invalid after
	* a successful call and should not be used again.  Any currency 
	* that might have been hidden by the original ucurr_register call is 
	* restored.
	* @param key the registry key returned by a previous call to ucurr_register
	* @param status the in/out status code, no special meanings are assigned
	* @return true if the currency for this key was successfully unregistered
	* @stable ICU 2.6
	*/
	UBool ucurr_unregister_69(UCurrRegistryKey key, UErrorCode* status);
}

/**
 * Returns the display name for the given currency in the
 * given locale.  For example, the display name for the USD
 * currency object in the en_US locale is "$".
 * @param currency null-terminated 3-letter ISO 4217 code
 * @param locale locale in which to display currency
 * @param nameStyle selector for which kind of name to return
 * @param isChoiceFormat always set to false, or can be NULL;
 *     display names are static strings;
 *     since ICU 4.4, ChoiceFormat patterns are no longer supported
 * @param len fill-in parameter to receive length of result
 * @param ec error code
 * @return pointer to display string of 'len' UChars.  If the resource
 * data contains no entry for 'currency', then 'currency' itself is
 * returned.
 * @stable ICU 2.6
 */
const(UChar)* ucurr_getName_69(const(UChar)* currency,
	const(char)* locale,
	UCurrNameStyle nameStyle,
	UBool* isChoiceFormat,
	int* len,
	UErrorCode* ec);

/**
 * Returns the plural name for the given currency in the
 * given locale.  For example, the plural name for the USD
 * currency object in the en_US locale is "US dollar" or "US dollars".
 * @param currency null-terminated 3-letter ISO 4217 code
 * @param locale locale in which to display currency
 * @param isChoiceFormat always set to false, or can be NULL;
 *     display names are static strings;
 *     since ICU 4.4, ChoiceFormat patterns are no longer supported
 * @param pluralCount plural count
 * @param len fill-in parameter to receive length of result
 * @param ec error code
 * @return pointer to display string of 'len' UChars.  If the resource
 * data contains no entry for 'currency', then 'currency' itself is
 * returned.
 * @stable ICU 4.2
 */
const(UChar)* ucurr_getPluralName_69(const(UChar)* currency,
	const(char)* locale,
	UBool* isChoiceFormat,
	const(char)* pluralCount,
	int* len,
	UErrorCode* ec);

/**
 * Returns the number of the number of fraction digits that should
 * be displayed for the given currency.
 * This is equivalent to ucurr_getDefaultFractionDigitsForUsage(currency,UCURR_USAGE_STANDARD,ec);
 *
 * Important: The number of fraction digits for a given currency is NOT
 * guaranteed to be constant across versions of ICU or CLDR. For example,
 * do NOT use this value as a mechanism for deciding the magnitude used
 * to store currency values in a database. You should use this value for
 * display purposes only.
 *
 * @param currency null-terminated 3-letter ISO 4217 code
 * @param ec input-output error code
 * @return a non-negative number of fraction digits to be
 * displayed, or 0 if there is an error
 * @stable ICU 3.0
 */
int ucurr_getDefaultFractionDigits_69(const(UChar)* currency,
	UErrorCode* ec);

/**
 * Returns the number of the number of fraction digits that should
 * be displayed for the given currency with usage.
 *
 * Important: The number of fraction digits for a given currency is NOT
 * guaranteed to be constant across versions of ICU or CLDR. For example,
 * do NOT use this value as a mechanism for deciding the magnitude used
 * to store currency values in a database. You should use this value for
 * display purposes only.
 *
 * @param currency null-terminated 3-letter ISO 4217 code
 * @param usage enum usage for the currency
 * @param ec input-output error code
 * @return a non-negative number of fraction digits to be
 * displayed, or 0 if there is an error
 * @stable ICU 54
 */
int ucurr_getDefaultFractionDigitsForUsage_69(const(UChar)* currency,
	const UCurrencyUsage usage,
	UErrorCode* ec);

/**
 * Returns the rounding increment for the given currency, or 0.0 if no
 * rounding is done by the currency.
 * This is equivalent to ucurr_getRoundingIncrementForUsage(currency,UCURR_USAGE_STANDARD,ec);
 * @param currency null-terminated 3-letter ISO 4217 code
 * @param ec input-output error code
 * @return the non-negative rounding increment, or 0.0 if none,
 * or 0.0 if there is an error
 * @stable ICU 3.0
 */
double ucurr_getRoundingIncrement_69(const(UChar)* currency,
	UErrorCode* ec);

/**
 * Returns the rounding increment for the given currency, or 0.0 if no
 * rounding is done by the currency given usage.
 * @param currency null-terminated 3-letter ISO 4217 code
 * @param usage enum usage for the currency
 * @param ec input-output error code
 * @return the non-negative rounding increment, or 0.0 if none,
 * or 0.0 if there is an error
 * @stable ICU 54
 */
double ucurr_getRoundingIncrementForUsage_69(const(UChar)* currency,
	const UCurrencyUsage usage,
	UErrorCode* ec);

/**
 * Selector constants for ucurr_openCurrencies().
 *
 * @see ucurr_openCurrencies
 * @stable ICU 3.2
 */
enum UCurrCurrencyType
{
	/**
	 * Select all ISO-4217 currency codes.
	 * @stable ICU 3.2
	 */
	UCURR_ALL = int.max,
	/**
	 * Select only ISO-4217 commonly used currency codes.
	 * These currencies can be found in common use, and they usually have
	 * bank notes or coins associated with the currency code.
	 * This does not include fund codes, precious metals and other
	 * various ISO-4217 codes limited to special financial products.
	 * @stable ICU 3.2
	 */
	UCURR_COMMON = 1,
	/**
	 * Select ISO-4217 uncommon currency codes.
	 * These codes respresent fund codes, precious metals and other
	 * various ISO-4217 codes limited to special financial products.
	 * A fund code is a monetary resource associated with a currency.
	 * @stable ICU 3.2
	 */
	UCURR_UNCOMMON = 2,
	/**
	 * Select only deprecated ISO-4217 codes.
	 * These codes are no longer in general public use.
	 * @stable ICU 3.2
	 */
	UCURR_DEPRECATED = 4,
	/**
	 * Select only non-deprecated ISO-4217 codes.
	 * These codes are in general public use.
	 * @stable ICU 3.2
	 */
	UCURR_NON_DEPRECATED = 8
}

/**
 * Provides a UEnumeration object for listing ISO-4217 codes.
 * @param currType You can use one of several UCurrCurrencyType values for this
 *      variable. You can also | (or) them together to get a specific list of
 *      currencies. Most people will want to use the (UCURR_COMMON|UCURR_NON_DEPRECATED) value to
 *      get a list of current currencies.
 * @param pErrorCode Error code
 * @stable ICU 3.2
 */
UEnumeration* ucurr_openISOCurrencies_69(uint currType, UErrorCode* pErrorCode);

/**
  * Queries if the given ISO 4217 3-letter code is available on the specified date range. 
  * 
  * Note: For checking availability of a currency on a specific date, specify the date on both 'from' and 'to' 
  * 
  * When 'from' is U_DATE_MIN and 'to' is U_DATE_MAX, this method checks if the specified currency is available any time. 
  * If 'from' and 'to' are same UDate value, this method checks if the specified currency is available on that date.
  * 
  * @param isoCode 
  *            The ISO 4217 3-letter code. 
  * 
  * @param from 
  *            The lower bound of the date range, inclusive. When 'from' is U_DATE_MIN, check the availability 
  *            of the currency any date before 'to' 
  * 
  * @param to 
  *            The upper bound of the date range, inclusive. When 'to' is U_DATE_MAX, check the availability of 
  *            the currency any date after 'from' 
  * 
  * @param errorCode 
  *            ICU error code 
   * 
  * @return true if the given ISO 4217 3-letter code is supported on the specified date range. 
  * 
  * @stable ICU 4.8 
  */
UBool ucurr_isAvailable_69(const(UChar)* isoCode,
	UDate from,
	UDate to,
	UErrorCode* errorCode);

/** 
 * Finds the number of valid currency codes for the
 * given locale and date.
 * @param locale the locale for which to retrieve the
 *               currency count.
 * @param date   the date for which to retrieve the
 *               currency count for the given locale.
 * @param ec     error code
 * @return       the number of currency codes for the
 *               given locale and date.  If 0, currency
 *               codes couldn't be found for the input
 *               values are invalid.
 * @stable ICU 4.0
 */
int ucurr_countCurrencies_69(const(char)* locale,
	UDate date,
	UErrorCode* ec);

/** 
 * Finds a currency code for the given locale and date 
 * @param locale the locale for which to retrieve a currency code.  
 *               Currency can be specified by the "currency" keyword 
 *               in which case it overrides the default currency code 
 * @param date   the date for which to retrieve a currency code for 
 *               the given locale. 
 * @param index  the index within the available list of currency codes
 *               for the given locale on the given date.
 * @param buff   fill in buffer. Can be NULL for preflighting. 
 * @param buffCapacity capacity of the fill in buffer. Can be 0 for 
 *               preflighting. If it is non-zero, the buff parameter 
 *               must not be NULL. 
 * @param ec     error code 
 * @return       length of the currency string. It should always be 3. 
 *               If 0, currency couldn't be found or the input values are  
 *               invalid.  
 * @stable ICU 4.0 
 */
int ucurr_forLocaleAndDate_69(const(char)* locale,
	UDate date,
	int index,
	UChar* buff,
	int buffCapacity,
	UErrorCode* ec);

/**
 * Given a key and a locale, returns an array of string values in a preferred
 * order that would make a difference. These are all and only those values where
 * the open (creation) of the service with the locale formed from the input locale
 * plus input keyword and that value has different behavior than creation with the
 * input locale alone.
 * @param key           one of the keys supported by this service.  For now, only
 *                      "currency" is supported.
 * @param locale        the locale
 * @param commonlyUsed  if set to true it will return only commonly used values
 *                      with the given locale in preferred order.  Otherwise,
 *                      it will return all the available values for the locale.
 * @param status error status
 * @return a string enumeration over keyword values for the given key and the locale.
 * @stable ICU 4.2
 */
UEnumeration* ucurr_getKeywordValuesForLocale_69(const(char)* key,
	const(char)* locale,
	UBool commonlyUsed,
	UErrorCode* status);

/**
 * Returns the ISO 4217 numeric code for the currency.
 * <p>Note: If the ISO 4217 numeric code is not assigned for the currency or
 * the currency is unknown, this function returns 0.
 *
 * @param currency null-terminated 3-letter ISO 4217 code
 * @return The ISO 4217 numeric code of the currency
 * @stable ICU 49
 */
int ucurr_getNumericCode_69(const(UChar)* currency);
