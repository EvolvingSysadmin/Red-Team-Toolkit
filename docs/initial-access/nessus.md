# Nessus

Vulnerability scanner from Tenable that identifies missing patches, misconfigurations, and known vulnerabilities.

## When I Use It

* Baseline vulnerability scanning across a network in scope
* Confirming patch levels and finding low-hanging known vulnerabilities before manual testing
* Producing a scan report to hand off alongside manual findings

Nessus is a starting point, not the engagement. Its output needs validation; a scanner finding is a lead until confirmed by hand.

## Installation

Download and install from [Tenable](https://docs.tenable.com/nessus/Content/Install.htm). Nessus Essentials is free for a limited number of hosts.

## Common Tasks

| Step | What to Do |
| :--- | :--- |
| Configure the scanner | Set scan targets, speed, and reporting options |
| Create a scan policy | Choose the checks: vulnerability, compliance, web |
| Launch the scan | Point it at the in-scope targets |
| Review results | Sort by severity; read each finding's detail and remediation |
| Report | Export for stakeholders or to pair with manual findings |

## Reading the Output

* Treat Critical and High findings as leads to validate, not confirmed vulnerabilities
* Watch for false positives on version-based checks, which flag a version without confirming exploitability
* The remediation text per finding is useful source material for the report's recommendations

## Related

* [Nmap](../discovery/nmap.md), for the host and service discovery that scoping a scan depends on
* [Metasploit](metasploit.md), to validate exploitable findings
* [Critical CVE context](../methodology/nist.md)

## Resources

* [Nessus Documentation](https://docs.tenable.com/nessus/)
* [Tenable Community](https://community.tenable.com/)
