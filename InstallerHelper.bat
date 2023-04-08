@echo off
title Latenzy Installer
echo Installing Latenzy...
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit
)
cls
title Latenzy Installer Console
cd /
cd "C:\Program Files\Latenzy"
echo Fetching info files from GitHub...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/version.txt -O Version.txt > nul
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyIcon.ico -O LatenzyIcon.ico > nul
echo Fetched info files.
type version.txt
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
taskkill /f /im "LatenzyInstallerUI.exe"
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/InstallerHelper2.bat -O InstallerHelper2.bat > nul
start cmd /c InstallerHelper2.bat
exit