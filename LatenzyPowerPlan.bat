@echo off
title Latenzy - Launching
:admincheck
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
powercfg -import "LatenzyPlan.pow"