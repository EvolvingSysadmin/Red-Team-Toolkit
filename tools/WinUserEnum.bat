@echo off

:: WinUserEnum.bat: Simple script provides available windows user information.
:: https://github.com/EvolvingSysadmin/Penetration-Testing 
:: https://ryanheavican.com/

:start
SET var=0
cls
echo ------------------------------------------------------------------------------
echo  Windows User Enumeration - %COMPUTERNAME% ^| %DATE% - %TIME%
echo ------------------------------------------------------------------------------
echo  1    All Current User Access Token Info
echo  2    Local Users
echo  3    Users with RDP Privileges
echo  4    Local Groups
echo  5    Local Administrators Group
echo  6    Domain Groups (must be run on DC)
echo  7    Domain Password Policy (must be run on DC)
echo  8    Get Full User Info for Selected User
echo  9    Print all to .txt (opens when done)
echo  0    Close
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Select an option [0-8]:

if "%var%"=="x" goto start
if "%var%"=="1" goto op1
if "%var%"=="2" goto op2
if "%var%"=="3" goto op3
if "%var%"=="4" goto op4
if "%var%"=="5" goto op5
if "%var%"=="6" goto op6
if "%var%"=="7" goto op7
if "%var%"=="8" goto op8
if "%var%"=="9" goto op9
if "%var%"=="0" goto close

:op1
    echo.
    whoami /all
    echo.
    pause
    goto:start

:op2
    echo.
    net users
    echo.
    pause
    goto:start

:op3
    echo.
    qwinsta
    echo.
    pause
    goto:start

:op4
    echo.
    net localgroup
    echo.
    pause
    goto:start

:op5
    echo.
    net localgroup administrators
    echo.
    pause
    goto:start

:op6
    echo.
    net groups
    echo.
    pause
    goto:start

:op7
    echo.
    net accounts /domain
    echo.
    pause
    goto:start

:op8
    echo.
    SET /p setuser= ^> Input Selected User Account: 
    echo.
    net user %setuser%
    pause
    goto:start

:op9
    echo Windows User Enumeration - %COMPUTERNAME% ^| %DATE% - %TIME% > "WinUserEnum.txt"
    echo 1. ========== All Current User Access Token Info ========== >> "WinUserEnum.txt"
    whoami /all >> "WinUserEnum.txt"
    echo 2. ========== Local Users ========== >> "WinUserEnum.txt"
    net users >> "WinUserEnum.txt"    
    echo 3. ========== Users with RDP Privileges ========== >> "WinUserEnum.txt"
    qwinsta >> "WinUserEnum.txt"
    echo 4. ========== Local Groups ========== >> "WinUserEnum.txt"
    net localgroup >> "WinUserEnum.txt"
    echo 5. ========== Local Administrators Group ========== >> "WinUserEnum.txt"
    net localgroup administrators >> "WinUserEnum.txt"
    echo 6. ========== Domain Groups (must be run on DC) ========== >> "WinUserEnum.txt"
    net localgroup administrators >> "WinUserEnum.txt"
    echo 7. ========== Domain Password Policy ========== >> "WinUserEnum.txt"
    net accounts /domain >> "WinUserEnum.txt"

    start notepad ".\WinUserEnum.txt"

    echo.
    pause
    goto:start

:close
    @cls&exit