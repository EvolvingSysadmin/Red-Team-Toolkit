# DNS Discovery

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

## DNS Online Tools

* https://dnsdumpster.com/
* https://network-tools.com/nslook/
* https://www.dnsqueries.com/en/
* https://mxtoolbox.com/