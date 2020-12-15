@echo off

:: WinSysEnum.bat: Simple batch script provides available windows systems information.
:: https://github.com/EvolvingSysadmin/Penetration-Testing 
:: https://ryanheavican.com/

:start
SET var=0
cls
echo ------------------------------------------------------------------------------
echo  Windows System Enumeration - %COMPUTERNAME% ^| %DATE% - %TIME%
echo ------------------------------------------------------------------------------
echo  1    Full System Info
echo  2    OS Name and Version
echo  3    Disk Info
echo  4    System Environment Table
echo  5    Running System Processes
echo  6    Services Running Inside Each Process
echo  7    Started Windows Services
echo  8    Scheduled Jobs 
echo  9    Windows Patches
echo  10   Application Names
echo  11   Connected Devices
echo  0    close
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Select an option [1-10]:

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
    systeminfo
    echo.
    pause
    goto:start

:op2
    echo.
    systeminfo | findstr /B /C:"OS Name" /C:"OS Version
    echo.
    pause
    goto:start

:op3
    echo.
    wmic logicaldisk where drivetype=3 get name, freespace, systemname, filesystem, size, volumeserialnumber
    echo.
    pause
    goto:start

:op4
    echo.
    set
    echo.
    pause
    goto:start

:op5
    echo.
    tasklist /v
    echo.
    pause
    goto:start

:op6
    echo.
    tasklist /svc
    echo.
    pause
    goto:start

:op7
    echo.
    net start
    echo.
    pause
    goto:start

:op8
    echo.
    schtasks /query
    echo.
    pause
    goto:start

:op9
    echo.
    wmic qfe get Caption,Description,HotFixID,InstalledOn
    echo.
    pause
    goto:start

:op10
    echo.
    wmic product get name
    echo.
    pause
    goto:start

:op11
    echo.
    wmic logicaldisk get caption,description,providername
    echo.
    pause
    goto:start


:close
    @cls&exit



:: systeminfo ::

echo ========== Display Full Local System Info (systeminfo) ========== > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

systeminfo > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"