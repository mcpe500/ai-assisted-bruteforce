# Task: <task_id>

```yaml
task_id:
mode: research | paper_ingestion | knowledge_extraction | simulation_design | threejs_build | experiment_search | photonic_computing | parameter_search | local_lab | ctf | reporting
objective:
background:
target:
inputs:
outputs:
constraints:
  max_attempts:
  timeout_seconds:
  network_allowed: false
  destructive_actions_allowed: false
  download_policy: open_access_only
success_condition:
stop_condition:
validation_method:
```

## Context

Describe the task, its motivation, and how it connects to the broader project.

## What the AI should help with

* Classify the task mode
* Run safety and feasibility check
* Create a bounded plan in `runs/<task_id>/PLAN.md`
* Define search space (if applicable)
* Execute only after approval
* Log all attempts
* Evaluate results against validation criteria
* Write `runs/<task_id>/result.md`
* Suggest next steps

## Notes

Add assumptions, known constraints, expected behavior, and relevant knowledge base references.
