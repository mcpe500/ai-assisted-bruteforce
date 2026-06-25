# Task: Light-Based Computing Simulator

```yaml
task_id: light-computing-simulator
mode: photonic_computing
objective: >
  Build an AI-assisted research and simulation workflow for exploring
  light-based computation using laser paths, reflection, detectors,
  and Three.js visualization.
background: >
  Investigate whether optical systems can represent simple arithmetic
  and eventually matrix multiplication. AI helps collect open research,
  extract concepts, design a simulator, implement a visual prototype,
  and run bounded experiments over optical configurations.
target:
  research_notes: knowledge/
  simulator_core: simulator/models/
  threejs_renderer: simulator/threejs/
  experiments: experiments/results/
inputs:
  initial_topics:
    - geometric optics
    - reflection
    - refraction
    - photon simulation
    - ray tracing
    - photonic computing
    - optical logic gates
    - optical matrix multiplication
    - diffractive optical computing
    - laser detector simulation
outputs:
  - PROJECT-VISION.md
  - knowledge/glossary.md
  - knowledge/concepts/ray-optics.md
  - knowledge/concepts/photonic-computing.md
  - simulator/README.md
  - simulator/models/ray-model.md
  - simulator/threejs/README.md
  - experiments/results/light-addition-baseline.md
constraints:
  max_attempts: 500
  timeout_seconds: 3600
  network_allowed: true
  destructive_actions_allowed: false
  download_policy: open_access_only
  paywall_bypass_allowed: false
  copyrighted_mass_download_allowed: false
success_condition: >
  Project has a clear simulation architecture, initial research notes,
  an optical computing representation, and at least one bounded experiment
  design for representing simple addition using light paths or detector states.
stop_condition: >
  Architecture, notes, and first experiment plan are complete,
  or timeout is reached.
validation_method: >
  Compare simulated detector output against expected arithmetic output.
  First baseline: validate that optical encoding can represent simple
  cases such as 1 + 2 = 3 under documented assumptions.
```

## Description

Create a framework where AI agents assist with researching, designing, and testing a light-based computing simulator.

The simulator should support:

* Laser sources and ray paths
* Mirrors, reflection, refraction
* Lenses and beam splitters
* Detectors and materials
* Intensity, phase, wavelength encoding
* Optical logic abstractions
* Arithmetic and matrix multiplication experiments

## Architecture decision

Three.js is visualization only. The simulation model is independent.

```
simulator/models/     Core physics and math
simulator/threejs/    3D rendering and UI
experiments/          Search tasks and validation results
knowledge/            Papers, concepts, equations, assumptions
```

## First milestone

Build a simple 3D scene with:

* One laser source
* One mirror
* One detector
* Visible ray path
* Adjustable mirror angle
* Detector hit/miss state
* Logged parameters

## First search experiment

Search over mirror angles to route ray into detector.

```yaml
mirror_angle_degrees:
  min: -90
  max: 90
  step: 0.1
```

Success: `distance(ray_intersection, detector_center) <= detector_radius`

## First optical arithmetic experiment

```
Input beam A = value 1 (intensity)
Input beam B = value 2 (intensity)
Optical layout combines/routes beams
Detector pattern decoded as value 3
```

Document: encoding, optical assumptions, decoding rule, physical vs abstract elements.
