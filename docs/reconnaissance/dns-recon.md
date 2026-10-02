# DNS Recon

Enumerating a target's DNS to map domains, subdomains, and infrastructure.

## Why It Matters

DNS is one of the richest passive sources in recon. Records reveal mail servers, subdomains, hosting providers, and sometimes internal naming, all without sending a packet to the target's own systems. A misconfigured server that allows a zone transfer can hand over the entire domain at once.

## Reference

### Approach

* Query records with nslookup, dig, and dnsrecon
* Brute force hostnames and enumerate subdomains with wordlists
* Attempt zone transfers against each name server
* Pull in OSINT and online DNS tools to corroborate
* Keep traffic to the target's own name servers low; prefer passive sources first

### nslookup

Query DNS for host, mail, and name server records.

```shell
nslookup targetorganization.com              # resolve A record
nslookup -type=CNAME targetorganization.com  # CNAME record
nslookup -query=mx example.com               # mail servers
nslookup -type=ns example.com                # name servers
nslookup -type=PTR 192.0.2.10                # reverse lookup
```

### dig

More detailed output than nslookup, and the standard tool on Linux.

```shell
dig a example.com @nameserver     # A record from a specific name server
dig example.com MX +short         # mail servers, terse
dig example.com ANY               # all record types
```

### dnsrecon

Kali reconnaissance tool for records, subdomain brute forcing, and zone transfers.

```bash
dnsrecon -d TARGET -D /usr/share/wordlists/dnsmap.txt -t std --xml output.xml
```

### fierce

Locates non-contiguous IP space and hostnames for a domain: <https://github.com/mschwager/fierce>

### Zone Transfers

A zone transfer (AXFR) copies a server's entire zone database. Only misconfigured servers allow it to arbitrary clients, but when they do it is the fastest possible enumeration.

```shell
dig @ns1.example.com example.com AXFR
```

On Windows, the same request through nslookup interactive mode:

```text
nslookup
> set type=any
> ls -d example.com
```

## How I Use It

I start with the record types that map infrastructure (NS, MX, A, TXT), then try an AXFR against every name server, since a single misconfigured one saves hours. Subdomain brute forcing and OSINT fill in the rest. I lean on the online tools below for passive data before touching the target's own servers.

## Resources

* [HackerTarget DNS tools](https://hackertarget.com/dns-lookup/)
* [DNSDumpster](https://dnsdumpster.com/)
* [dnstwist](https://dnstwist.it/)
* [DNSlytics](https://dnslytics.com/)
* [MXToolbox](https://mxtoolbox.com/)
* [Active and Passive Recon Cheatsheet](https://infinitelogins.com/2021/02/20/active-passive-recon-cheatsheet/)
