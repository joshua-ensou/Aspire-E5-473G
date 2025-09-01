@echo off
cd /d %~dp0

echo *********** BIOS Flash Utility  ***********
REM ***************************************************************
REM *** Just modify the above part ********************************
echo Notice:
echo 1. This procedure may replace your BIOS!
echo    If you don't want to do it, press Ctrl-C to cancel.
echo 2. Make sure you plug in the AC adapter before flashing BIOS.
echo    If not, DO NOT flash!
echo 3. This utility will check if the battery capacity is over 30%%. 
echo    If not, it will stop to flash the BIOS.


if (%PROCESSOR_ARCHITECTURE%)==(x86) goto Winflash32
if (%PROCESSOR_ARCHITECTURE%)==(AMD64) goto Winflash64

:Winflash32
devcon32.exe find "PCI\VEN_8086&DEV_1E55*" |find "No matching devices found." >nul
if errorlevel 1 goto QM77
devcon32.exe find "PCI\VEN_8086&DEV_1E57*" |find "No matching devices found." >nul
if errorlevel 1 goto HM77
goto end

:Winflash64
devcon64.exe find "PCI\VEN_8086&DEV_1E55*" |find "No matching devices found." >nul
if errorlevel 1 goto QM77
devcon64.exe find "PCI\VEN_8086&DEV_1E57*" |find "No matching devices found." >nul
if errorlevel 1 goto HM77
goto end

:QM77
cd QM77
QUBIV110.exe
goto end

:HM77
cd HM77SBA
QUBIS110.exe
goto end


:end