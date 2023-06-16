# Open Source Intelligence

This document contains information about techniques and tools for Open Source Intelligence.

* [Background](#background)
* [Techniques](#techniques)
  * [Search Engines](#search-engines)
  * [Social Media](#social-media)
  * [Public Databases](#public-databases)
  * [Forums](#forums)
  * [Document Sharing Websites](#document-sharing-websites)
  * [Darkweb](#darkweb)
* [Tools](#tools)
  * [Google Dorks](#google-dorks)
  * [Maltego](#maltego)
  * [OSINT Framework](#osint-framework)
  * [TheHarvester](#theharvester)
  * [SimplyEmail](#simplyemail)
  * [Recon-ng](#recon-ng)
  * [OWASP Amass](#owasp-amass)
  * [SpiderFoot](#spiderfoot)
  * [Shodan](#shodan)
  * [Whois Lookup Tools](#whois-lookup-tools)
  * [WhoisXML API](#whoisxml-api)
  * [URL Scanners](#url-scanners)
  * [GitLeaks](#gitleaks)
  * [Metagoofil](#metagoofil)
  * [FOCA](#foca)
* [Resources](#resources)

## Background

Open Source Intelligence (OSINT) is the process of gathering information about a target from publicly available sources, such as websites, social media, government databases, and other sources, in order to aid with penetration testing.

## Techniques

There are many techniques for gathering OSINT that include utilizing search engines, social media, public databases, forums, doument sharing websites, and the darkweb.

### Search Engines

* Google, Bing, Yahoo, and other search engines are some of the most commonly used tools for OSINT. They allow you to search for information on a particular topic or individual.
  * See Google Dorks for information on using Google for OSINT
* Search Engine News aggregators: News aggregators such as Google News, Yahoo News, and the BBC News website can be used to search for news articles on a particular topic or individual.
* Reverse image search engines: Reverse image search engines such as Google Images, TinEye, and Karma Decay allow you to search for other instances of a particular image on the Internet.
* Online maps: Online maps such as Google Maps and Bing Maps can be used to gather information about a particular location or to visualize geographical data.

### Social Media

* Social media platforms such as Twitter, Facebook, Instagram, and LinkedIn provide a wealth of information about individuals and organizations.
* Tools such as Social Mention, Brand24, and Hootsuite can be used to monitor social media for specific keywords and mentions.

### Public Databases

* Publicly available databases such as the Securities and Exchange Commission (SEC) EDGAR database, the United States Patent and Trademark Office (USPTO) database, and the General Services Administration (GSA) database can provide information about companies and individuals.

### Forums

* Online forums and discussion boards such as Reddit, Quora, and Yahoo Answers can provide valuable insights into a particular topic or individual.

### Document Sharing Websites

* *Websites such as Scribd, Slideshare, and Docstoc can be used to find publicly available documents such as presentations, reports, and white papers. GitHub can also be a source of valuable OSINT.

### Darkweb

* The dark web, also known as the deep web, is a portion of the internet that is not indexed by search engines and can only be accessed using special software such as Tor. While it is often associated with illegal activities, the dark web can also be a valuable source of information for OSINT.

## Tools

The following tools can be used to gather OSINT, including Google Dorks, Malteo, OSINT Framework, TheHarvester, Recon-ng, OWASP Amass, SpiderFoot, Shodan, Whois Lookup Tools, WhoisXML API, and URL Scanners.

### Google Dorks

* Google Dorks are advanced search queries that can be used to find specific types of information on the Internet.
* Here is a simple list of Google Search Operators:

|Operator     |Example                    |Description                                                            |
|-------------|---------------------------|-----------------------------------------------------------------------|
|`cache:`     |`cache:www.google.com web` |Shows the version of the web page that Google has in its cache         |
|`link:`      |`link:www.google.com`      |List webpages with links pointing to the Google homepage               |
|`related:`   |`related:www.google.com`   |List web pages that are similar to the Google homepage                 |
|`info:`      |`info:www.google.com`      |Shows information about the Google homepage                            |
|`define:`    |`define:google`            |Provides a definition of the words you enter after it                  |
|`stocks:`    |`stocks: intc yhoo`        |Will show information about Intel and Yahoo, use ticker                |
|`site:`      |`help site:com`            |Restricts the results to those websites in the given domain            |
|`allintitle:`|`allintitle: google search`|Restricts the results to those with all of the query words in the title|
|`intitle:`   |`intitle:google`           |Restricts the results to documents containing that word in the title   |
|`allinurl:`  |`allinurl: foo/bar`        |Restricts the results to those with all of the query words in the url  |
|`inurl:`     |`inurl:google`             |Restricts the results to documents containing that word in the url     |

* Resources
  * [Exploit-DB Google Hacking Database](https://www.exploit-db.com/google-hacking-database): This is a comprehensive database of Google Dorks, maintained by Offensive Security.
  * [Google Dorking Tool](https://pentest-tools.com/information-gathering/google-hacking): A free online tool that generates Google Dorks based on keywords and search parameters.
  * [Google Hacking for Penetration Testers PDF](/resources/Google-Hacking-for-Penetration-Testers.pdf)
  * [SANS Google Cheat Sheet](/resources/SANS-Google-Cheat-Sheet.pdf)
  * [Google Dork List](https://www.boxpiper.com/posts/google-dork-list)
  * [Advanced Google Search Operators](https://ahrefs.com/blog/google-advanced-search-operators/)

### Maltego

* Maltego is an OSINT tool that allows you to visualize and analyze relationships between people, companies, domains, IP addresses, and other entities.
* The community edition of Maltego can be used for free by following [this Maltego guide](https://www.maltego.com/blog/beginners-guide-to-maltego-setting-up-maltego-community-edition-ce/#:~:text=Maltego%20Community%20Edition%20(CE)%20is,OSINT%20and%20graphical%20link%20analyses.)
* Resources
  * [Maltego Site](https://www.maltego.com/)
  * [Maltego Downloads](https://www.maltego.com/downloads/)
  * [Online Documentation](https://docs.maltego.com/support/home)

### OSINT Framework

* [OSINT Framework](https://osintframework.com/) is a comprehensive list of OSINT resources, including websites, databases, and tools, organized by category.

### TheHarvester

* [TheHarvester](https://www.kali.org/tools/theharvester/) is an OSINT tool included in Kali that allows you to gather information about a target from various public sources such as search engines, social media, and other websites. The tool gathers emails, names, subdomains, IPs and URLs using multiple public data sources that include:
* Here is an example of TheHarvester usage where `-d kali.org` specifies the domain to search, `-l 500` limits the search to 500 results, & `-b google` specifies the data source to use:

```bash
theharvester -d kali.org -l 500 -b google
```

### SimplyEmail

[SimplyEmail](https://github.com/SimplySecurity/SimplyEmail) can be used to enumerate email addreses. SimplyEmail can then verify the discovered email addresss after gathering. The tool works better when using proxies or long throttle times to avoid Captchas.

```bash
curl -s https://raw.githubusercontent.com/killswitch-GUI/SimplyEmail/master/setup/oneline-setup.sh | bash
cd SimplyEmail
./SimplyEmail.py
```

### Recon-ng

* [Recon-ng](https://www.kali.org/tools/recon-ng/) is a web reconnaissance framework included in Kali that allows you to gather information about a target from various sources such as search engines, social media, and other websites. The Recon-ng wiki is found here: <https://github.com/lanmaster53/recon-ng/wiki>

### OWASP Amass

* [OWASP Amass](https://github.com/OWASP/Amass) is an OSINT tool that allows you to gather information about a target's network, including subdomains, IP addresses, and other assets.
* Resources
  * Installation Guide: <https://github.com/OWASP/Amass/blob/master/doc/install.md>

### SpiderFoot

* [SpiderFoot](https://intel471.com/attack-surface-documentation) is an OSINT tool that allows you to gather information about a target from various sources such as search engines, social media, and other websites.
* Resources
  * SpiderFoot GitHub Repo: <https://github.com/smicallef/spiderfoot>
  * SpiderFoot Guide: <https://nixintel.info/osint-tools/getting-started-with-spiderfoot/>

### Shodan

[Shodan](https://www.shodan.io/) is a search engine for Internet-connected devices and can be used to gather information about a target's network, including IP addresses, open ports, and running services.

#### Shodan General Filters

| **Name**           | **Description**                                                                                                                                                                                                            | **Type** |
| ------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| **after**          | Only show results after the given date (dd/mm/yyyy) string                                                                                                                                                                 | string   |
| **asn**            | Autonomous system number string                                                                                                                                                                                            | string   |
| **before**         | Only show results before the given date (dd/mm/yyyy) string                                                                                                                                                                | string   |
| **category**       | Available categories: ics, malware string                                                                                                                                                                                  | string   |
| **city**           | Name of the city string                                                                                                                                                                                                    | string   |
| **country**        | 2-letter country code string                                                                                                                                                                                               | string   |
| **geo**            | Accepts between 2 and 4 parameters. If 2 parameters: latitude,longitude. If 3 parameters: latitude,longitude,range. If 4 parameters: top left latitude, top left longitude, bottom right latitude, bottom right longitude. | string   |
| **hash**           | Hash of the data property integer                                                                                                                                                                                          | integer  |
| **has_ipv6**       | True/ False boolean                                                                                                                                                                                                        | boolean  |
| **has_screenshot** | True/ False boolean                                                                                                                                                                                                        | boolean  |
| **hostname**       | Full hostname for the device string                                                                                                                                                                                        | string   |
| **ip**             | Alias for net filter string                                                                                                                                                                                                | string   |
| **isp**            | ISP managing the netblock string                                                                                                                                                                                           | string   |
| **net**            | Network range in CIDR notation (ex. 199.4.1.0/24) string                                                                                                                                                                   | string   |
| **org**            | Organization assigned the netblock string                                                                                                                                                                                  | string   |
| **os**             | Operating system string                                                                                                                                                                                                    | string   |
| **port**           | Port number for the service integer                                                                                                                                                                                        | string   |
| **postal**         | Postal code (US-only) string                                                                                                                                                                                               | string   |
| **product**        | Name of the software/ product providing the banner string                                                                                                                                                                  | string   |
| **region**         | Name of the region/ state string                                                                                                                                                                                           | string   |
| **state**          | Alias for region string                                                                                                                                                                                                    | string   |
| **version**        | Version for the product string                                                                                                                                                                                             | string   |
| **vuln**           | CVE ID for a vulnerability string                                                                                                                                                                                          | string   |

#### Shodan HTTP Filters

| **Name**                    | **Description**                                  | **Type** |
| --------------------------- | ------------------------------------------------ | -------- |
| **http.component**          | Name of web technology used on the website       | string   |
| **http.component_category** | Category of web components used on the   website | string   |
| **http.html**               | HTML of web banners                              | string   |
| **http.html_hash**          | Hash of the website HTML                         | integer  |
| **http.status**             | Response status code                             | integer  |
| **http.title**              | Title for the web banners website                | string   |

#### Shodan NTP Filters

| **Name**         | **Description**                                                              | **Type** |
| ---------------- | ---------------------------------------------------------------------------- | -------- |
| **ntp.ip**       | IP addresses returned by monlist                                             | string   |
| **ntp.ip_count** | Number of IPs returned by initial monlist                                    | integer  |
| **ntp.more**     | True/ False; whether there are more IP addresses to be gathered from monlist | boolean  |
| **ntp.port**     | Port used by IP addresses in monlist                                         | integer  |

#### Shodan SSL Filters

| **Name**                 | **Description**                                       | **Type**         |
| ------------------------ | ----------------------------------------------------- | ---------------- |
| **has_ssl**              | True / False                                          | boolean          |
| **ssl**                  | Search all SSL data                                   | string           |
| **ssl.alpn**             | Application layer protocols such as HTTP/2 ("h2")     | string           |
| **ssl.chain_count**      | Number of certificates in the chain                   | integer          |
| **ssl.version**          | Possible values: SSLv2, SSLv3, TLSv1,TLSv1.1, TLSv1.2 | string           |
| **ssl.cert.alg**         | Certificate algorithm                                 | string           |
| **ssl.cert.expired**     | True / False                                          | boolean          |
| **ssl.cert.extension**   | vNames of extensions in the certificate               | string           |
| **ssl.cert.serial**      | Serial number as an integer or hexadecimal string     | integer / string |
| **ssl.cert.pubkey.bits** | Number of bits in the public key                      | integer          |
| **ssl.cert.pubkey.type** | Public key type                                       | string           |
| **ssl.cipher.version**   | SSL version of the preferred cipher                   | string           |
| **ssl.cipher.bits**      | Number of bits in the preferred cipher                | integer          |
| **ssl.cipher.name**      | Name of the preferred cipher                          | string           |

#### Shodan Telnet Filters

| **Name**          | **Description**                                             | **Type** |
| ----------------- | ----------------------------------------------------------- | -------- |
| **telnet.option** | Search all the options                                      | string   |
| **telnet.do**     | The server requests the client do support these options     | string   |
| **telnet.dont**   | The server requests the client to not support these options | string   |
| **telnet.will**   | The server supports these options                           | string   |
| **telnet.wont**   | The server doesnt support these options                     | string   |

#### Shodan Resources

* [Top Shodan Dorks](https://securitytrails.com/blog/top-shodan-dorks)
* [Awesome Shodan Search Queries](https://github.com/jakejarvis/awesome-shodan-queries)
* [Shodan Tutorial and Primer](https://danielmiessler.com/study/shodan/)
* [Shodan Website](https://www.shodan.io/)
* [Shodan Filters](https://github.com/JavierOlmedo/shodan-filters)
* [Shodan Filter Reference](https://beta.shodan.io/search/filters)

### Whois Lookup Tools

* [Whois lookup tools](https://whois.domaintools.com/) allow you to gather information about the owner of a domain name or IP address.

### WhoisXML API

* [WhoisXML API](https://www.whoisxmlapi.com/) is a database of information about domains, IP addresses, and other network assets.

### URL Scanners

URL scanners such as [VirusTotal](https://www.virustotal.com/gui/home/upload) and [URLScan](https://urlscan.io/) allow you to scan a website for potential security threats and to gather information about the website's content and structure.

### GitLeaks

[Gitleaks](https://github.com/zricethezav/gitleaks) is a SAST tool for detecting and preventing hardcoded secrets like passwords, api keys, and tokens in git repos. Gitleaks is an easy-to-use, all-in-one solution for detecting secrets, past or present, in your code.

Installation:

```bash
git clone https://github.com/gitleaks/gitleaks.git
cd gitleaks
make build
```

* For usage see [GitLeak on GitHub](https://github.com/gitleaks/gitleaks)

### Metagoofil

Metagoofil is an information gathering tool designed for extracting metadata of public documents (pdf,doc,xls,ppt,docx,pptx,xlsx) belonging to a target.

Metagoofil is included in Kali Linux. The help menu can be launched running:

```bash
metagoofil -h
```

* [Metagoofil Kali Tools Page](https://www.kali.org/tools/metagoofil/)

### FOCA

FOCA (Fingerprinting Organizations with Collected Archives) is an application used mainly to find metadata and hidden information in the documents it scans. These documents may be on web pages, and can be downloaded and analysed with FOCA.

* FOCA is [available here](https://github.com/ElevenPaths/FOCA).

## Resources

* [OSINT Toolkit](https://one-plus.github.io/)
* [Awesome OSINT](https://github.com/jivoi/awesome-osint)
