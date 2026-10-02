# OWASP ZAP

The OWASP Zed Attack Proxy: a free, open-source web application scanner and intercepting proxy.

## When I Use It

* Web application testing when I want an open-source alternative to Burp Suite
* An automated baseline scan of a web app before manual testing
* Intercepting and modifying requests, spidering an app, and running active scans

## Installation

Download from the [ZAP site](https://www.zaproxy.org/download/), or run it in Docker. It is also bundled with Kali.

## Common Tasks

| Task | How |
| :--- | :--- |
| Automated scan | Enter a URL in Quick Start -> Automated Scan |
| Proxy the browser | Point the browser at ZAP (default `127.0.0.1:8080`) and import ZAP's CA certificate for HTTPS |
| Spider the app | Right click a site -> Attack -> Spider, or AJAX Spider for JavaScript-heavy apps |
| Active scan | Right click a site in scope -> Attack -> Active Scan |
| Manual testing | Use the Requester and Breakpoints to modify requests |

## Reading the Output

* Alerts are grouped by risk; each includes a description and remediation, useful for the report
* An active scan is intrusive, so confirm the target is in scope before running one
* Validate findings by hand; automated alerts include false positives

## Related

* [Burp Suite](burp-suite.md)
* [Web Application Recon](../reconnaissance/web-application-recon.md)
* [OWASP](../methodology/owasp.md)

## Resources

* [ZAP Documentation](https://www.zaproxy.org/docs/)
* [ZAP Getting Started Guide](https://www.zaproxy.org/getting-started/)
