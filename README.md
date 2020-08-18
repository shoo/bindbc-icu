# ICU(International Components for Unicode) for D
[![status](https://github.com/shoo/bindbc-icu/workflows/status/badge.svg)](https://github.com/shoo/bindbc-icu/actions?query=workflow%3Astatus)
[![master](https://github.com/shoo/bindbc-icu/workflows/master/badge.svg)](https://github.com/shoo/bindbc-icu/actions?query=workflow%3Amaster)
[![dub](https://img.shields.io/dub/v/bindbc-icu.svg?cacheSeconds=3600)](https://code.dlang.org/packages/bindbc-icu)
[![downloads](https://img.shields.io/dub/dt/bindbc-icu.svg?cacheSeconds=3600)](https://code.dlang.org/packages/bindbc-icu)
[![BSL-1.0](http://img.shields.io/badge/license-BSL--1.0-blue.svg?style=flat)](./LICENSE)
[![codecov](https://codecov.io/gh/shoo/bindbc-icu/branch/master/graph/badge.svg)](https://codecov.io/gh/shoo/bindbc-icu)
[![ICU-Version](http://img.shields.io/badge/icu%20version-67.1-green.svg?style=flat)](https://github.com/unicode-org/icu/releases/tag/release-67-1)

This project provides dynamic and static bindings to the C API of ICU(International Components for Unicode). The bindings are `@nogc` and `nothrow` compatible and can be compiled for compatibility with <s>`-betterC`</s>.

`-betterC` is is currently unsupported. It is blocked by [Issue18472](https://issues.dlang.org/show_bug.cgi?id=18472), which is caused by the metaprogramming we use internally.([A bounty is being placed on this issue.](https://www.flipcause.com/secure/cause_pdetails/NjU3MTQ=))

# Usage
[Documents are here(ICU4C)](http://userguide.icu-project.org/)  
[And bindbc-icu's API lists are here](https://shoo.github.io/bindbc-icu/)

If you are using dub, you can add a dependency by describing it as follows:

```json
"dependencies": {
    "bindbc-icu": "~>67.1",
}
```

On Windows, the package includes binaries, so you can use it as is.  
On Linux or MacOS, the ICU must be installed. Be sure to specify the version of the ICU.

```sh
apt install libicu-dev=67.1-3
```

If the required version is not provided by the package manager, you will need to build it from source code.

```sh
git clone -b release-67-1 --depth 1 --single-branch https://github.com/unicode-org/icu.git
cd icu/icu4c/source
./runConfigureICU Linux --disable-samples --disable-tests --with-data-packaging=library
make -j2
make install
```

## Dynamic link
For dynamic linking, use subconfigurations in addition to dependencies.

```json
"dependencies": {
    "bindbc-icu": "~>67.1",
}
"subConfigurations": {
    "bindbc-icu": "dynamic"
}
```

Then, initialize the dynamic link library as follows:

```d
import bindbc.icu;

if (loadIcu() != IcuSupport.icu)
{
    stderr.write("Failed to load the library");
    return;
}
scope (exit)
    unloadIcu();
```

`bindbc.icu` bindbc.icu automatically selects and imports definitions(`bindbc.icu.binddynamic`) for dynamic linking.
In particular, ICU functions are characterized by a versioned function name (symbol), but you can use the variable of function pointer without versions.
Inside the library, create the alias as following:

```d
UCharsetDetector* ucsdet_open_67(UErrorCode* status) @system;   // real symbol
typeof(&ucsdet_open_67) ucsdet_open;                            // usable function pointer from dynamic link libraries
```

## Static link
For static linking, use subconfigurations in addition to dependencies.

```json
"dependencies": {
    "bindbc-icu": "~>67.1",
}
"subConfigurations": {
    "bindbc-icu": "static"
}
```

Then, you can use any symbols of icu4c as following:

```d
import bindbc.icu;
```

`bindbc.icu` bindbc.icu automatically selects and imports definitions(`bindbc.icu.bindstatic`) for static linking.
Then you can use ICU's C language function definitions and related structs, enums, etc.
In particular, ICU functions are characterized by a versioned function name (symbol), but you can use the aliasing name without versions.
Inside the library, create the alias as following:

```d
UCharsetDetector* ucsdet_open_67(UErrorCode* status) @system;   // real symbol
alias ucsdet_open = ucsdet_open_67;                             // usable alias
```

# Support status

|           | module |                     |
|:---------:|:------:|:-------------------:|
| ✅️       | ucsdet | Charset Detection   |
| ✅️       | ucnv   | Charset conversion  |
| ✖        | other  |                     |


# Contributing
This project accepts [Issue](https://github.com/shoo/bindbc-icu/issues) reports and [PullRequests](https://github.com/shoo/bindbc-icu/pulls).
The PullRequest must pass all tests in CI of [GitHub Actions](https://github.com/shoo/bindbc-icu/actions).
First, make sure that your environment passes the test with the following commands.

```sh
rdmd scripts/runner.d -m=ut # or dub test
rdmd scripts/runner.d -m=it # or dub build / test / run for all ./testcases/* directories.
```

# License

This library(bindbc-icu) is provided by provided under the [BSL-1.0](./LICENSE), but the ICU(ICU4C) on which this library depends is provided under the [ICU License](https://github.com/unicode-org/icu/blob/master/icu4c/LICENSE).
