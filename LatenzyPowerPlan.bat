@echo off
title Latenzy - Launching
if not "%1"=="am_admin" (
    title Latenzy - Requesting admin permissions...
    powershell -Command "Start-Process -Verb RunAs -FilePath '%0' -ArgumentList 'am_admin'"
    exit /b
)
title Latenzy - Power Plan
echo Setting your power plan...
cd /
cd "Program Files"
cd Latenzy
echo %PWROF% | find "N/A" >nul && echo "This powerplan is not designed for laptops." && goto exit
if "%PWROF%" == "%COL%[91mOFF" (
	curl -g -k -L -# -o "Latenzy.pow" "https://github.com/auraside/HoneCtrl/raw/main/Files/HoneV2.pow"
	powercfg /d 44444444-4444-4444-4444-444444444449
	powercfg -import "Latenzy.pow" 44444444-4444-4444-4444-444444444449
	powercfg /changename 44444444-4444-4444-4444-444444444449 "Latenzy Power Plan" "The Ultimate Power Plan to increase FPS, improve latency and reduce input lag."
set THREADS=%NUMBER_OF_PROCESSORS%
	for /f "tokens=2 delims==" %%n in ('wmic cpu get numberOfCores /value') do set CORES=%%n
	if "%CORES%" == "%NUMBER_OF_PROCESSORS%" (
		powercfg -setacvalueindex 44444444-4444-4444-4444-444444444449 sub_processor IDLEDISABLE 1
) else (
		powercfg -setacvalueindex 44444444-4444-4444-4444-444444444449 sub_processor IDLEDISABLE 0 
)
	powercfg -setacvalueindex 44444444-4444-4444-4444-444444444449 sub_processor IDLEDISABLE 0
	powercfg -setactive "44444444-4444-4444-4444-444444444449"
) >nul 2>&1 else (
	powercfg -restoredefaultschemes
) >nul 2>&1
:exit
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