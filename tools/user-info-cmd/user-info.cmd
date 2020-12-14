@echo off

:: user-info :: This simple CMD script provides you with user information output to a txt file.

title Windows User Enumeration

echo Please wait... Gathering system information, which is also saved to userinfo.txt.

:: whoami /all ::

echo ========== Display All Current User Access Token Info ========== > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

whoami /all > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

:: net users ::

echo ========== Display Local Users ========== > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

net users > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

:: qwinsta ::

echo ========== Display Users with RDP Privileges ========== > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

qwinsta > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

:: net localgroup ::

echo ========== Display Local Groups ========== > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

net localgroup > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

:: net localgroup administrators ::

echo ========== Display Local Administrators ========== > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

net localgroup administrators > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

:: net groups ::

echo ========== Display Domain Group (must be run on DC) ========== > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

net groups > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

:: net accounts /domain ::

echo ========== Display Domain Password Policy ========== > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

net accounts /domain > "userinfo.tmp"
type "userinfo.tmp"
type "userinfo.tmp" >> "userinfo.txt"
del "userinfo.tmp"

ECHO ============================================

:: display userinfo.txt file ::

.\userinfo.txt

PAUSE