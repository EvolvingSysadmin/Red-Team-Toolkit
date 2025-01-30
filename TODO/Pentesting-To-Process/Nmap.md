# Nmap

Useful Nmap port scans for pentesting

## Nmap Verbose Scans

Nmap verbose scan, runs syn stealth, T4 timing (should be ok on LAN), OS and service version info, traceroute and scripts against services
```shell
nmap -v -sS -A -T4 target
```

As above but scans all TCP ports (takes a lot longer)
```shell
nmap -v -sS -p--A -T4 target
```

As above but scans all TCP ports and UDP scan (takes even longer)
```shell
nmap -v -sU -sS -p- -A -T4 target
```

Nmap script to scan for vulnerable SMB servers - WARNING: unsafe=1 may cause knockover
```shell
nmap -v -p 445 --script=smb-check-vulns 
--script-args=unsafe=1 192.168.1.X
```

## Nmap Target Selection

Scan a single IP
```shell
nmap 192.168.1.1
```

Scan a host
```shell
nmap www.testhostname.com
```

Scan a range of IPs
```shell
nmap 192.168.1.1-20
```

Scan a subnet
```shell
nmap 192.168.1.0/24
```

Scan targets from a text file
```shell
nmap -iL list-of-ips.txt
```	

## Nmap Port Selection

Scan a single Port
```shell
nmap -p 22 192.168.1.1
```

Scan a range of ports
```shell
nmap -p 1-100 192.168.1.1
```

Scan 100 most common ports (Fast)
```shell
nmap -F 192.168.1.1
```

Scan all 65535 ports
```shell
nmap -p- 192.168.1.1
```

## Nmap Port Scan types

Scan using TCP connect
```shell
nmap -sT 192.168.1.1
```

Scan using TCP SYN scan (default)
```shell
nmap -sS 192.168.1.1
```

Scan UDP ports
```shell
nmap -sU -p 123,161,162 192.168.1.1
```

Scan selected ports - ignore discovery
```shell
nmap -Pn -F 192.168.1.1
```

## Nmap Service and OS Detection

Detect OS and Services
```shell
nmap -A 192.168.1.1
```

Standard service detection
```shell
nmap -sV 192.168.1.1
```

More aggressive Service Detection
```shell
nmap -sV --version-intensity 5 192.168.1.1
```

Lighter banner grabbing detection
```shell
nmap -sV --version-intensity 0 192.168.1.1
```

## NMAP Output Formats

Save default output to file
```shell
nmap -oN outputfile.txt 192.168.1.1
```

Save results as XML
```shell
nmap -oX outputfile.xml 192.168.1.1
```

Nmap Output to CSV
https://github.com/hackertarget/nmap-csv-xlsx

```shell
sudo nmap -F -sV -oX nmapresults 192.168.1.0/24
python3 nmap-xml-to-csv.py nmapresults.xml
```

## Nmap HTTP Service Information

Gather page titles from HTTP services
```shell
nmap --script=http-title 192.168.1.0/24
```

Get HTTP headers of web services
```shell
nmap --script=http-headers 192.168.1.0/24
```

Find web apps from known paths
```shell
nmap --script=http-enum 192.168.1.0/24
```

Find Information about IP address
```shell
nmap --script=asn-query,whois,ip-geolocation-maxmind 192.168.1.0/24
```

## Nmap Vulnerability Detection

Nmap Heartbleed Testing
```shell
nmap -sV -p 443 --script=ssl-heartbleed 192.168.1.0/24
```

Nmap CVE detection
```shell
map -Pn --script vuln 192.168.1.0/24
```

Nmap Malware Scan
```shell
nmap -sV --script=http-malware-host 192.168.1.0
```

Nmap Malware Scan using Google’s Malware check
```shell
nmap -p80 --script http-google-malware infectedsite.com
```

## Nmap Tools

* https://hackertarget.com/nmap-cheatsheet-a-quick-reference-guide/
* https://securitytrails.com/blog/top-15-nmap-commands-to-scan-remote-hosts
* https://github.com/hackertarget/nmap-csv-xlsx 
* https://github.com/EvolvingSysadmin/Penetration-Testing/blob/master/Resources
* Nmap%206%20Network%20Exploration%20and%20Security%20Auditing%20Cookbook.pdf
* [For Scanning Large IP Ranges](https://zmap.io/)
* [Internet scale IP Scanning](https://github.com/robertdavidgraham/masscan)