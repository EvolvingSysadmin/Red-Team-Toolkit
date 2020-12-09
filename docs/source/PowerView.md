# PowerView

## Setup

* Download PowerSploit and/or Recon folder/module here:
  * https://github.com/PowerShellMafia/PowerSploit/tree/dev
  * Copy to Folder Path: C:\Windows\System32\WindowsPowerShell\v1.0\Modules
* Add folders as exculsions or disable windows defender
* Set unrestricted PowerShell execution policy:
    ``` PowerShell 
    Set-ExecutionPolicy -ExecutionPolicy Unrestricted
    ```
* Import PowerView and/or Recon module:
    ``` PowerShell 
    Import-Module Recon
    ```
    
## Domain Info

Display Current Domain
```PowerShell
Get-NetDomain
 Get-NetDomain -Domain <DomainName>
```
Display Verbose Domain Info
```PowerShell
Get-ADDomain
 Get-ADDomain -Domain <DomainName>
```
Get Domain SID
```PowerShell
Get-DomainSID
```
Get Domain Controllers
```PowerShell
Get-ADDomainController
Get-NetDomainController
 Get-NetDomainController -Domain <DomainName>
```
Get Domain Policy (might be deprecated)
```PowerShell
Get-DomainPolicy
```
Get Domain Shares
```PowerShell
Find-DomainShare
 Find-DomainShare -CheckShareAccess
```
Get GPOs
```PowerShell
Get-NetGPO
 Get-NetGPO -ComputerName <Name of the PC>
```
Display OUs
```PowerShell
Get-NetOU -FullData
```


## User Info

Get User Info
```PowerShell
Get-NetUser
  Get-NetUser -SamAccountName <user> 
  Get-NetUser | select cn
```
Get Logged on User Info
```PowerShell
Get-NetLoggedon -ComputerName <ComputerName>
```
Get Machines Where Current User is Logged In
```PowerShell
Find-DomainUserLocation
```
Get Members of a Specified Group
```PowerShell
Get-DomainGroup -Identity <GroupName> | Select-Object -ExpandProperty Member
```

## Computer Info

Display Domain Computers
```PowerShell
Get-ADComputer -Filter *
```
More Detailed All Computer Info & Just Live Machines
```PowerShell
Get-NetComputer
 Get-NetComputer -Ping
```






New
```PowerShell
Code
```
New
```PowerShell
Code
```


