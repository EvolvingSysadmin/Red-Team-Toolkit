# MITRE

The [MITRE ATT&CK framework](https://attack.mitre.org/) is a knowledge base of adversary tactics and techniques that can be used as a penetration testing guide.

* [Background](#background)
* [Steps](#steps)
* [Resources](#resources)

## Background

MITRE ATT&CK (Adversarial Tactics, Techniques, and Common Knowledge) is a framework developed by MITRE, a non-profit organization that provides research and development services to the U.S. government. The framework provides a comprehensive understanding of the tactics, techniques, and procedures that are used by adversaries in real-world attacks in the form of a matrix, and is designed to be a common language for describing and understanding cyber threats. Penetration testers can use the MITRE CVE framework to identify known vulnerabilities in a target's systems and applications, and to prioritize their testing efforts based on the severity of the vulnerabilities.

## Steps

The [framework's enterprise matrix](https://attack.mitre.org/matrices/enterprise/) is divided into several steps, which are as follows:

1. [Reconnaissance](https://attack.mitre.org/tactics/TA0043/): This involves the collection of information about the target organization or individual, including network topology, security measures, and vulnerabilities.
2. [Resource Development](https://attack.mitre.org/tactics/TA0042): This step involves the creation of tools, malware, and other resources that can be used during the attack.
3. [Initial Access](https://attack.mitre.org/tactics/TA0001): This step involves gaining initial access to the target's network, systems, or applications. This can be achieved through a variety of means, including exploiting vulnerabilities, using stolen credentials, or social engineering.
4. [Execution](https://attack.mitre.org/tactics/TA0002): This step involves executing the primary payload of the attack, which can include malware installation, data theft, or other malicious activities.
5. [Persistence](https://attack.mitre.org/tactics/TA0003): This involves establishing a foothold within the target's environment to maintain access over an extended period.
6. [Privilege Escalation](https://attack.mitre.org/tactics/TA0003): This step involves gaining elevated privileges within the target environment to gain access to sensitive data or systems.
7. [Defense Evasion](https://attack.mitre.org/tactics/TA0005): This step involves using various techniques to avoid detection and evade defenses, such as anti-virus software, firewalls, and intrusion detection systems.
8. [Credential Access](https://attack.mitre.org/tactics/TA0006): This step involves obtaining valid credentials that can be used to gain access to additional systems and resources within the target environment.
9. [Discovery](https://attack.mitre.org/tactics/TA0007): This involves mapping out the target's environment to identify potential targets for further exploitation.
10. [Lateral Movement](https://attack.mitre.org/tactics/TA0008): This step involves moving laterally within the target environment to gain access to additional systems and resources.
11. [Collection](https://attack.mitre.org/tactics/TA0009): This involves gathering data or information of interest, such as sensitive data, credentials, or system configurations.
12. [Command and Control](https://attack.mitre.org/tactics/TA0011): This step involves establishing and maintaining communication with remote systems that are under the control of the attacker, which are used to issue commands and receive information.
13. [Exfiltration](https://attack.mitre.org/tactics/TA0010): This involves the extraction of data or information from the target environment to a location under the control of the attacker.
14. [Impact](https://attack.mitre.org/tactics/TA0010): This involves the final result or impact of the attack, which can include data theft, system compromise, or other malicious activities.

## Resources

* [ATT&CK Official Site](https://attack.mitre.org)
* [ATT&CK Matrix](https://attack.mitre.org/matrices/enterprise)
* [ATT&CK Navigator Web App](https://mitre-attack.github.io/attack-navigator)
* [ATT&CK Caldera Emulator](https://github.com/mitre/caldera)
* [ATT&CK Decider Automation](https://github.com/cisagov/decider)
* [MITRE GitHub](https://mitre.github.io)
* [MITRE Cyber Analytics Repository (CAR)](https://car.mitre.org)
* [ATT&CK ATT&CK Getting Started Guide](https://www.mitre.org/sites/default/files/2021-11/getting-started-with-attack-october-2019.pdf)
* [MITRE ATT&CK Resources](https://attack.mitre.org/resources)
* [ATT&CK Getting STarted](https://attack.mitre.org/resources/getting-started)
