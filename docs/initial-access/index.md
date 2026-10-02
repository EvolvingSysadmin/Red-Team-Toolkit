# Initial Access

Getting the first foothold in the target environment, by exploiting an exposed service, a web application, or a person.

## Why It Matters

Initial access is where recon turns into a foothold. The vector that works is often the most important finding in the report, because it is the one the defender most needs to close.

## Pages

| Page | Description |
| :--- | :--- |
| [Phishing](phishing.md) | Social engineering for credentials and code execution |
| [Web Authentication Bypass](web-authentication-bypass.md) | Defeating login and session controls |
| [SQL Injection](sql-injection.md) | Injecting SQL to read data or gain execution |
| [XSS](xss.md) | Cross-site scripting against web application users |
| [Network Services Attacks](network-services-attacks.md) | Attacking exposed network services |
| [Breaching Active Directory](breaching-active-directory.md) | First access into an AD environment |
| [Windows Exploits](windows-exploits.md) | Exploiting Windows hosts and services |
| [Linux Exploits](linux-exploits.md) | Exploiting Linux hosts and services |

## Tools

| Tool | Use |
| :--- | :--- |
| [Burp Suite](burp-suite.md) | Web application proxy and testing platform |
| [OWASP ZAP](owasp-zap.md) | Open-source web application scanner and proxy |
| [Hydra](hydra.md) | Network login brute forcing |
| [Metasploit](metasploit.md) | Exploitation framework |
| [Nessus](nessus.md) | Vulnerability scanner |
| [Wordlists](wordlists.md) | Wordlists for brute forcing and fuzzing |

## How I Use It

I work from the recon picture to the lowest-risk, highest-likelihood vector first: a known-vulnerable exposed service or a weak web application before anything noisier. Once a foothold lands, it leads into [Discovery](../discovery/index.md).
