@echo off
title Latenzy
cd /
cd "C:\Program Files\Latenzy"
echo Press 1 to start Latenzy after install, otherwise press 2 to exit
set /p op=Type option: 
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2

:op1
start LatenzyLauncher.bat
exit

:op2
exit
