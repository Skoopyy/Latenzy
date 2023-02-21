@echo off
title Latenzy Launcher
CLS
cd "C:\Program Files\Latenzy"
echo Select a task:
echo =============
echo -
ECHO 1. Optimize Minecraft
ECHO 2. Optimize Fortnite
ECHO 3. Optimize your computer by debloating
ECHO 4. Optimize your Internet using Google's DNS servers
ECHO 5. Optimize your computer using Cloudflare's DNS servers
ECHO 6. Optimize your ping
ECHO 7. Optimize performace with Latenzy's Power Plan
ECHO 8. Optimize your PC with Latenzy's Cleaner
ECHO 9. Optimize your NVIDIA Graphics Card
ECHO 10. Optimize your AMD Graphics Card
ECHO 11. Optimize your Intel iGPU
ECHO 12. Optimize audio latency - experimental
echo -
set /p op=Type option: 
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4
if "%op%"=="5" goto op5
if "%op%"=="6" goto op6
if "%op%"=="7" goto op7
if "%op%"=="8" goto op8
if "%op%"=="9" goto op9
if "%op%"=="10" goto op10
if "%op%"=="11" goto op11
if "%op%"=="12" goto op12

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
start LatenzyDebloat.bat
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
echo Option 6 it is
start LatenzyPing.bat
exit

:op7
echo Option 7 it is
start LatenzyPlan.bat
exit

:op8
echo Option 8 it is
start LatenzyCleaner.bat
exit

:op9
echo Option 9 it is
start LatenzyNVIDIA.bat
exit

:op10
echo Option 10 it is
start LatenzyAMD.bat
exit

:op11
echo Option 11 it is
start LatenzyIntel.bat
exit

:op11
echo Option 12 it is
start LatenzyAudio.bat
exit