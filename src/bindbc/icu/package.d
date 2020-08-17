/*******************************************************************************
 * bindbc-icu
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 */
module bindbc.icu;


version (BindBC_ICU_Dynamic)
{
	///
	public import bindbc.icu.binddynamic;
}
else version (BindBC_ICU_Static)
{
	///
	public import bindbc.icu.bindstatic;
}
