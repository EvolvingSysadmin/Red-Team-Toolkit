# Movement

Moving laterally through the environment and avoiding detection while doing it.

## Why It Matters

Few targets are reachable from the first foothold. Lateral movement is how an attacker reaches the systems that matter, and doing it quietly is what separates a realistic assessment from one the blue team catches in minutes.

## Pages

| Page | Description |
| :--- | :--- |
| [Lateral Movement](movement.md) | Techniques for moving between hosts |
| [Evasion](evasion.md) | Avoiding detection by defensive tooling |

## How I Use It

I reuse the credentials and access gathered in discovery and privilege escalation to reach new hosts, watching what the environment's defenses would see. From new hosts the cycle returns to [Discovery](../discovery/index.md); once I reach the objective it becomes [Collection](../collection/index.md).
