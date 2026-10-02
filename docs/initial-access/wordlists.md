# Wordlists

Lists of usernames, passwords, and content paths used for brute forcing, spraying, and fuzzing.

## Why It Matters

The right wordlist is often the difference between a brute-force or fuzzing attack that works and one that wastes hours. Matching the list to the target (its technology, language, and naming conventions) matters more than raw size.

## Reference

### Common Lists

| List | Use |
| :--- | :--- |
| [SecLists](https://github.com/danielmiessler/SecLists) | The standard collection: usernames, passwords, web content, fuzzing payloads |
| rockyou.txt | The classic leaked-password list, bundled with Kali |
| [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings) | Attack payloads and fuzzing lists by category |
| dirbuster / common.txt | Web content and directory names |

### Generating Targeted Lists

| Tool | Use |
| :--- | :--- |
| [CeWL](https://github.com/digininja/CeWL) | Build a wordlist by crawling the target's website |
| [CUPP](https://github.com/Mebus/cupp) | Generate password guesses from a person's details |
| [crunch](https://www.kali.org/tools/crunch/) | Generate lists matching a known password pattern |

## How I Use It

I start with a targeted list over a giant generic one: CeWL against the target's own site for passwords, and a technology-matched content list for fuzzing. rockyou is a reasonable fallback for password attacks, but a custom list built from OSINT usually lands faster and quieter.

## Related

* [Hydra](hydra.md)
* [Password Cracking](../privilege-escalation/password-cracking.md)
* [Web Application Recon](../reconnaissance/web-application-recon.md)
