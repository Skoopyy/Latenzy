@echo off
title Latenzy - Launching
:admincheck
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

:optimize
title Latenzy - Minecraft Edition
cls
echo Setting svchost process to idle...
wmic process where name="svchost.exe" CALL setpriority "idle"
cls
echo Pinging localhost...
ping 127.0.0.1 -n 5 >nul
cls
echo Setting Minecraft's processes to high priority...
wmic process where name="javaw.exe" CALL setpriority "high priority"
wmic process where name="javaw.exe" CALL setpriority "high priority"
cls
echo Flushing DNS...
echo *This will change your IP address only if you have a dynamic IP address, nothing else will be changed*
ipconfig /flushdns
cls
title Latenzy - Finished
echo Finished optimizing your PC, enjoy!
sc start BITS
goto done
:done
echo Minecraft optimized at %time%, do not delete this file unless you want to optimize again. > "C:\Latenzy\Optimizer\mcinfo.txt"
cls
color 0b
echo Thank you for using Latenzy.
echo --------------------------------------
echo Author: Skoopyy
echo youtube.com/SkoopyyYouTube
echo github.com/Skoopyy
echo --------------------------------------
echo Press any key to exit Latenzy.
pause > nul
exit