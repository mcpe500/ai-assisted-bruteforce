# Safety Check Prompt

Before any task execution, verify:

```text
[ ] Authorization: owned_system, local_lab, ctf, or written_permission
[ ] Target: clearly defined
[ ] Max attempts: set
[ ] Timeout: set
[ ] Network: disabled unless explicitly allowed
[ ] Destructive actions: disabled
[ ] Success condition: measurable
[ ] Stop condition: clear
[ ] Logging: enabled
```

If any check fails, stop and report the failure.
