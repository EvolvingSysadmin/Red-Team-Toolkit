# Burp Suite

This document contains 

Burp Suite is web application penetration testing framework written in Java

## Background

Burp Suite is a comprehensive platform for web application security testing. It provides a range of features, including a web proxy, web spider, vulnerability scanner, and manual testing tools, to help security professionals and ethical hackers test the security of web applications.

## Installation

* Burp Suite installers: <https://portswigger.net/>
* FoxyProxy used to send requests to burp suite proxy: <https://getfoxyproxy.org/>
* Installing certificates: <http://burp/cert>

## Usage

* Burp Suite Features
  * Proxy: intercept requests
  * Repeater: modify requests
  * Intruder: bruteforce/spray endpoints
  * Decoder: decode/encorde payloads
  * Comparer: compare data
  * Sequencer: test for randomness
  * Extender: use other modules written for Burp Suite
* [Burp Suite Installers](https://portswigger.net/burp/releases)
* Burp Proxy
  * Burp Proxy intercepts website requests so they can be utilized in Burp Suite
  * Use [FoxyProxy](https://getfoxyproxy.org/) to send browser requests to Burp Suite using the following settings (Use Proxy IP: `127.0.0.1` & Port: `8080` in FoxyProxy to send request to Burp Suite)
  * For SSL use `http://burp/cert`, download `cacert.der`, add this certificate to `about:preferences` in FireFox or Chrome
  * Use the Burp Browser by first going to `Project options -> Misc -> Embedded Browser` and checking the option `Allow the embedded browser to run without a sandbox`
  * Right Click and select `Add to Scope` while in the `Target` Tab and add an Add rule in `Proxy Options` to ensure that URLs are in the target scope to help filter captured traffic
* Jython Interpreter in Burp extender

## Resources

* [Burp Suite Documentation](https://portswigger.net/burp/documentation)
* [Sans Burp Suite Cheat Sheet](/resources/sans-burp-suite.pdf)
* [Burp Suite for Pentesters](https://github.com/Ignitetechnologies/BurpSuite-For-Pentester)
* <https://github.com/xl7dev/BurpSuite/blob/master/CheatSheet.md>

The official Burp Suite documentation: https://portswigger.net/burp/documentation
PortSwigger's blog: https://portswigger.net/blog/
The Burp Suite community: https://portswigger.net/community/
The Burp Suite support center: https://portswigger.net/support
The Burp Suite YouTube channel: https://www.youtube.com/channel/UCxlIPvCvSo2QZmI1cgL9d9g
The Burp Suite User Group on LinkedIn: https://www.linkedin.com/groups/4503164/
OWASP's Burp Suite page: https://owasp.org/www-project-web-security-testing-guide/v2/5-Web_Application_Penetration_Testing/02-Application_Discovery/01-Reconnaissance/03-Proxies
Online courses and tutorials: Udemy, Pluralsight, and Coursera offer courses on Burp Suite and web application security.