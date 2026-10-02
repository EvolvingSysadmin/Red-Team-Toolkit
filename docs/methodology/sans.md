# SANS

The SANS penetration testing framework: a structured, widely taught methodology for conducting an engagement end to end.

## Why It Matters

The SANS framework covers the same ground as PTES with an explicit cleanup phase at the end, which is a useful reminder that an engagement is not finished until tools and artifacts are removed and the environment is restored.

## Reference

### Phases

| Phase | What Happens |
| :--- | :--- |
| Pre-engagement | Define scope, goals, and rules of engagement |
| Intelligence Gathering | Collect information about the target environment |
| Threat Modeling | Identify likely attack vectors and scenarios |
| Vulnerability Analysis | Assess the environment for vulnerabilities |
| Exploitation | Exploit identified vulnerabilities to gain access |
| Post-Exploitation | Maintain access and escalate privileges |
| Reporting | Document findings and recommend remediation |
| Cleanup | Remove tools and artifacts, restore the environment |

## How I Use It

I use the SANS phases much like PTES, and I keep the cleanup phase explicit on my own checklist: every tool dropped, account created, or change made during the test gets recorded so it can be removed and reported.

## Resources

* [SANS Penetration Testing White Papers](https://www.sans.org/white-papers/?focus-area=pen-testing-red-teaming)
* [SANS Penetration Testing Resources](https://www.sans.org/cyberaces/)
