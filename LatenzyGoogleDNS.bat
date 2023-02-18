@echo off
title Latenzy - Google DNS
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit 
)
title Latenzy - Google DNS
CLS
echo Please input the name of your network adapter here (ex: "Wi-Fi")
echo You can open the Performance tab in Task Manager to find out.
set /p adapterName="Network adapter name: "
cls
FOR /F "tokens=* delims=:" %%a IN ('IPCONFIG ^| FIND /I "ETHERNET ADAPTER"') DO (
SET adapterName=%%a
 
REM Removes "Ethernet adapter" from the front of the adapter name
SET adapterName=!adapterName:~17!
 
REM WinXP Remove some weird trailing chars (dunno what they are)
FOR /l %%a IN (1,1,255) DO IF NOT "!adapterName:~-1!"==":" SET adapterName=!adapterName:~0,-1!
 
REM Removes the colon from the end of the adapter name
SET adapterName=!adapterName:~0,-1!
echo !adapterName!
GOTO:EOF
netsh interface ip set dns name="!adapterName!" static 8.8.8.8 primary
netsh interface ip add dns name="!adapterName!" 8.8.4.4 index=2
)
goto done
:done
title Latenzy - Finished
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
