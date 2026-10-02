# Evasion

Avoiding detection by antivirus, EDR, and network monitoring during an engagement.

## Why It Matters

A realistic assessment tests detection as well as prevention. Understanding how defenses see an action, and how real attackers avoid being seen, is what makes an engagement representative of a genuine threat rather than a noisy scan the blue team catches immediately.

## Reference

### What Defenses Watch

| Layer | Signals |
| :--- | :--- |
| Endpoint (AV/EDR) | Known tool signatures, suspicious process trees, LSASS access, script content |
| Network | Beaconing patterns, connections to new infrastructure, large transfers |
| Identity | Anomalous logons, lateral movement, privilege changes |
| Logging | Event log clearing, audit policy changes |

### General Principles

* **Live off the land:** prefer built-in binaries (LOLBAS) and native protocols over dropped tools
* **Minimize footprint:** fewer actions, on fewer hosts, at a measured pace
* **Blend in:** use expected ports, times, and accounts where possible
* **Avoid known-bad tooling** on monitored hosts; signatured tools like Mimikatz are flagged on sight
* **Clean up:** track artifacts created so they can be removed and reported

!!! warning "Evasion is scoped, not unlimited"
    Evasion techniques are used within the rules of engagement to test detection, not to cause harm or hide activity from the client. Red team work is documented in full; the goal is to measure what defenses catch, and report what they miss.

## How I Use It

I decide up front how quiet the engagement needs to be: an overt test can be noisy, while a red team exercise against a mature SOC is as much about evasion as access. On monitored networks I favor built-in tooling and native protocols, keep actions minimal, and record everything I do so the report can compare what I did against what the blue team detected.

## Related

* [Lateral Movement](movement.md)
* [LOLBAS](https://lolbas-project.github.io/)
* [MITRE ATT&CK: Defense Evasion](https://attack.mitre.org/tactics/TA0005/)

## Resources

* [MITRE ATT&CK: Defense Evasion](https://attack.mitre.org/tactics/TA0005/)
* [LOLBAS Project](https://lolbas-project.github.io/)
