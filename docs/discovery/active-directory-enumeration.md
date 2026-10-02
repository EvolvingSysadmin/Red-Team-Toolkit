# Active Directory Enumeration

Mapping an Active Directory domain: its users, groups, computers, trusts, and the relationships between them.

## Why It Matters

AD enumeration turns a single domain foothold into a map of the whole environment. It reveals privileged accounts, group membership, trust relationships, and attack paths, which is what every later phase (privilege escalation, lateral movement) depends on. Most of it can be done with a single low-privilege account.

## Reference

### AD Components

| Component | Description |
| :--- | :--- |
| Domain Controller | Holds the AD DS data store, handles authentication and authorization |
| AD DS data store | Contains `NTDS.dit`, which holds all AD objects and domain password hashes |
| Forest | The top-level container: one or more domain trees, with shared schema and trusts |
| Domain | Groups and manages objects (users, groups, computers) |
| Organizational Unit (OU) | Container for objects, where Group Policy is applied |
| Trusts | Allow users in one domain to access resources in another |
| Objects | Users, groups, computers, printers, shares |

### Key Groups to Find

| Group | Why It Matters |
| :--- | :--- |
| Domain Admins | Full control of the domain |
| Enterprise Admins | Full control of the forest |
| Schema Admins | Can modify the AD schema |
| Account Operators, Backup Operators | Often overlooked paths to privilege |
| Protected Users | Accounts with extra authentication protections |

### Enumeration with CMD

| Task | Command |
| :--- | :--- |
| Domain, DC address, roles | `wmic ntdomain` |
| Domain users | `net user /domain` |
| Detail on a user | `net user <name> /domain` |
| Domain Admins | `net group "Domain Admins" /domain` |
| Hosts in the domain | `net view` |
| Trusts | `nltest /trusted_domains` |
| Query users / groups / computers | `dsquery user`, `dsquery group`, `dsquery computer` |

### Enumeration with PowerShell

The ActiveDirectory module and ADSI provide richer queries.

```powershell
# accounts with adminCount=1 (privileged or formerly privileged)
([adsisearcher]"(&(objectClass=User)(admincount=1))").FindAll().Properties.samaccountname

# accounts that never lock out (userAccountControl bit)
dsquery * -filter "(&(objectCategory=person)(objectClass=user)(userAccountControl:1.2.840.113556.1.4.803:=65536))"

# export all AD objects
Get-ADObject -Filter * | Select Name, ObjectClass, DistinguishedName | Export-Csv ADObjects.csv -NoTypeInformation
```

For broad, structured collection, [PowerView](powerview.md) is purpose-built for this.

### Enumeration from Linux

| Task | Command |
| :--- | :--- |
| SMB null session | `rpcclient -U "" <target>` |
| Broad SMB/AD enumeration | `enum4linux -a <target>` (or the maintained `enum4linux-ng`) |
| List SMB shares | `smbclient -L //<target>` |
| LDAP dump | `ldapsearch -x -H ldap://<target> -b "dc=example,dc=com"`, or [ldapdomaindump](https://github.com/dirkjanm/ldapdomaindump) |
| Modern all-in-one | [NetExec](https://github.com/Pennyw0rth/NetExec) (`nxc smb <target> -u user -p pass --users --groups --shares`) |

### BloodHound

BloodHound maps AD objects and their relationships into a graph, which reveals attack paths that are invisible in flat lists (for example, who can reach Domain Admin through a chain of group memberships and ACLs).

* Collect with [SharpHound](https://github.com/BloodHoundAD/SharpHound) on Windows, or [bloodhound-python](https://github.com/dirkjanm/BloodHound.py) from Linux
* Load the data into the BloodHound GUI and run the built-in queries, such as "Shortest Path to Domain Admins"

## How I Use It

From a domain foothold I confirm the basics with `net` and `wmic`, then run a BloodHound collection, because the graph shows attack paths that command-line enumeration misses. PowerView fills in specific questions (ACLs, sessions, local admin access). The privileged accounts and paths I find here drive [AD Privilege Escalation](../privilege-escalation/ad-privilege-escalation.md) and [Movement](../movement/index.md).

## Related

* [PowerView](powerview.md)
* [Breaching Active Directory](../initial-access/breaching-active-directory.md)
* [AD Privilege Escalation](../privilege-escalation/ad-privilege-escalation.md)

## Resources

* [BloodHound Documentation](https://bloodhound.readthedocs.io/)
* [Active Directory Exploitation Cheat Sheet](https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet)
* [The Hacker Recipes: Active Directory](https://www.thehacker.recipes/)
