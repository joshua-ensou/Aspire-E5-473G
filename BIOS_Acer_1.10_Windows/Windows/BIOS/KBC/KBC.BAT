@echo off

AC
if errorlevel 255 goto KBCFlash
goto fail

:KBCFlash
flupdate -bbl -vrd -novr -nocomp -noverify -noreboot -nopause -v -x 2 W28AC110.bin -runbsf PchDec.bsf

goto BIOSFlash

:BIOSFlash
cd..
cd BIOS
call BIOS.bat
goto end

:fail
echo *******************************************
echo *        Please Plug the Adaptor          *
echo *        and  Run BIOS.bat again!!        *
echo *******************************************
pause

:end