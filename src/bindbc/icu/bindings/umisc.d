/*******************************************************************************
 * umisc.h
 * 
 * C API: misc definitions
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 *  This file contains miscellaneous definitions for the C APIs. 
 */
@("icuuc") // this actually doesn't have a library associated
module bindbc.icu.bindings.umisc;

import bindbc.icu.bindings.utypes;

extern (C):

/** A struct representing a range of text containing a specific field 
 *  @stable ICU 2.0
 */
struct UFieldPosition {
	/**
	 * The field 
	 * @stable ICU 2.0
	 */
	int field;
	/**
	 * The start of the text range containing field 
	 * @stable ICU 2.0
	 */
	int beginIndex;
	/** 
	 * The limit of the text range containing field 
	 * @stable ICU 2.0
	 */
	int endIndex;
}

version (UCONFIG_NO_SERVICE)
{
}
else
{
	/**
	* Opaque type returned by registerInstance, registerFactory and unregister for service registration.
	* @stable ICU 2.6
	*/
	alias URegistryKey = const(void)*;
}
