# Burp Suite

Web application testing platform built around an intercepting proxy, written in Java.

## When I Use It

* Any web application assessment: intercepting, reading, and modifying requests
* Replaying and tampering with a single request (Repeater) or fuzzing one (Intruder)
* Encoding and decoding payloads, and testing session token randomness

## Installation

* Download from [PortSwigger](https://portswigger.net/burp/releases); the Community edition is free
* Point the browser at the proxy (`127.0.0.1:8080`), using [FoxyProxy](https://getfoxyproxy.org/) to switch quickly, or use Burp's built-in browser
* For HTTPS, install Burp's CA certificate from `http://burp/cert` into the browser

## Common Tasks

| Tool | Use |
| :--- | :--- |
| Proxy | Intercept and inspect requests and responses |
| Repeater | Modify and resend a single request |
| Intruder | Automate payloads against a request (fuzzing, spraying) |
| Decoder | Encode and decode payloads |
| Comparer | Diff two responses |
| Sequencer | Test session token randomness |
| Extender | Load extensions from the BApp store |

Set the engagement scope under **Target -> Scope** and filter the proxy history to it, so captured traffic stays relevant.

## Reading the Output

* The Target site map builds up a picture of the application as you browse it
* Repeater is where most manual testing happens: change one thing, resend, compare the response
* The Community edition throttles Intruder; for heavy automated fuzzing, [ffuf](https://github.com/ffuf/ffuf) is faster

## Related

* [Web Application Recon](../reconnaissance/web-application-recon.md)
* [Web Authentication Bypass](web-authentication-bypass.md)
* [SQL Injection](sql-injection.md), [XSS](xss.md)
* [OWASP ZAP](owasp-zap.md), the open-source alternative

## Resources

* [Burp Suite Documentation](https://portswigger.net/burp/documentation)
* [Web Security Academy](https://portswigger.net/web-security) (free labs from PortSwigger)
