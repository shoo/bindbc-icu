/*******************************************************************************
 * parseerr.h
 * 
 * C API: Parse Error Information
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
 */
@("icuuc") // this actually doesn't have a library associated
module bindbc.icu.bindings.parseerr;

import bindbc.icu.bindings.utypes;

extern (C):

/**
 * The capacity of the context strings in UParseError.
 * @stable ICU 2.0
 */
enum U_PARSE_CONTEXT_LEN = 16;

/**
 * A UParseError struct is used to returned detailed information about
 * parsing errors.  It is used by ICU parsing engines that parse long
 * rules, patterns, or programs, where the text being parsed is long
 * enough that more information than a UErrorCode is needed to
 * localize the error.
 *
 * <p>The line, offset, and context fields are optional; parsing
 * engines may choose not to use to use them.
 *
 * <p>The preContext and postContext strings include some part of the
 * context surrounding the error.  If the source text is "let for=7"
 * and "for" is the error (e.g., because it is a reserved word), then
 * some examples of what a parser might produce are the following:
 *
 * <pre>
 * preContext   postContext
 * ""           ""            The parser does not support context
 * "let "       "=7"          Pre- and post-context only
 * "let "       "for=7"       Pre- and post-context and error text
 * ""           "for"         Error text only
 * </pre>
 *
 * <p>Examples of engines which use UParseError (or may use it in the
 * future) are Transliterator, RuleBasedBreakIterator, and
 * RegexPattern.
 * 
 * @stable ICU 2.0
 */
struct UParseError
{

	/**
	 * The line on which the error occurred.  If the parser uses this
	 * field, it sets it to the line number of the source text line on
	 * which the error appears, which will be a value >= 1.  If the
	 * parse does not support line numbers, the value will be <= 0.
	 * @stable ICU 2.0
	 */
	int line;

	/**
	 * The character offset to the error.  If the line field is >= 1,
	 * then this is the offset from the start of the line.  Otherwise,
	 * this is the offset from the start of the text.  If the parser
	 * does not support this field, it will have a value < 0.
	 * @stable ICU 2.0
	 */
	int offset;

	/**
	 * Textual context before the error.  Null-terminated.  The empty
	 * string if not supported by parser.
	 * @stable ICU 2.0   
	 */
	UChar[U_PARSE_CONTEXT_LEN] preContext;

	/**
	 * The error itself and/or textual context after the error.
	 * Null-terminated.  The empty string if not supported by parser.
	 * @stable ICU 2.0   
	 */
	UChar[U_PARSE_CONTEXT_LEN] postContext;
}
