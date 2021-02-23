# DNS Discovery

General tip: search for subdomains that point to public IP of LAN rather than hosted web services (eg. mx.conto.com; ns1.contoso.com; remote.contoso.com)

* [Nslookup](#nslookup)
* [DNS IP Lookup](#dns-ip-lookup)
* [Reverse DNS lookup](#reverse-dns-lookup)
* [MX (Mail Exchange) lookup](#mx--mail-exchange--lookup)
* [NS (Nameserver) lookup](#ns--nameserver--lookup)
* [Zone Transfers](#zone-transfers)
* [Kali DNS Bruteforce](#kali-dns-bruteforce)
* [DNS Online Tools](#dns-online-tools)

## Nslookup

Resolve a given hostname to the corresponding IP
```shell
nslookup targetorganization.com
```

## DNS IP Lookup
```shell
dig a domain-name-here.com @nameserver 
```

## Reverse DNS lookup

Resolve a given IP to the corresponding hostname PTR record
```shell
nslookup -type=PTR IP_address
```

## MX (Mail Exchange) lookup 

Resolves a given domain hostname to the MX record
```shell
nslookup -type=MX domain
 dig mx domain-name-here.com @nameserver
```

## NS (Nameserver) lookup 

Displays nameservers for given domain
```shell
nslookup -type=ns domain
```

## Zone Transfers

Perform Zone Transfer with DIG
```shell
dig axfr domain-name-here.com @nameserver
```

Windows Zone Transfer
```CMD
nslookup -> set type=any -> ls -d blah.com
```

## Kali DNS Bruteforce
```bash
dnsrecon -d TARGET -D /usr/share/wordlists/dnsmap.txt -t std --xml ouput.xml
```

## Fierce

Fierce is a semi-lightweight scanner that helps locate non-contiguous IP space and hostnames against specified domains using DNS.

[Fierce](https://github.com/mschwager/fierce)

## DNS Online Tools

* https://dnsdumpster.com/
* https://network-tools.com/nslook/
* https://www.dnsqueries.com/en/
* https://mxtoolbox.com/