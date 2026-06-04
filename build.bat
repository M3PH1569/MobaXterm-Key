@echo off
REM Build script for MobaXterm KeyGen

echo.
echo ================================
echo MobaXterm KeyGen - Build Script
echo ================================
echo.

REM Check if npm packages are installed
if not exist "node_modules" (
    echo Installing dependencies...
    call npm install
)

echo.
echo Building portable .exe...
call npm run build-portable

echo.
echo Building installer .exe...
call npm run build

echo.
echo ================================
echo Build complete!
echo Output files in dist/
echo ================================
echo.
pause
