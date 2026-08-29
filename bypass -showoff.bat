@echo off
chcp 65001
color 0A
title Bypass Admin Id



:: Display the banner
echo.
echo.
echo					    ██████╗ ██╗   ██╗██████╗  █████╗ ███████╗███████╗
echo					    ██╔══██╗╚██╗ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝
echo					    ██████╔╝ ╚████╔╝ ██████╔╝███████║███████╗███████╗
echo					    ██╔══██╗  ╚██╔╝  ██╔═══╝ ██╔══██║╚════██║╚════██║
echo					    ██████╔╝   ██║   ██║     ██║  ██║███████║███████║
echo					    ╚═════╝    ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝                                                 
echo.                                                 
echo 				========================================================
echo 				^|             System Information                       ^|
echo 				========================================================
echo.
systeminfo | findstr /B /C:"OS" /C:"Memory" /C:"Available Physical Memory"                                                 

:: User Personalization
set /p username="Enter your name: "
echo Welcome, %username%!
pause

:: Log Name
echo [%date% %time%] User "%username%" ran a bypass in complex version. >> user_log.txt
                                                 
:: Prompt user for the program path
set /p program="Enter the full path of the program you want to run: "

:: Put out error message if file is not found
if not exist "%program%" (
    echo Error: File not found. Please check the path and try again.
    pause
    exit
)

:: Extract filename for tab title
for %%F in ("%program%") do set filename=%%~nF
title Running: %filename%

:: Loading Animation
echo Loading...
for /l %%x in (1, 1, 20) do (
    echo|set /p=.
    ping localhost -n 1 >nul
)

:: Run the program without admin privileges
cmd /min /C "set __COMPAT_LAYER=runasinvoker && start "" "%program%""


:: Exit Message
echo [%date% %time%] Program "%program%" was run in complex version. >> program_log.txt







