# Web Application Recon

Tools and techniques for web application recon

* [Background](#background)
* [Techniques](#techniques)
  * [Information Gathering](#information-gathering)
  * [Footprinting](#footprinting)
  * [Manual Content Discovery](#manul-content-discovery)
    * [General Content Discovery](#general-content-discovery)
    * [Subdomain Discovery](#subdomain-discovery)
    * [Framework Discovery](#framework-discovery)
  * [Automated Content Discovery](#automated-content-discovery)
  * [Parameter Analysis](#paramter-analysis)
  * [Header Analysis](#header-analysis)
    * [Header Grabbing and Analysis Tools](#header-grabbing-and-analysis-tools)
    * [Header Analysis Techniques](#header-analysis-techniques)
    * [Shodan](#shodan)
  * [Resources](#resources)

## Background

Web application reconnaissance is the process of gathering information about a target web application prior to launching an attack, such as its architecture, technologies, and potential vulnerabilities, to identify attack vectors and plan a successful attack strategy.

## Techniques

There are various techniques and tools used for web application reconnaissance, including website mapping, directory and file enumeration, and the detection of common vulnerabilities such as SQL injection and cross-site scripting (XSS).

Information Gathering, footprinting, manual content discovery, automated content discovery

### Information Gathering

Collect publicly available information about the target web application, such as its technologies used, version numbers, and IP addresses.

* Use Google dorking to discover content, eg:
  * site: `site:victim.com`
  * inurl: `inurl:admin`
  * filetype: `filetype:pdf`
  * intitle: `intitle:admin`
  * Use [Google Dorking Cheat Sheet](https://gist.github.com/sundowndev/283efaddbcf896ab405488330d1bbc06)
  * Use [Google Hacking Database](https://www.exploit-db.com/google-hacking-database)
* Use [WappAlyzer](https://www.wappalyzer.com/) to identify website technologies
* Use [Wayback Machine](https://archive.org/web/) to view past versions of website
* Search GitHub for repositories related to website
* Search for misconfigured S3 Buckets
  * The format of the S3 buckets is http(s)://{name}.s3.amazonaws.com where {name} is decided by the owner

### Footprinting

Footprinting during web application recon for penetration testing involves gathering information about the target web application and its associated network and systems through research, network scans, OS fingerprinting, and analysis of response headers and error messages:

* Network scanning using tools such as Nmap, Nessus, and OpenVAS
* OS fingerprinting using tools such as p0f, Xprobe, and Nmap
* Analysis of response headers and error messages using tools such as Burp Suite, OWASP ZAP, and Telnet
* Social engineering techniques such as phishing and pretexting.

### Manul Content Discovery

Use the following techniques for manual web application content discovery, which also known as Walking an Application, to find hidden content and administrative interfaces of a web application.

#### General Content Discovery

* Check HTML comments in page source
* Check misconfigured directories with bad permissions by searching URLs
* Search robots.txt for hidden pages
* Search sitemap.xml for site structure
* Use browser developer tools like Inspector, Debugger, Network, Storage, and Breakpoints

#### Subdomain Discovery

* Search SSL/TLS Certificates using [Certificate Search](http://crt.sh/) or [Certificate Transparency Search Tool](https://ui.ctsearch.entrust.com/ui/ctsearchui)
* Use Google Dorking: `site:*.victim.com`
* Use [Dnsrecon](https://www.kali.org/tools/dnsrecon/) to bruteforce hostnames
* Use [Sublist3r](https://github.com/aboul3la/Sublist3r)
* Use [ffuf](https://github.com/ffuf/ffuf)

This example uses ffuf for a wordlist-based fuzzing attack. It uses `-w` to specify a wordlist that contains common subdomain names, the `-h` option sets a custom header with "Host: FUZZ.acmeitsupport.thm", `-u` option specifies the target URL or IP address of the machine. The command replace the "FUZZ" placeholder with each entry from the wordlist to the target URL:

```bash
 ffuf -w /usr/share/wordlists/SecLists/Discovery/DNS/namelist.txt -H "Host: FUZZ.acmeitsupport.thm" -u http://MACHINE_IP
```

The command is using ffuf to fuzz a target web application by injecting values from the wordlist "/usr/share/wordlists/SecLists/Discovery/DNS/namelist.txt" as the host header value "FUZZ.acmeitsupport.thm" and sending HTTP requests to the machine IP specified in the URL. The "-fs" flag is setting a filter for the response size.

#### Framework Discovery

* Research framework documentation for funcionality like admin login pages or outdated vulnerabilities
* Check out of date software and for the framework about updates/vulnerabilities
  * Most common web hosting software: Apache, Nginx, IIS and NodeJS
* Search hash of favicon against [OWASP Favicon Database](https://wiki.owasp.org/index.php/OWASP_favicon_database) to identify web framework

Here is an example of getting the hash of a favicon using bash:

 ```bash
 curl https://victim.com/images/favicon.ico | md5sum
 ```

Here is an example of getting the hash of a favicon using PowerShell:

  ``` powershell
  PS C:\> curl https://victim.com/images/favicon.ico -UseBasicParsing -o favicon.ico
  PS C:\> Get-FileHash .\favicon.ico -Algorithm MD5
  ```

### Automated Content Discovery

Use the following tools for automated web application content discovery, also known as spidering or URL scanning:

* Use Wordlists such as [SecLists](https://github.com/danielmiessler/SecLists) can be used to find common directory and file names
* Web Fuzzers can be used in conjunction with SecLists:
  * [ffuf](https://github.com/ffuf/ffuf) example usage
    * `ffuf -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt -u http://VICTIM_IP/FUZZ`
  * [dirb](https://www.kali.org/tools/dirb/) example usage:
    * `dirb http://VICTIM_IP/ /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt`
  * [Gobuster](https://github.com/OJ/gobuster) example usage:
    * `user@machine$ gobuster dir --url http://VICTIM_IP/ -w /usr/share/wordlists/SecLists/Discovery/Web-Content/common.txt`

### Paramter Analysis

Analyzing and manipulating parameters in URLs and form submissions that are passed to a web application to identify potential vulnerabilities. This technique can be used to identify potential attack vectors, such as cross-site scripting (XSS), SQL injection, and others.

### Header Analysis

Header analysis is used to inspect the headers of HTTP responses to gather information about the web server, technology stack, and potential vulnerabilities.

#### Header Grabbing and Analysis Tools

Use the following tools for header grabbing and analysis:

* Burp Suite
* OWASP ZAP
* Fiddler
* HTTP Debugger
* Charles Web Debugging Proxy
* Wireshark
* curl
* Telnet
* Nmap
* Netcat

An example of getting an HTTP header response using curl on Windows:

```powershell
curl https://victim.com -v
```

An example of getting a header response using netcat on Linux:

```bash
nc TARGET-IP 80
GET / HTTP/1.1
Host: TARGET-IP
User-Agent: Mozilla/5.0
Referrer: meh-domain
<enter>
```

#### Header Analysis Techniques

* Review the HTTP headers for information disclosure, such as server type, software versions, and other details.
* Check for security headers, such as X-XSS-Protection, X-Content-Type-Options, and * Strict-Transport-Security.
* Look for cookie attributes, such as secure, HTTPOnly, and SameSite, to understand the application's security posture.
* Analyze the headers for additional functionality, such as redirects, caching, and compression.
* Investigate the header values for inconsistencies or deviations from standard values, which may indicate misconfigurations or vulnerabilities.

#### Shodan

[Shodan](https://www.shodan.io/) is a search engine for banners grabbed from port scanning the Internet to discover insecure web applications or misconfigured services.

## Resources

* [WappAlyzer](https://www.wappalyzer.com/): A tool that identifies the technologies used by a web application and provides a report of its components and dependencies.
* [OWASP Favicon Database](https://wiki.owasp.org/index.php/OWASP_favicon_database): A resource that catalogs the favicon images used by websites for recognition and fingerprinting purposes.
* [Google Hacking Database](https://www.exploit-db.com/google-hacking-database): A database of search terms and Google Dorks used to find vulnerable and sensitive information on websites.
* [Wayback Machine](https://archive.org/web/): An internet archive that keeps snapshots of websites and their content over time.
* [SecLists](https://github.com/danielmiessler/SecLists): A collection of multiple types of lists used for penetration testing, including wordlists, usernames, and directory paths.
* [ffuf](https://github.com/ffuf/ffuf): A fast web fuzzer tool that can be used for discovering web resources, including directories, files, and parameters.
* [dirb](https://www.kali.org/tools/dirb/): A URL bruteforcer tool that can be used to discover hidden web resources by guessing names of directories and files.
* [Gobuster](https://github.com/OJ/gobuster): A tool for brute-forcing URLs to discover hidden directories and files on web servers.
* [Certificate Transparency Search Tool](https://ui.ctsearch.entrust.com/ui/ctsearchui): A tool that allows you to search for SSL/TLS certificates that have been issued by public certificate authorities.
* [Certificate Search](http://crt.sh/): A tool for searching for SSL/TLS certificates in a database of certificate transparency logs.
* [Dnsrecon](https://www.kali.org/tools/dnsrecon/): A tool for enumerating DNS information, including subdomains, records, and zone transfers.
* [Sublist3r](https://github.com/aboul3la/Sublist3r): A tool for enumerating subdomains of websites using search engines, public databases, and custom wordlists.
* [BuiltWith](https://builtwith.com/): A tool that provides information about the technologies and services used by a website, including its web servers, programming languages, and content management systems.
* [WhatWeb](https://www.whatweb.net/): A tool that performs a fingerprint on a target website and provides information about its technologies, plugins, and other components.
* [Netcraft](https://sitereport.netcraft.com/): A tool that provides information about a website's hosting environment, including information about its server type, operating system, and IP address.
* [Subdomain Enumeration Techniques](https://blog.appsecco.com/a-penetration-testers-guide-to-sub-domain-enumeration-7d842d5570f6)
* [Shodan](https://www.shodan.io/)

https://www.sslshopper.com/ssl-checker.html
https://mxtoolbox.com/SuperTool.aspx
https://wpscan.com/