@if x%COFFIMPLIB%x == xx set COFFIMPLIB=coffimplib.exe

@call :convert_lib icudt.lib
@call :convert_lib icuin.lib
@call :convert_lib icuio.lib
@call :convert_lib icutu.lib
@call :convert_lib icuuc.lib
@exit /b 0

:convert_lib
@copy /Y ..\windows-x86_mscoff\%1 %1 >NUL
@call %COFFIMPLIB% -f %1
@exit /b
