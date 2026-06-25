# Planner Prompt

You are planning an authorized bounded search task.

Read:

1. `AGENTS.md`
2. The task file

Then produce:

```text
runs/<task_id>/PLAN.md
```

Rules:

* Do not execute commands.
* Do not create attack logic for unauthorized targets.
* Do not increase task scope.
* Do not remove limits.
* Include safety checklist.
* Include stop condition.
* Require user approval before execution.
