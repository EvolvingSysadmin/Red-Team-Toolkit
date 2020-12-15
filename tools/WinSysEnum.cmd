@echo off

:: WinSysEnum :: This simple CMD script provides you with your operating system and hardward information.

:: https://github.com/EvolvingSysadmin/Penetration-Testing :: https://ryanheavican.com/

title Windows OS Enumeration

echo Please wait... Gathering system information, which is also saved to WinSysEnum.txt.

:: systeminfo ::

echo ========== Display Full Local System Info (systeminfo) ========== > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

systeminfo > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: fsutil fsinfo drives ::

ECHO ========== Display System Drives ====================== > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

fsutil fsinfo drives > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: set ::

ECHO ========== Display System Environment Table =========== > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

set > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: tasklist /v ::

ECHO ========== Display Running System Processes =========== > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

tasklist /v > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: tasklist /svc ::

ECHO ======= Display Services Running Inside Each Process ========= > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

tasklist /svc > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: net start ::

ECHO ======= Display Started Windows Services ========= > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

net start > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: schtasks ::

ECHO ======= Display Scheduled Jobs ========= > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

schtasks > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: wmic qfe get Caption,Description,HotFixID,InstalledOn ::

ECHO ======= Display Windows Patches ========= > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

wmic qfe get Caption,Description,HotFixID,InstalledOn > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: wmic product get name ::

ECHO ======= Display All Installed Application Names ========= > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

wmic product get name > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: wmic logicaldisk get caption,description,providername ::

ECHO ======= Display Connected Devices ========= > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

wmic logicaldisk get caption,description,providername > "WinSysEnum.tmp"
type "WinSysEnum.tmp"
type "WinSysEnum.tmp" >> "WinSysEnum.txt"
del "WinSysEnum.tmp"

:: display WinSysEnum.txt file ::

.\WinSysEnum.txt

pause