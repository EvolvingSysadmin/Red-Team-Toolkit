@echo off

:: WinNetEnum.bat: Simple script provides available windows networking information.
:: https://github.com/EvolvingSysadmin/Penetration-Testing 
:: https://ryanheavican.com/

:start
SET var=0
cls
echo ------------------------------------------------------------------------------
echo  Windows Network Enumeration - %COMPUTERNAME% ^| %DATE% - %TIME%
echo ------------------------------------------------------------------------------
echo  1    List all Interfaces
echo  2    Display Routing Tables
echo  3    ARP Table
echo  4    Active Connections
echo  5    Just Listening Connections
echo  6    Processes Associated with Active Port Connections
echo  7    Print all to WinNetEnum.txt (opens when done)
echo  0    Close
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Select an option [0-7]:

if "%var%"=="x" goto start
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto op5
if "%var%"=="6" goto op6
if "%var%"=="7" goto op7
if "%var%"=="0" goto close

:op1
    echo.
    ipconfig /all
    echo.
    pause
    goto:start

:op2
    echo.
    route print
    echo.
    pause
    goto:start

:op3
    echo.
    arp -A
    echo.
    pause
    goto:start

:op4
    echo.
    netstat -ano
    echo.
    pause
    goto:start

:op5
    echo.
    netstat -nao | findstr /I listening
    echo.
    pause
    goto:start

:op6
    echo.
    netstat -nabo
    echo.
    pause
    goto:start

:op7
    echo Windows Network Enumeration - %COMPUTERNAME% ^| %DATE% - %TIME% > "WinUserEnum.txt"
    echo 1. ========== List all Interfaces  ========== >> "WinNetEnum.txt"
    ipconfig /all >> "WinNetEnum.txt"
    echo 2. ========== Routing Table  ========== >> "WinNetEnum.txt"
    route print >> "WinNetEnum.txt"    
    echo 3. ========== ARP Table  ========== >> "WinNetEnum.txt"
    arp -A >> "WinNetEnum.txt"        
    echo 4. ========== Active Connections  ========== >> "WinNetEnum.txt"
    netstat -an >> "WinNetEnum.txt"
    echo 5. ========== Only Active Listening Connections  ========== >> "WinNetEnum.txt"
    netstat -nao | findstr /I listening >> "WinNetEnum.txt"
    echo 6. ========== Processes Associated with Active Port Connections  ========== >> "WinNetEnum.txt"
    netstat -nabo >> "WinNetEnum.txt"

    start notepad ".\WinNetEnum.txt"

    echo.
    pause
    goto:start

:close
    @cls&exit