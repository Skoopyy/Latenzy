@echo off
title Latenzy Installer
echo Installing Latenzy...
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit
)
cls
title Latenzy Installer
echo Doing file check...
cd /
cd "Program Files"
if exist Latenzy\ (
    echo It seems like you already have Latenzy installed, do you want to reinstall it?
    echo 1. Reinstall Latenzy
    echo 2. Uninstall Latenzy
    echo 3. Exit
    CHOICE /C 123 /M "Enter your choice: "
    IF ERRORLEVEL 3 exit
    IF ERRORLEVEL 2 rd Latenzy /s /q & goto Uninstall
    IF ERRORLEVEL 1 rd Latenzy /s /q & goto Install
) else (
    goto Install
)
:Install
md Latenzy
cd Latenzy
cls
title Latenzy Installer
echo Fetching EULA...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/EULA.txt -O EULA.txt > nul
powershell curl https://github.com/Skoopyy/Latenzy/blob/main/LatenzyInstallerUI.exe?raw=true -O LatenzyInstallerUI.exe > nul
cls
echo By installing Latenzy, you agree to the EULA.
echo The EULA will show up in 3 seconds
timeout 1 /nobreak > nul
cls
echo By installing Latenzy, you agree to the EULA.
echo The EULA will show up in 2 seconds
timeout 1 /nobreak > nul
cls
echo By installing Latenzy, you agree to the EULA.
echo The EULA will show up in 1 second
timeout 1 /nobreak > nul
cls
type EULA.txt
echo.
echo.
timeout 2 /nobreak > nul
echo Press any key to accept the EULA and continue.
pause > nul
cls
start LatenzyInstallerUI.exe
title Installing Latenzy...
echo Preparing for install...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/InstallerHelper.bat -O InstallerHelper.bat > nul
reg add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >nul 2>&1
cls
start /min InstallerHelper.bat
exit

:Uninstall
cls
title Latenzy Uninstaller
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Latenzy" /f
echo Uninstalled Latenzy
echo.
echo Would you like to take a moment to tell us why you uninstalled Latenzy?
echo Y for yes, N for no
set /p op=Type option: 
if "%op%"=="Y" goto yes
if "%op%"=="N" goto no

:yes
start https://bit.ly/LatenzyUninstall
exit

:no
exit
