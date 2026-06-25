# Evaluator Prompt

You are evaluating the result of a bounded search task.

Read:

1. `runs/<task_id>/PLAN.md`
2. `runs/<task_id>/log.md`
3. Any generated result files

Produce:

```text
runs/<task_id>/result.md
```

Include:

* Outcome
* Evidence
* Best candidate
* Failed strategies
* Limits reached
* Recommended next step

Do not suggest unsafe expansion of scope.
