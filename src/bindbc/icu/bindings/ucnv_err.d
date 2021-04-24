/*******************************************************************************
 * ucnv_err.h
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 */
@("icuuc")
module bindbc.icu.bindings.ucnv_err;

import bindbc.icu.bindings.utypes;

extern (C):

///
struct UConverter {}

///
enum string UCNV_SUB_STOP_ON_ILLEGAL = "i";
///
enum string UCNV_SKIP_STOP_ON_ILLEGAL = "i";
///
enum string UCNV_ESCAPE_ICU = null;
///
enum string UCNV_ESCAPE_JAVA = "J";
///
enum string UCNV_ESCAPE_C = "C";
///
enum string UCNV_ESCAPE_XML_DEC = "D";
///
enum string UCNV_ESCAPE_XML_HEX = "X";
///
enum string UCNV_ESCAPE_UNICODE = "U";
///
enum string UCNV_ESCAPE_CSS2 = "S";

///
enum UConverterCallbackReason
{
	///
	UCNV_UNASSIGNED = 0,
	///
	UCNV_ILLEGAL = 1,
	///
	UCNV_IRREGULAR = 2,
	///
	UCNV_RESET = 3,
	///
	UCNV_CLOSE = 4,
	///
	UCNV_CLONE = 5
}

///
struct UConverterFromUnicodeArgs
{
	///
	ushort size;
	///
	UBool flush;
	///
	UConverter* converter;
	///
	const(UChar)* source;
	///
	const(UChar)* sourceLimit;
	///
	char* target;
	///
	const(char)* targetLimit;
	///
	int* offsets;
}

///
struct UConverterToUnicodeArgs
{
	///
	ushort size;
	///
	UBool flush;
	///
	UConverter *converter;
	///
	const(char)* source;
	///
	const(char)* sourceLimit;
	///
	UChar* target;
	///
	const(UChar)* targetLimit;
	///
	int* offsets;
}

///
void UCNV_FROM_U_CALLBACK_STOP_68(const(void)* context, UConverterFromUnicodeArgs* fromUArgs, const(UChar)* codeUnits,
	int length, UChar32 codePoint, UConverterCallbackReason reason, UErrorCode* err);

///
void UCNV_TO_U_CALLBACK_STOP_68(const(void)* context, UConverterToUnicodeArgs* toUArgs, const(char)* codeUnits,
	int length, UConverterCallbackReason reason, UErrorCode* err);

///
void UCNV_FROM_U_CALLBACK_SKIP_68(const(void)* context, UConverterFromUnicodeArgs* fromUArgs, const(UChar)* codeUnits,
	int length, UChar32 codePoint, UConverterCallbackReason reason, UErrorCode* err);

///
void UCNV_FROM_U_CALLBACK_SUBSTITUTE_68(const(void)* context, UConverterFromUnicodeArgs* fromUArgs,
	const(UChar)* codeUnits, int length, UChar32 codePoint, UConverterCallbackReason reason, UErrorCode* err);

///
void UCNV_FROM_U_CALLBACK_ESCAPE_68(const(void)* context, UConverterFromUnicodeArgs* fromUArgs, const(UChar)* codeUnits,
	int length, UChar32 codePoint, UConverterCallbackReason reason, UErrorCode* err);

///
void UCNV_TO_U_CALLBACK_SKIP_68(const(void)* context, UConverterToUnicodeArgs* toUArgs, const(char)* codeUnits,
	int length, UConverterCallbackReason reason, UErrorCode* err);

///
void UCNV_TO_U_CALLBACK_SUBSTITUTE_68(const(void)* context, UConverterToUnicodeArgs* toUArgs, const(char)* codeUnits,
	int length, UConverterCallbackReason reason, UErrorCode* err);

///
void UCNV_TO_U_CALLBACK_ESCAPE_68(const(void)* context, UConverterToUnicodeArgs* toUArgs, const(char)* codeUnits,
	int length, UConverterCallbackReason reason, UErrorCode* err);
