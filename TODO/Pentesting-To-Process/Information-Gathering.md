# Social Recon

## Google

[Google Hacking for Penetration Testers](/docs/source/Resources/)

Whois lookup google hack:
   "physical address search string" site:www.findip-address.com
   "physical address search string" site:domaintools.com

## theHarvester

theHarvester is a very simple to use, yet powerful and effective tool designed to be used in the early stages of a
penetration test or red team engagement. Use it for open source intelligence (OSINT) gathering to help determine a
company's external threat landscape on the internet. The tool gathers emails, names, subdomains, IPs and URLs using
multiple public data sources that include:

[https://github.com/laramies/theHarvester](https://github.com/laramies/theHarvester)

Usage in Kali:
```bash
theharvester -h
```

## recon-ng

Recon-ng is a full-featured reconnaissance framework designed with the goal of providing a powerful environment to conduct open source web-based reconnaissance quickly and thoroughly.

[https://github.com/lanmaster53/recon-ng](https://github.com/lanmaster53/recon-ng)

Installation:

[https://github.com/lanmaster53/recon-ng/wiki/Getting-Started](https://github.com/lanmaster53/recon-ng/wiki/Getting-Started)

## SimplyEmail

Use SimplyEmail to enumerate all the online places (github target site etc), it works better if you use proxies or set long throttle times so google doesn’t think you’re a robot and make you fill out a Captcha. Simply Email can verify the discovered email addresss after gathering.

[https://github.com/SimplySecurity/SimplyEmail](https://github.com/SimplySecurity/SimplyEmail)

```bash
git clone https://github.com/killswitch-GUI/SimplyEmail.git
./SimplyEmail.py -all -e TARGET-DOMAIN
```

## Gitleaks

Gitleaks is a SAST tool for detecting hardcoded secrets like passwords, api keys, and tokens in git repos. Gitleaks aims to be the easy-to-use, all-in-one solution for finding secrets, past or present, in your code.

[https://github.com/zricethezav/gitleaks](https://github.com/zricethezav/gitleaks)

## MetaData Analysis

Use these tools to analyze publicly available documents for useful metadata

[Metagoofil](https://github.com/laramies/metagoofil)
[FOCA](https://github.com/ElevenPaths/FOCA)


