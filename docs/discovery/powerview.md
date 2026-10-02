# PowerView

PowerShell tool (part of PowerSploit) for enumerating users, groups, computers, shares, ACLs, and trust relationships in Active Directory.

## When I Use It

* Enumerating a domain from a compromised host without dropping obvious tooling
* Finding attack paths: where users are logged in, who has local admin, and which ACLs are abusable
* Quick domain reconnaissance when a full BloodHound collection is not warranted

!!! warning "Detection and policy"
    PowerView is widely flagged by AV and EDR, and setting an unrestricted execution policy is itself noisy. Expect detection on a monitored network and prefer it where that is acceptable in scope.

## Setup

* Obtain the Recon module from [PowerSploit](https://github.com/PowerShellMafia/PowerSploit)
* Import it: `Import-Module .\PowerView.ps1` (or `Import-Module Recon`)

## Common Tasks

### Domain Info

| Task | Cmdlet |
| :--- | :--- |
| Current domain | `Get-NetDomain` |
| Domain SID | `Get-DomainSID` |
| Domain controllers | `Get-NetDomainController` |
| Domain shares | `Find-DomainShare` |
| GPOs / OUs | `Get-NetGPO` / `Get-NetOU` |
| Forest domains | `Get-NetForestDomain` |

### Users, Groups, Computers

| Task | Cmdlet |
| :--- | :--- |
| Domain users | `Get-NetUser` |
| Domain groups | `Get-NetGroup` |
| Members of a group | `Get-DomainGroup -Identity <group> \| Select -Expand Member` |
| Domain computers | `Get-NetComputer` |

### ACLs and Trusts

| Task | Cmdlet |
| :--- | :--- |
| ACLs for an object | `Get-ObjectAcl -SamAccountName <acct> -ResolveGUIDs` |
| Interesting ACEs | `Invoke-ACLScanner -ResolveGUIDs` |
| ACL of a share path | `Get-PathAcl -Path "\host\share"` |

### User Hunting

| Task | Cmdlet |
| :--- | :--- |
| Machines where you are local admin | `Find-LocalAdminAccess` |
| Local admins on machines | `Invoke-EnumerateLocalAdmin` |
| Where a target user has a session | `Invoke-UserHunter` |

## Reading the Output

* `Find-LocalAdminAccess` and `Invoke-UserHunter` are the fastest way to find a path to privileged access
* ACL results from `Invoke-ACLScanner` reveal delegation and abusable rights that are not obvious from group membership
* For large domains, [BloodHound](active-directory-enumeration.md) visualizes these same relationships more clearly

## Related

* [Active Directory Enumeration](active-directory-enumeration.md)
* [AD Privilege Escalation](../privilege-escalation/ad-privilege-escalation.md)

## Resources

* [PowerSploit / PowerView](https://github.com/PowerShellMafia/PowerSploit)
* [HackTricks: PowerView](https://book.hacktricks.xyz/)
