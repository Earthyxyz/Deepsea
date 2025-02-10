@echo off
setlocal enabledelayedexpansion

:: ===== CONFIGURATION =====
set REPO_OWNER=Earthyxyz
set REPO_NAME=Deepsea
set LOCAL_VERSION_FILE=version.txt
set RELEASE_API_URL=https://api.github.com/repos/%REPO_OWNER%/%REPO_NAME%/releases/latest
set TEMP_ZIP=update.zip
set TEMP_FOLDER=update_temp

:: ===== STEP 1: CHECK FOR UPDATES =====
echo Checking for latest release...
curl -s -o latest_release.json %RELEASE_API_URL%

:: Extract latest version number from JSON
for /f "tokens=2 delims=:" %%A in ('findstr /C:"\"tag_name\"" latest_release.json') do (
    set LATEST_VERSION=%%A
)
set LATEST_VERSION=!LATEST_VERSION:~2,-2!  :: Trim quotes

if not exist %LOCAL_VERSION_FILE% (
    echo 0 > %LOCAL_VERSION_FILE%
)

set /p LOCAL_VERSION=<%LOCAL_VERSION_FILE%

echo Current Version: %LOCAL_VERSION%
echo Latest Version: %LATEST_VERSION%

if "%LOCAL_VERSION%"=="%LATEST_VERSION%" (
    echo Your program is up to date.
    del latest_release.json
    exit /b
)

:: ===== STEP 2: DOWNLOAD THE LATEST RELEASE ZIP =====
echo New update found! Downloading version %LATEST_VERSION%...
for /f "tokens=2 delims=:" %%A in ('findstr /C:"\"browser_download_url\"" latest_release.json') do (
    set DOWNLOAD_URL=%%A
)
set DOWNLOAD_URL=!DOWNLOAD_URL:~2,-2!  :: Trim quotes

curl -L -o %TEMP_ZIP% !DOWNLOAD_URL!

if not exist %TEMP_ZIP% (
    echo ERROR: Failed to download update.
    del latest_release.json
    exit /b
)

:: ===== STEP 3: EXTRACT FILES =====
echo Extracting update...
mkdir %TEMP_FOLDER%
powershell -command "Expand-Archive -Path '%TEMP_ZIP%' -DestinationPath '%TEMP_FOLDER%' -Force"

:: ===== STEP 4: REPLACE OLD FILES =====
xcopy /s /y "%TEMP_FOLDER%\*" "./"

:: ===== STEP 5: CLEAN UP =====
echo %LATEST_VERSION% > %LOCAL_VERSION_FILE%
rmdir /s /q %TEMP_FOLDER%
del %TEMP_ZIP%
del latest_release.json

echo Update successful! Now running version %LATEST_VERSION%.
exit /b