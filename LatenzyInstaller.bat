@echo off
title Installing Latenzy
echo Installing Latenzy...
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
cls
title Installing Latenzy...
echo Getting install files from Github...
cd /
cd "Program Files"
md Latenzy
cd Latenzy
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyLauncher.bat -O LatenzyLauncher.bat
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyMC.bat -O LatenzyMC.bat
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyFN.bat -O LatenzyFN.bat
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyGoogleDNS.bat -O LatenzyGoogleDNS.bat
powershell curl https://github.com/Skoopyy/Latenzy/raw/main/LatenzyCloudflareDNS.bat -O LatenzyCloudflareDNS.bat
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\Latenzy Launcher.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "C:\ProgramFiles\Latenzy\LatenzyLauncher.bat" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs
cls
title Installed Latenzy
echo Installed Latenzy, press any key to exit.
pause > nul
exit