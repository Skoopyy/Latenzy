@echo off
title Latenzy
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit 
)
title Latenzy - Intel iGPU Optimizer
echo %DSSOF% | find "N/A" >nul && echo You don't have an Intel iGPU && goto exit
REM DedicatedSegmentSize in Intel iGPU
if "%DSSOF%" == "%COL%[91mOFF" (
	reg add "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /t REG_DWORD /d "1024" /f
) >nul 2>&1 else (
	reg delete "HKLM\SOFTWARE\Intel\GMM" /v "DedicatedSegmentSize" /f
) >nul 2>&1
:exit
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