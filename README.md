# AI-Assisted Bruteforce Framework

> A framework for AI-assisted research, simulation, optimization, and bounded brute-force exploration.

## What is this?

This repository is a framework for using AI coding agents to help with complex exploratory tasks.

The word **bruteforce** in this project means:

> Systematic exploration of a large search space under clear rules, constraints, logs, and validation.

It does **not** mean unauthorized attacks, credential guessing, password spraying, or illegal automation.

## Core idea

This framework turns a vague goal into an auditable research-and-experiment loop:

```text
Idea
  -> Research
  -> Knowledge extraction
  -> Model design
  -> Simulator implementation
  -> Experiment definition
  -> Bounded brute-force/search
  -> Evaluation
  -> Refinement
  -> Result
```

The AI agent assists with:

* Understanding the task
* Finding relevant open research sources
* Summarizing papers
* Extracting equations, assumptions, and algorithms
* Designing simulations
* Implementing prototypes
* Running bounded experiments
* Searching parameters
* Comparing results
* Writing reports
* Suggesting next experiments

## Main use cases

This framework is designed for:

* Scientific research assistance
* Physics simulation prototyping
* Light / photon / optics simulation
* Photonic computing exploration
* Three.js visualization
* Ray tracing experiments
* Reflection and refraction experiments
* Optical logic experiments
* Optical matrix multiplication concepts
* Fuzzing and parameter search
* CTF and local lab tasks
* Optimization problems
* Algorithmic brute-force search
* Literature review automation

## Example vision

One example target project:

> Build a light-based computing simulator where AI helps research photon behavior, laser reflection, optical paths, and photonic computing concepts, then builds a Three.js simulator that can test whether optical systems can represent arithmetic, multiplication, or matrix operations.

Example tasks:

* Discover open-access papers about reflection, refraction, ray optics, photon simulation, and photonic computing
* Extract important equations and simulation assumptions
* Build a 3D optical scene in Three.js
* Simulate laser paths, mirrors, lenses, detectors, and materials
* Search over mirror angles and object positions
* Encode numbers as light intensity, phase, path, or detector state
* Test simple arithmetic like `1 + 2 = 3`
* Explore optical multiplication and matrix multiplication
* Compare simulation output against known mathematical results

## Important distinction

Three.js should be treated as the **visualization layer**, not necessarily the full physics engine.

Recommended split:

```text
Simulation Core
  Responsible for math, physics, ray behavior, state, equations, validation

Three.js Renderer
  Responsible for 3D display, interaction, animation, debugging visuals

Experiment Runner
  Responsible for brute-force/search over parameters

Knowledge Base
  Responsible for papers, concepts, equations, assumptions, and citations
```

## Repository structure

```text
.
├── README.md
├── AGENTS.md
├── CLAUDE.md
├── PROJECT-VISION.md
├── tasks/
│   ├── TEMPLATE.md
│   └── examples/
├── knowledge/
│   ├── papers/
│   ├── concepts/
│   ├── equations/
│   ├── algorithms/
│   └── glossary.md
├── simulator/
│   ├── README.md
│   ├── models/
│   ├── threejs/
│   └── validation/
├── experiments/
│   ├── TEMPLATE.md
│   └── results/
├── prompts/
├── policies/
└── runs/
```

## Task modes

### `research`

For literature discovery, paper summaries, knowledge extraction, and concept mapping.

```yaml
mode: research
objective: Find open-access sources about photon simulation and optical computing
```

### `paper_ingestion`

For collecting metadata, abstracts, notes, and open-access PDFs.

This mode must only download legally available open-access material.

```yaml
mode: paper_ingestion
download_policy: open_access_only
```

### `simulation_design`

For turning research into a simulation architecture.

```yaml
mode: simulation_design
target: simulator/
objective: Design a modular photon/ray optics simulation engine
```

### `threejs_build`

For building visualization and interaction layers.

```yaml
mode: threejs_build
target: simulator/threejs
objective: Visualize lasers, mirrors, lenses, detectors, and ray paths
```

### `experiment_search`

For bounded brute-force exploration.

```yaml
mode: experiment_search
objective: Search mirror angles that route light to the target detector
```

### `photonic_computing`

For exploring light-based arithmetic and matrix operations.

```yaml
mode: photonic_computing
objective: Test whether an optical layout can represent addition or matrix multiplication
```

### `local_lab`

For local-only testing, fuzzing, and bounded brute-force tasks.

```yaml
mode: local_lab
network_allowed: false
```

### `ctf`

For CTF or challenge environments.

```yaml
mode: ctf
authorization: challenge_environment
```

## Research policy

The agent may help discover and summarize research, but it must follow these rules:

* Prefer open-access sources.
* Do not bypass paywalls.
* Do not mass-download copyrighted papers from unauthorized sources.
* Store metadata even when a PDF cannot be downloaded.
* Store citations and source URLs.
* Summarize papers in the agent's own words.
* Keep track of assumptions and limitations.
* Distinguish between proven physics, simulation assumptions, and speculative ideas.

Allowed paper sources include:

* Open-access repositories
* Publisher-provided open-access PDFs
* arXiv-style preprints
* DOI metadata
* Abstracts
* Citation graphs
* User-provided PDFs

## Knowledge base format

Each paper note should be saved as:

```text
knowledge/papers/<year>-<short-title>.md
```

Format:

```md
# Paper title

## Metadata

- Title:
- Authors:
- Year:
- Venue:
- DOI:
- URL:
- Access type: open_access | abstract_only | user_provided

## Summary

## Key concepts

## Equations

## Algorithms

## Simulation relevance

## Limitations

## Follow-up papers

## Tags
```

## Simulation concept

The simulator should support layers.

### Layer 1: Geometric optics

Useful for:

* Rays
* Mirrors
* Reflection
* Refraction
* Lenses
* Detectors
* Beam paths

### Layer 2: Wave optics

Useful for:

* Interference
* Diffraction
* Phase
* Coherence
* Wavelength effects

### Layer 3: Monte Carlo photon simulation

Useful for:

* Probabilistic photon paths
* Scattering
* Absorption
* Material interaction
* Statistical output

### Layer 4: Optical computing abstraction

Useful for:

* Logic gates
* Arithmetic encoding
* Matrix-vector multiplication
* Signal routing
* Detector-based output

## Optical computing representation

Numbers may be represented as:

* Light intensity
* Beam count
* Path selection
* Detector state
* Phase
* Wavelength
* Polarization
* Time slot
* Spatial position

Example:

```text
Input number 1 -> beam A intensity
Input number 2 -> beam B intensity
Optical system -> combines or routes beams
Detector output -> interpreted as result 3
```

For matrix multiplication:

```text
Input vector -> light intensities
Optical weights -> lens/mask/mirror/interference system
Detector array -> output vector
```

## Experiment format

Each experiment should define:

```yaml
experiment_id:
task_id:
objective:
input_encoding:
search_space:
constraints:
  max_attempts:
  timeout_seconds:
  seed:
  network_allowed:
success_metric:
stop_condition:
validation_method:
```

## Brute-force/search examples

This framework can search over:

* Mirror angles
* Lens positions
* Detector positions
* Material parameters
* Light source positions
* Beam intensity
* Phase offsets
* Wavelength choices
* Scene geometry
* Optical gate layout
* Matrix encoding strategy
* Simulation constants
* Algorithm variants

Example:

```text
Find a mirror configuration where input beams representing 1 and 2 produce detector state 3.
```

## Agent workflow

For every task, the AI agent must follow:

```text
1. Read AGENTS.md
2. Read the task file
3. Classify the task mode
4. Run the safety and feasibility check
5. Create a plan
6. Wait for approval if execution changes files or runs experiments
7. Execute within limits
8. Log all attempts
9. Evaluate results
10. Write next steps
```

## Output folders

Each task run should produce:

```text
runs/<task_id>/
├── PLAN.md
├── research-notes.md
├── implementation-notes.md
├── experiment-log.md
├── result.md
└── next-steps.md
```

## Safety and allowed use

This project is allowed for:

* Research
* Simulation
* Education
* Local experiments
* Optimization
* CTF/lab tasks
* Authorized testing

This project is not allowed for:

* Unauthorized account brute force
* Credential stuffing
* Password spraying
* Bypassing rate limits
* Paywall bypassing
* Stealth automation
* Data exfiltration
* Attacking third-party systems without written authorization

## Project philosophy

The goal is not to make an AI that blindly runs commands.

The goal is to make an AI-assisted system that can:

* Think through a hard problem
* Research background material
* Build a model
* Test possibilities
* Learn from failed attempts
* Improve the simulator
* Produce reproducible results

In short:

```text
AI-assisted bruteforce = controlled search + research + simulation + validation
```
