@echo off

set UMAROM=BAD4V110.ROM

:BIOSFlash
Flash.exe /sd /ver /cvar /v /silent /bcp /bbl /file %UMAROM%
goto end

:end
                                                                                                   