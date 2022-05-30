@echo off
title Latenzy Launcher
CLS
cd "C:\Program Files\Latenzy"
echo Select a task:
echo =============
echo -
ECHO 1. Optimize Minecraft using Latenzy
ECHO 2. Optimize Fortnite using Latenzy
ECHO 3. Optimize your computer by stopping automatic updates
ECHO 4. Optimize your Internet using Google's DNS servers
ECHO 5. Optimize your computer using Cloudflare's DNS servers
ECHO 6. Exit Latenzy
echo -
set /p op=Type option: 
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4
if "%op%"=="5" goto op5
if "%op%"=="6" goto op6

echo Please pick an option:
goto begin


:op1
echo Option 1 it is
start LatenzyMC.bat
exit

:op2
echo Option 2 it is
start LatenzyFN.bat
exit

:op3
echo Option 3 it is
cls
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
cls
title Latenzy - Windows Update
set
timeout 1 /nobreak > nul
cls
echo Stopping automatic updates...
net stop wuauserv
sc config wuauserv start= disabled
echo Stopped sucessfully.
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

:op4
echo Option 4 it is
start LatenzyGoogleDNS.bat
exit

:op5
echo Option 5 it is
start LatenzyCloudflareDNS.bat
exit

:op6
exit