# Web Application Recon

Mapping a web application's surface: its technology, content, parameters, and headers, before testing it.

## Why It Matters

Recon decides how efficient the rest of a web assessment is. Fingerprinting the stack, finding hidden content and subdomains, and reading the headers all point at where the weaknesses are likely to be, so the actual testing is targeted instead of blind.

## Reference

### Information Gathering

Collect what is publicly known about the application: technology, versions, and exposed assets.

* Google dorking to surface content and exposure:
    * `site:victim.com`, `inurl:admin`, `filetype:pdf`, `intitle:admin`, `site:*.victim.com`
    * [Google Dorking Cheat Sheet](https://gist.github.com/sundowndev/283efaddbcf896ab405488330d1bbc06), [Google Hacking Database](https://www.exploit-db.com/google-hacking-database)
* [Wappalyzer](https://www.wappalyzer.com/) and [BuiltWith](https://builtwith.com/) to identify technologies
* [Wayback Machine](https://archive.org/web/) for past versions of the site
* Search GitHub for the organization's repositories and leaked secrets
* Check for misconfigured S3 buckets at `https://{name}.s3.amazonaws.com`

### Footprinting

Build a picture of the app and its supporting systems.

| Technique | Tools |
| :--- | :--- |
| Network scanning | Nmap, Nessus, OpenVAS |
| OS fingerprinting | p0f, Xprobe, Nmap |
| Response header and error analysis | Burp Suite, OWASP ZAP, curl, Telnet |

### Manual Content Discovery

Also called walking the application: finding hidden content by hand.

* Read HTML comments in the page source
* Check `robots.txt` for disallowed paths and `sitemap.xml` for structure
* Use browser developer tools (Inspector, Debugger, Network, Storage)
* Look for misconfigured directories with weak permissions

#### Subdomain Discovery

* Certificate transparency logs: [crt.sh](https://crt.sh/), [Entrust CT Search](https://ui.ctsearch.entrust.com/ui/ctsearchui)
* Google dorking: `site:*.victim.com`
* [dnsrecon](https://www.kali.org/tools/dnsrecon/), [Sublist3r](https://github.com/aboul3la/Sublist3r)
* Virtual host fuzzing with [ffuf](https://github.com/ffuf/ffuf):

```bash
ffuf -w /usr/share/wordlists/SecLists/Discovery/DNS/namelist.txt \
  -H "Host: FUZZ.acmeitsupport.thm" -u http://MACHINE_IP
```

`-fs <size>` filters out responses of a given size to cut noise from catch-all responses.

#### Framework Discovery

* Read the framework's documentation for default admin pages and known issues
* Check whether the hosting software (Apache, Nginx, IIS, Node.js) is out of date
* Fingerprint by favicon hash:

```bash
curl https://victim.com/images/favicon.ico | md5sum
```

### Automated Content Discovery

Brute force directories and files with a wordlist such as [SecLists](https://github.com/danielmiessler/SecLists).

```bash
ffuf -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://VICTIM_IP/FUZZ
dirb http://VICTIM_IP/ /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
gobuster dir --url http://VICTIM_IP/ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt
```

### Header Analysis

Inspect HTTP response headers for the server, technology stack, and security posture.

* Grab headers with curl, netcat, Burp Suite, OWASP ZAP, or Nmap:

```bash
curl -v https://victim.com
```

* Look for information disclosure (server type, software versions)
* Check for missing security headers: X-Content-Type-Options, Strict-Transport-Security, Content-Security-Policy
* Review cookie attributes: Secure, HttpOnly, SameSite
* Note redirects, caching, and compression behavior

[Shodan](https://www.shodan.io/) indexes banners from internet-wide scanning and can surface exposed services and misconfigurations for a target.

## How I Use It

I fingerprint the stack first (Wappalyzer, favicon hash, headers), then do manual content discovery before any automated brute forcing, because the manual pass usually finds the interesting paths with far less noise. Subdomain enumeration via certificate transparency is quiet and high-value, so it goes early. Everything found here feeds the testing in [Initial Access](../initial-access/index.md).

## Resources

* [SecLists](https://github.com/danielmiessler/SecLists)
* [ffuf](https://github.com/ffuf/ffuf), [Gobuster](https://github.com/OJ/gobuster), [dirb](https://www.kali.org/tools/dirb/)
* [WhatWeb](https://github.com/urbanadventurer/WhatWeb), [Netcraft Site Report](https://sitereport.netcraft.com/)
* [A Pentester's Guide to Subdomain Enumeration](https://blog.appsecco.com/a-penetration-testers-guide-to-sub-domain-enumeration-7d842d5570f6)
