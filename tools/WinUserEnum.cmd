@echo off

:: WinUserEnum :: This simple CMD script provides you with user information output to a txt file.

:: https://github.com/EvolvingSysadmin/Penetration-Testing :: https://ryanheavican.com/

title Windows User Enumeration

echo Please wait... Gathering system information, which is also saved to WinUserEnum.txt.

:: whoami /all ::

echo ========== Display All Current User Access Token Info ========== > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

whoami /all > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

:: net users ::

echo ========== Display Local Users ========== > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

net users > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

:: qwinsta ::

echo ========== Display Users with RDP Privileges ========== > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

qwinsta > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

:: net localgroup ::

echo ========== Display Local Groups ========== > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

net localgroup > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

:: net localgroup administrators ::

echo ========== Display Local Administrators ========== > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

net localgroup administrators > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

:: net groups ::

echo ========== Display Domain Group (must be run on DC) ========== > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

net groups > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

:: net accounts /domain ::

echo ========== Display Domain Password Policy ========== > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

net accounts /domain > "WinUserEnum.tmp"
type "WinUserEnum.tmp"
type "WinUserEnum.tmp" >> "WinUserEnum.txt"
del "WinUserEnum.tmp"

echo ============================================

:: display WinUserEnum.txt file ::

.\WinUserEnum.txt

pause