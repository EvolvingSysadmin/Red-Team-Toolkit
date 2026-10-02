# Hydra

Fast network login brute-forcer that supports many protocols.

## When I Use It

* Testing a login service for weak or reused credentials: SSH, FTP, RDP, SMB, HTTP forms
* Spraying a known password across many usernames, or a wordlist against a known username
* Confirming that a credential policy (lockout, rate limiting) actually works

!!! warning "Noisy and can lock accounts"
    Brute forcing generates heavy authentication traffic and can trigger account lockouts. Confirm it is in scope, watch thread counts, and prefer password spraying over per-account brute force where lockout is a risk.

## Installation

Included in Kali. Elsewhere: `sudo apt install hydra`.

## Common Commands

| Flag | Meaning |
| :--- | :--- |
| `-l` / `-L` | Single username / username list |
| `-p` / `-P` | Single password / password list |
| `-t` | Parallel connections (lower is quieter) |
| `-vV` | Verbose: show each attempt |
| `-f` | Stop after the first valid login |

```bash
# SSH with a username and wordlist
hydra -l mike -P /usr/share/wordlists/rockyou.txt -t 4 10.10.10.6 ssh

# FTP
hydra -l dale -P /usr/share/wordlists/rockyou.txt -t 4 -vV 10.10.10.6 ftp

# HTTP POST login form: path:body:failure-string
hydra -l molly -P rockyou.txt 10.10.10.6 \
  http-post-form "/login:username=^USER^&password=^PASS^:F=incorrect" -V
```

For the web form, `^USER^` and `^PASS^` are substituted from the lists, and `F=` is a string that appears on a failed login.

## Reading the Output

* A found credential is printed as `[port][service] host: ... login: ... password: ...`
* Many services that appear vulnerable are rate-limited; if every attempt fails instantly, check whether the service is dropping the connections
* Pair with [Wordlists](wordlists.md) chosen for the target

## Related

* [Wordlists](wordlists.md)
* [Network Services Attacks](network-services-attacks.md)
* [Password Cracking](../privilege-escalation/password-cracking.md)

## Resources

* [Hydra (Kali Tools)](https://www.kali.org/tools/hydra/)
* [SecLists](https://github.com/danielmiessler/SecLists)
