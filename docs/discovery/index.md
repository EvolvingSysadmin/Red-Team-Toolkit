# Discovery

Enumerating the environment from a foothold: hosts, users, privileges, and the Active Directory layout.

## Why It Matters

Discovery turns a single foothold into an understanding of the whole environment. Mapping users, groups, trusts, and reachable hosts reveals the path from where you landed to where you want to go, and most of it has to be done carefully to avoid tripping detection.

## Pages

| Page | Description |
| :--- | :--- |
| [Nmap](nmap.md) | Network and service discovery |
| [Other Scanning Methods](other-scanning-methods.md) | Additional scanning and enumeration techniques |
| [Active Directory Enumeration](active-directory-enumeration.md) | Mapping users, groups, trusts, and objects in AD |
| [PowerView](powerview.md) | PowerShell AD reconnaissance |
| [Windows Post-Exploitation Discovery](windows-post-exploitation-discovery.md) | Enumerating a compromised Windows host |
| [Linux Post-Exploitation Discovery](linux-post-exploitation-discovery.md) | Enumerating a compromised Linux host |

## How I Use It

From a foothold I enumerate locally first (the host, its users, its privileges), then outward into the domain with AD enumeration and PowerView. What I find here sets up [Privilege Escalation](../privilege-escalation/index.md) and [Movement](../movement/index.md).
