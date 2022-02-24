/*******************************************************************************
 * ufieldpositer.h
 * 
 * C API: UFieldPositionIterator for use with format APIs.
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 *
 * Usage:
 * ufieldpositer_open creates an empty (unset) UFieldPositionIterator.
 * This can be passed to format functions such as {@link #udat_formatForFields},
 * which will set it to apply to the fields in a particular formatted string.
 * ufieldpositer_next can then be used to iterate over those fields,
 * providing for each field its type (using values that are specific to the
 * particular format type, such as date or number formats), as well as the
 * start and end positions of the field in the formatted string.
 * A given UFieldPositionIterator can be re-used for different format calls;
 * each such call resets it to apply to that format string.
 * ufieldpositer_close should be called to dispose of the UFieldPositionIterator
 * when it is no longer needed.
 *
 * @see FieldPositionIterator
 */
@("icuin")
module bindbc.icu.bindings.ufieldpositer;

import bindbc.icu.bindings.utypes;

extern (C):

version (UCONFIG_NO_FORMATTING)
{
}
else:

/**
 * Opaque UFieldPositionIterator object for use in C.
 * @stable ICU 55
 */
struct UFieldPositionIterator;

/**
 * Open a new, unset UFieldPositionIterator object.
 * @param status
 *          A pointer to a UErrorCode to receive any errors.
 * @return
 *          A pointer to an empty (unset) UFieldPositionIterator object,
 *          or NULL if an error occurred.
 * @stable ICU 55
 */
UFieldPositionIterator* ufieldpositer_open_69(UErrorCode* status);

/**
 * Close a UFieldPositionIterator object. Once closed it may no longer be used.
 * @param fpositer
 *          A pointer to the UFieldPositionIterator object to close.
 * @stable ICU 55
 */
void ufieldpositer_close_69(UFieldPositionIterator* fpositer);

/**
 * Get information for the next field in the formatted string to which this
 * UFieldPositionIterator currently applies, or return a negative value if there
 * are no more fields.
 * @param fpositer
 *          A pointer to the UFieldPositionIterator object containing iteration
 *          state for the format fields.
 * @param beginIndex
 *          A pointer to an int to receive information about the start offset
 *          of the field in the formatted string (undefined if the function
 *          returns a negative value). May be NULL if this information is not needed.
 * @param endIndex
 *          A pointer to an int to receive information about the end offset
 *          of the field in the formatted string (undefined if the function
 *          returns a negative value). May be NULL if this information is not needed.
 * @return
 *          The field type (non-negative value), or a negative value if there are
 *          no more fields for which to provide information. If negative, then any
 *          values pointed to by beginIndex and endIndex are undefined.
 *
 *          The values for field type depend on what type of formatter the
 *          UFieldPositionIterator has been set by; for a date formatter, the
 *          values from the UDateFormatField enum. For more information, see the
 *          descriptions of format functions that take a UFieldPositionIterator*
 *          parameter, such as {@link #udat_formatForFields}.
 *
 * @stable ICU 55
 */
int ufieldpositer_next_69(UFieldPositionIterator* fpositer,
	int* beginIndex, int* endIndex);
