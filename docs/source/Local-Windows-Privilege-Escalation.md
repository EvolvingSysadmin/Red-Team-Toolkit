# Local Windows Privilege Escalation



## OS

Get architecture & patches
```CMD
systeminfo
wmic qfe
```
Get Environment Variables
```CMD
set
```
```PowerShell
Get-ChildItem Env: | ft Key,Value
```
Get Connected Drives
```CMD
net use
wmic logicaldisk get caption,description,providername
```
```PowerShell
Get-PSDrive | where {$_.Provider -like "Microsoft.PowerShell.Core\FileSystem"}| ft Name,Root
```
## Users

Any interesting user privileges? Note: The State column does not mean that the user does or does not have access to this privilege. If the privilege is listed, then that user has it.
```CMD
whoami /priv
```

What users are on the system? Any old user profiles that weren’t cleaned up?
```CMD
net users
dir /b /ad "C:\Users\"
dir /b /ad "C:\Documents and Settings\" # Windows XP and below
```
```PowerShell
Get-LocalUser | ft Name,Enabled,LastLogon
Get-ChildItem C:\Users -Force | select Name
```

Is anyone else logged in?
```CMD
qwinsta
```

What local groups are on the system?
```CMD
net localgroup
```
```PowerShell
Get-LocalGroup | ft Name
```

Check Admnistrators Group users
```CMD
net localgroup Administrators
```
```PowerShell
Get-LocalGroupMember Administrators | ft Name, PrincipalSource
```

Anything in the Registry for User Autologon?
```CMD
reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" 2>nul | findstr "DefaultUserName DefaultDomainName DefaultPassword"
```
```PowerShell
Get-ItemProperty -Path 'Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon' | select "Default*"
```

Anything interesting in Credential Manager?
```CMD
cmdkey /list
dir C:\Users\username\AppData\Local\Microsoft\Credentials\
dir C:\Users\username\AppData\Roaming\Microsoft\Credentials\
```
```PowerShell
Get-ChildItem -Hidden C:\Users\username\AppData\Local\Microsoft\Credentials\
Get-ChildItem -Hidden C:\Users\username\AppData\Roaming\Microsoft\Credentials\
```

Can we access SAM and SYSTEM files?
```CMD
%SYSTEMROOT%\repair\SAM
%SYSTEMROOT%\System32\config\RegBack\SAM
%SYSTEMROOT%\System32\config\SAM
%SYSTEMROOT%\repair\system
%SYSTEMROOT%\System32\config\SYSTEM
%SYSTEMROOT%\System32\config\RegBack\system
```

## Programs, Processes, and Services

What software is installed?
```CMD
dir /a "C:\Program Files"
dir /a "C:\Program Files (x86)"
reg query HKEY_LOCAL_MACHINE\SOFTWARE
```
```PowerShell
Get-ChildItem 'C:\Program Files', 'C:\Program Files (x86)' | ft Parent,Name,LastWriteTime

Get-ChildItem -path Registry::HKEY_LOCAL_MACHINE\SOFTWARE | ft Name
```

## Resources
* https://www.absolomb.com/2018-01-26-Windows-Privilege-Escalation-Guide/