/*******************************************************************************
 * umisc.h
 * 
 * C API: misc definitions
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
