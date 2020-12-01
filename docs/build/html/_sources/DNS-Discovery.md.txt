# DNS Discovery

## Nslookup

Resolve a given hostname to the corresponding IP
```shell
nslookup targetorganization.com
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
```

## NS (Nameserver) lookup 

Displays nameservers for given domain
```shell
nslookup -type=ns domain
```

## DNS Online Tools

* https://dnsdumpster.com/
* https://network-tools.com/nslook/
* https://www.dnsqueries.com/en/
* https://mxtoolbox.com/