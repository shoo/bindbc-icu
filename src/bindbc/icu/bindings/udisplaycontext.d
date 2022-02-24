/*******************************************************************************
 * udisplaycontext.h
 * 
 * C API: Display context types (enum values)
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 */
@("icuuc") // this actually doesn't have a library associated
module bindbc.icu.bindings.udisplaycontext;

import bindbc.icu.bindings.utypes;

extern (C):

version (UCONFIG_NO_FORMATTING)
{
}
else:

/**
 * Display context types, for getting values of a particular setting.
 * Note, the specific numeric values are internal and may change.
 * @stable ICU 51
 */
enum UDisplayContextType
{
	/**
	 * Type to retrieve the dialect handling setting, e.g.
	 * STANDARD_NAMES or DIALECT_NAMES.
	 * @stable ICU 51
	 */
	TYPE_DIALECT_HANDLING = 0,
	/**
	 * Type to retrieve the capitalization context setting, e.g.
	 * CAPITALIZATION_NONE, CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE,
	 * CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE, etc.
	 * @stable ICU 51
	 */
	TYPE_CAPITALIZATION = 1,
	/**
	 * Type to retrieve the display length setting, e.g.
	 * LENGTH_FULL, LENGTH_SHORT.
	 * @stable ICU 54
	 */
	TYPE_DISPLAY_LENGTH = 2,
	/**
	 * Type to retrieve the substitute handling setting, e.g.
	 * SUBSTITUTE, NO_SUBSTITUTE.
	 * @stable ICU 58
	 */
	TYPE_SUBSTITUTE_HANDLING = 3
}

/**
 * Display context settings.
 * Note, the specific numeric values are internal and may change.
 * @stable ICU 51
 */
enum UDisplayContext
{
	/**
	 * ================================
	 * DIALECT_HANDLING can be set to one of STANDARD_NAMES or
	 * DIALECT_NAMES. Use UDisplayContextType TYPE_DIALECT_HANDLING
	 * to get the value.
	 */
	/**
	 * A possible setting for DIALECT_HANDLING:
	 * use standard names when generating a locale name,
	 * e.g. en_GB displays as 'English (United Kingdom)'.
	 * @stable ICU 51
	 */
	STANDARD_NAMES = (UDisplayContextType.TYPE_DIALECT_HANDLING << 8) + 0,
	/**
	 * A possible setting for DIALECT_HANDLING:
	 * use dialect names, when generating a locale name,
	 * e.g. en_GB displays as 'British English'.
	 * @stable ICU 51
	 */
	DIALECT_NAMES = (UDisplayContextType.TYPE_DIALECT_HANDLING << 8) + 1,
	/**
	 * ================================
	 * CAPITALIZATION can be set to one of CAPITALIZATION_NONE,
	 * CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE,
	 * CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE,
	 * CAPITALIZATION_FOR_UI_LIST_OR_MENU, or
	 * CAPITALIZATION_FOR_STANDALONE.
	 * Use UDisplayContextType TYPE_CAPITALIZATION to get the value.
	 */
	/**
	 * The capitalization context to be used is unknown (this is the default value).
	 * @stable ICU 51
	 */
	CAPITALIZATION_NONE = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 0,
	/**
	 * The capitalization context if a date, date symbol or display name is to be
	 * formatted with capitalization appropriate for the middle of a sentence.
	 * @stable ICU 51
	 */
	CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 1,
	/**
	 * The capitalization context if a date, date symbol or display name is to be
	 * formatted with capitalization appropriate for the beginning of a sentence.
	 * @stable ICU 51
	 */
	CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 2,
	/**
	 * The capitalization context if a date, date symbol or display name is to be
	 * formatted with capitalization appropriate for a user-interface list or menu item.
	 * @stable ICU 51
	 */
	CAPITALIZATION_FOR_UI_LIST_OR_MENU = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 3,
	/**
	 * The capitalization context if a date, date symbol or display name is to be
	 * formatted with capitalization appropriate for stand-alone usage such as an
	 * isolated name on a calendar page.
	 * @stable ICU 51
	 */
	CAPITALIZATION_FOR_STANDALONE = (UDisplayContextType.TYPE_CAPITALIZATION << 8) + 4,
	/**
	 * ================================
	 * DISPLAY_LENGTH can be set to one of LENGTH_FULL or
	 * LENGTH_SHORT. Use UDisplayContextType TYPE_DISPLAY_LENGTH
	 * to get the value.
	 */
	/**
	 * A possible setting for DISPLAY_LENGTH:
	 * use full names when generating a locale name,
	 * e.g. "United States" for US.
	 * @stable ICU 54
	 */
	LENGTH_FULL = (UDisplayContextType.TYPE_DISPLAY_LENGTH << 8) + 0,
	/**
	 * A possible setting for DISPLAY_LENGTH:
	 * use short names when generating a locale name,
	 * e.g. "U.S." for US.
	 * @stable ICU 54
	 */
	LENGTH_SHORT = (UDisplayContextType.TYPE_DISPLAY_LENGTH << 8) + 1,
	/**
	 * ================================
	 * SUBSTITUTE_HANDLING can be set to one of SUBSTITUTE or
	 * NO_SUBSTITUTE. Use UDisplayContextType TYPE_SUBSTITUTE_HANDLING
	 * to get the value.
	 */
	/**
	 * A possible setting for SUBSTITUTE_HANDLING:
	 * Returns a fallback value (e.g., the input code) when no data is available.
	 * This is the default value.
	 * @stable ICU 58
	 */
	SUBSTITUTE = (UDisplayContextType.TYPE_SUBSTITUTE_HANDLING << 8) + 0,
	/**
	 * A possible setting for SUBSTITUTE_HANDLING:
	 * Returns a null value with error code set to U_ILLEGAL_ARGUMENT_ERROR when no
	 * data is available.
	 * @stable ICU 58
	 */
	NO_SUBSTITUTE = (UDisplayContextType.TYPE_SUBSTITUTE_HANDLING << 8) + 1
}
