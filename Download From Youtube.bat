if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
@echo off
for /f %%a in ('powershell -command "Get-Clipboard"') do (set url=%%a)
if "%url%"=="" exit
echo "%url%" | findstr /l youtube.com
if errorlevel 1 exit
setlocal enableextensions disabledelayedexpansion
for /f "tokens=1-3 delims=." %%a in ("%url%") do (
set "major=%%a"
set "minor=%%b"
set "build=%%c"
)
start https://ss%minor%.%build%
exit