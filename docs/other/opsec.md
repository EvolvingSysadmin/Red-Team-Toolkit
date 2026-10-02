# OpSec

Operational security for the tester: protecting the engagement, the client's data, and your own infrastructure.

## Why It Matters

A tester handles sensitive access and data, and operates infrastructure that could itself become a target. Good operational security keeps the engagement controlled and the client's data safe, and keeps the test attributable and clean rather than a liability.

## Reference

### Engagement Hygiene

| Concern | Practice |
| :--- | :--- |
| Scope discipline | Act only within the agreed scope and rules of engagement |
| Credential handling | Store captured credentials and hashes securely; reset them as part of remediation |
| Evidence handling | Keep findings and client data encrypted and access-controlled |
| Attribution and logging | Log your own actions so the client can distinguish the test from a real attacker |
| Cleanup | Track and remove tools, accounts, and changes made during the test |
| Separation | Keep engagement infrastructure separate from personal and other client work |

### Anonymity and Isolation Tooling

Useful for research and for isolating testing infrastructure. Routing engagement traffic through anonymity networks is a decision made with the client, not a default.

| Tool | Use |
| :--- | :--- |
| [Whonix](https://www.whonix.org/) | Tor-based isolation in two VMs |
| Tails | Amnesic live OS routing through Tor |
| Qubes OS | Security through compartmentalization |

## How I Use It

I treat the client's data and the access I gain as the most sensitive part of the engagement: encrypted storage, least handling, and credentials reset at the end. I log my own activity so the blue team can tell my actions apart from a real incident, and I keep a cleanup checklist so nothing I created is left behind.

## Related

* [Evasion](../movement/evasion.md)
* [Methodology](../methodology/index.md)

## Resources

* [PTES: Pre-engagement](http://www.pentest-standard.org/index.php/Pre-engagement)
* [Whonix](https://www.whonix.org/)
