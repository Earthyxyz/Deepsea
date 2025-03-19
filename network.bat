@echo off
color F
title Deepsea - Network
chcp 65001 >nul
goto main

:main
cls
echo.
echo  Welcome to Deepsea - Network
echo.
echo  -------------------------------
echo.
echo  [1] Network Ports
echo.

set /p choice="  "
if ["%choice%"] == ["Cancel"] goto entreroute_to_main
if ["%choice%"] == ["Deepsea -m"] goto module
if ["%choice%"] == ["1"] goto network_ports

:entreroute_to_main
cls
echo.
start main.bat
echo  Sucefully started main.bat
exit

:module
cls
echo.
echo  You are currently using the module Default!
pause
goto main

:network_ports
cls
echo.
echo  This part of the porgram is still work in progress.
echo.
pause
goto main