@echo off
title Latenzy - Launching
:admincheck
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit
)
title Latenzy - Audio Optimizer
if "%AUDOF%" == "%COL%[91mOFF" (
	if not exist nssm.exe (
		curl -g -L -# -o "nssm.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/nssm.exe"
		curl -g -L -# -o "REAL.exe" "https://github.com/auraside/HoneCtrl/raw/main/Files/REAL.exe"
		nssm install LatenzyAudio "REAL.exe"
		nssm set LatenzyAudio DisplayName Latenzy Audio Latency Reducer Service
		nssm set LatenzyAudio Description Reduces Audio Latency
		nssm set LatenzyAudio Start SERVICE_AUTO_START
		nssm set LatenzyAudio AppAffinity 1
	)
nssm set LatenzyAudio start SERVICE_AUTO_START
nssm start LatenzyAudio
) >nul 2>&1 else (
nssm set LatenzyAudio start SERVICE_DISABLED
nssm stop LatenzyAudio
) >nul 2>&1
timeout 2 /nobreak > nul
echo Doing driver tweaks...
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