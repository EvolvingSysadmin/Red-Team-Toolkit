# Other Scanning Methods

Scanning and enumeration techniques beyond Nmap: banner grabbing, UDP, and local network discovery.

## When I Use It

* Confirming a service version by reading its banner directly
* Scanning UDP services that a default TCP scan misses
* Discovering live hosts on the local subnet, including confirming I am on the right VLAN on site

## Common Tasks

### Banner Grabbing

Connect to a service and read the banner it returns for version and fingerprint information.

```bash
nc -v TARGET-IP 25
telnet TARGET-IP 25
```

For HTTP, send a minimal request after connecting:

```bash
nc TARGET-IP 80
GET / HTTP/1.1
Host: TARGET-IP

```

### UDP Scanning

UDP services are easy to miss. [udp-proto-scanner](https://github.com/portcullislabs/udp-proto-scanner) probes known UDP protocols.

```bash
./udp-proto-scanner.pl -f ips.txt        # all probes against a list of IPs
udp-proto-scanner.pl -p ntp -f ips.txt   # a specific service
```

### Local Network Discovery

[netdiscover](https://github.com/alexxy/netdiscover) finds hosts, MAC addresses, and vendors from ARP, which is handy for confirming you are on the expected VLAN on site.

```bash
netdiscover -r 192.168.1.0/24
```

## Reading the Output

* A banner gives the service and often the exact version, which maps to known vulnerabilities
* UDP results are less reliable than TCP; corroborate anything interesting
* netdiscover's vendor column helps tell infrastructure (switches, printers) from endpoints

## Related

* [Nmap](nmap.md)
* [Network Services Attacks](../initial-access/network-services-attacks.md)

## Resources

* [SANS PowerShell Built-in Port Scanner](https://www.sans.org/blog/pen-test-poster-white-board-powershell-built-in-port-scanner/)
* [Impacket](https://github.com/fortra/impacket)
