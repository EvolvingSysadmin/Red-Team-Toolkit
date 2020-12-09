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

## Domain Enumeration Resources
* Information dumper via LDAP: https://github.com/dirkjanm/ldapdomaindump
* Integrated DNS dumping by any authenticated user: https://github.com/dirkjanm/adidnsdump
* Advanced Discovery of Privileged Accounts: https://github.com/cyberark/ACLight
* Detailed Active Directory Recon Tool: https://github.com/sense-of-security/ADRecon
* Powershell AD Enumeration: https://www.exploit-db.com/docs/english/46990-active-directory-enumeration-with-powershell.pdf