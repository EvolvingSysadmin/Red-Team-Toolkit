# Network Service Attacks

## Description

Techniques for exploiting common network services

## Techniques

* [Service Enumeration](#service-enumeration)
* [SMB](#smb)
* [Telnet](#telnet)
* [FTP](#ftp)
* [NFS](#nfs)
* [SMTP](#smtp)
* [MySQL](#mysql)

## Service Enumeration

* Use NMAP, Enum4linux

## SMB

Installation of smbclient: `smbclient //[IP]/[SHARE]` with the tags `-U [name] : to specify the user -p [port] : to specify the port`

## Telnet

`telnet [IP] [port]`

<https://www.cvedetails.com/>
<https://cve.mitre.org/>

## FTP

ftp [ip]

ftp arp poisoning: <https://www.jscape.com/blog/bid/91906/Countering-Packet-Sniffers-Using-Encrypted-FTP>

## NFS

/usr/sbin/showmount -e [ip]

NFS-Common

<https://tryhackme.com/room/networkservices2>

Mounting NFS shares

sudo mount -t nfs IP:share /tmp/mount/ -nolock

Tag Function
sudo Run as root
mount Execute the mount command
-t nfs Type of device to mount, then specifying that it's NFS
IP:share The IP Address of the NFS server, and the name of the share we wish to mount
-nolock Specifies not to use NLM locking

root_squash

## SMTP

<https://www.afternerd.com/blog/smtp/>

"smtp_version" module in MetaSploit

Enumerate users using SMTP: RFY (confirming the names of valid users) and EXPN (which reveals the actual address of user’s aliases and lists of e-mail (mailing lists)

Version scanner: auxiliary/scanner/smtp/smtp_version

## MySQL

<https://dev.mysql.com/doc/dev/mysql-server/latest/PAGE_SQL_EXECUTION.html>

<https://www.w3schools.com/php/php_mysql_intro.asp>

To install client: `sudo apt install default-mysql-client`
nmap's mysql-enum script: <https://nmap.org/nsedoc/scripts/mysql-enum.html> or <https://www.exploit-db.com/exploits/23081>

Connect to mysql database: `mysql -h [IP] -u [username] -p`

mysql schema dump: auxiliary/scanner/mysql/mysql_schemadump
hash dump: auxiliary/scanner/mysql/mysql_hashdump

## Resources
