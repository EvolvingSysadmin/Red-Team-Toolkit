# Password Cracking

Recovering plaintext passwords from captured hashes, offline.

## Why It Matters

Hashes captured during an engagement (from a database, `NTDS.dit`, SAM, or intercepted authentication) are only useful once cracked. Cracked passwords reveal credential reuse, weak password policies, and often a direct path to further access, and the crack rate itself is a finding worth reporting.

## Reference

### Identify the Hash First

Knowing the hash type decides the mode and the effort. Use [hashid](https://github.com/psypanda/hashID) or `hashcat --identify`, and check the [Hashcat example hashes](https://hashcat.net/wiki/doku.php?id=example_hashes) for the mode number.

### Tools

| Tool | Use |
| :--- | :--- |
| [Hashcat](https://hashcat.net/hashcat/) | GPU-accelerated; the fastest option for most hash types |
| [John the Ripper](https://www.openwall.com/john/) | CPU-based, flexible, with helpers like `zip2john` and `*2john` |

### Approach

| Method | When |
| :--- | :--- |
| Dictionary | First: a wordlist such as rockyou or a target-specific list from CeWL |
| Rules | Apply mutation rules (for example `best64`) to a wordlist to cover variations |
| Mask / brute force | For short or known-pattern passwords, define a mask |
| Hybrid | Combine a wordlist with a mask (word plus digits or a year) |

Example Hashcat runs (mode `-m`, attack `-a`):

```bash
hashcat -m 1000 -a 0 hashes.txt rockyou.txt                 # NTLM, dictionary
hashcat -m 1000 -a 0 hashes.txt rockyou.txt -r rules/best64.rule
hashcat -m 0 -a 3 hashes.txt '?u?l?l?l?l?d?d'               # MD5, mask
```

## How I Use It

I identify the hash type, then start with a targeted wordlist plus a rules file before resorting to masks or brute force. A wordlist built from the target's own site (CeWL) and OSINT usually outperforms a bigger generic list. The crack rate and the common patterns that fall go into the report as evidence for password-policy recommendations.

## Related

* [John the Ripper](https://www.openwall.com/john/)
* [Wordlists](../initial-access/wordlists.md)
* [Mimikatz](mimikatz.md), for capturing the hashes

## Resources

* [Hashcat Wiki](https://hashcat.net/wiki/)
* [Hashcat example hashes](https://hashcat.net/wiki/doku.php?id=example_hashes)
