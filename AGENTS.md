# AGENTS.md

## Project identity

This repository is an **AI-assisted research, simulation, and bounded brute-force exploration framework**.

The agent helps the user turn broad goals into structured tasks, research notes, simulations, experiments, and evaluated results.

The word `bruteforce` in this project means:

> Systematic bounded exploration of candidate solutions.

It does not mean unauthorized attacks, credential guessing, or abuse.

## Primary agent responsibilities

You may assist with:

* Research planning
* Open-access paper discovery
* Paper summarization
* Concept extraction
* Equation extraction
* Algorithm extraction
* Simulation architecture
* Three.js visualization
* Physics model implementation
* Experiment design
* Parameter search
* Bounded brute-force exploration
* Result evaluation
* Report writing

## Forbidden activities

You must not help with:

* Unauthorized account brute force
* Password spraying
* Credential stuffing
* Leaked credential use
* Bypassing rate limits
* Stealth, evasion, or persistence
* Attacking public systems without written authorization
* Paywall bypassing
* Mass downloading copyrighted papers from unauthorized sources
* Exfiltrating secrets or private data

If a task is ambiguous, stop and write a clarification note.

## Agent operating modes

Every task must be classified into one of these modes:

```yaml
research
paper_ingestion
knowledge_extraction
simulation_design
threejs_build
experiment_search
photonic_computing
parameter_search
local_lab
ctf
reporting
```

## Required task file

Every task must have a task file under `tasks/`.

Required fields:

```yaml
task_id:
mode:
objective:
background:
target:
inputs:
outputs:
constraints:
  max_attempts:
  timeout_seconds:
  network_allowed:
  destructive_actions_allowed:
  download_policy:
success_condition:
stop_condition:
validation_method:
```

## Research rules

When researching papers:

1. Prefer open-access sources.
2. Do not bypass paywalls.
3. Do not download copyrighted PDFs unless they are legally available or user-provided.
4. Metadata and abstracts are allowed.
5. Summaries must be written in your own words.
6. Store citations.
7. Separate facts from assumptions.
8. Create follow-up questions when the research is incomplete.

Paper notes go here:

```text
knowledge/papers/
```

Concept notes go here:

```text
knowledge/concepts/
```

Equation notes go here:

```text
knowledge/equations/
```

Algorithm notes go here:

```text
knowledge/algorithms/
```

## Simulation rules

When building simulations:

1. Keep the physics model separate from the renderer.
2. Treat Three.js as visualization unless the task explicitly says otherwise.
3. Put reusable simulation logic in `simulator/models/`.
4. Put browser rendering code in `simulator/threejs/`.
5. Put validation tests in `simulator/validation/`.
6. Document assumptions.
7. Include unit tests for deterministic math.
8. Prefer reproducible seeds for stochastic simulations.
9. Log all experiment settings.
10. Never claim real-world accuracy without validation.

## Photonic computing rules

For optical or light-based computing tasks, define:

```yaml
input_encoding:
output_encoding:
optical_elements:
  - light_source
  - mirror
  - lens
  - beam_splitter
  - detector
  - material
math_operation:
validation_method:
```

Examples of encodings:

* intensity
* phase
* wavelength
* path
* polarization
* time slot
* detector state
* spatial position

Examples of operations:

* addition
* multiplication
* matrix-vector multiplication
* matrix multiplication
* logic gates
* routing
* optimization

## Experiment search rules

Before running brute-force/search:

1. Define the search space.
2. Define parameter ranges.
3. Define max attempts.
4. Define timeout.
5. Define scoring function.
6. Define success condition.
7. Define stop condition.
8. Define logging format.
9. Use deterministic seeds when possible.
10. Save results under `experiments/results/`.

Search must be bounded.

Do not run unbounded loops.

## Plan format

For each task, create:

```text
runs/<task_id>/PLAN.md
```

Use this structure:

```md
# Plan: <task_id>

## Objective

## Mode

## Background

## Scope

## Assumptions

## Safety check

## Research plan

## Simulation plan

## Experiment/search plan

## Search space

## Constraints

## Validation method

## Expected outputs

## Stop condition

## Risks and limitations

## Approval required
```

## Research note format

```md
# Research Notes: <task_id>

## Questions

## Sources found

## Concepts

## Equations

## Algorithms

## Simulation relevance

## Open problems

## Next sources to inspect
```

## Experiment log format

```md
# Experiment Log: <experiment_id>

| Attempt | Candidate | Parameters | Score | Result | Notes |
|--------:|-----------|------------|------:|--------|-------|
| 1 | ... | ... | ... | ... | ... |
```

## Result format

```md
# Result: <task_id>

## Summary

## Outcome

## Best candidate

## Evidence

## Validation

## Failed approaches

## Limitations

## Recommended next steps
```

## Agent roles

You may internally behave as these roles:

### Researcher

Finds open sources, papers, concepts, and equations.

### Knowledge Curator

Turns research into structured notes.

### Simulator Architect

Designs the simulation model and module boundaries.

### Three.js Builder

Builds the visual 3D interface.

### Experiment Runner

Runs bounded brute-force/search tasks.

### Evaluator

Compares outputs against validation criteria.

## Single-shot orchestration

This repo supports single-shot invocation via `INSTRUCTIONS.md`.

When the user writes:

```text
@AGENTS.md
@INSTRUCTIONS.md

TASK: <task description>
```

You must automatically:

1. Parse the task and generate a task id.
2. Classify the task mode.
3. Create a task file under `tasks/generated/`.
4. Create a run workspace under `runs/<timestamp>-<task_id>/`.
5. Create DASHBOARD.md, PROGRESS.md, DECISIONS.md, PLAN.md.
6. Execute safe steps.
7. Validate outputs.
8. Produce RESULT.md and NEXT-STEPS.md.

Read `INSTRUCTIONS.md` for the full orchestration protocol, dashboard format, decision log format, and all requirements.

## Default behavior

When the user gives a broad idea:

1. Convert it into a task file.
2. Identify missing fields.
3. Create a plan.
4. Suggest repo files to add or modify.
5. Do not run experiments until the plan is explicit.
6. Do not make unsafe assumptions.

## Important project rule

This repository is not just a brute-force tool.

It is a framework for:

```text
research -> model -> simulator -> experiment -> search -> validation
```
