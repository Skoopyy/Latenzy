@echo off
title Latenzy Installer
echo Installing Latenzy...
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
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
    md Latenzy
    cd Latenzy
)
:Install
cls
title Latenzy Installer
echo Fetching EULA...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/EULA.txt -O EULA.txt > nul
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
title Installing Latenzy...
echo Preparing for install...
reg add "HKLM\System\CurrentControlSet\Control\CrashControl" /v "DisplayParameters" /t REG_DWORD /d "1" /f >nul 2>&1
echo|(set /p="Creating restore point" & echo.)
Wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "Latenzy Restore Point", 100, 7
cls
echo Fetching info files from GitHub...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/verinfo.txt -O VersionInfo.txt > nul
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyIcon.ico -O LatenzyIcon.ico > nul
echo Fetched info files.
echo Installing...
cls
echo Installing Latenzy Launcher...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyLauncher.bat -O LatenzyLauncher.bat > nul
cls
echo Installed Latenzy Launcher.
echo Installing Latenzy Minecraft...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyMC.bat -O LatenzyMC.bat >  nul
cls
echo Installed Latenzy Minecraft.
echo Installing Latenzy Fortnite...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyFN.bat -O LatenzyFN.bat > nul
cls
echo Installed Latenzy Fortnite.
echo Installing Latenzy DNS configurators...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyGoogleDNS.bat -O LatenzyGoogleDNS.bat > nul
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyCloudflareDNS.bat -O LatenzyCloudflareDNS.bat > nul
cls
echo Installed Latenzy DNS configurators.
echo Installing Latenzy Power Plan...
echo https://raw.githubusercontent.com/Skoopyy/Latenzy/main/LatenzyPowerPlan.bat > LatenzyPowerPlan.bat > nul
cls
echo Installed Latenzy Power Plan.
echo Installing Latenzy Debloater...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyDebloat.bat -O LatenzyDebloat.bat > nul
cls
echo Installed Latenzy Debloater.
echo Installing Latenzy Ping Optimizer...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyPing.bat -O LatenzyPing.bat > nul
cls
echo Installed Latenzy Ping Optimizer.
echo Installing Latenzy Cleaner...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyCleaner.bat -O LatenzyCleaner.bat > nul
cls
echo Installed Latenzy Cleaner.
echo Installing Latenzy Driver Optimizers...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyNVIDIA.bat -O LatenzyNVIDIA.bat > nul
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyAMD.bat -O LatenzyAMD.bat > nul
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyIntel.bat -O LatenzyIntel.bat > nul
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyAudio.bat -O LatenzyAudio.bat > nul
CLS
echo Installed Latenzy Driver Optimizers.
echo Creating script to make desktop shortcut...
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\Latenzy Launcher.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Program Files\Latenzy\LatenzyLauncher.bat" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cls
echo Created script to make desktop shortcut.
title Almost done installing Latenzy
cls
echo Creating desktop shortcut...
echo.
cscript CreateShortcut.vbs > nul
del CreateShortcut.vbs
cls
echo Creating script to make start shortcut...
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Latenzy Launcher.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\Program Files\Latenzy\LatenzyLauncher.bat" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
cls
title Installed Latenzy
echo.
echo Press 1 to start Latenzy after install, otherwise press 2 to exit
set /p op=Type option: 
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2

:op1
start LatenzyLauncher.bat
exit

:op2
exit

:Uninstall
cls
title Latenzy Uninstaller
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