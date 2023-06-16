# DNS Recon

Techniques for enumerating DNS for penetration testing

* [Background](#background)
* [Techniques for Using DNS to Find Services](#techniques-for-using-dns-to-find-services)
* [Tools](#tools)
  * [Nslookup](#nslookup)
  * [dig](#dig)
  * [Fierce](#fierce)
  * [DNSRecon](#dnsrecon)
* [Zone Transfers](#zone-transfers)
  * [Zone Transfers Using dig](#zone-transfers-using-dig)
  * [Zone Transfer Using Windows CMD](#zone-transfer-using-windows-cmd)
* [DNS Online Tools](#dns-online-tools)

## Background

DNS discovery is the process of finding and mapping domain names and IP addresses in a network. It's a key step in the reconnaissance phase of a penetration testing process, aimed at identifying systems, services, and potential vulnerabilities. DNS discovery can be done manually or through automated tools and provides valuable information for more targeted penetration testing.

## Techniques for Using DNS to Find Services

Follow these techniques to find services using DNS in penetration testing

* Scan target domain with tools such as nslookup, dig, and dnsrecon.
* Use bruteforce techniques to identify all hostnames within the domain.
* Perform subdomain enumeration with wordlists.
* Monitor target domain for changes to its DNS records.
* Use tools like Fierce to perform active scans.
* Gather OSINT information about the target domain.
* Minimize the amount of network traffic generated.

## Tools

DNS discovery can be performed manually, using tools such as the ping command or the nslookup utility, or by using automated tools, such as port scanners or vulnerability assessment software. The information obtained from DNS discovery can be used to plan and execute more targeted and effective penetration testing and security assessments.

### Nslookup

[nslookup](https://www.broadbandsearch.net/nslookup) is a tool for querying DNS to obtain domain name or IP address information. In DNS discovery, it can be used to retrieve information about specific hostnames or IP addresses, providing valuable insights into a network's infrastructure during penetration testing reconnaissance.

Resolve a given hostname to the corresponding IP:

```shell
nslookup targetorganization.com
```

Obtain CNAME DNS record:

```shell
nslookup --type=CNAME targetorganization.com
```

Obtain MX DNS record:

```shell
nslookup -query=mx example.com
```

Displays nameservers for given domain:

```shell
nslookup -type=ns domain
```

Use reverse DNS lookup to resolve an IP address to the given PTR record hostname:

```shell
nslookup -type=PTR IP_address
```

### dig

The dig command is a tool for querying the DNS system to retrieve information about domain names and IP addresses. It provides more detailed output than nslookup.

Use the dig command in linux to return DNS information

```shell
dig a domain-name-here.com @nameserver 
```

### Fierce

Fierce is a semi-lightweight scanner that helps locate non-contiguous IP space and hostnames against specified domains using DNS.

[Fierce](https://github.com/mschwager/fierce)

### DNSRecon

DNSRecon is a reconnaissance tool in Kali Linux that gathers information about a target domain's DNS infrastructure by performing techniques such as zone transfers, subdomain enumeration, and brute-force attacks.

Example using Kali `dnsrecon` on `TARGET` using the wordlist file `dnsmap.txt` and outputs results to `output.xml`:

```bash
dnsrecon -d TARGET -D /usr/share/wordlists/dnsmap.txt -t std --xml ouput.xml
```

## Zone Transfers

A DNS zone transfer is the process of copying the entire database of DNS records from one DNS server to another, allowing for replication of the DNS information.

### Zone Transfers Using dig

An example where the `dig` command is used to transfer the entire zone database for the domain "example.com" from the DNS server "ns1.example.com". The `AXFR` option specifies that the query is a request for a zone transfer.

```shell
dig @ns1.example.com example.com AXFR
```

### Zone Transfer Using Windows CMD

An example of the `nslookup` command where `type=any` sets query to retrieve all DNS record types, and `ls -d blah` performs zone tranfers for the domain `example.com`:

```CMD
nslookup -> set type=any -> ls -d example.com
```

## DNS Online Tools

* [HackerTarget](https://hackertarget.com/dns-lookup/): An online reconnaissance tool that allows you to perform scans on a target domain, including a comprehensive DNS scan.
* [DNSDumpster](https://dnsdumpster.com/): A reconnaissance tool that provides a visual representation of a target domain's DNS infrastructure, including its subdomains, DNS servers, and other associated information.
* [DNSTwist](https://dnstwist.it/): A tool that helps you enumerate subdomains and perform reconnaissance on a target domain's DNS infrastructure.
* [DNSlytics](https://dnslytics.com/): A tool that provides a visual representation of a target domain's DNS infrastructure, as well as historical information about changes to its DNS records.
* [MXToolbox](https://mxtoolbox.com/): A tool that provides a comprehensive set of diagnostic and monitoring services for DNS, email delivery, and website uptime.
* [Active & Passive Recon Cheatsheet](https://infinitelogins.com/2021/02/20/active-passive-recon-cheatsheet/)
* [DNS Recon Cheat Sheet](https://github.com/Xservus/Pentest/blob/master/dns_recon_cheatsheet.txt)
* [IP, DNS, Domain Enumeration Cheat Sheet](https://github.com/Shiva108/CTF-notes/blob/master/Notes%20VA/IP%2C%20DNS%20Domain%20Enumeration%20Cheatsheet.txt
)
* [DNS Query Web Tool](https://www.dnsqueries.com/en/)
* [Online NsLookup Tool](https://www.broadbandsearch.net/nslookup)
