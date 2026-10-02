# MITRE ATT&CK

A knowledge base of adversary tactics and techniques built from real-world observations, used to plan an engagement and map findings to recognized behavior.

## Why It Matters

ATT&CK gives offense and defense a shared language. On an engagement I use it to plan which techniques to cover, to structure findings so a blue team can map them to their detections, and to show a client coverage against behavior real attackers use rather than a generic checklist.

## Reference

### Enterprise Tactics

| ID | Tactic | Goal |
| :--- | :--- | :--- |
| TA0043 | Reconnaissance | Gather information to plan the attack |
| TA0042 | Resource Development | Build infrastructure, accounts, and tooling |
| TA0001 | Initial Access | Get into the environment |
| TA0002 | Execution | Run malicious code |
| TA0003 | Persistence | Keep access across reboots and credential changes |
| TA0004 | Privilege Escalation | Gain higher permissions |
| TA0005 | Defense Evasion | Avoid detection |
| TA0006 | Credential Access | Steal account names and passwords |
| TA0007 | Discovery | Learn the environment |
| TA0008 | Lateral Movement | Move through the environment |
| TA0009 | Collection | Gather data of interest |
| TA0011 | Command and Control | Communicate with compromised systems |
| TA0010 | Exfiltration | Steal data |
| TA0040 | Impact | Disrupt, destroy, or manipulate systems and data |

The tactics map closely to the phases in this toolkit, from [Reconnaissance](../reconnaissance/index.md) through [Collection](../collection/index.md).

## How I Use It

I build an [ATT&CK Navigator](https://mitre-attack.github.io/attack-navigator/) layer for the engagement to track which techniques I plan to exercise and which I actually did. In the report, mapping each finding to a technique lets the client line my results up against their own detection coverage.

## Resources

* [ATT&CK Enterprise Matrix](https://attack.mitre.org/matrices/enterprise/)
* [ATT&CK Navigator](https://mitre-attack.github.io/attack-navigator/)
* [Getting Started with ATT&CK](https://attack.mitre.org/resources/getting-started/)
* [CALDERA (adversary emulation)](https://github.com/mitre/caldera)
* [MITRE Cyber Analytics Repository (CAR)](https://car.mitre.org/)
