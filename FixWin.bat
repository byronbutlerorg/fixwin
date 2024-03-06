@echo off
cls
color 0a

:menu
cls
echo ====================================
echo 		  Welcome to FixWin
echo ====================================
echo.

echo 1. Display system information
echo 2. Run System File Checker (sfc /scannow)
echo 3. Check Image Health (DISM)
echo 4. Exit
echo.

set /p choice=Enter your choice (1-4):

if "%choice%"=="1" (
    echo.
    echo System Information:
    echo -------------------
    systeminfo | find "OS Name"
    systeminfo | find "OS Version"
    systeminfo | find "System Manufacturer"
    systeminfo | find "System Model"
    systeminfo | find "Total Physical Memory"
    echo.
    pause
    goto :menu
) else if "%choice%"=="2" (
    echo.
    echo Running System File Checker (sfc /scannow)...
    echo.
    sfc /scannow
    echo.
    pause
    goto :menu
) else if "%choice%"=="3" (
    echo.
    echo Checking Image Health (DISM)...
    echo.
    DISM /Online /Cleanup-Image /CheckHealth
    echo.
    DISM /Online /Cleanup-Image /ScanHealth
    echo.
    DISM /Online /Cleanup-Image /RestoreHealth
    echo.
    pause
    goto :menu
) else if "%choice%"=="4" (
    echo.
    echo Exiting...
    echo.
    pause
    exit
) else (
    echo.
    echo Invalid choice! Please enter a number between 1 and 4.
    echo.
    pause
    goto :menu
)
