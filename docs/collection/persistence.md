# Persistence

Maintaining access to a compromised environment across reboots, credential changes, and loss of the initial foothold.

## Why It Matters

In an engagement, persistence demonstrates that access would survive and that a defender's recovery is incomplete if they only remove the obvious foothold. Every persistence mechanism is also a detection and remediation opportunity for the blue team, so it is documented in full and removed during cleanup.

## Reference

### Common Mechanisms

| Mechanism | Description |
| :--- | :--- |
| New or modified accounts | Adding a user or adding an account to a privileged group |
| Scheduled tasks | A task that re-runs a payload on a trigger |
| Services | A service that starts a payload at boot |
| Run keys and startup folder | Registry autostart or a dropped shortcut |
| WMI event subscription | Fires a payload on a system event |
| AD-level | Golden/silver tickets, DCSync rights, AdminSDHolder, `krbtgt` abuse |

### Account Management Commands

Used to demonstrate account-based persistence (and to clean up afterward):

```cmd
net user <name> * /add              :: add a local user
net localgroup Administrators <name> /add   :: add to local admins
net user <name> * /add /domain      :: add a domain user
net group "<group>" <name> /add /domain     :: add to a domain group
```

!!! warning "Track and remove everything"
    Persistence created during an engagement is sensitive and must be inventoried and removed during cleanup, and reported. Leaving a backdoor behind, even accidentally, is a serious failure of the engagement.

## How I Use It

I use the least intrusive mechanism that proves the point, and record every account, task, service, or key I create so it can be removed at the end. On a red team exercise, the choice of mechanism also tests whether the blue team detects it. The persistence findings map directly to detections the defender can add.

## Related

* [AD Privilege Escalation](../privilege-escalation/ad-privilege-escalation.md)
* [Mimikatz](../privilege-escalation/mimikatz.md)
* [Exfiltration](exfiltration.md)

## Resources

* [MITRE ATT&CK: Persistence](https://attack.mitre.org/tactics/TA0003/)
* [The Hacker Recipes: Persistence](https://www.thehacker.recipes/)
