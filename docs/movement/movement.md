# Lateral Movement

Moving from one compromised host to others, reusing credentials and access gathered along the way.

## Why It Matters

The first foothold is rarely the objective. Lateral movement is how an attacker reaches the systems that matter, and it is where credential reuse, over-permissive access, and weak segmentation turn one compromised host into many.

## Reference

### In-Place Techniques

Acting as another user on a host you already control.

| Technique | Description |
| :--- | :--- |
| Pass the Hash | Authenticate with an NTLM hash instead of a password |
| Token Impersonation | Steal and reuse another logged-on user's token |
| Process Injection | Run code in the context of another process |
| `runas` / RunAs | Launch a process as another user with their credentials |

### Remote Techniques (Windows Domain)

Executing on a remote host using valid credentials or hashes.

| Technique | Tooling |
| :--- | :--- |
| PsExec | Sysinternals PsExec, Impacket `psexec.py` |
| WMI | `wmiexec.py`, `wmic` |
| WinRM / PowerShell Remoting | `Enter-PSSession`, `evil-winrm` |
| Scheduled Tasks | `at`, `schtasks` on a remote host |
| GPO | Pushing a scheduled task or script via Group Policy |
| SMB / admin shares | Copying and executing over `C$`/`ADMIN$` |

[NetExec](https://github.com/Pennyw0rth/NetExec) and [Impacket](https://github.com/fortra/impacket) implement most of these in one place.

## How I Use It

I reuse the credentials and hashes gathered in discovery and privilege escalation, and let [BloodHound](../discovery/active-directory-enumeration.md) show which hosts a given account can actually reach. I prefer built-in protocols (WinRM, WMI, SMB) over dropping tools, and I watch what the environment's defenses would see, since lateral movement is where many engagements get caught. Each hop is recorded for the report.

## Related

* [AD Privilege Escalation](../privilege-escalation/ad-privilege-escalation.md)
* [Mimikatz](../privilege-escalation/mimikatz.md)
* [Evasion](evasion.md)

## Resources

* [adsecurity.org](https://adsecurity.org/)
* [TrustedSec: No PsExec Needed](https://www.trustedsec.com/blog/no_psexec_needed/)
* [MITRE ATT&CK: Lateral Movement](https://attack.mitre.org/tactics/TA0008/)
