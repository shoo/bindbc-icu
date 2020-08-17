/*******************************************************************************
 * For dynamic link
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 */
module bindbc.icu.binddynamic;

version (BindBC_ICU_Dynamic):

import bindbc.loader;
import std.traits;
import std.meta;
import std.string: stripRight;
import bindbc.icu.bindcommon;


mixin((){
	///
	string ret;
	static foreach (mod; icuBindings)
	{
		ret ~= `static import ` ~ fullyQualifiedName!mod ~ ";\n";
		static foreach (member; __traits(allMembers, mod))
		{
			static if (is(__traits(getMember, mod, member) == struct))
			{
				// struct
				ret ~= `alias ` ~ member ~ ` = ` ~ fullyQualifiedName!(__traits(getMember, mod, member)) ~ ";\n";
			}
			else static if (is(__traits(getMember, mod, member) == enum))
			{
				// enum
				ret ~= `alias ` ~ member ~ ` = ` ~ fullyQualifiedName!(__traits(getMember, mod, member)) ~ ";\n";
				static foreach (enumMember; __traits(allMembers, __traits(getMember, mod, member)))
					ret ~= `alias ` ~ enumMember ~ ` = `
						~ fullyQualifiedName!(__traits(getMember, __traits(getMember, mod, member), enumMember)) ~ ";\n";
			}
			else static if (is(typeof(__traits(getMember, mod, member)) == function))
			{
				// function
				ret ~= `typeof(&` ~ fullyQualifiedName!(__traits(getMember, mod, member)) ~ `) `
					~ member.stripRight("_" ~ icuVersion) ~ ";\n";
			}
			else static if (__traits(isTemplate, __traits(getMember, mod, member)))
			{
				// template
				ret ~= `alias ` ~ member ~ ` = ` ~ fullyQualifiedName!(__traits(getMember, mod, member)) ~ ";\n";
			}
			else static if (is(__traits(getMember, mod, member)))
			{
				// type
				ret ~= `alias ` ~ member ~ ` = ` ~ fullyQualifiedName!(__traits(getMember, mod, member)) ~ ";\n";
			}
			else static if (is(typeof(__traits(getMember, mod, member))))
			{
				// value
				ret ~= `alias ` ~ member ~ ` = ` ~ fullyQualifiedName!(__traits(getMember, mod, member)) ~ ";\n";
			}
			//else pragma(msg, "unknown member type " ~ member);
		}
	}
	return ret;
}());


mixin((){
	///
	string ret;
	static foreach (name; icuLibraries)
		ret ~= `private __gshared SharedLib lib_` ~ name ~ ";\n";
	return ret;
}());


///
enum IcuSupport
{
	///
	noLibrary,
	///
	badLibrary,
	///
	icu,
}

///
IcuSupport loadIcu() @nogc nothrow
{
	version (Windows) enum buildLibName(string name) = libFileName(name) ~ icuVersion ~ ".dll";
	version (OSX)     enum buildLibName(string name) = "lib" ~ libFileName(name) ~ "." ~ icuVersion ~ ".dylib";
	version (linux)   enum buildLibName(string name) = "lib" ~ libFileName(name) ~ ".so." ~ icuVersion;
	
	static foreach (name; icuLibraries)
	{
		__traits(getMember, bindbc.icu.binddynamic, "lib_" ~ name) = load(buildLibName!name);
		if (__traits(getMember, bindbc.icu.binddynamic, "lib_" ~ name) == invalidHandle)
			return IcuSupport.noLibrary;
	}
	
	void bind(alias lib, alias targetSymbol, string symbolName)()
	{
		lib.bindSymbol(cast(void**)&targetSymbol, symbolName);
	}

	template filterMod(alias mod, string uda)
	{
		static if (__traits(getAttributes, mod).length > 0)
		{
			enum bool filterMod = __traits(getAttributes, mod)[0] == uda;
		}
		else
		{
			enum bool filterMod = false;
		}
	}
	
	const errCount = errorCount();
	static foreach (libName; icuLibraries)
	static foreach (mod; Filter!(ApplyRight!(filterMod, libName), icuBindings))
	static foreach (member; __traits(allMembers, mod))
	{
		static if (is(typeof(__traits(getMember, mod, member)) == function))
			bind!(__traits(getMember, bindbc.icu.binddynamic, "lib_" ~ libName),
				__traits(getMember, bindbc.icu.binddynamic, member.stripRight("_" ~ icuVersion)),
				member);
	}
	
	if (errorCount() != errCount)
		return IcuSupport.badLibrary;
	
	return IcuSupport.icu;
}


///
void unloadIcu() @nogc nothrow
{
	static foreach (name; icuLibraries)
	{
		if (__traits(getMember, bindbc.icu.binddynamic, "lib_" ~ name) != invalidHandle)
			__traits(getMember, bindbc.icu.binddynamic, "lib_" ~ name).unload();
	}
}

@system unittest
{
	loadIcu();
	unloadIcu();
}
