@echo off
set currentver=v0.2
color F
title Deepsea %currentver%
chcp 65001 >nul
goto start

:start
cls
echo.
echo  Welcome to Deepsea
echo        %currentver%
echo.
goto main

:main
echo.
set /p command="Command Line: "
if ["%command%"] == [""] goto main
if ["%command%"] == ["Deepsea -v"] goto version
if ["%command%"] == ["Deepsea -m"] goto module
if ["%command%"] == ["Deepsea -m dev"] goto devlogin
if ["%command%"] == ["Deepsea -m Dev"] goto devlogin
if ["%command%"] == ["Deepsea -m network"] goto networkstuff
if ["%command%"] == ["Deepsea -m Network"] goto networkstuff
if ["%command%"] == ["Deepsea -u"] goto update             

:version
echo.
echo Your current Deepsea version is %currentver%!
goto main

:module
echo.
echo You are currently using the module Default!
goto main

:devlogin
echo.
set /p user="Username: "
if ["%user%"] == [""] goto devloginfail
if ["%user%"] == ["Cancel"] goto main
if ["%user%"] == ["cancel"] goto main
if ["%user%"] == ["Earthy"] goto devpassword
goto devloginfail

:devpassword
set /p pass="Password: "
if ["%pass%"] == [""] goto devloginfail
if ["%pass%"] == ["Cancel"] goto main
if ["%pass%"] == ["cancel"] goto main
if ["%pass%"] == ["123admin"] goto devsuccess
goto devloginfail

:devsuccess
echo Welcome administrator!
start devmode.bat
exit

:devloginfail
echo Beep boop? I can't find you in my database.. You sure you enterd it correctly?
goto main

:networkstuff
cls
echo Loading...
start network.bat
echo Succefully loaded network.bat!
exit

:update
cls
echo Update is currently disabled.
echo.
echo If you want to update, please go to the GitHub repository and download the latest version.
goto start