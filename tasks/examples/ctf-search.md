# Task: ctf-search-example

```yaml
task_id: ctf-search-example
mode: ctf
authorization: ctf
target: ./challenge-program
objective: Find the correct input that satisfies the challenge condition
constraints:
  max_attempts: 1000
  timeout_seconds: 300
  network_allowed: false
  destructive_actions_allowed: false
success_condition: Challenge program outputs the flag or expected success message
stop_condition: Success, timeout, or max attempts reached
```

## Context

A CTF challenge binary validates input and prints a flag on success. The search space is constrained but not trivially enumerable. AI assistance helps narrow the candidate space through analysis and iterative refinement.

## Search space

* Alphanumeric strings
* Length 4-32 characters
* May include special characters depending on challenge analysis

## Strategy

1. Analyze the binary (strings, behavior on known inputs)
2. Identify constraints from error messages or behavior
3. Generate candidates that satisfy observed constraints
4. Narrow search based on partial success signals (timing, partial output)
5. Log all attempts

## Notes

* This is a CTF challenge environment — the target is designed to be solved.
* No real accounts or external services involved.
* If the challenge is remote, this task mode is not applicable without explicit authorization.
