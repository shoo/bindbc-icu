/*******************************************************************************
 * udisplaycontext.h
 * 
 * C API: Display context types (enum values)
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Documentation: https://unicode-org.github.io/icu-docs/apidoc/dev/icu4c/udisplaycontext_8h.html
 */
@("icuuc") // this actually doesn't have a library associated
module bindbc.icu.bindings.udisplaycontext;

import bindbc.icu.bindings.utypes;

extern (C):

version (UCONFIG_NO_FORMATTING)
{
}
else:

///
enum UDisplayContextType
{
	///
	TYPE_DIALECT_HANDLING = 0,
	///
	TYPE_CAPITALIZATION = 1,
	///
	TYPE_DISPLAY_LENGTH = 2,
	///
	TYPE_SUBSTITUTE_HANDLING = 3
}

///
enum UDisplayContext
{
	///
	STANDARD_NAMES = (UDisplayContextType.TYPE_DIALECT_HANDLING << 8) + 0,
	///
	DIALECT_NAMES = (UDisplayContextType.TYPE_DIALECT_HANDLING << 8) + 1,
	///
	CAPITALIZATION_NONE = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 0,
	///
	CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 1,
	///
	CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 2,
	///
	CAPITALIZATION_FOR_UI_LIST_OR_MENU = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 3,
	///
	CAPITALIZATION_FOR_STANDALONE = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 4,
	///
	LENGTH_FULL = (UDisplayContextType.TYPE_DISPLAY_LENGTH << 8) + 0,
	///
	LENGTH_SHORT = (UDisplayContextType.TYPE_DISPLAY_LENGTH << 8) + 1,
	///
	SUBSTITUTE = (UDisplayContextType.TYPE_SUBSTITUTE_HANDLING << 8) + 0,
	///
	NO_SUBSTITUTE = (UDisplayContextType.TYPE_SUBSTITUTE_HANDLING << 8) + 1
}
