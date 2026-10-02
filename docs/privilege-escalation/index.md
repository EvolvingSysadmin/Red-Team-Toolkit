# Privilege Escalation

Going from limited access to administrative or domain-level control on a host or in Active Directory.

## Why It Matters

A low-privilege foothold is rarely the goal. Privilege escalation turns it into meaningful access, and the misconfigurations that allow it (weak service permissions, cached credentials, over-privileged accounts) are exactly the findings a defender needs to fix.

## Pages

| Page | Description |
| :--- | :--- |
| [Local Windows Privilege Escalation](local-windows-privilege-escalation.md) | Escalating on a Windows host |
| [AD Privilege Escalation](ad-privilege-escalation.md) | Escalating within Active Directory |
| [Linux Privilege Escalation](linux-privilege-escalation.md) | Escalating on a Linux host |
| [Password Cracking](password-cracking.md) | Recovering passwords from captured hashes |
| [Mimikatz](mimikatz.md) | Extracting Windows credentials from memory |

## How I Use It

I enumerate escalation paths before trying anything: local misconfigurations first, then credential material that opens up the domain. Recovered credentials and elevated access feed back into [Discovery](../discovery/index.md) and forward into [Movement](../movement/index.md).
