# Task: local-fuzzing-example

```yaml
task_id: local-fuzzing-example
mode: fuzzing
authorization: local_lab
target: ./target-binary
objective: Find input that triggers a crash or unexpected output in a local binary
constraints:
  max_attempts: 500
  timeout_seconds: 120
  network_allowed: false
  destructive_actions_allowed: false
success_condition: Binary crashes, returns non-zero exit code, or produces unexpected output
stop_condition: Success, timeout, or max attempts reached
```

## Context

You have a local binary that accepts stdin or command-line arguments. The goal is to find input that causes abnormal behavior — crash, hang, wrong output, or assertion failure.

## Search space

* Printable ASCII characters
* Length 1-256 bytes
* Optionally start from known-good input and mutate

## Strategy

1. Start with boundary values (empty, max length, special chars)
2. Mutate from known-good inputs (bit flip, byte insertion, truncation)
3. Random fuzzing within constraints
4. Log every attempt with input, command, exit code, and stderr

## Notes

* The binary must be local — no remote targets.
* If the binary requires arguments, document them in the context section.
* Capture both stdout and stderr for evaluation.
