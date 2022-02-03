/*******************************************************************************
 * Common definitions for internal use.
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 */
module bindbc.icu.bindcommon;

import std.meta;

import bindbc.icu.bindings.parseerr;
import bindbc.icu.bindings.ucnv;
import bindbc.icu.bindings.ucnv_err;
import bindbc.icu.bindings.ucsdet;
import bindbc.icu.bindings.ucurr;
import bindbc.icu.bindings.udisplaycontext;
import bindbc.icu.bindings.uenum;
import bindbc.icu.bindings.uformattable;
import bindbc.icu.bindings.uloc;
import bindbc.icu.bindings.umisc;
import bindbc.icu.bindings.utypes;

package(bindbc.icu) enum string icuVersion = "69";
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
	bindbc.icu.bindings.umisc,
	bindbc.icu.bindings.uloc,
	bindbc.icu.bindings.uformattable,
	bindbc.icu.bindings.uenum,
	bindbc.icu.bindings.ucurr,
	bindbc.icu.bindings.udisplaycontext,
	bindbc.icu.bindings.ucsdet,
	bindbc.icu.bindings.ucnv,
	bindbc.icu.bindings.ucnv_err,
	bindbc.icu.bindings.parseerr,
);


