@echo off
cd /d %~dp0

for /F "Skip=1 tokens=1,2,3 delims=." %%A IN ('wmic os get version') Do call :SetOsVer %%A %%B %%C

if "%OS_Main%"=="5" (call launch.bat) else (cmd.exe /C "%~dp0\launch.bat" %*)



set OS_main=
set OS_Sub=
Set OS_Build=
goto :eof


:SetOsVer
if not "%OS_main%"=="" goto :eof
if not "%OS_sub%"=="" goto :eof
if not "%OS_Build%"=="" goto :eof
if "%3"=="" goto :eof

set OS_main=%1
set OS_Sub=%2
Set OS_Build=%3

goto :eof
