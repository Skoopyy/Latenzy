@echo off
title Latenzy Installer
echo Unpacking...
cd \
cd %temp%
title Latenzy Installer Console
cls
echo Unpacking Installer...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyInstaller.bat -O LatenzyInstaller.bat > nul
cls
echo Installing Latenzy...
start LatenzyInstaller.bat
exit