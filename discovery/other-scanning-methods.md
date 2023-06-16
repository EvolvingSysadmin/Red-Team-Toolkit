# Other Scanning Methods

## Banner Grabbing

Basic versioning / finger printing via displayed banner

```bash
nc -v 192.168.1.1 25
 telnet 192.168.1.1 25
```

Banner grabbing with NC

```bash
nc TARGET-IP 80
GET / HTTP/1.1
Host: TARGET-IP
User-Agent: Mozilla/5.0
Referrer: meh-domain
<enter>
```

## UDP Protocol Scanner

```bash
git clone https://github.com/portcullislabs/udp-proto-scanner.git
```

Scan a file of IP addresses for all services

```bash
./udp-protocol-scanner.pl -f ip.txt 
```

Scan for a specific UDP service

```bash
udp-proto-scanner.pl -p ntp -f ips.txt
```

## Netdiscover

Discovers IP, MAC Address and MAC vendor on the subnet from ARP, helpful for confirming you're on the right VLAN at $client site

```bash
netdiscover -r 192.168.1.0/24
```

https://github.com/absolomb/WindowsEnum 

