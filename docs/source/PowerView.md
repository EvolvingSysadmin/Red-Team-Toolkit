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
```
Display Other Domains
```PowerShell
Get-NetDomain -Domain <DomainName>
```
Get Domain SID
```PowerShell
Get-DomainSID
```
Get Domain Controllers
```PowerShell
Get-NetDomainController
Get-NetDomainController -Domain <DomainName>
```



- **Get Domain Policy:** 
  ```
  Get-DomainPolicy

  #Will show us the policy configurations of the Domain about system access or kerberos
  (Get-DomainPolicy)."system access"
  (Get-DomainPolicy)."kerberos policy"
  ```









## Domain Users ##
New
```PowerShell
Code
```
New
```PowerShell
Code
```
New
```PowerShell
Code
```
New
```PowerShell
Code
```
New
```PowerShell
Code
```
New
```PowerShell
Code
```
New
```PowerShell
Code
```


 Get-NetUser
  Get-NetUser -SamAccountName <user> 
  Get-NetUser | select cn
  Get-UserProperty