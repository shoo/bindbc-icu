# Check list for Version up icu4c
- [x] icuVersion of bindbc.icu.bindcommon.d
  ```diff
  - package(bindbc.icu) enum string icuVersion = "67";
  + package(bindbc.icu) enum string icuVersion = "68";
  ```
- [x] Function name of bindbc.icu.bindngs.*
  ```diff
  - int ucnv_compareNames_67(const(char)* name1, const(char)* name2);
  + int ucnv_compareNames_68(const(char)* name1, const(char)* name2);
  ```
  Need to check by taking DIFF in ICU4C headers.
- [x] Update windows binaries  
  from https://github.com/unicode-org/icu/releases
  - bin/windows-x86_64/*
  - bin/windows-x86/*
- [x] Update windows static libiraries  
  from https://github.com/unicode-org/icu/releases
  - libs/windows-x86_64/*
  - libs/windows-x86_mscoff/*
  - libs/windows-x86_omf/*  
    from mscoff, use coffimplib (helper: libs/windows-x86_omf/make_lib_from_mscoff.bat)
- [x] dub.json
  - copyFiles-windows-x86
  - copyFiles-windows-x86_64
  - libs-linux
- [x] README.md
  - Badge
  - Sample codes
  - git repository (tag)
  - Changes of LICENSE (https://github.com/unicode-org/icu/blob/main/icu4c/LICENSE)
- [x] Github Actions
  ```diff
  - git clone -b release-67-1 --depth 1 --single-branch https://github.com/unicode-org/icu.git
  + git clone -b release-68-2 --depth 1 --single-branch https://github.com/unicode-org/icu.git
  ```
  - master.yml
  - pr.yml
  - status.yml
- [x] Run unittests
  ```sh
  rdmd scripts/runner.d -m=ut
  rdmd scripts/runner.d -m=it
  ```
- [x] When any other changes
  Update this checklist.
