@echo off
REM Script untuk build installer NSIS

echo.
echo ================================
echo MobaXterm KeyGen - NSIS Installer
echo ================================
echo.

REM Check if npm packages installed
if not exist "node_modules" (
    echo Installing dependencies...
    call npm install
)

echo.
echo Building NSIS Installer...
echo.

REM Build dengan electron-builder (akan generate .exe installer)
call npm run build

echo.
echo ================================
echo Build Complete!
echo Output files:
echo  - dist/MobaXterm-KeyGen-3.0.0-Setup.exe (Installer)
echo  - dist/MobaXterm-KeyGen-3.0.0-portable.exe (Portable)
echo ================================
echo.
pause
