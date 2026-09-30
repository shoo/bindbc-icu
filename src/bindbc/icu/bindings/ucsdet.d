/*******************************************************************************
 * ucsdet.h
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/ucsdet_8h.html
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
UCharsetDetector* ucsdet_open_78(UErrorCode* status) @system;

///
void ucsdet_close_78(UCharsetDetector* ucsd) @system;

///
void ucsdet_setText_78(UCharsetDetector* ucsd, const(Char)* textIn, int len, UErrorCode* status);

///
void ucsdet_setDeclaredEncoding_78(UCharsetDetector* ucsd, const(char)* encoding, int length, UErrorCode* status);

///
const(UCharsetMatch)* ucsdet_detect_78(UCharsetDetector* ucsd, UErrorCode* status);

///
const(UCharsetMatch)** ucsdet_detectAll_78(UCharsetDetector* ucsd, int *matchesFound, UErrorCode* status);

///
const(char)* ucsdet_getName_78(const(UCharsetMatch)* ucsm, UErrorCode* status);

///
int ucsdet_getConfidence_78(const(UCharsetMatch)* ucsm, UErrorCode* status);

///
const(char)* ucsdet_getLanguage_78(const(UCharsetMatch)* ucsm, UErrorCode* status);

///
int ucsdet_getUChars_78(const(UCharsetMatch)* ucsm, UChar *buf, int cap, UErrorCode* status);

///
UEnumeration* ucsdet_getAllDetectableCharsets_78(const(UCharsetDetector)* ucsd,  UErrorCode* status);

///
UBool ucsdet_isInputFilterEnabled_78(const(UCharsetDetector)* ucsd);

///
UBool ucsdet_enableInputFilter_78(UCharsetDetector* ucsd, UBool filter);
