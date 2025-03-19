@echo off
title Deepsea - Installer
color e
chcp 65001 >nul
set questions=8 :: Change this to however many install questions there are
cls
goto checkforadmin

:checkforadmin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo  Requesting admin...
    powershell -Command "Start-Process '%~f0' -Verb RunAs -Wait; exit $LastExitCode"
    if %errorlevel% neq 0 (
        cls
        echo  Requesting admin...
        echo.
        echo  Administrative privileges are required.
        pause
        exit /b
    )
    exit /b
)

goto installerquestion1

:installerquestion1
cls
echo.
echo  Where do you want to install Deepsea? The path must be a folder, not a file.
echo  Note that if you choose a folder that doesn't exist, it will be created.
echo  Question 1 of %questions%
echo.
echo  [1] C:\Users\%username%\Desktop
echo  [2] C:\Users\%username%\Documents
echo  [3] C:\Users\%username%\Downloads
echo  [4] C:\Users\%username%\AppData\Local
echo  [5] C:\Users\%username%\AppData\Roaming
echo.

set /p uneditedinstalllocation="  "

if %uneditedinstalllocation% equ 1 (
    echo  Installing Deepsea to C:\Users\%username%\Desktop...
    set installloc=C:\Users\%username%\Desktop
    pause
    goto installerquestion2
) else if %uneditedinstalllocation% equ 2 (
    echo  Installing Deepsea to C:\Users\%username%\Documents...
    set installloc=C:\Users\%username%\Documents
    pause
    goto installerquestion2
) else if %uneditedinstalllocation% equ 3 (
    echo  Installing Deepsea to C:\Users\%username%\Downloads...
    set installloc=C:\Users\%username%\Downloads
    pause
    goto installerquestion2
) else if %uneditedinstalllocation% equ 4 (
    echo  Installing Deepsea to C:\Users\%username%\AppData\Local...
    set installloc=C:\Users\%username%\AppData\Local
    pause
    goto installerquestion2
) else if %uneditedinstalllocation% equ 5 (
    echo  Installing Deepsea to C:\Users\%username%\AppData\Roaming...
    set installloc=C:\Users\%username%\AppData\Roaming
    pause
    goto installerquestion2
) else (
    echo  That's not a valid option. Please try again.
    pause
    goto installerquestion1
)

:installerquestion2
cls
echo.
echo  What is your name registered to your computer?
echo  PLEASE BE HONEST! This is for the installer to know where to install Deepsea.
echo  Question 2 of %questions%
echo.
set /p username="  "
goto installerquestion3

:installerquestion3
cls
echo.
echo  Do you want to create a desktop shortcut for Deepsea? (y/n)
echo  Question 3 of %questions%
echo.
set /p createshortcut="  "

if %createshortcut% equ y (
    echo Creating desktop shortcut...
    set createshortcut=Yes
    pause
    goto installerquestion4
) else if %createshortcut% equ n (
    echo Skipping desktop shortcut creation...
    set createshortcut=No
    pause
    goto installerquestion4
) else if %createshortcut% equ Y (
    echo Creating desktop shortcut...
    set createshortcut=Yes
    pause
    goto installerquestion4
) else if %createshortcut% equ N (
    echo Skipping desktop shortcut creation...
    set createshortcut=No
    pause
    goto installerquestion4
) else (
    echo That's not a valid option. Please try again.
    pause
    goto installerquestion3
)

:installerquestion4
cls
echo.
echo  Do you want to create a start menu shortcut for Deepsea? (y/n)
echo  Question 4 of %questions%
echo.
set /p createstartmenuwin="  "

if %createstartmenuwin% equ y (
    echo  Creating start menu shortcut...
    pause
    goto installerquestion5
) else if %createstartmenuwin% equ n (
    echo  Skipping start menu shortcut creation...
    pause
    goto installerquestion5
) else if %createstartmenuwin% equ Y (
    echo  Creating start menu shortcut...
    pause
    goto installerquestion5
) else if %createstartmenuwin% equ N (
    echo  Skipping start menu shortcut creation...
    pause
    goto installerquestion5
) else (
    echo  That's not a valid option. Please try again.
    pause
    goto installerquestion4
)

:installerquestion5
cls
echo.
echo  Do you want to automaticly run Deepsea on startup? (y/n)
echo  Question 5 of %questions%
echo.
set /p autorun="  "

if %autorun% equ y (
    echo  Setting Deepsea to run on startup...
    pause
    goto installerquestion6
) else if %autorun% equ n (
    echo  Skipping setting Deepsea to run on startup...
    pause
    goto installerquestion6
) else if %autorun% equ Y (
    echo  Setting Deepsea to run on startup...
    pause
    goto installerquestion6
) else if %autorun% equ N (
    echo  Skipping setting Deepsea to run on startup...
    pause
    goto installerquestion6
) else (
    echo  That's not a valid option. Please try again.
    pause
    goto installerquestion5
)

:installerquestion6
cls
echo.
echo  What modules do you want to install with Deepsea?
echo  Note that things like the default is always installed.
echo  Question 6 of %questions%
echo.
echo.
echo  [1] Devmode (Requires password)
echo  [2] Network (Work in progress)
echo  [3] AI (Requires password)
echo.
echo  Please enter the number of the module you want to install.
echo  Seperate multiple modules with a comma and a space.
echo  Example: 1, 2, 4
echo.
set /p modules="  "
goto installerquestion7

:installerquestion7
cls
echo.
echo  Do you want to be able to run deepsea from the command line? (y/n)
echo  Note that this will add deepsea to your PATH variable.
echo  Question 7 of %questions%
echo.
set /p runfromcmd="  "

if %runfromcmd% equ y (
    echo  Adding Deepsea to PATH...
    set runfromcmd=Yes
    pause
    goto installerquestion8
) else if %runfromcmd% equ n (
    echo  Skipping adding Deepsea to PATH...
    set runfromcmd=No
    pause
    goto installerquestion8
) else if %runfromcmd% equ Y (
    echo  Adding Deepsea to PATH...
    set runfromcmd=Yes
    pause
    goto installerquestion8
) else if %runfromcmd% equ N (
    echo  Skipping adding Deepsea to PATH...
    set runfromcmd=No
    pause
    goto installerquestion8
) else (
    echo  That's not a valid option. Please try again.
    pause
    goto installerquestion7
)

:installerquestion8
cls
echo.
echo Do you want to be able to run deepsea from the workshop? (y/n)
echo Question 8 of %questions%
echo.
set /p runfromworkshop="  "

if %runfromworkshop% equ y (
    echo Adding Deepsea to workshop...
    set runfromworkshop=Yes
    pause
    goto confirmation  
) else if %runfromworkshop% equ n (
    echo Skipping adding Deepsea to workshop...
    set runfromworkshop=No
    pause
    goto confirmation
) else if %runfromworkshop% equ Y (
    echo Adding Deepsea to workshop...
    set runfromworkshop=Yes
    pause
    goto confirmation
) else if %runfromworkshop% equ N (
    echo Skipping adding Deepsea to workshop...
    set runfromworkshop=No
    pause
    goto confirmation
) else (
    echo That's not a valid option. Please try again.
    pause
    goto installerquestion7
)

:confirmation
cls
echo.
echo  That's all the questions! Here's a summary of your choices:
echo.
echo  Installation location: %installloc%
echo  Desktop shortcut: %createshortcut%
echo  Start menu shortcut: %createstartmenuwin%
echo  Autorun on startup: %autorun%
echo  Modules: %modules%
echo  Run from command line: %runfromcmd%
echo  Run from workshop: %runfromworkshop%
echo.

echo  Is this correct? (y/n)
set /p confirm="  "

if %confirm% equ y (
    echo.
    pause
if %runfromcmd% equ y (
    echo.
    pause
    goto instslldeepsea
) else if %confirm% equ n (
    echo.
    pause
    goto installerquestion1
) else if %confirm% equ Y (
    echo.
    pause
    goto installdeepsea
) else if %confirm% equ N (
    echo.
    pause
    goto installerquestion1
) else (
    echo.
    echo  That's not a valid option. Please try again.
    pause
    goto confirmation
)

:installdeepsea
if %runfromcmd% equ Yes (
    if %createshortcut% equ Yes (
        goto installdeepseawithpathandwithshortcut
    ) else if %createshortcut equ No (
	goto installdeepseawithpathbutwithoutshortcut
    )
) else if %runfromcmd% equ No (
    if %createshortcut% equ Yes (
        goto installdeepseawithoutpathbutwithshortcut
    ) else if %createshortcut% equ No (
        goto installdeepseawithoutpathandwithoutshortcut
    )
) else (
    echo.
    echo  04.03.2025/10:11:37 - [ERROR] 3
    pause
    exit
)


:installdeepseawithpathandwithshortcut
set completeinstalloperations=7 :: Change this to however many operations will be done after the quiz part to actully install deepsea in this way of installing
cls
echo.
echo  Installing Deepsea...
echo.
echo  [1/%completeinstalloperations%] Creating installation directory...
if not exist %installloc% (
    mkdir %installloc%
)

cls
echo.
echo  Installing Deepsea...
echo.
echo  [2/%completeinstalloperations%] Adding Deepsea to PATH...
setx PATH "%PATH%;%installloc%" /M

cls
echo.
echo  Installing Deepsea...
echo.
echo  [3/%completeinstalloperations%] Creating desktop shortcut...

cls
echo.
echo  Installing Deepsea...
echo.
echo  [4/%completeinstalloperations%] Creating start menu shortcut...
if not exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Deepsea" (
    mkdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Deepsea"
    :: Does not add anything within that folder yet
)

cls
echo.
echo  Installing Deepsea...
echo.
echo  [5/%completeinstalloperations%] Downloading files...

cls
echo.
echo  Installing Deepsea...
echo.
echo [6/%completeinstalloperations%] Extracting files...

cls
echo.
echo  Installing Deepsea...
echo.
echo [7/%completeinstalloperations%] Editing variables...

cls
echo.
echo  Deepsea is successfully installed!
echo.
echo Deepsea is installed at: %installloc%
pause
exit


:installdeepseawithoutpathbutwithshortcut
set completeinstalloperations=6 :: Change this to however many operations will be done after the quiz part to actully install deepsea in this way of installing
cls
echo.
echo  Installing Deepsea...
echo.
echo  [1/%completeinstalloperations%] Creating installation directory...
if not exist %installloc% (
    mkdir %installloc%
)

cls
echo.
echo  Installing Deepsea...
echo.
echo  [2/%completeinstalloperations%] Creating desktop shortcut...

cls
echo.
echo  Installing Deepsea...
echo.
echo  [3/%completeinstalloperations%] Creating start menu shortcut...
if not exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Deepsea" (
    mkdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Deepsea"
    :: Does not add anything within that folder yet
)

cls
echo.
echo  Installing Deepsea...
echo.
echo  [4/%completeinstalloperations%] Downloading files...

cls
echo.
echo  Installing Deepsea...
echo.
echo [5/%completeinstalloperations%] Extracting files...

cls
echo.
echo  Installing Deepsea...
echo.
echo [6/%completeinstalloperations%] Editing variables...

cls
echo.
echo  Deepsea is successfully installed!
echo.
echo Deepsea is installed at: %installloc%
pause
exit


:installdeepseawithoutpathandwithoutshortcut
set completeinstalloperations=5 :: Change this to however many operations will be done after the quiz part to actully install deepsea in this way of installing
cls
echo.
echo  Installing Deepsea...
echo.
echo  [1/%completeinstalloperations%] Creating installation directory...
if not exist %installloc% (
    mkdir %installloc%
)

cls
echo.
echo  Installing Deepsea...
echo.
echo  [2/%completeinstalloperations%] Creating start menu shortcut...
if not exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Deepsea" (
    mkdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Deepsea"
    :: Does not add anything within that folder yet
)

cls
echo.
echo  Installing Deepsea...
echo.
echo  [3/%completeinstalloperations%] Downloading files...

cls
echo.
echo  Installing Deepsea...
echo.
echo [4/%completeinstalloperations%] Extracting files...

cls
echo.
echo  Installing Deepsea...
echo.
echo [5/%completeinstalloperations%] Editing variables...

cls
echo.
echo  Deepsea is successfully installed!
echo.
echo Deepsea is installed at: %installloc%
pause
exit


:installdeepseawithpathbutwithoutshortcut
set completeinstalloperations=6 :: Change this to however many operations will be done after the quiz part to actully install deepsea in this way of install
cls
echo.
echo  Installing Deepsea...
echo.
echo  [1/%completeinstalloperations%] Creating installation directory...
if not exist %installloc% (
    mkdir %installloc%
)

cls
echo.
echo  Installing Deepsea...
echo.
echo  [2/%completeinstalloperations%] Adding Deepsea to PATH...
setx PATH "%PATH%;%installloc%" /M

cls
echo.
echo  Installing Deepsea...
echo.
echo  [3/%completeinstalloperations%] Creating start menu shortcut...
if not exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Deepsea" (
    mkdir "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Deepsea"
    :: Does not add anything within that folder yet
)

cls
echo.
echo  Installing Deepsea...
echo.
echo  [4/%completeinstalloperations%] Downloading files...

cls
echo.
echo  Installing Deepsea...
echo.
echo [5/%completeinstalloperations%] Extracting files...

cls
echo.
echo  Installing Deepsea...
echo.
echo [6/%completeinstalloperations%] Editing variables...

cls
echo.
echo  Deepsea is successfully installed!
echo.
echo Deepsea is installed at: %installloc%
pause
exit