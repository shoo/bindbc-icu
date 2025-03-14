/*******************************************************************************
 * ucnv.h
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/ucnv_8h.html
 */
@("icuuc")
module bindbc.icu.bindings.ucnv;

import bindbc.icu.bindings.utypes;
import bindbc.icu.bindings.uenum;
import bindbc.icu.bindings.ucnv_err;

extern (C):

///
struct USet {}


///
enum UConverterType
{
	///
	UCNV_UNSUPPORTED_CONVERTER = -1,
	///
	UCNV_SBCS = 0,
	///
	UCNV_DBCS = 1,
	///
	UCNV_MBCS = 2,
	///
	UCNV_LATIN_1 = 3,
	///
	UCNV_UTF8 = 4,
	///
	UCNV_UTF16_BigEndian = 5,
	///
	UCNV_UTF16_LittleEndian = 6,
	///
	UCNV_UTF32_BigEndian = 7,
	///
	UCNV_UTF32_LittleEndian = 8,
	///
	UCNV_EBCDIC_STATEFUL = 9,
	///
	UCNV_ISO_2022 = 10, 
	///
	UCNV_LMBCS_1 = 11,
	///
	UCNV_LMBCS_2,
	///
	UCNV_LMBCS_3,
	///
	UCNV_LMBCS_4,
	///
	UCNV_LMBCS_5,
	///
	UCNV_LMBCS_6,
	///
	UCNV_LMBCS_8,
	///
	UCNV_LMBCS_11,
	///
	UCNV_LMBCS_16,
	///
	UCNV_LMBCS_17,
	///
	UCNV_LMBCS_18,
	///
	UCNV_LMBCS_19,
	///
	UCNV_LMBCS_LAST = UCNV_LMBCS_19,
	///
	UCNV_HZ,
	///
	UCNV_SCSU,
	///
	UCNV_ISCII,
	///
	UCNV_US_ASCII,
	///
	UCNV_UTF7,
	///
	UCNV_BOCU1,
	///
	UCNV_UTF16,
	///
	UCNV_UTF32,
	///
	UCNV_CESU8,
	///
	UCNV_IMAP_MAILBOX,
	///
	UCNV_COMPOUND_TEXT, 
	///
	UCNV_NUMBER_OF_SUPPORTED_CONVERTER_TYPES
}

///
enum UConverterPlatform
{
	///
	UCNV_UNKNOWN = -1,
	///
	UCNV_IBM = 0
}

///
alias UConverterToUCallback = void function(const(void)* context, UConverterToUnicodeArgs* args,
	const(Char)* codeUnits, int length, UConverterCallbackReason reason, UErrorCode* pErrorCode);

///
alias UConverterFromUCallback = void function(const(void)* context, UConverterFromUnicodeArgs* args,
	const(UChar)* codeUnits, int length, UChar32 codePoint, UConverterCallbackReason reason, UErrorCode* pErrorCode);

///
enum char UCNV_OPTION_SEP_CHAR = ',';

///
enum string UCNV_OPTION_SEP_STRING = ",";

///
enum char UCNV_VALUE_SEP_CHAR = '=';

///
enum string UCNV_VALUE_SEP_STRING = "=";

///
enum string UCNV_LOCALE_OPTION_STRING = ",locale=";

///
enum string UCNV_VERSION_OPTION_STRING = ",version=";

///
enum string UCNV_SWAP_LFNL_OPTION_STRING = ",swaplfnl";

///
int ucnv_compareNames_74(const(char)* name1, const(char)* name2);

///
UConverter* ucnv_open_74(const(char)* converterName, UErrorCode* err) @system;

///
UConverter* ucnv_openU_74(const(char)* name, UErrorCode* err) @system;

///
UConverter* ucnv_openCCSID_74(int codepage, UConverterPlatform platform, UErrorCode* err) @system;

///
UConverter* ucnv_openPackage_74(const(char)* packageName, const(char)* converterName, UErrorCode* err) @system;

///
UConverter* ucnv_clone_74(const(UConverter)* cnv, UErrorCode *status) @system;

///
//deprecated("Deprecated at ICU 71")
UConverter* ucnv_safeClone_74(const(UConverter)* cnv, void* stackBuffer, int* pBufferSize, UErrorCode* status) @system;

///
enum int U_CNV_SAFECLONE_BUFFERSIZE = 1024;

///
void ucnv_close_74(UConverter* converter) @system;

///
void ucnv_getSubstChars_74(const(UConverter)* converter, Char* subChars, byte* len, UErrorCode* err);

///
void ucnv_setSubstChars_74(UConverter* converter, const(Char)* subChars, byte len, UErrorCode* err);

///
void ucnv_setSubstString_74(UConverter* cnv, const(UChar)* s, int length, UErrorCode* err);

///
void ucnv_getInvalidChars_74(const(UConverter)* converter, Char* errBytes, byte* len, UErrorCode* err);

///
void ucnv_getInvalidUChars_74(const(UConverter)* converter, UChar* errUChars, byte* len, UErrorCode* err);

///
void ucnv_reset_74(UConverter* converter);

///
void ucnv_resetToUnicode_74(UConverter* converter);

///
void ucnv_resetFromUnicode_74(UConverter* converter);

///
byte ucnv_getMaxCharSize_74(const(UConverter)* converter);

///
extern(D) pragma(inline) int UCNV_GET_MAX_BYTES_FOR_STRING()(int length, int maxCharSize)
{
	return (length+10)*maxCharSize;
}

///
byte ucnv_getMinCharSize_74(const(UConverter)* converter);

///
int ucnv_getDisplayName_74(const(UConverter)* converter, const(char)* displayLocale, UChar* displayName,
	int displayNameCapacity, UErrorCode* err);

///
const(char)* ucnv_getName_74(const(UConverter)* converter, UErrorCode* err);

///
int ucnv_getCCSID_74(const(UConverter)* converter, UErrorCode *err);

///
UConverterPlatform ucnv_getPlatform_74(const(UConverter)* converter, UErrorCode* err);

///
UConverterType ucnv_getType_74(const(UConverter)* converter);

///
void ucnv_getStarters_74(const(UConverter)* converter, ref UBool[256] starters, UErrorCode* err);

///
enum UConverterUnicodeSet
{
	///
	UCNV_ROUNDTRIP_SET,
	///
	UCNV_ROUNDTRIP_AND_FALLBACK_SET,
}

///
void ucnv_getUnicodeSet_74(const(UConverter)* cnv, USet* setFillIn, UConverterUnicodeSet whichSet,
	UErrorCode* pErrorCode);

///
void ucnv_getToUCallBack_74(const(UConverter)* converter, UConverterToUCallback *action, const(void*)* context);

///
void ucnv_getFromUCallBack_74(const(UConverter)* converter, UConverterFromUCallback* action, const(void*)* context);

///
void ucnv_setToUCallBack_74(UConverter* converter, UConverterToUCallback newAction, const(void)* newContext,
	UConverterToUCallback* oldAction, const(void*)* oldContext, UErrorCode* err);

///
void ucnv_setFromUCallBack_74(UConverter* converter, UConverterFromUCallback newAction, const(void)* newContext,
	UConverterFromUCallback* oldAction, const(void*)* oldContext, UErrorCode* err);

///
void ucnv_fromUnicode_74(UConverter* converter, Char** target, const(Char)* targetLimit,
	const(UChar*)* source, const(UChar)* sourceLimit, int* offsets, UBool flush, UErrorCode* err);

///
void ucnv_toUnicode_74(UConverter* converter, UChar** target, const(UChar)* targetLimit,
	const(Char*)* source, const(Char)* sourceLimit, int* offsets, UBool flush, UErrorCode* err);

///
int ucnv_fromUChars_74(UConverter* cnv, Char* dest, int destCapacity,
	const(UChar)* src, int srcLength, UErrorCode* pErrorCode);

///
int ucnv_toUChars_74(UConverter* cnv, UChar* dest, int destCapacity,
	const(Char)* src, int srcLength, UErrorCode* pErrorCode);

///
UChar32 ucnv_getNextUChar_74(UConverter* converter, const(Char*)* source, const(Char)* sourceLimit, UErrorCode* err);

///
void ucnv_convertEx_74(UConverter* targetCnv, UConverter* sourceCnv,
	Char** target, const(Char)* targetLimit, const(Char*)* source, const(Char)* sourceLimit,
	UChar* pivotStart, UChar** pivotSource, UChar** pivotTarget, const(UChar)* pivotLimit,
	UBool reset, UBool flush, UErrorCode* pErrorCode);

///
int ucnv_convert_74(const(char)* toConverterName, const(char)* fromConverterName, Char* target, int targetCapacity,
	const(Char)* source, int sourceLength, UErrorCode* pErrorCode);

///
int ucnv_toAlgorithmic_74(UConverterType algorithmicType, UConverter* cnv, Char* target, int targetCapacity,
	const(Char)* source, int sourceLength, UErrorCode* pErrorCode);

///
int ucnv_fromAlgorithmic_74(UConverter* cnv, UConverterType algorithmicType, Char* target, int targetCapacity,
	const(Char)* source, int sourceLength, UErrorCode*pErrorCode);

///
int ucnv_flushCache_74();

///
int ucnv_countAvailable_74();

///
const(char)* ucnv_getAvailableName_74(int n);

///
UEnumeration* ucnv_openAllNames_74(UErrorCode* pErrorCode) @system;

///
ushort ucnv_countAliases_74(const(char)* alias_, UErrorCode* pErrorCode);

///
const(char)* ucnv_getAlias_74(const(char)* alias_, ushort n, UErrorCode* pErrorCode);

///
void ucnv_getAliases_74(const(char)* alias_, const(char*)* aliases, UErrorCode* pErrorCode);

///
UEnumeration* ucnv_openStandardNames_74(const(char)* convName, const(char)* standard, UErrorCode* pErrorCode) @system;

///
ushort ucnv_countStandards_74();

///
const(char)* ucnv_getStandard_74(ushort n, UErrorCode* pErrorCode);

///
const(char)* ucnv_getStandardName_74(const(char)* name, const(char)* standard, UErrorCode* pErrorCode);

///
const(char)* ucnv_getCanonicalName_74(const(char)* alias_, const(char)* standard, UErrorCode* pErrorCode);

///
const(char)* ucnv_getDefaultName_74();

///
void ucnv_setDefaultName_74(const(char)* name);

///
void ucnv_fixFileSeparator_74(const(UConverter)* cnv, UChar* source, int sourceLen);

///
UBool ucnv_isAmbiguous_74(const(UConverter)* cnv);

///
void ucnv_setFallback_74(UConverter* cnv, UBool usesFallback);

///
UBool ucnv_usesFallback_74(const(UConverter)* cnv);

///
const(char)* ucnv_detectUnicodeSignature_74(const(Char)* source, int sourceLength,
	int* signatureLength, UErrorCode* pErrorCode);

///
int ucnv_fromUCountPending_74(const(UConverter)* cnv, UErrorCode* status);

///
int ucnv_toUCountPending_74(const(UConverter)* cnv, UErrorCode* status);

///
UBool ucnv_isFixedWidth_74(UConverter* cnv, UErrorCode* status);
