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