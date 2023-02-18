@echo off
color 0
title Installing Latenzy
echo Installing Latenzy...
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit 
)
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
cd /
cd "Program Files"
md Latenzy > nul
cls
echo Don't trust EzPing, they already got exposed
echo ---------------------
echo Fetching info files from GitHub...
cd Latenzy
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
echo https://raw.githubusercontent.com/Skoopyy/Latenzy/main/LatenzyPlan.pow > LatenzyPlan.pow > nul
cls
echo Installed Latenzy Power Plan.
echo Installing Latenzy Debloater...
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyDebloat.bat -O LatenzyDebloat.bat > nul
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
echo Installed Latenzy, press any key to exit.
pause > nul
exit