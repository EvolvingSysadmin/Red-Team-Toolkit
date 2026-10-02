# Linux Privilege Escalation

Going from a low-privilege Linux shell to root by abusing misconfigurations or vulnerabilities.

## Why It Matters

A foothold on Linux is usually an unprivileged service or user account. Privilege escalation is what makes it useful, and the paths to it (loose sudo rules, SUID binaries, writable cron jobs) are concrete misconfigurations a defender can fix once they are named in the report.

## Reference

### Enumerate First

Most escalations come from enumeration, not exploits. Run [LinPEAS](https://github.com/carlospolop/PEASS-ng) for breadth, and check these by hand:

| Vector | Check |
| :--- | :--- |
| sudo rights | `sudo -l`: commands you can run as root, often abusable via [GTFOBins](https://gtfobins.github.io/) |
| SUID / SGID binaries | `find / -perm -4000 -type f 2>/dev/null`: binaries that run as their owner |
| Capabilities | `getcap -r / 2>/dev/null`: binaries with elevated capabilities |
| Cron jobs | `cat /etc/crontab`, `/etc/cron.*`: scripts that run as root, especially writable ones |
| Writable paths | `$PATH` entries or scripts you can modify that privileged processes run |
| Credentials | History, config files, `.ssh` keys, and files with passwords |
| Kernel version | `uname -a`: a last resort, matched to a known kernel exploit |

### Common Techniques

* **sudo abuse:** a permitted command that can spawn a shell or read/write arbitrary files (check GTFOBins for the binary)
* **SUID abuse:** a SUID binary that can be made to execute a shell or read protected files
* **Writable cron / PATH:** placing or editing a script that a root process executes
* **Capabilities:** for example `cap_setuid` on a binary that can then change UID to 0

!!! warning "Kernel exploits last"
    Public kernel exploits can crash the host. Exhaust misconfiguration-based paths first, and test kernel exploits in a matching lab before using them on a live target.

## How I Use It

I run LinPEAS and work through `sudo -l`, SUID binaries, and cron first, because those are reliable and quiet. GTFOBins turns almost every permitted-command finding into a concrete escalation. Kernel exploits are the fallback when nothing else is available and the risk is acceptable.

## Related

* [Linux Post-Exploitation Discovery](../discovery/linux-post-exploitation-discovery.md)
* [Linux Exploits](../initial-access/linux-exploits.md)

## Resources

* [GTFOBins](https://gtfobins.github.io/)
* [HackTricks: Linux Privilege Escalation](https://book.hacktricks.xyz/linux-hardening/privilege-escalation)
* [PEASS-ng (LinPEAS)](https://github.com/carlospolop/PEASS-ng)
