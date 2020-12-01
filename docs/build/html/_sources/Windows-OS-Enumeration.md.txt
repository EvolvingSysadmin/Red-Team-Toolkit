# Windows OS Enumration

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

Display Running System Processes
```CMD
tasklist /v
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

## Windows Network Information

Display IP and Interfaces
```CMD
ipconfig /all
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

## Windows User Information

Display Username Associated with Current User ID
```CMD
whoami
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
net localgroup "administrators"
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