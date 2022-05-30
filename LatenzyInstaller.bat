@echo off
color 0
title Installing Latenzy
echo Installing Latenzy...
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
cls
title Installing Latenzy...
echo Preparing for install...
cd /
cd "Program Files"
md Latenzy > nul
cls
echo Fetching info files from GitHub...
cd Latenzy
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/verinfo.txt -O VersionInfo.txt
echo Fetched info files.
echo Installing...
cls
echo Installing Latenzy Launcher...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyLauncher.bat -O LatenzyLauncher.bat
cls
echo Installed Latenzy Launcher.
echo Installing Latenzy Minecraft...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyMC.bat -O LatenzyMC.bat
cls
echo Installed Latenzy Minecraft.
echo Installing Latenzy Fortnite...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyFN.bat -O LatenzyFN.bat
cls
echo Installed Latenzy Fortnite.
echo Installing Latenzy DNS configurators...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyGoogleDNS.bat -O LatenzyGoogleDNS.bat
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyCloudflareDNS.bat -O LatenzyCloudflareDNS.bat
cls
echo Installed Latenzy DNS configurators.
echo Installing Latenzy Power Plan...
echo https://raw.githubusercontent.com/Skoopyy/Latenzy/main/LatenzyPlan.pow > LatenzyPlan.pow
cls
echo Installed Latenzy Power Plan.
echo Installing Latenzy Debloater...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyDebloat.bat -O LatenzyDebloat.bat
CLS
echo Installed Latenzy Debloater.
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
cscript CreateShortcut.vbs
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
echo Installed Latenzy, press any key to exit.
pause > nul
exit