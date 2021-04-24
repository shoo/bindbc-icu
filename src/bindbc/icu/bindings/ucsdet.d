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
UCharsetDetector* ucsdet_open_68(UErrorCode* status) @system;

///
void ucsdet_close_68(UCharsetDetector* ucsd) @system;

///
void ucsdet_setText_68(UCharsetDetector* ucsd, const(Char)* textIn, int len, UErrorCode* status);

///
void ucsdet_setDeclaredEncoding_68(UCharsetDetector* ucsd, const(char)* encoding, int length, UErrorCode* status);

///
const(UCharsetMatch)* ucsdet_detect_68(UCharsetDetector* ucsd, UErrorCode* status);

///
const(UCharsetMatch)** ucsdet_detectAll_68(UCharsetDetector* ucsd, int *matchesFound, UErrorCode* status);

///
const(char)* ucsdet_getName_68(const(UCharsetMatch)* ucsm, UErrorCode* status);

///
int ucsdet_getConfidence_68(const(UCharsetMatch)* ucsm, UErrorCode* status);

///
const(char)* ucsdet_getLanguage_68(const(UCharsetMatch)* ucsm, UErrorCode* status);

///
int ucsdet_getUChars_68(const(UCharsetMatch)* ucsm, UChar *buf, int cap, UErrorCode* status);

///
UEnumeration* ucsdet_getAllDetectableCharsets_68(const(UCharsetDetector)* ucsd,  UErrorCode* status);

///
UBool ucsdet_isInputFilterEnabled_68(const(UCharsetDetector)* ucsd);

///
UBool ucsdet_enableInputFilter_68(UCharsetDetector* ucsd, UBool filter);
