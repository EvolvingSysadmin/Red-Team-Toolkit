# Nmap

Nmap is a Security Scanner, Port Scanner, & Network Exploration Tool

* [Background](#background)
* [Installation](#installation)
* [Usage](#usage)
  * [Basic Usage](#basic-usage)
  * [Scan Types](#scan-types)
  * [Targeting](#targeting)
  * [Host Discovery](#host-discovery)
  * [Port Discovery](#port-discovery)
  * [OS Discovery](#os-discovery)
  * [Service Discovery](#service-discovery)
  * [Evasion](#evasion)
  * [Output](#output)
  * [Scripting](#scripting)
  * [Timing Templates](#timing-templates)
  * [Timing and Performance](#timing-and-performance)
* [Resources](#resources)

## Background

Nmap is a popular security tool that can be used as a network exploration and port scanner. It can help you identify hosts and services on a network, as well as other valuable information like operating system details, open ports, services running on those ports, and potential vulnerabilities.

## Installation

* Download: <https://nmap.org/download.html>
* Linux:

    ```bash
    sudo apt-get update && upgrade
    sudo apt-get install nmap
    ```

## Usage

### Basic Usage

* Base Syntax: `nmap [ScanType] [Options] {targets}`
* Access Help: `nmap -h`
* Nmap Discovery Steps: 1. Enumerate Targets -> 2. Discover Live Hosts -> 3. Reverse DNS Lookup -> 4. Scan Ports -> 5. Detect Versions -> 6. Detect OS -> 7. Tracert -> 8. Run Scripts -> 9. Write Output
* TCP Flags:
  * URG: urgent incoming data
  * ACK: TCP receipt acknowledgement
  * PSH: promptly push data into application
  * RST: reset connection
  * SYN: synchornize initiates TCP handshake
  * FIN: sender has no more data to send

### Scan Types

| Description                                                                                          | Switch | Example                |
|------------------------------------------------------------------------------------------------------|--------|------------------------|
| [TCP SYN port scan (Default )](https://nmap.org/book/synscan.html)                                   | `-sS`  | `nmap 192.168.1.1 -sS` |
| [TCP connect port scan (Default without root)](https://nmap.org/book/scan-methods-connect-scan.html) | `-sT`  | `nmap 192.168.1.1 -sT` |
| [UDP port scan](https://nmap.org/book/scan-methods-udp-scan.html)                                    | `-sU`  | `nmap 192.168.1.1 -sU` |
| [TCP ACK Port Scan](https://nmap.org/book/scan-methods-ack-scan.html)                                | `-sA`  | `nmap 192.168.1.1 -sA` |
| [TCP Window port scan](https://nmap.org/book/scan-methods-window-scan.html)                          | `-sW`  | `nmap 192.168.1.1 -sW` |
| [TCP Maimon port scan](https://nmap.org/book/scan-methods-maimon-scan.html)                          | `-sM`  | `nmap 192.168.1.1 -sM` |
| [TCP Fin scan](https://nmap.org/book/scan-methods-null-fin-xmas-scan.html)                           | `-sF`  | `nmap 192.168.1.1 -sF` |
| [TCP Null scan](https://nmap.org/book/scan-methods-null-fin-xmas-scan.html)                          | `-sN`  | `nmap 192.168.1.1 -sN` |
| [TCP Xmas scan](https://nmap.org/book/scan-methods-null-fin-xmas-scan.html)                          | `-sX`  | `nmap 192.168.1.1 -sX` |
| [ARP scan](https://nmap.org/book/host-discovery-techniques.html)                                     | `-PR`  | `nmap 192.168.1.1 -PR` |

### Targeting

| Description              | Switch     | Example                        |
|--------------------------|------------|--------------------------------|
| Scan a single IP         |            | `nmap 192.168.1.1`             |
| Scan specific IPs        |            | `nmap 192.168.1.1 192.168.2.1` |
| Scan a range             |            | `nmap 192.168.1-255.1-254`     |
| Scan a domain            |            | `nmap scanme.nmap.org`         |
| Scan using CIDR notation |            | `nmap 192.168.1.0/24`          |
| Scan targets from a file | `-iL`      | `nmap -iL targets.txt`         |
| Scan 100 random hosts    | `-iR`      | `nmap -iR 100`                 |
| Exclude listed hosts     | `–exclude` | `nmap –exclude 192.168.1.1`    |

### Host Discovery

| Description                                     | Switch         | Example                                     |
|-------------------------------------------------|----------------|---------------------------------------------|
| Don't Scan. List targets only                   | `-sL`          | `nmap 192.168.1.1-3 -sL`                    |
| Disable port scanning. Host discovery only.     | `-sn`          | `nmap 192.168.1.1/24 -sn`                   |
| Disable host discovery. Port scan only.         | `-Pn`          | `nmap 192.168.1.1-5 -Pn`                    |
| TCP SYN discovery on port x (port 80 default)   | `-PS`          | `nmap 192.168.1.1-5 -PS22-25,80`            |
| TCP ACK discovery on port x (port 80 default)   | `-PA`          | `nmap 192.168.1.1-5 -PA22-25,80`            |
| UDP discovery on port x (port 40125 default)    | `-PU`          | `nmap 192.168.1.1-5 -PU53`                  |
| ARP discovery on local network                  | `-PR`          | `nmap 192.168.1.1-1/24 -PR`                 |
| Don't do DNS resolution                         | `-n`           | `nmap 192.168.1.1 -n`                       |
| Specify DNS server. Example 192.168.1.2         | `–dns-servers` | `nmap 192.168.1.1 –dns-servers 192.168.1.2` |
| Perform DNS resolution, even for offline hosts. | `-R`           | `nmap 192.168.1.1 -R`                       |
| ICMP timestamp request                          | `-PP`          | `nmap 192.168.1.1 -PP`                      |
| ICMP address mask                               | `-PM`          | `nmap 192.168.1.1 -PM`                      |
| ICMP echo request                               | `-PE`          | `nmap 192.168.1.1 -PE`                      |

### Port Discovery

| Description                                   | Switch       | Example                               |
|-----------------------------------------------|--------------|---------------------------------------|
| Port scan for single port                     | `-p`         | `nmap 192.168.1.1 -p 21`              |
| Port range                                    | `-p`         | `nmap 192.168.1.1 -p 21-100`          |
| Port scan multiple TCP and UDP ports          | `-p`         | `nmap 192.168.1.1 -p U:53,T:21-25 80` |
| Port scan all ports                           | `-p`         | `nmap 192.168.1.1 -p-`                |
| Port scan from service name                   | `-p`         | `nmap 192.168.1.1 -p http,https`      |
| Fast port scan (100 ports)                    | `-F`         | `nmap 192.168.1.1 -F`                 |
| Port scan the top x ports                     | `–top-ports` | `nmap 192.168.1.1 –top-ports 2000`    |
| Omitting beginning range starts scan at 1     | `-p-65535`   | `nmap 192.168.1.1 -p-65535`           |
| Omitting ending range runs scan through 65535 | `-p-`        | `nmap 192.168.1.1 -p0-`               |

### OS Discovery

| Description                                                      | Switch             | Example                               |
|------------------------------------------------------------------|--------------------|---------------------------------------|
| Remote OS detection using TCP/IP fingerprinting                  | `-O`               | `nmap 192.168.1.1 -O`                 |
| OS host detection if open and closed ports >=1                   | `-O –osscan-limit` | `nmap 192.168.1.1 -O –osscan-limit`   |
| Makes Nmap guess more aggressively                               | `-O –osscan-guess` | `nmap 192.168.1.1 -O –osscan-guess`   |
| Maximum OS detection tries against a target                      | `-O –max-os-tries` | `nmap 192.168.1.1 -O –max-os-tries 1` |
| OS detection, version detection, script scanning, traceroute     | `-A`               | `nmap 192.168.1.1 -A`                 |
| Run traceroute                                                   | `–traceroute`      | `nmap traceroute 192.168.1.1`         |

### Service Discovery

| Description                                                  | Switch                   | Example                                     |
|--------------------------------------------------------------|--------------------------|---------------------------------------------|
| Attempts to determine version of service running on port     | `-sV`                    | `nmap 192.168.1.1 -sV`                      |
| Intensity level 0 to 9. Higher increases correctness         | `-sV –version-intensity` | `nmap 192.168.1.1 -sV –version-intensity 8` |
| Light mode. Lower possibility of correctness. Faster         | `-sV –version-light`     | `nmap 192.168.1.1 -sV –version-light`       |
| Intensity level 9. Higher possibility of correctness. Slower | `-sV –version-all`       | `nmap 192.168.1.1 -sV –version-all`         |
| OS detection, version detection, script scanning, traceroute | `-A`                     | `nmap 192.168.1.1 -A`                       |

### Evasion

| Description                                                               | Switch         | Example                                                                      |
|---------------------------------------------------------------------------|----------------|------------------------------------------------------------------------------|
| Use fragmented IP packets (-ff increases fragmentation)                   | `-f`           | `nmap 192.168.1.1 -f`                                                        |
| Set your own offset size                                                  | `–mtu`         | `nmap 192.168.1.1 –mtu 32`                                                   |
| Send scans from spoofed/decoy IPs                                         | `-D`           | `nmap -D 192.168.1.101,192.168.1.102,192.168.1.103,192.168.1.23 192.168.1.1` |
| Above example explained                                                   | `-D`           | `nmap -D decoy-ip1,decoy-ip2,your-own-ip,decoy-ip3,decoy-ip4 remote-host-ip` |
| Spoofed scan of Facebook from Microsoft (-e eth0 -Pn may be required)     | `-S`           | `nmap -S www.microsoft.com www.facebook.com`                                 |
| Use given source port number                                              | `-g`           | `nmap -g 53 192.168.1.1`                                                     |
| Relay connections through HTTP/SOCKS4 proxies                             | `–proxies`     | `nmap –proxies http://192.168.1.1:8080, http://192.168.1.2:8080 192.168.1.1` |
| Appends random data to sent packets                                       | `–data-length` | `nmap –data-length 200 192.168.1.1`                                          |
| Spoof MAC address                                                         | `–spoof-mac`   | `nmap –spoof-mac 00000ABB28FC`                                               |
| Idle/zombie scan. Example using 192.168.1.2 as zombie to scan 192.168.1.1 | `-sI`          | `nmap -sI 192.168.1.2 192.168.1.1`                                           |
| Custom scan flags. Example with SYN and FIN flags set                     | `--scanflags`  | `nmap --scanflags SYNFIN 192.168.1.1`                                        |

### Output

| Description                                                   | Switch           | Example                                         |
|---------------------------------------------------------------|------------------|-------------------------------------------------|
| Normal output to the file normal.file                         | `-oN`            | `nmap 192.168.1.1 -oN normal.file`              |
| XML output to the file xml.file                               | `-oX`            | `nmap 192.168.1.1 -oX xml.file`                 |
| Grepable output to the file grep.file                         | `-oG`            | `nmap 192.168.1.1 -oG grep.file`                |
| Output in the three major formats at once                     | `-oA`            | `nmap 192.168.1.1 -oA results`                  |
| Grepable output to screen. -oN -, -oX – also usable           | `-oG –`          | `nmap 192.168.1.1 -oG –`                        |
| Append a scan to a previous scan file                         | `–append-output` | `nmap 192.168.1.1 -oN file.file –append-output` |
| Increase the verbosity level (-vv or more for greater effect) | `-v`             | `nmap 192.168.1.1 -v`                           |
| Increase debugging level (-dd or more for greater effect)     | `-d`             | `nmap 192.168.1.1 -d`                           |
| Display the reason a port is in a  state, same output as -vv  | `–reason`        | `nmap 192.168.1.1 –reason`                      |
| Only show open (or possibly open) ports                       | `–open`          | `nmap 192.168.1.1 –open`                        |
| Show all packets sent and received                            | `–packet-trace`  | `nmap 192.168.1.1 -T4 –packet-trace`            |
| Shows the host interfaces and routes                          | `–iflist`        | `nmap –iflist`                                  |
| Resume a scan                                                 | `–resume`        | `nmap –resume results.file`                     |

### Scripting

| Description                                       | Switch            | Example                                                                   |
|---------------------------------------------------|-------------------|---------------------------------------------------------------------------|
| View all local scripts                            | `ls`              | `ls /urs/share/nmap/scripts`                                              |
| Search local scripts with wildcards. Example http | `ls -l`           | `ls -l /usr/share/nmap/scripts/*http*`                                    |
| Default NSE scripts. Useful/safe for discovery    | `-sC`             | `nmap 192.168.1.1 -sC`                                                    |
| Default NSE scripts. Useful/safe for discovery    | `–script default` | `nmap 192.168.1.1 –script default`                                        |
| Use Single script. Example banner                 | `–script`         | `nmap 192.168.1.1 –script=banner`                                         |
| Use wildcard. Example http                        | `–script`         | `nmap 192.168.1.1 –script=http*`                                          |
| Use two scripts. Example http and banner          | `–script`         | `nmap 192.168.1.1 –script=http,banner`                                    |
| Use a category. Example auth                      | `–script`         | `nmap 192.168.1.1 –script=auth`                                           |
| Default with intrusive scripts removed            | `–script`         | `nmap 192.168.1.1 –script not intrusive`                                  |
| NSE script with arguments                         | `–script-args`    | `nmap –script snmp-sysdescr –script-args snmpcommunity=admin 192.168.1.1` |
| Display help for script. Example banner           | `–script-help`    | `nmap –script-help banner`                                                |
| Get page titles from HTTP services                | `-script`         | `nmap 192.168.1.0/24 -script=http-title`                                  |
| Get HTTP headers of web services                  | `-script`         | `nmap 192.168.1.0/24 -script=http-headers`                                |
| Find apps from known paths                        | `-script`         | `nmap 192.168.1.0/24 -script=http-enum`                                   |
| Get IP info                                       | `-script`         | `nmap 192.168.1.0/24 -script=asn-query,whois,ip-geolocation-maxmind`      |
| Heartbleed vulnerability detection                | `-script`         | `nmap 192.168.1.0/24 -script=ssl-heartbleed -sV -p 443`                   |
| CVE detection                                     | `-script`         | `nmap 192.168.1.0/24 -script-vuln -Pn`                                    |
| Malware scan                                      | `-script`         | `nmap 192.168.1.0/24 -script=http-malware-host -sV`                       |
| Malware scan using Google malware check           | `-script`         | `nmap 192.168.1.0/24 -script=script http-google-malware -p80 target.com`  |
| SMB vulnerability detection                       | `-script`         | `nmap 192.168.1.0/24 -script=smb-check-vulns -script-args=unsage=1 -v -p` |

### Timing Templates

| Description                                                                   | Switch | Example                |
|-------------------------------------------------------------------------------|--------|------------------------|
| Paranoid (0) Intrusion Detection System evasion                               | `-T0`  | `nmap 192.168.1.1 -T0` |
| Sneaky (1) Intrusion Detection System evasion                                 | `-T1`  | `nmap 192.168.1.1 -T1` |
| Polite (2) slows down to use less bandwidth and less target machine resources | `-T2`  | `nmap 192.168.1.1 -T2` |
| Normal (3) which is default speed                                             | `-T3`  | `nmap 192.168.1.1 -T3` |
| Aggressive (4) speeds scans; assumes you are on a fast network                | `-T4`  | `nmap 192.168.1.1 -T4` |
| Insane (5) speeds scan; assumes you are on an extraordinarily fast network    | `-T5`  | `nmap 192.168.1.1 -T5` |

### Timing and Performance

| Description                                         | Switch                                                        | Example    |
|-----------------------------------------------------|---------------------------------------------------------------|------------|
| Give up on target after this long                   | `–host-timeout <time>`                                        | 1s; 4m; 2h |
| Specifies probe round trip time                     | `–min-rtt-timeout/max-rtt-timeout/initial-rtt-timeout <time>` | 1s; 4m; 2h |
| Parallel host scan group sizes                      | `–min-hostgroup/max-hostgroup <size<size>`                    | 50; 1024   |
| Probe parallelization                               | `–min-parallelism/max-parallelism <numprobes>`                | 10; 1      |
| Maximum number of port scan probe retransmissions   | `–max-retries <tries>`                                        | 3          |
| Send packets no slower than `<number>` per second   | `–min-rate <number>`                                          | 100        |
| Send packets no faster than `<number>` per second   | `–max-rate <number>`                                          | 100        |

## Resources

* [Nmap Reference Guide](https://nmap.org/book/man.html)
* [Nmap Officical Book](https://nmap.org/book/toc.html)
* [NMAP Scripts Portal](https://nmap.org/nsedoc/)
* [NMAP Script Usage](https://nmap.org/book/nse-usage.html)
* [NMAP Firewall Evasion Techniques](https://nmap.org/book/man-bypass-firewalls-ids.html)
* [Kali Nmap Guide](https://www.kali.org/tools/nmap/)
* [Common Ports](https://web.mit.edu/rhel-doc/4/RH-DOCS/rhel-sg-en-4/ch-ports.html)
* [Nmap Cheat Sheet](/resources/nmap-cheat-sheet.pdf)
* [SANS Nmap Cheat Sheet](/resources/sans-nmap.pdf)
* Additional Scanning Tools:
  * [arp-scan](https://www.kali.org/tools/arp-scan/)
  * [masscan](https://github.com/robertdavidgraham/masscan)
  * [ZMap](https://zmap.io/)
