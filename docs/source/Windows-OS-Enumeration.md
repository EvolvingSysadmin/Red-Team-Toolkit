# Windows OS Enumration Using CMD.exe

## Windows System Information

Display Full Local System Info
```CMD
systeminfo
```

Display OS Name and Version
```CMD
systeminfo | findstr /B /C:"OS Name" /C:"OS Version
```

Display System Drives
```CMD
fsutil fsinfo drives
```

Display System Environment Table
```CMD
set
```

Display SET using PowerShell
```PowerShell
Get-ChildItem Env: | ft Key,Value
```

Display Running System Processes
```CMD
tasklist /v
```

Services Running Inside Each Process
```CMD
 tasklist /svc
```

Attributes of All Running Processes
```CMD
wmic process list full
```

Display Started Windows Services
```CMD
net start
```

Display Scheduled Jobs
```CMD
schtasks /query /fo LIST /v
```

Display Windows Patches
```CMD
wmic qfe get Caption,Description,HotFixID,InstalledOn
```

Display All Installed Application Names
```CMD
wmic product get name
```

Display Connected Devices
```CMD
net use
 wmic logicaldisk get caption,description,providername
```

Display Connected Devices in PowerShell
```PowerShell
Get-PSDrive | where {$_.Provider -like "Microsoft.PowerShell.Core\FileSystem"}| ft Name,Root
```

## Windows Network Information

Display IP and Interfaces/Copy to Clipboard
```CMD
ipconfig /all
 ipconfig | clip
```

Display Routing Table
```CMD
route print
```

Display ARP Table
```CMD
arp -A
```

Display Active TCP Connections
```CMD
netstat -an
```

List of TCP and UDP activity every 1 second
```CMD
netstat -naob 1 | find "<IPADDR or PORT>"
```

## Windows User Information

A simple CMD script that outputs these commands to txt is here: [tools\user-info.cmd](/../blob/tools/user-info.cmd)

Display Username Associated with Current User ID
```CMD
whoami
 echo %USERNAME%
```

Display All whoami Access Token Info
```CMD
whoami /all
```

Display Local Users
```CMD
net users
```

Display Detailed User Info
```CMD
net user $USERNAME
```

Display Users with RDP Privileges
```CMD
qwinsta
```

Display Local Groups
```CMD
net localgroup
```

Display Local Administrators
```CMD
net localgroup administrators
```

Display Domain Group (must be run on DC)
```CMD
net groups
```

Display Domain Password Policy
```CMD
net accounts /domain
```

## Windows User Administration

Add User on Local Computer 
```CMD
net user /add $USERNAME *
```

Change Local User Password
```CMD
net user $USERNAME *
```

Add New User Account to Domain
```CMD
net user $USERNAME * /ADD /DOMAIN
```

Add User to Local Group
```CMD
net localgroup $GROUPNAME $USERNAME /add
```

Add user to Remote Desktop User Group
```CMD
net group "Remote Desktop User" $USERNAME /add
```

Add user to Domain Group
```CMD
net group $GROUPNAME $USERNAME /add /domain
```