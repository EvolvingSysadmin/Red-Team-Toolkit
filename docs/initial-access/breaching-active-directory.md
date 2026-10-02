# Breaching Active Directory

Getting the first valid set of Active Directory credentials, the usual prerequisite for everything else in an AD engagement.

## Why It Matters

Most AD attacks assume you already have a foothold: one valid domain account. Breaching AD is about getting that first credential, whether from an exposed service, a misconfiguration, intercepted authentication, or OSINT. Once inside, the work moves to [Discovery](../discovery/index.md) and [Privilege Escalation](../privilege-escalation/index.md).

## Reference

### Where Credentials Come From

| Source | Notes |
| :--- | :--- |
| OSINT and breach data | [Have I Been Pwned](https://haveibeenpwned.com/), DeHashed, GitHub leaks, documents |
| NTLM-authenticated services | OWA/Exchange, RDP, AD-integrated VPNs, internet-facing apps that accept domain creds |
| LDAP bind credentials | Services (GitLab, Jenkins, printers, VPNs, custom apps) that store a domain bind account |
| Authentication relays | Intercepting and relaying NetNTLM authentication on the internal network |
| Deployment systems | MDT/SCCM and PXE boot images that contain credentials |
| Configuration files | Web app configs, service configs, registry keys, deployed application files |

### Password Spraying

Trying one common password across many usernames stays under per-account lockout thresholds. Build the username list from OSINT and the organization's email format, pick passwords that fit the season or policy, and keep the attempt rate low. Tools: [kerbrute](https://github.com/ropnop/kerbrute), [NetExec](https://github.com/Pennyw0rth/NetExec).

!!! warning "Lockouts"
    Spraying can still lock accounts if the password count per account exceeds the policy. Know the lockout threshold and observation window before starting, and stay well under them.

### LDAP Pass-back

If you control a device's LDAP configuration (for example a printer's admin panel), redirecting its LDAP server to a host you control can capture the bind credentials. A rogue LDAP server configured to accept cleartext mechanisms, with `tcpdump` capturing port 389, recovers the credential when the device tests its connection.

### NetNTLM Interception and Relay

SMB and other services use NetNTLM authentication, which can be captured and abused:

* [Responder](https://github.com/lgandx/Responder) answers LLMNR, NBT-NS, and WPAD requests to coerce and capture authentication: `sudo responder -I <interface>`
* Captured NetNTLM hashes can be cracked offline (slower than raw NTLM) or relayed to another host to gain an authenticated session

## How I Use It

I start with the quietest sources: OSINT, breach data, and any exposed service that accepts domain credentials for a careful spray. On an internal network, Responder plus relaying is often the fastest path to a first credential. One valid account is the goal; from there the engagement moves into enumeration with [BloodHound](../discovery/active-directory-enumeration.md) and [PowerView](../discovery/powerview.md).

## Related

* [Active Directory Enumeration](../discovery/active-directory-enumeration.md)
* [AD Privilege Escalation](../privilege-escalation/ad-privilege-escalation.md)
* [Mimikatz](../privilege-escalation/mimikatz.md)

## Resources

* [Active Directory Exploitation Cheat Sheet](https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet)
* [TryHackMe: Breaching Active Directory](https://tryhackme.com/room/breachingad)
* [The Hacker Recipes: AD](https://www.thehacker.recipes/)
