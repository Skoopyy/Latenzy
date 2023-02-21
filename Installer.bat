@echo off
title Latenzy Installer
echo Unpacking...
cd \
cd %temp%
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyInstaller.bat -O LatenzyInstaller.bat > nul
start LatenzyInstaller.bat
exit