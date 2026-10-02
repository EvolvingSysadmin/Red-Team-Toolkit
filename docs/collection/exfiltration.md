# Exfiltration

Demonstrating that data can be removed from the environment, to prove impact within the rules of engagement.

## Why It Matters

Showing that sensitive data can leave the network is often the clearest way to make risk concrete to a client. In an engagement this is done to demonstrate the path, not to steal data: a small, authorized proof is enough, handled carefully and documented.

## Reference

### Channels

| Channel | Description |
| :--- | :--- |
| Over C2 | Data sent back through the existing command-and-control channel |
| HTTPS / cloud storage | Upload to a web service or cloud bucket, blending with normal traffic |
| DNS tunneling | Encoding data in DNS queries where other egress is blocked |
| Alternative protocols | ICMP, email, or other allowed outbound paths |

### What Defenses Watch

* Unusual outbound data volumes
* Connections to new or uncategorized destinations
* Large transfers at odd times
* Known exfiltration tooling (rclone, megasync) on endpoints

!!! warning "Authorized, minimal, and documented"
    Only move data the rules of engagement permit, keep it to the minimum needed to prove the path, protect anything handled as sensitive evidence, and record exactly what was transferred. Never exfiltrate real sensitive data beyond what is authorized.

## How I Use It

I demonstrate the channel with benign or explicitly authorized data rather than removing real sensitive records, and I note which egress paths worked and which controls (DLP, proxy, segmentation) would have caught them. The point for the report is the gap, paired with the control that would close it.

## Related

* [Persistence](persistence.md)
* [Evasion](../movement/evasion.md)

## Resources

* [MITRE ATT&CK: Exfiltration](https://attack.mitre.org/tactics/TA0010/)
