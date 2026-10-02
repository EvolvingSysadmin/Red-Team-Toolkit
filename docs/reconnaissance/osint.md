# OSINT

Gathering intelligence on a target from publicly available sources: search engines, social media, public records, code repositories, and internet scan data.

## Why It Matters

OSINT is the quietest phase of an engagement. Everything collected here comes from third parties, not the target, so it builds a picture of domains, people, technology, and exposed data without the target ever knowing. It shapes phishing pretexts, credential guesses, and the attack surface for later phases.

## Reference

### Sources

| Source | Examples and Use |
| :--- | :--- |
| Search engines | Google, Bing, and dorking for exposed content; reverse image search (TinEye); maps for physical locations |
| Social media | LinkedIn for org charts and tech, plus Twitter, Facebook, Instagram for people |
| Public records | SEC EDGAR, USPTO, company registries |
| Forums and Q&A | Reddit, Stack Overflow, and niche forums where staff discuss their stack |
| Document sharing | Scribd, SlideShare, and GitHub for documents and leaked material |
| Breach data | [Have I Been Pwned](https://haveibeenpwned.com/) for exposed accounts |
| People search | [Sherlock](https://github.com/sherlock-project/sherlock) to find usernames across sites |

### Email Enumeration

* Dork for addresses: `site:organisation.com intext:@organisation.com`
* Harvest and verify with theHarvester and the tools below
* Cross-reference against breach data to find reused credentials

### Google Dorks

Advanced search operators that surface specific content.

| Operator | Example | Description |
| :--- | :--- | :--- |
| `site:` | `help site:victim.com` | Restrict results to a domain |
| `inurl:` | `inurl:admin` | Word appears in the URL |
| `intitle:` | `intitle:"index of"` | Word appears in the page title |
| `filetype:` | `filetype:pdf` | Restrict to a file type |
| `cache:` | `cache:victim.com` | Google's cached copy of a page |
| `related:` | `related:victim.com` | Sites similar to one given |

The [Google Hacking Database](https://www.exploit-db.com/google-hacking-database) is a curated catalog of dorks that find exposed and sensitive content.

### Tools

| Tool | Use |
| :--- | :--- |
| [theHarvester](https://www.kali.org/tools/theharvester/) | Emails, names, subdomains, IPs, and URLs from many public sources |
| [Maltego](https://www.maltego.com/) | Visualize relationships between people, domains, and infrastructure |
| [recon-ng](https://www.kali.org/tools/recon-ng/) | Modular web reconnaissance framework |
| [OWASP Amass](https://github.com/OWASP/Amass) | Subdomain and attack-surface mapping |
| [SpiderFoot](https://github.com/smicallef/spiderfoot) | Automated OSINT collection and correlation |
| [Shodan](https://www.shodan.io/) | Search engine for internet-connected devices and banners |
| [gitleaks](https://github.com/gitleaks/gitleaks) | Find hardcoded secrets in git repositories |
| [Metagoofil](https://www.kali.org/tools/metagoofil/) / [FOCA](https://github.com/ElevenPaths/FOCA) | Extract metadata from public documents |
| [OSINT Framework](https://osintframework.com/) | Categorized directory of OSINT resources |

Example theHarvester run (`-d` domain, `-l` result limit, `-b` data source):

```bash
theharvester -d kali.org -l 500 -b google
```

### Common Shodan Filters

Shodan indexes banners from internet-wide scanning, which makes it a fast way to find a target's exposed services.

| Filter | Purpose |
| :--- | :--- |
| `org:"Target Inc"` | Services on an organization's netblocks |
| `net:199.4.1.0/24` | A specific network range |
| `hostname:victim.com` | Hosts matching a hostname |
| `port:3389` | A specific service port |
| `product:` / `version:` | A specific software and version |
| `vuln:CVE-2021-34527` | Hosts flagged for a given CVE |
| `ssl.cert.expired:true` | Expired certificates |
| `http.title:"Login"` | Web banners by page title |

The [full filter reference](https://beta.shodan.io/search/filters) lists the HTTP, SSL, NTP, and Telnet filter sets.

## How I Use It

I map the organization first (domains, netblocks, and the technology its staff mention), then the people (names, roles, email format, and reused or breached credentials), and I check Shodan and GitHub for anything already exposed. Nothing here touches the target directly, so it runs before any active recon and feeds both [DNS Recon](dns-recon.md) and [Initial Access](../initial-access/index.md).

## Resources

* [Awesome OSINT](https://github.com/jivoi/awesome-osint)
* [OSINT Framework](https://osintframework.com/)
* [Awesome Shodan Search Queries](https://github.com/jakejarvis/awesome-shodan-queries)
* [Google Hacking Database](https://www.exploit-db.com/google-hacking-database)
