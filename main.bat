@echo off
set currentver=v0.2
color b

set deepseapath=C:\Users\%username%\Desktop\Deepsea
:: Change the path above to where you have your deepsea folders
:: DO NOT CHANGE IT TO THE main.bat FILE!! JUST THE FOLDER CALLED DEEPSEA!!!
:: The program will automaticly find out what user of this computer is currently using the program!
title Deepsea %currentver%
goto start

:start
cls
echo Welcome to Deepsea
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
if ["%command%"] == ["Deepsea -o network"] goto networkstuff
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
cd %deepseapath%
echo Welcome administrator!
start devmode.bat
exit

:devloginfail
echo Beep boop? I can't find you in my database.. You sure you enterd it correctly?
goto main

:networkstuff
echo Loading...
start network.bat
echo Sucefully loaded network.bat!
exit

:update
echo Please wait...
start update.bat
echo Sucefully loaded update.bat!
exit