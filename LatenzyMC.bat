@echo off
title Latenzy - Launching
:admincheck
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)

:optimize
title Latenzy - Minecraft
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
timeout 1 /nobreak > nul
ipconfig /flushdns
cls
echo Giving you the best Optifine settings...
cd /
cd "%appdata%\.minecraft"
powershell curl https://raw.githubusercontent.com/Skoopyy/Latenzy/main/optionsof.txt -O optionsof.txt
cls
echo Gave you the best Optifine settings.
timeout 1 /nobreak > nul
cls
title Latenzy - Finished
echo Finished optimizing your PC, enjoy!
sc start BITS
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