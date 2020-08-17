/*******************************************************************************
 * Common definitions for internal use.
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 */
module bindbc.icu.bindcommon;


import std.meta;
import bindbc.icu.bindings.utypes;
import bindbc.icu.bindings.uenum;
import bindbc.icu.bindings.ucsdet;

package(bindbc.icu) enum string icuVersion = "67";
package(bindbc.icu) alias icuLibraries = AliasSeq!("icudt", "icuin", "icuio", "icutu", "icuuc");
package(bindbc.icu) string libFileName(string libName)
{
	version (Windows) return libName;
	version (Posix) final switch (libName)
	{
	case "icudt": return "icudata";
	case "icuin": return "icui18n";
	case "icuio": return "icuio";
	case "icutu": return "icutu";
	case "icuuc": return "icuuc";
	}
}

package(bindbc.icu) alias icuBindings = AliasSeq!(
	bindbc.icu.bindings.utypes,
	bindbc.icu.bindings.uenum,
	bindbc.icu.bindings.ucsdet,);


