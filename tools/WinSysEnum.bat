@echo off

:: WinSysEnum.bat: Simple script provides available windows systems information.
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
echo  12   Print all to WinSysEnum.txt (opens when done)
echo  0    Close
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Select an option [0-12]:

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
if "%var%"=="10" goto op10
if "%var%"=="11" goto op11
if "%var%"=="12" goto op12
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

:op12
    echo 1. ========== Display Full Local System Info  ========== > "WinSysEnum.txt"
    systeminfo >> "WinSysEnum.txt"
    echo 2. ========== OS Name and Version ====================== >> "WinSysEnum.txt"
    systeminfo | findstr /B /C:"OS Name" /C:"OS Version" >> "WinSysEnum.txt"
    echo 3. ========== Disk Info ====================== >> "WinSysEnum.txt"
    fsutil wmic logicaldisk where drivetype=3 get name, freespace, systemname, filesystem, size, volumeserialnumber >> "WinSysEnum.txt"
    echo 4. ========== System Environment Table ====================== >> "WinSysEnum.txt"
    set >> "WinSysEnum.txt"
    echo 5. ========== Running System Processes ====================== >> "WinSysEnum.txt"
    tasklist /v >> "WinSysEnum.txt"
    echo 6. ========== Services Running Inside Each Process ============ >> "WinSysEnum.txt"
    tasklist /svc >> "WinSysEnum.txt"
    echo 7. ========== Started Windows Services ====================== >> "WinSysEnum.txt"
    net start >> "WinSysEnum.txt"
    echo 8. ========== Scheduled Jobs  ====================== >> "WinSysEnum.txt"
    schtasks /query >> "WinSysEnum.txt"
    echo 9. ========== Windows Patches ====================== >> "WinSysEnum.txt"
    wmic qfe get Caption,Description,HotFixID,InstalledOn >> "WinSysEnum.txt"
    echo 10. ========== Application Names ====================== >> "WinSysEnum.txt"
    wmic product get name >> "WinSysEnum.txt"
    echo 11. ========== Connected Devices ====================== >> "WinSysEnum.txt"
    wmic logicaldisk get caption,description,providername >> "WinSysEnum.txt"
    
    start notepad ".\WinSysEnum.txt"

    echo.
    pause
    goto:start

:close
    @cls&exit