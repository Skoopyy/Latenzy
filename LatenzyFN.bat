@echo off
title Latenzy - Fortnite
:admincheck
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit 
)
title Latenzy - Fortnite
cls
echo Setting Fortnite's processes to high priority...
wmic process where name="EpicGamesLauncher.exe" CALL setpriority "high priority" > nul
wmic process where name="FortniteClient-Win64-Shipping.exe" CALL setpriority "high priority" > nul
cls
echo Setting svchost process to idle...
wmic process where name="svchost.exe" CALL setpriority "idle" > nul
echo Flushing DNS...
echo *This will change your IP address only if you have a dynamic IP address, nothing else will be changed*
timeout 1 /nobreak > nul
ipconfig /flushdns
cls
echo Pinging localhost...
ping 127.0.0.1 -n 5 > nul
cls
title Latenzy - Finished
echo Finished optimizing your PC, enjoy!
sc start BITS > nul
goto done
:done
cls
color 0b
echo Thank you for using Latenzy.
echo.
echo --------------------------------------
echo Author: Skoopyy
echo youtube.com/SkoopyyYouTube
echo github.com/Skoopyy
echo --------------------------------------
echo.
echo Press any key to exit Latenzy.
pause > nul
exit