@echo off

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

ACERACDC.EXE
if errorlevel 255 goto DosFlash
goto end

:DosFlash
iChipset
if errorlevel 31 if not errorlevel 32 goto QM77
if errorlevel 33 if not errorlevel 34 goto HM77SBA

Echo Can't identify chipset
goto end


:QM77
cd QM77
call bios.bat
cd ..
goto end

:HM77SBA
cd HM77SBA
call bios.bat
cd ..
goto end

:end
                                                                                                   