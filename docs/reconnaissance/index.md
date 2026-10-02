# Reconnaissance

Gathering information about a target before touching it directly, to understand the attack surface and plan the engagement.

## Why It Matters

Recon shapes everything that follows. Passive collection builds a picture of the target's domains, hosts, people, and technology without alerting them; active recon confirms what is reachable. The quality of this phase decides how focused the rest of the test is.

## Pages

| Page | Description |
| :--- | :--- |
| [OSINT](osint.md) | Open-source intelligence on domains, people, and exposed data |
| [DNS Recon](dns-recon.md) | Enumerating DNS records, subdomains, and infrastructure |
| [Web Application Recon](web-application-recon.md) | Mapping a web application's surface before testing it |

## How I Use It

I start passive and stay quiet as long as possible: OSINT and DNS first to map domains, people, and technology, then active web recon once there is a target in scope. Everything found here feeds [Initial Access](../initial-access/index.md).
