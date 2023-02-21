@echo off
title Latenzy - Launching
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
title Latenzy - Cleaner
title Latenzy - Cleaning
echo Cleaning files...
cls
rmdir /S /Q "DeviceCleanupCmd\" >nul 2>&1
del /F /Q "AdwCleaner.exe" >nul 2>&1
del /F /Q "EmptyStandbyList.exe" >nul 2>&1
curl -g -L -# -o "EmptyStandbyList.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/EmptyStandbyList.exe"
curl -g -L -# -o "DeviceCleanupCmd.zip" "https://www.uwe-sieber.de/files/DeviceCleanupCmd.zip"
curl -g -L -# -o "AdwCleaner.exe" "https://adwcleaner.malwarebytes.com/adwcleaner?channel=release"
powershell -NoProfile Expand-Archive 'DeviceCleanupCmd.zip' -DestinationPath '%SYSTEMDRIVE%\Hone\Resources\DeviceCleanupCmd\'
del /F /Q "DeviceCleanupCmd.zip" >nul 2>&1
del /Q %LOCALAPPDATA%\Microsoft\Windows\INetCache\IE\*.* >nul 2>&1
del /Q "%SYSTEMROOT%\Downloaded Program Files\*.*" >nul 2>&1
rd /s /q %SYSTEMDRIVE%\$Recycle.bin >nul 2>&1
del /Q %TEMP%\*.* >nul 2>&1
del /Q %SYSTEMROOT%\Temp\*.* >nul 2>&1
del /Q %SYSTEMROOT%\Prefetch\*.* >nul 2>&1
cd %SYSTEMDRIVE%\Hone\Resources >nul 2>&1
AdwCleaner.exe /eula /clean /noreboot
for %%g in (workingsets modifiedpagelist standbylist priority0standbylist) do EmptyStandbyList.exe %%g
cd "%SYSTEMDRIVE%\Hone\Resources\DeviceCleanupCmd\x64" >nul 2>&1
DeviceCleanupCmd.exe *
cls
color 0b
echo Thank you for using Latenzy.
echo.
echo --------------------------------------
echo Author: Skoopyy
echo youtube.com/SkoopyyYouTube
echo github.com/Skoopyy
echo --------------------------------------
echo.
echo Press any key to exit Latenzy.
pause > nul
exit