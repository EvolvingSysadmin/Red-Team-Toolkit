@echo off

:: WinDomainEnum :: This simple CMD script provides available windows domain information.

:: https://github.com/EvolvingSysadmin/Penetration-Testing :: https://ryanheavican.com/

title Windows Domain Enumeration

echo Please wait... Gathering system information, which is also saved to WinDomainEnum.txt.

:: ipconfig /all ::

echo ========== Display Networking Info ipconfig /all ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

ipconfig /all > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: echo %logonserver% ::

echo ========== Display Logon Server ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

echo %logonserver% > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: net accounts /domain : ::

echo ========== Display Domain Password Policy ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

net accounts /domain > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: wmic ntdomain : ::

echo ========== Display DC Address, Domain Name, Roles ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

wmic ntdomain > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: wmic /NAMESPACE:\\root\directory\ldap PATH ds_user GET ds_samaccountname ::

echo ========== Display All Domain Users ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

wmic /NAMESPACE:\\root\directory\ldap PATH ds_user GET ds_samaccountname > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: wmic /NAMESPACE:\\root\directory\ldap PATH ds_group GET ds_samaccountname ::

echo ========== Display All Domain Groups: ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

wmic /NAMESPACE:\\root\directory\ldap PATH ds_group GET ds_samaccountname > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: wmic /NAMESPACE:\\root\directory\ldap PATH ds_computer GET ds_samaccountname ::

echo ========== Display All Domain Computers ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

wmic /NAMESPACE:\\root\directory\ldap PATH ds_computer GET ds_samaccountname > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: net group “Domain Admins” /domain ::

echo ========== Display Domain Admin Users ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

net group “Domain Admins” /domain > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: net user /domain ::

echo ========== View Domain User Info ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

net user /domain > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: net view ::

echo ========== View All Hosts in Domain/Workgroup ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

net view > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: net share ::

echo ========== Display Network Shares ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

net share > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

:: nltest /trusted_domains ::

echo ========== Display Dommain Trust Info ========== > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

nltest /trusted_domains > "WinDomainEnum.tmp"
type "WinDomainEnum.tmp"
type "WinDomainEnum.tmp" >> "WinDomainEnum.txt"
del "WinDomainEnum.tmp"

echo ============================================

:: display WinWomainEnum.txt file ::

.\WinDomainEnum.txt

pause