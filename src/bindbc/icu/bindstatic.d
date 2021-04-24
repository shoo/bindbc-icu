/*******************************************************************************
 * For static link
 * 
 * License: [BSL-1.0](http://boost.org/LICENSE_1_0.txt).
 */
module bindbc.icu.bindstatic;

version (BindBC_ICU_Static):

import std.meta;
import std.traits;
import std.string: stripRight;
import bindbc.icu.bindcommon;


mixin((){
	///
	string ret;
	static foreach (mod; icuBindings)
		ret ~= `static import ` ~ fullyQualifiedName!mod ~ ";\n";
	static foreach (mod; icuBindings)
	{
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
				ret ~= `alias ` ~ member.stripRight("_" ~ icuVersion) ~ ` = `
					~ fullyQualifiedName!(__traits(getMember, mod, member)) ~ ";\n";
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
