# Phishing

Social engineering by email to obtain credentials or code execution, used in authorized engagements and awareness testing.

## Why It Matters

Phishing is the most common real-world initial access vector, so testing it measures a control that attackers actually use. In an engagement it is run with explicit authorization and scope, to assess both the technical controls and the human response.

## Reference

### Frameworks

| Tool | Use |
| :--- | :--- |
| [GoPhish](https://getgophish.com/) | Open-source framework for running and measuring phishing campaigns |
| [Social-Engineer Toolkit (SET)](https://github.com/trustedsec/social-engineer-toolkit) | Broad social engineering toolkit, including phishing and cloned sites |
| [King Phisher](https://github.com/rsmusllp/king-phisher) | Campaign framework with detailed tracking |
| [MailSniper](https://github.com/dafthack/MailSniper) | Search and extract mail from exposed mailboxes |

### Engagement Steps

1. Define scope, targets, and rules of engagement in writing
2. Build a pretext and infrastructure (domain, sending profile, landing page)
3. Launch the campaign and track opens, clicks, and submissions
4. Report results: technical gaps (filtering, authentication) and the human response, without singling out individuals

!!! warning "Authorization and handling"
    Only run campaigns that are explicitly authorized and scoped. Captured credentials are sensitive evidence and must be stored and handled accordingly, then reset as part of remediation.

## How I Use It

I build the pretext from OSINT (the email format, the technology staff use, current events at the organization) and keep infrastructure separate from any other work. Reporting focuses on the controls and the aggregate response, framed to improve training rather than to blame people.

## Related

* [OSINT](../reconnaissance/osint.md)
* [Gophish Phishing Framework](https://github.com/EvolvingSysadmin/Gophish-Phishing-Framework)
* [TryHackMe: Phishing](https://tryhackme.com/room/phishingyl)
