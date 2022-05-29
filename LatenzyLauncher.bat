@echo off
title Latenzy Launcher
CLS
echo Select a task:
echo =============
echo -
ECHO 1. Optimize Minecraft using Latenzy
ECHO 2. Optimize Fortnite using Latenzy
ECHO 3. Optimize your Internet using Cloudflare's DNS servers
ECHO 4. Optimize your Internet using Google's DNS servers
ECHO 5. Exit Latenzy
echo -
set /p op=Type option: 
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4
if "%op%"=="5" goto op5

echo Please pick an option:
goto begin


:op1
echo you picked option 1
start LatenzyMC.bat
exit

:op2
echo you picked option 2
start LatenzyFN.bat
exit

:op3
echo you picked option 3
start LatenzyCloudflareDNS.bat
exit

:op4
echo you picked option 4
start LatenzyGoogleDNS.bat
exit

:op5
exit
