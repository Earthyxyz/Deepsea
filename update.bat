@echo off
:: Your GitHub Repository URL
:: GitHub : https://github.com/Earthyxyz/Deepsea

setlocal enabledelayedexpansion

:: GitHub API URL for the latest release
set "api_url=https://api.github.com/repos/Earthyxyz/Deepsea/releases/latest"

:: Temporary file to store API response
set "temp_file=%temp%\latest_release.json"

:: Fetch the latest release information
curl -s -H "Accept: application/vnd.github.v3+json" %api_url% > %temp_file%

:: Check if the release information was fetched successfully
if not exist %temp_file% (
    echo Failed to fetch release information.
    goto end
)

:: Extract the tag name of the latest release
for /f "tokens=2 delims=:," %%a in ('findstr /i "tag_name" %temp_file%') do (
    set "latest_release=%%~a"
    set "latest_release=!latest_release:~1,-1!"
)

:: Clean up the temporary file
del %temp_file%

echo Latest release: %latest_release%

:: Check if the latest release is stable or beta
if "!latest_release:~0,5!"=="beta-" (
    goto beta
) else (
    goto stable
)

:stable
git pull origin master
git checkout master
goto end

:beta
git pull origin beta
git checkout beta

:end
echo }

pause

:: Replace 'main.bat' with the script you want to run after updating
main.bat