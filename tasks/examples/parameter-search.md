# Task: parameter-search-example

```yaml
task_id: parameter-search-example
mode: parameter_search
authorization: local_lab
target: ./optimizer-script
objective: Find parameter combination that minimizes output value
constraints:
  max_attempts: 200
  timeout_seconds: 600
  network_allowed: false
  destructive_actions_allowed: false
success_condition: Output value drops below threshold (e.g., < 0.01)
stop_condition: Success, timeout, or max attempts reached
```

## Context

A local script accepts parameters (e.g., learning rate, iterations, threshold) and produces a numeric output. The goal is to find the combination that minimizes or optimizes that output within constraints.

## Search space

```yaml
parameters:
  learning_rate:
    type: float
    min: 0.0001
    max: 1.0
  iterations:
    type: int
    min: 10
    max: 10000
  threshold:
    type: float
    min: 0.0
    max: 1.0
```

## Strategy

1. Start with grid search over coarse ranges
2. Identify promising regions from initial results
3. Narrow to fine-grained search in best regions
4. Use hill-climbing or random restart within top candidates
5. Log every combination and its output

## Notes

* The script must be deterministic for the same inputs.
* Capture numeric output for comparison.
* Define "best" clearly — minimize, maximize, or target value.
