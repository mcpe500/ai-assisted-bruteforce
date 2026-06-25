# Safety Rules

1. Authorization is mandatory for every task.
2. All limits (attempts, timeout, scope) are hard caps — never silently increased.
3. Network access defaults to disabled.
4. Destructive actions defaults to disabled.
5. All attempts must be logged.
6. Secrets, tokens, and passwords must not appear in logs.
7. Stop condition must be respected immediately when triggered.
8. Scope changes require explicit user approval.
9. No stealth, evasion, or persistence mechanisms.
10. Ambiguous requests are treated as unsafe until proven otherwise.
