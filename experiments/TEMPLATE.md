# Experiment: <experiment_id>

```yaml
experiment_id:
task_id:
objective:
input_encoding:
output_encoding:
search_space:
  parameter_name:
    type: float | int | choice
    min:
    max:
    step:
    choices:
constraints:
  max_attempts:
  timeout_seconds:
  seed:
  network_allowed: false
success_metric:
stop_condition:
validation_method:
```

## Context

Describe the experiment, its motivation, and how it connects to the broader task.

## Input encoding

How are input numbers represented physically?

* intensity
* phase
* wavelength
* path
* polarization
* detector state
* spatial position

## Output decoding

How are detector outputs interpreted as numbers?

## Search strategy

Describe how candidates will be generated and iterated.

## Validation

How will the output be compared against expected results?

## Notes

Assumptions, known limitations, expected behavior.
