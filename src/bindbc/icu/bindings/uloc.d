/*******************************************************************************
 * uloc.h
 * 
 * C API: Locale
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/uloc_8h.html
 */
@("icuuc")
module bindbc.icu.bindings.uloc;

import bindbc.icu.bindings.utypes;
import bindbc.icu.bindings.uenum;

extern (C):

/// Common language constants
enum ULOC_CHINESE = "zh";
enum ULOC_ENGLISH = "en"; /// ditto
enum ULOC_FRENCH = "fr"; /// ditto
enum ULOC_GERMAN = "de"; /// ditto
enum ULOC_ITALIAN = "it"; /// ditto
enum ULOC_JAPANESE = "ja"; /// ditto
enum ULOC_KOREAN = "ko"; /// ditto
enum ULOC_SIMPLIFIED_CHINESE = "zh_CN"; /// ditto
enum ULOC_TRADITIONAL_CHINESE = "zh_TW"; /// ditto

/// Common country/region constants
enum ULOC_CANADA = "en_CA";
enum ULOC_CANADA_FRENCH = "fr_CA"; /// ditto
enum ULOC_CHINA = "zh_CN"; /// ditto
enum ULOC_PRC = "zh_CN"; /// ditto
enum ULOC_FRANCE = "fr_FR"; /// ditto
enum ULOC_GERMANY = "de_DE"; /// ditto
enum ULOC_ITALY = "it_IT"; /// ditto
enum ULOC_JAPAN = "ja_JP"; /// ditto
enum ULOC_KOREA = "ko_KR"; /// ditto
enum ULOC_TAIWAN = "zh_TW"; /// ditto
enum ULOC_UK = "en_GB"; /// ditto
enum ULOC_US = "en_US"; /// ditto

/// Maximum size of the language part of a locale ID including the terminating NULL.
enum ULOC_LANG_CAPACITY = 12;

/// Maximum size of the country part of a locale ID including the terminating NULL.
enum ULOC_COUNTRY_CAPACITY = 4;

/// Maximum size of the whole locale ID including the terminating NULL and keywords.
enum ULOC_FULLNAME_CAPACITY = 157;

/// Maximum size of the script part of a locale ID including the terminating NULL.
enum ULOC_SCRIPT_CAPACITY = 6;

/// Maximum size of keywords in a locale ID including the terminating NULL.
enum ULOC_KEYWORDS_CAPACITY = 96;

/// Maximum size of keywords and their values in a locale.
enum ULOC_KEYWORD_AND_VALUES_CAPACITY = 100;

///
enum ULOC_KEYWORD_SEPARATOR = '@';

///
enum ULOC_KEYWORD_SEPARATOR_UNICODE = 0x40;

///
enum ULOC_KEYWORD_ASSIGN = '=';

///
enum ULOC_KEYWORD_ASSIGN_UNICODE = 0x3D;

///
enum ULOC_KEYWORD_ITEM_SEPARATOR = ';';

///
enum ULOC_KEYWORD_ITEM_SEPARATOR_UNICODE = 0x3B;

///
enum ULocDataLocaleType
{
	///
	ULOC_ACTUAL_LOCALE = 0,
	///
	ULOC_VALID_LOCALE = 1,
}

///
const(char)* uloc_getDefault_70();

///
void uloc_setDefault_70(const(char)* localeID, UErrorCode* status);

///
int uloc_getLanguage_70(const(char)* localeID,
	char* language,
	int languageCapacity,
	UErrorCode* err);

///
int uloc_getScript_70(const(char)* localeID,
	char* script,
	int scriptCapacity,
	UErrorCode* err);

///
int uloc_getCountry_70(const(char)* localeID,
	char* country,
	int countryCapacity,
	UErrorCode* err);

///
int uloc_getVariant_70(const(char)* localeID,
	char* variant,
	int variantCapacity,
	UErrorCode* err);

///
int uloc_getName_70(const(char)* localeID,
	char* name,
	int nameCapacity,
	UErrorCode* err);

///
int uloc_canonicalize_70(const(char)* localeID,
	char* name,
	int nameCapacity,
	UErrorCode* err);

///
const(char)* uloc_getISO3Language_70(const(char)* localeID);

///
const(char)* uloc_getISO3Country_70(const(char)* localeID);

///
uint uloc_getLCID_70(const(char)* localeID);

///
int uloc_getDisplayLanguage_70(const(char)* locale,
	const(char)* displayLocale,
	UChar* language,
	int languageCapacity,
	UErrorCode* status);

///
int uloc_getDisplayScript_70(const(char)* locale,
	const(char)* displayLocale,
	UChar* script,
	int scriptCapacity,
	UErrorCode* status);

///
int uloc_getDisplayCountry_70(const(char)* locale,
	const(char)* displayLocale,
	UChar* country,
	int countryCapacity,
	UErrorCode* status);

///
int uloc_getDisplayVariant_70(const(char)* locale,
	const(char)* displayLocale,
	UChar* variant,
	int variantCapacity,
	UErrorCode* status);

///
int uloc_getDisplayKeyword_70(const(char)* keyword,
	const(char)* displayLocale,
	UChar* dest,
	int destCapacity,
	UErrorCode* status);

///
int uloc_getDisplayKeywordValue_70(const(char)* locale,
	const(char)* keyword,
	const(char)* displayLocale,
	UChar* dest,
	int destCapacity,
	UErrorCode* status);

///
int uloc_getDisplayName_70(const(char)* localeID,
	const(char)* inLocaleID,
	UChar* result,
	int maxResultSize,
	UErrorCode* err);

///
const(char)* uloc_getAvailable_70(int n);

///
int uloc_countAvailable_70();

///
enum ULocAvailableType
{
	///
	DEFAULT,

	///
	ONLY_LEGACY_ALIASES,

	///
	WITH_LEGACY_ALIASES,
}

///
UEnumeration* uloc_openAvailableByType_70(ULocAvailableType type, UErrorCode* status);

///
const(char*)* uloc_getISOLanguages_70();

///
const(char*)* uloc_getISOCountries_70();

///
int uloc_getParent_70(const(char)* localeID,
	char* parent,
	int parentCapacity,
	UErrorCode* err);

///
int uloc_getBaseName_70(const(char)* localeID,
	char* name,
	int nameCapacity,
	UErrorCode* err);

///
UEnumeration* uloc_openKeywords_70(const(char)* localeID,
	UErrorCode* status);

///
int uloc_getKeywordValue_70(const(char)* localeID,
	const(char)* keywordName,
	char* buffer, int bufferCapacity,
	UErrorCode* status);

///
int uloc_setKeywordValue_70(const(char)* keywordName,
	const(char)* keywordValue,
	char* buffer,
	int bufferCapacity,
	UErrorCode* status);

///
UBool uloc_isRightToLeft_70(const(char)* locale);

///
enum ULayoutType
{
	LTR = 0, /// left-to-right
	RTL = 1, /// right-to-left
	TTB = 2, /// top-to-bottom
	BTT = 3, /// bottom-to-top
	UNKNOWN
}

///
ULayoutType uloc_getCharacterOrientation_70(const(char)* localeId,
	UErrorCode* status);

///
ULayoutType uloc_getLineOrientation_70(const(char)* localeId,
	UErrorCode* status);

///
enum UAcceptResult
{
	///
	FAILED = 0,
	///
	VALID = 1,
	///
	FALLBACK = 2 /*  */
}

///
int uloc_acceptLanguageFromHTTP_70(char* result,
	int resultAvailable,
	UAcceptResult* outResult,
	const(char)* httpAcceptLanguage,
	UEnumeration* availableLocales,
	UErrorCode* status);

///
int uloc_acceptLanguage_70(char* result,
	int resultAvailable,
	UAcceptResult* outResult,
	const(char)** acceptList,
	int acceptListCount,
	UEnumeration* availableLocales,
	UErrorCode* status);

///
int uloc_getLocaleForLCID_70(uint hostID,
	char* locale,
	int localeCapacity,
	UErrorCode* status);

///
int uloc_addLikelySubtags_70(const(char)* localeID,
	char* maximizedLocaleID,
	int maximizedLocaleIDCapacity,
	UErrorCode* err);

///
int uloc_minimizeSubtags_70(const(char)* localeID,
	char* minimizedLocaleID,
	int minimizedLocaleIDCapacity,
	UErrorCode* err);

///
int uloc_forLanguageTag_70(const(char)* langtag,
	char* localeID,
	int localeIDCapacity,
	int* parsedLength,
	UErrorCode* err);

///
int uloc_toLanguageTag_70(const(char)* localeID,
	char* langtag,
	int langtagCapacity,
	UBool strict,
	UErrorCode* err);

///
const(char)* uloc_toUnicodeLocaleKey_70(const(char)* keyword);

///
const(char)* uloc_toUnicodeLocaleType_70(const char* keyword, const char* value);

///
const(char)* uloc_toLegacyKey_70(const(char)* keyword);

///
const(char)* uloc_toLegacyType_70(const(char)* keyword, const(char)* value);
