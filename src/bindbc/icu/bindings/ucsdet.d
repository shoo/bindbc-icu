/*******************************************************************************
 * ucsdet.h
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 */
@("icuin")
module bindbc.icu.bindings.ucsdet;

import bindbc.icu.bindings.utypes;
import bindbc.icu.bindings.uenum;

extern (C):

///
struct UCharsetDetector{}

///
struct UCharsetMatch{}

///
UCharsetDetector* ucsdet_open_67(UErrorCode* status) @system;

///
void ucsdet_close_67(UCharsetDetector* ucsd) @system;

///
void ucsdet_setText_67(UCharsetDetector* ucsd, const(char)* textIn, int len, UErrorCode* status);

///
void ucsdet_setDeclaredEncoding_67(UCharsetDetector* ucsd, const(char)* encoding, int length, UErrorCode* status);

///
const(UCharsetMatch)* ucsdet_detect_67(UCharsetDetector* ucsd, UErrorCode* status);

///
const(UCharsetMatch)** ucsdet_detectAll_67(UCharsetDetector* ucsd, int *matchesFound, UErrorCode* status);

///
const(char)* ucsdet_getName_67(const(UCharsetMatch)* ucsm, UErrorCode* status);

///
int ucsdet_getConfidence_67(const(UCharsetMatch)* ucsm, UErrorCode* status);

///
const(char)* ucsdet_getLanguage_67(const(UCharsetMatch)* ucsm, UErrorCode* status);

///
int ucsdet_getUChars_67(const(UCharsetMatch)* ucsm, UChar *buf, int cap, UErrorCode* status);

///
UEnumeration* ucsdet_getAllDetectableCharsets_67(const(UCharsetDetector)* ucsd,  UErrorCode* status);

///
UBool ucsdet_isInputFilterEnabled_67(const(UCharsetDetector)* ucsd);

///
UBool ucsdet_enableInputFilter_67(UCharsetDetector* ucsd, UBool filter);
