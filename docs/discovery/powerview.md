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
* Import PowerSploit and/or Recon module:
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
 Get-NetDomainController -Identity <DomainName>
```

## Detailed Domain Info

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
 Get-NetGPO -GPOname <GUID of GPO>
```
Display OUs
```PowerShell
Get-NetOU
```
Display ACLs
```PowerShell
Get-ObjectAcl -SamAccountName <Account Name> -ResolveGUIDs
```
Find Interesting Access Control Entries
```PowerShell
Invoke-ACLScanner -ResolveGUIDs
```
Display ACL of Specified Path
```PowerShell
Get-PathAcl -Path "\\Path\Of\A\Share"
```
Display Domains of Forest
```PowerShell
Get-NetForestDomain
```
Display Domain Trust (may be deprecated)
```PowerShell
Get-ADTrust -Filter *
 Get-ADTrust -Identity <DomainName>
```
Display Local AppLocker Effective Policy
```PowerShell
Get-AppLockerPolicy -Effective
```

## Computer Info

Display Domain Computers
```PowerShell
Get-ADComputer -Filter * -Properties *
```
More Detailed All Computer Info
```PowerShell
Get-NetComputer
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
Get Session Info for Machine
```PowerShell
Get-NetSession -ComputerName <ComputerName>
```
Get Machines Where Current User is Logged In
```PowerShell
Find-DomainUserLocation
```
Get Detailed User Info
```PowerShell
Get-ADUser -Properties * -Filter *
```

## Group Info

Get Members of a Specified Group
```PowerShell
Get-DomainGroup -Identity <GroupName> | Select-Object -ExpandProperty Member
```
Display All Groups
```PowerShell
Get-NetGroup
```
Display Detailed Info on All Groups
```PowerShell
Get-ADGroup -Properties * -Filter *
```

## User Hunting

Find all Machines Where Current User is Local Admin
```PowerShell
Find-LocalAdminAccess -Verbose
```
Find Local Admins on Machines
```PowerShell
Invoke-EnumerateLocalAdmin -Verbose
```
Find Machines Where Domain Admin or Specified User Has Session
```PowerShell
Invoke-UserHunter
 Invoke-UserHunter -GroupName <GroupName>
 Invoke-UserHunter -CheckAccess
  Invoke-UserHunter -Stealth
```

## Loot Hunting

Use Domain Account to download list of all filenames in the network
```PowerShell
   Invoke-ShareFinderThreaded -ExcludedShares IPC$,PRINT$,ADMIN$ |
   select-string '^(.*) \t-' | %{dir -recurse $_.Matches[0].Groups[1] |
   select fullname | out-file -append files.txt}
```

## PowerView Resources
* https://powersploit.readthedocs.io/en/latest/Recon/
* https://github.com/PowerShellMafia/PowerSploit/tree/master/Recon
* https://gist.github.com/HarmJ0y/184f9822b195c52dd50c379ed3117993
* https://github.com/PowerShellEmpire/PowerTools/tree/master/PowerView
* http://www.harmj0y.net/blog/tag/powerview/
* http://www.harmj0y.net/blog/powershell/veil-powerview-a-usage-guide/
* http://www.harmj0y.net/blog/redteaming/powerview-2-0/
* http://www.harmj0y.net/blog/penetesting/i-hunt-sysadmins/
* http://www.slideshare.net/harmj0y/i-have-the-powerview
* https://adsecurity.org/?p=2535
* https://www.youtube.com/watch?v=rpwrKhgMd7E
* Powerview like program for systems without powershell https://github.com/mubix/netview
https://www.hackingarticles.in/active-directory-enumeration-powerview/
* [PowerShell Port Scanner](https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/)
