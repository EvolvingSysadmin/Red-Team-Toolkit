# Network Services Attacks

## Description

Techniques for exploiting common network services

## Techniques

* [Service Enumeration](network-services-attacks.md#service-enumeration)
* [SMB](network-services-attacks.md#smb)
* [Telnet](network-services-attacks.md#telnet)
* [FTP](network-services-attacks.md#ftp)
* [NFS](network-services-attacks.md#nfs)
* [SMTP](network-services-attacks.md#smtp)
* [MySQL](network-services-attacks.md#mysql)

## Service Enumeration

* Use NMAP, Enum4linux

## SMB

Installation of smbclient: `smbclient //[IP]/[SHARE]` with the tags `-U [name] : to specify the user -p [port] : to specify the port`

## Telnet

`telnet [IP] [port]`

[https://www.cvedetails.com/](https://www.cvedetails.com/) [https://cve.mitre.org/](https://cve.mitre.org/)

## FTP

ftp \[ip]

ftp arp poisoning: [https://www.jscape.com/blog/bid/91906/Countering-Packet-Sniffers-Using-Encrypted-FTP](https://www.jscape.com/blog/bid/91906/Countering-Packet-Sniffers-Using-Encrypted-FTP)

## NFS

/usr/sbin/showmount -e \[ip]

NFS-Common

[https://tryhackme.com/room/networkservices2](https://tryhackme.com/room/networkservices2)

Mounting NFS shares

sudo mount -t nfs IP:share /tmp/mount/ -nolock

Tag Function sudo Run as root mount Execute the mount command -t nfs Type of device to mount, then specifying that it's NFS IP:share The IP Address of the NFS server, and the name of the share we wish to mount -nolock Specifies not to use NLM locking

root\_squash

## SMTP

[https://www.afternerd.com/blog/smtp/](https://www.afternerd.com/blog/smtp/)

"smtp\_version" module in MetaSploit

Enumerate users using SMTP: RFY (confirming the names of valid users) and EXPN (which reveals the actual address of user’s aliases and lists of e-mail (mailing lists)

Version scanner: auxiliary/scanner/smtp/smtp\_version

## MySQL

[https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE\_SQL\_EXECUTION.html](https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_SQL_EXECUTION.html)

[https://www.w3schools.com/php/php\_mysql\_intro.asp](https://www.w3schools.com/php/php_mysql_intro.asp)

To install client: `sudo apt install default-mysql-client` nmap's mysql-enum script: [https://nmap.org/nsedoc/scripts/mysql-enum.html](https://nmap.org/nsedoc/scripts/mysql-enum.html) or [https://www.exploit-db.com/exploits/23081](https://www.exploit-db.com/exploits/23081)

Connect to mysql database: `mysql -h [IP] -u [username] -p`

mysql schema dump: auxiliary/scanner/mysql/mysql\_schemadump hash dump: auxiliary/scanner/mysql/mysql\_hashdump

## Resources
