# Task: Photonic Matrix Multiplication

```yaml
task_id: photonic-matrix-multiplication
mode: photonic_computing
objective: >
  Research and prototype an optical system that performs matrix-vector
  multiplication using light intensities, optical weights, and detector arrays.
background: >
  Matrix multiplication is fundamental to signal processing and machine learning.
  Photonic approaches promise parallel computation at light speed. This task
  explores whether a browser-based simulation can model a simple optical
  matrix-vector multiplication system and validate the output.
target:
  research_notes: knowledge/
  simulator_core: simulator/models/
  experiments: experiments/results/
inputs:
  matrix_size: small (2x2 or 3x3)
  encoding: light_intensity
  optical_elements:
    - light_source_array (input vector)
    - weight_mask (transmittance values)
    - detector_array (output vector)
outputs:
  - knowledge/concepts/optical-matrix-multiplication.md
  - simulator/models/matrix-multiply-model.md
  - experiments/results/matrix-mult-validation.md
constraints:
  max_attempts: 200
  timeout_seconds: 1800
  network_allowed: true
  destructive_actions_allowed: false
  download_policy: open_access_only
success_condition: >
  Simulation produces output vector matching expected mathematical result
  of matrix-vector multiplication within defined tolerance.
stop_condition: >
  Validated 2x2 multiplication with known test cases, or timeout reached.
validation_method: >
  Compare simulation output against NumPy/standard matrix multiplication
  for 3+ test vectors. Report max error and mean error.
```

## Encoding scheme

```yaml
input_vector:
  each_element: light intensity (0.0 to 1.0)
  physical_representation: separate light sources per element
weight_matrix:
  each_element: transmittance of optical mask pixel (0.0 to 1.0)
  physical_representation: 2D transmittance mask or SLM
output_vector:
  each_element: detector intensity reading
  physical_representation: detector array, one per output element
```

## Math model

```
output[j] = sum_over_i( input[i] * weight[i][j] )
```

In the optical model:

```
detector[j] = sum_over_i( source[i].intensity * mask[i][j].transmittance )
```

This is a linear operation — same as standard matrix-vector multiplication if transmittance values are set correctly.

## Validation test cases

```yaml
test_1:
  input: [1, 0]
  matrix: [[1, 0], [0, 1]]
  expected_output: [1, 0]
  description: Identity matrix

test_2:
  input: [0.5, 0.8]
  matrix: [[0.3, 0.7], [0.6, 0.4]]
  expected_output: [0.63, 0.56]  # computed as standard matmul
  description: General case

test_3:
  input: [1, 1, 1]
  matrix: [[0.25, 0.25, 0.25], [0.25, 0.25, 0.25], [0.25, 0.25, 0.25]]
  expected_output: [0.75, 0.75, 0.75]
  description: Averaging matrix
```

## Research questions

1. How do real photonic matrix multipliers work?
2. What are the physical limitations (nonlinearity, noise, crosstalk)?
3. What is the smallest useful demonstration?
4. How to handle negative numbers in an intensity-only system?
5. What encoding alternatives exist (phase, wavelength, polarization)?
