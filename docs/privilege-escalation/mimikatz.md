# Mimikatz

Windows post-exploitation tool for extracting credentials, tickets, and secrets from memory and the local security databases.

## When I Use It

* Recovering credentials from LSASS memory after gaining administrative access to a host
* Dumping local account hashes from the SAM, or domain secrets where available
* Kerberos ticket attacks (pass-the-ticket, and reference for golden/silver tickets)

!!! warning "Heavily detected; requires high privilege"
    Mimikatz is one of the most-signatured tools in existence; AV and EDR flag it on sight, and most functions need local administrator or SYSTEM. Expect detection on any monitored host, and confirm it is acceptable in scope. The point in a report is usually that it *worked*, which is itself the finding.

## Installation

Obtain from the official repository: [gentilkiwi/mimikatz](https://github.com/gentilkiwi/mimikatz). It is also loadable in memory through Meterpreter (`load kiwi`) and ported into other frameworks.

## Common Modules

| Command | Purpose |
| :--- | :--- |
| `privilege::debug` | Acquire the debug privilege needed for most operations |
| `sekurlsa::logonpasswords` | Dump credentials of logged-on users from LSASS |
| `sekurlsa::tickets` | List and export Kerberos tickets in memory |
| `lsadump::sam` | Dump local account hashes from the SAM |
| `lsadump::lsa` | Dump LSA secrets |
| `lsadump::dcsync` | Request password data for an account from a DC (DCSync; needs replication rights) |
| `sekurlsa::pth` | Pass-the-hash: start a process as another user with their NTLM hash |

## Reading the Output

* `sekurlsa::logonpasswords` returns NTLM hashes and, on older or misconfigured systems, cleartext (WDigest)
* Hashes feed [Password Cracking](password-cracking.md) or pass-the-hash for [Movement](../movement/index.md)
* A successful `dcsync` against a domain means the domain's credentials, including `krbtgt`, are exposed

## Related

* [Local Windows Privilege Escalation](local-windows-privilege-escalation.md)
* [AD Privilege Escalation](ad-privilege-escalation.md)
* [Password Cracking](password-cracking.md)
* [Movement](../movement/index.md)

## Resources

* [mimikatz (gentilkiwi)](https://github.com/gentilkiwi/mimikatz)
* [adsecurity.org: Mimikatz guide](https://adsecurity.org/?page_id=1821)
