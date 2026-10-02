# Network Services Attacks

Enumerating and attacking common network services to find a foothold.

## Why It Matters

Exposed network services are a frequent entry point. Many are misconfigured (anonymous access, default credentials, readable shares) or run outdated versions with known vulnerabilities. Thorough enumeration of each service is usually what reveals the way in.

## Reference

### Enumeration

Identify services and versions with [Nmap](../discovery/nmap.md) `-sV` and its NSE scripts, and `enum4linux` for Windows and Samba hosts. The exact version is what maps to a known vulnerability on [Exploit-DB](https://www.exploit-db.com/) or in CVE databases.

### Services

| Service | Port | Enumeration and Notes |
| :--- | :--- | :--- |
| SMB | 445 | `smbclient -L //IP -U user`; list and access shares, check for anonymous access and readable shares |
| Telnet | 23 | `telnet IP port`; cleartext, often legacy; check for exposed banners and credentials |
| FTP | 21 | `ftp IP`; check for anonymous login and writable directories; cleartext credentials |
| NFS | 2049 | `showmount -e IP` to list exports; mount with `sudo mount -t nfs IP:share /mnt -o nolock`; check for `no_root_squash` |
| SMTP | 25 | Enumerate users with `VRFY` and `EXPN`; Metasploit `auxiliary/scanner/smtp/smtp_version` |
| MySQL | 3306 | `mysql -h IP -u user -p`; Metasploit `mysql_version`, `mysql_schemadump`, `mysql_hashdump` |

### Common Issues to Check

* Anonymous or guest access (FTP, SMB, NFS)
* Default or weak credentials (test with [Hydra](hydra.md))
* Readable or writable shares and exports
* Outdated versions with public exploits
* `no_root_squash` on NFS exports, which allows writing files as root

## How I Use It

I enumerate every open service fully before trying anything, because the foothold is usually a misconfiguration (an anonymous share, a writable export) rather than an exploit. Version numbers go straight to `searchsploit`. Anything requiring credentials gets a targeted, in-scope brute force only after the easy wins are exhausted.

## Related

* [Nmap](../discovery/nmap.md), [Other Scanning Methods](../discovery/other-scanning-methods.md)
* [Hydra](hydra.md), [Metasploit](metasploit.md)

## Resources

* [HackTricks: Pentesting services by port](https://book.hacktricks.xyz/)
* [TryHackMe: Network Services](https://tryhackme.com/room/networkservices)
