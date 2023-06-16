@echo off

:: WinSysEnum.bat: Simple script provides available windows domain information.
:: https://github.com/EvolvingSysadmin/Penetration-Testing 
:: https://ryanheavican.com/

:start
SET var=0
cls
echo ------------------------------------------------------------------------------
echo  Windows Domain Enumeration - %COMPUTERNAME% ^| %DATE% - %TIME%
echo ------------------------------------------------------------------------------
echo  1    All Networking Info
echo  2    Authenticated Domain Controller
echo  3    Domain Password Policy
echo  4    Domain Users
echo  5    Domain Groups
echo  6    Domain Computers
echo  7    Domain Admin Users
echo  8    Domain OUs
echo  9    All Domain Servers
echo  10   Network Shares
echo  11   Domain Trusts
echo  12   Current User Group Policies
echo  13   Current Computer Group Policies
echo  14   Site Name
echo  15   Operations Master Role Domain Controller
echo  16   All Domain Controllers
echo  17   Logon Server
echo  18   Print all to WinDomainEnum.txt (opens when done)
echo  0    Close
echo ------------------------------------------------------------------------------
echo.

SET /p var= ^> Select an option [0-18]:

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
if "%var%"=="13" goto op13
if "%var%"=="14" goto op14
if "%var%"=="15" goto op15
if "%var%"=="16" goto op16
if "%var%"=="17" goto op17
if "%var%"=="18" goto op18
if "%var%"=="0" goto close

:op1
    echo.
    ipconfig /all
    echo.
    pause
    goto:start

:op2
    echo.
    nltest /dsgetdc: /force
    echo.
    pause
    goto:start

:op3
    echo.
    net accounts /domain
    echo.
    pause
    goto:start

:op4
    echo.
    dsquery user | SORT
    echo.
    pause
    goto:start

:op5
    echo.
    dsquery group -limit 300 | SORT
    echo.
    pause
    goto:start

:op6
    echo.
    dsquery computer | SORT
    echo.
    pause
    goto:start

:op7
    echo.
    net group “Domain Admins” /domain
    echo.
    pause
    goto:start

:op8
    echo.
    dsquery ou | SORT
    echo.
    pause
    goto:start

:op9
    echo.
    dsquery * -Filter "(operatingSystem=*server*)" | SORT
    echo.
    pause
    goto:start

:op10
    echo.
    net share
    echo.
    pause
    goto:start

:op11
    echo.
    nltest /trusted_domains
    echo.
    pause
    goto:start

:op12
    echo.
    gpresult /Scope User /v
    echo.
    pause
    goto:start    

:op13
    echo.
    gpresult /Scope Computer /v
    echo.
    pause
    goto:start

:op14
    echo.
    dsquery site
    echo.
    pause
    goto:start

:op15
    echo.
    netdom query FSMO
    echo.
    pause
    goto:start

:op16
    echo.
    dsquery server -o rdn -forest
    echo.
    pause
    goto:start

:op17
    echo.
    SET log
    echo.
    pause
    goto:start

:op18
    echo 1. ========== All Networking Info ========== > "WinDomainEnum.txt"
    ipconfig /all >> "WinDomainEnum.txt"
    echo 2. ========== Authenticated Domain Controller ========== >> "WinDomainEnum.txt"
    nltest /dsgetdc: /force >> "WinDomainEnum.txt"    
    echo 3. ========== Domain Password Policy ========== >> "WinDomainEnum.txt"
    net accounts /domain >> "WinDomainEnum.txt"   
    echo 4. ========== Domain Users ========== >> "WinDomainEnum.txt"
    dsquery user | SORT >> "WinDomainEnum.txt"   
    echo 5. ========== Domain Groups ========== >> "WinDomainEnum.txt"
    dsquery group -limit 300 | SORT >> "WinDomainEnum.txt"   
    echo 6. ========== Domain Computers ========== >> "WinDomainEnum.txt"
    dsquery computer | SORT >> "WinDomainEnum.txt"   
    echo 7. ========== Domain Admin Users ========== >> "WinDomainEnum.txt"
    net group “Domain Admins” /domain >> "WinDomainEnum.txt"   
    echo 8. ========== Domain OUs ========== >> "WinDomainEnum.txt"
    dsquery ou | SORT >> "WinDomainEnum.txt"   
    echo 9. ========== All Domain Servers ========== >> "WinDomainEnum.txt"
    dsquery * -Filter "(operatingSystem=*server*)" | SORT >> "WinDomainEnum.txt"   
    echo 10. ========== Network Shares ========== >> "WinDomainEnum.txt"
    net share >> "WinDomainEnum.txt"    
    echo 11. ========== Domain Trusts ========== >> "WinDomainEnum.txt"
    nltest /trusted_domains >> "WinDomainEnum.txt"     
    echo 12. ========== Current User Group Policies ========== >> "WinDomainEnum.txt"
    gpresult /Scope User /v >> "WinDomainEnum.txt" 
    echo 13. ========== Current Computer Group Policies ========== >> "WinDomainEnum.txt"
    gpresult /Scope Computer /v >> "WinDomainEnum.txt" 
    echo 14. ========== Site Name ========== >> "WinDomainEnum.txt"
    dsquery site >> "WinDomainEnum.txt" 
    echo 15. ========== Operations Master Role Domain Controller ========== >> "WinDomainEnum.txt"
    netdom query FSMO >> "WinDomainEnum.txt" 
    echo 16. ========== All Domain Controllers ========== >> "WinDomainEnum.txt"
    dsquery server -o rdn -forest >> "WinDomainEnum.txt"
    echo 17. ========== Logon Server ========== >> "WinDomainEnum.txt"
    SET log >> "WinDomainEnum.txt"

    start notepad ".\WinDomainEnum.txt"

    echo.
    pause
    goto:start

:close
    @cls&exit
