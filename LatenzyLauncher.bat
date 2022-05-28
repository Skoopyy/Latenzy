@echo off
title Latenzy Launcher
CLS
ECHO 1. Optimize Minecraft using Latenzy
ECHO 2. Optimize Fortnite using Latenzy
ECHO 3. Optimize your Internet using Cloudflare's DNS servers
ECHO 4. Optimize your Internet using Google's DNS servers
ECHO 5. Exit Latenzy
ECHO.

CHOICE /C 12345 /M "Enter your choice: "

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 5 GOTO Exit
IF ERRORLEVEL 4 GOTO GoogleDNS
IF ERRORLEVEL 3 GOTO CloudflareDNS
IF ERRORLEVEL 2 GOTO Fortnite
IF ERRORLEVEL 1 GOTO Minecraft

:minecraft
cls
LatenzyMC

:fortnite
cls
LatenzyFN

:CloudflareDNS
cls
LatenzyCloudflareDNS

:GoogleDNS
cls
LatenzyGoogleDNS

:Exit
cls
echo Exiting Latenzy...
timeout 3 /nobreak > nul
exit
