# Persistence

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

Powershell Add Firewall Rule

New-NetFirewallRule -Action Allow -DisplayName Pentester-C2 -RemoteAddress <IPADDR>

For persistence section: https://ss64.com/nt/net-config.html