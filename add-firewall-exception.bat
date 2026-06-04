@echo off
REM Batch script to add firewall exception
REM Run as Administrator

setlocal enabledelayedexpansion

set "APP_PATH=C:\Program Files\MobaXterm KeyGen\MobaXterm KeyGen.exe"
set "RULE_NAME=MobaXterm KeyGen"

REM Check if running as Admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: This script must be run as Administrator!
    echo Please right-click and select "Run as Administrator"
    pause
    exit /b 1
)

echo.
echo ================================
echo Firewall Exception Setup
echo ================================
echo.
echo Adding firewall exception for: !APP_PATH!
echo.

REM Remove existing rules
netsh advfirewall firewall delete rule name="!RULE_NAME!" >nul 2>&1
netsh advfirewall firewall delete rule name="!RULE_NAME! (Outbound)" >nul 2>&1

REM Add inbound rule
netsh advfirewall firewall add rule name="!RULE_NAME!" dir=in action=allow program="!APP_PATH!" enable=yes

REM Add outbound rule
netsh advfirewall firewall add rule name="!RULE_NAME! (Outbound)" dir=out action=allow program="!APP_PATH!" enable=yes

echo.
echo ================================
echo Firewall exception added!
echo ================================
echo.
pause
