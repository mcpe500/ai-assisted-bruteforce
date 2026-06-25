# INSTRUCTIONS.md

# AI-Assisted Bruteforce Orchestrator

You are the main orchestrator for this repository.

The user will usually invoke you like this:

```text
@AGENTS.md
@INSTRUCTIONS.md

TASK: <user task here>
```

Your job is to turn that single `TASK:` line into a complete, structured, visible, auditable workflow.

The user should not need to write a full task file manually.

You must infer the task, classify it, create the required files, plan the work, execute safe steps, show progress, record decisions, validate results, and produce a final report.

---

## Core principle

This repository uses the word `bruteforce` to mean:

> systematic bounded exploration of possible solutions.

It does not mean unauthorized attacks, credential guessing, password spraying, or abuse.

You must support research, simulation, optimization, UI/UX design, coding, experiment search, and result evaluation.

---

## Single input protocol

When the user writes:

```text
TASK: <anything>
```

You must automatically do the following:

1. Parse the task.
2. Generate a task id.
3. Classify the task mode.
4. Create a task file.
5. Create a run workspace.
6. Create a progress dashboard.
7. Create a decision log.
8. Create a plan.
9. Execute safe steps.
10. Validate outputs.
11. Produce final result and next steps.

Do not ask clarifying questions unless the task is unsafe, impossible, destructive, or missing critical authorization.

If details are missing but safe defaults are possible, choose sensible defaults and record them in `ASSUMPTIONS.md`.

---

## Supported task modes

Classify every task into one or more of these modes:

```yaml
research
paper_ingestion
knowledge_extraction
simulation_design
threejs_build
ui_ux_design
software_build
experiment_search
photonic_computing
parameter_search
local_lab
ctf
reporting
```

If multiple modes apply, use a pipeline.

Example:

```text
TASK: build a light-based computing simulator with Three.js
```

Should become:

```text
research -> knowledge_extraction -> simulation_design -> threejs_build -> ui_ux_design -> experiment_search -> validation -> reporting
```

---

## Run workspace

For every task, create:

```text
runs/<timestamp>-<task_id>/
├── DASHBOARD.md
├── TASK.md
├── PLAN.md
├── PROGRESS.md
├── DECISIONS.md
├── ASSUMPTIONS.md
├── QUESTIONS.md
├── ACTIONS.md
├── COMMANDS.md
├── VALIDATION.md
├── RESULT.md
├── NEXT-STEPS.md
└── artifacts/
```

Also create or update:

```text
tasks/generated/<task_id>.md
```

If the task creates or modifies software, also create:

```text
docs/UI-UX-SPEC.md
docs/ARCHITECTURE.md
docs/IMPLEMENTATION-NOTES.md
```

---

## Dashboard requirement

The user must always be able to inspect current progress.

Maintain `runs/<run_id>/DASHBOARD.md`.

The dashboard must always contain:

```md
# Run Dashboard: <task_id>

## Status

- Current phase:
- Overall progress:
- Last updated:
- Current action:
- Next action:
- Blockers:
- Risk level:

## Progress

| Phase | Status | Progress | Notes |
|------|--------|----------|-------|
| Intake | pending/running/done | 0-100% | |
| Planning | pending/running/done | 0-100% | |
| Research | pending/running/done/skipped | 0-100% | |
| Design | pending/running/done/skipped | 0-100% | |
| Build | pending/running/done/skipped | 0-100% | |
| Experiment | pending/running/done/skipped | 0-100% | |
| Validation | pending/running/done/skipped | 0-100% | |
| Reporting | pending/running/done | 0-100% | |

## Latest decisions

| ID | Decision | Reason | Impact |
|----|----------|--------|--------|

## Latest actions

| Time | Action | Result |
|------|--------|--------|

## Artifacts

| File | Purpose |
|------|---------|
```

Update this dashboard after every major step.

---

## Decision log requirement

Maintain `runs/<run_id>/DECISIONS.md`.

Every important choice must be recorded.

Use this format:

```md
# Decision Log: <task_id>

## D-0001: <decision title>

- Time:
- Status: accepted | rejected | superseded
- Context:
- Options considered:
  1. Option A
  2. Option B
  3. Option C
- Decision:
- Reason:
- Tradeoffs:
- Impact:
- Reversal plan:
```

Examples of decisions that must be logged:

* Choosing architecture
* Choosing simulation model
* Choosing UI framework
* Choosing data structure
* Choosing search strategy
* Choosing validation method
* Choosing paper source strategy
* Choosing whether to skip or defer a feature
* Choosing safe defaults

---

## Progress log requirement

Maintain `runs/<run_id>/PROGRESS.md`.

Use this format:

```md
# Progress Log: <task_id>

| Time | Phase | Action | Status | Evidence | Next |
|------|-------|--------|--------|----------|------|
```

Every meaningful step must be visible here.

---

## Command log requirement

Maintain `runs/<run_id>/COMMANDS.md`.

Before running commands, record intent.

After running commands, record result.

Use:

```md
# Command Log: <task_id>

| Time | Command | Purpose | Result | Notes |
|------|---------|---------|--------|-------|
```

Do not log secrets, tokens, passwords, private keys, or sensitive data.

---

## Task file generation

When the user provides only `TASK: ...`, create:

```text
tasks/generated/<task_id>.md
```

Use this format:

````md
# Task: <task_id>

```yaml
task_id: <task_id>
mode:
  - <mode>
objective: >
  <objective inferred from user task>
background: >
  <expanded background>
target:
  repo: .
  output_directories:
    - runs/<run_id>/
    - docs/
    - knowledge/
    - simulator/
    - experiments/
inputs:
  user_task: |
    <original task text>
outputs:
  - runs/<run_id>/DASHBOARD.md
  - runs/<run_id>/PLAN.md
  - runs/<run_id>/DECISIONS.md
  - runs/<run_id>/RESULT.md
constraints:
  max_attempts: 100
  timeout_seconds: 3600
  network_allowed: false
  destructive_actions_allowed: false
  download_policy: open_access_only
  paywall_bypass_allowed: false
  copyrighted_mass_download_allowed: false
success_condition: >
  The task is completed with documented decisions, visible progress,
  validated outputs, and a final result.
stop_condition: >
  Stop when success condition is met, limits are reached, or a safety blocker appears.
validation_method: >
  Use tests, inspection, reproducible logs, and result comparison where applicable.
````

## User task

<original task text>
```

---

## Default assumptions

If the user does not specify constraints, use:

```yaml
max_attempts: 100
timeout_seconds: 3600
network_allowed: false
destructive_actions_allowed: false
download_policy: open_access_only
paywall_bypass_allowed: false
copyrighted_mass_download_allowed: false
write_outside_repo_allowed: false
```

For research tasks, network may be enabled only if needed and only for legitimate public/open sources.

For coding tasks, file edits inside the repository are allowed.

For destructive actions, external targets, credentials, account automation, scraping, or paywall bypassing, stop and ask for approval or refuse if unsafe.

---

## Planning behavior

Always create:

```text
runs/<run_id>/PLAN.md
```

Plan format:

```md
# Plan: <task_id>

## Objective

## Interpreted task

## Mode classification

## Scope

## Out of scope

## Assumptions

## Safety and ethics check

## UI/UX requirement

## Architecture plan

## Research plan

## Build plan

## Experiment/search plan

## Validation plan

## Artifacts to create or modify

## Risks and limitations

## Stop condition

## Execution checklist
```

If the task is safe and low risk, proceed after writing the plan.

If the task is risky, destructive, external, credential-related, or legally ambiguous, stop before execution.

---

## UI/UX requirement

If the task involves any user-facing software, dashboard, simulator, app, web UI, CLI, or visualization, you must create:

```text
docs/UI-UX-SPEC.md
```

The UI/UX spec must include:

```md
# UI/UX Spec

## Product goal

## Primary users

## Main user flows

## Screens

## Components

## Navigation

## Layout

## States

### Empty state

### Loading state

### Success state

### Error state

### Partial result state

## Progress visibility

## Decision visibility

## Experiment visibility

## Accessibility

## Responsive behavior

## Interaction details

## Data displayed

## Visual hierarchy

## Future improvements
```

The user must be able to see:

* What the system is doing
* Why it made a decision
* What phase it is in
* What has already completed
* What failed
* What is next
* What artifacts were created

For simulator projects, include a visible UI panel with:

```text
Task status
Simulation state
Current parameters
Search progress
Best candidate
Decision log
Experiment log
Validation result
```

---

## Software architecture requirement

If the task involves building software, create or update:

```text
docs/ARCHITECTURE.md
```

Include:

```md
# Architecture

## Overview

## Modules

## Data flow

## State model

## File structure

## Core abstractions

## Interfaces

## Error handling

## Testing strategy

## Extension points

## Known limitations
```

For simulation projects, separate:

```text
simulation core != renderer != experiment runner != UI dashboard
```

Example:

```text
simulator/models/       physics/math core
simulator/threejs/      rendering and interaction
experiments/            bounded search and validation
knowledge/              research notes and equations
runs/                   task progress and result logs
```

---

## Research behavior

For research tasks:

1. Prefer open-access sources.
2. Do not bypass paywalls.
3. Do not mass-download copyrighted papers.
4. Store metadata even when full text is unavailable.
5. Summarize in your own words.
6. Record citations.
7. Separate facts, assumptions, and speculation.
8. Extract equations, algorithms, and simulation relevance.

Create notes under:

```text
knowledge/papers/
knowledge/concepts/
knowledge/equations/
knowledge/algorithms/
```

---

## Experiment/search behavior

For brute-force, parameter search, optimization, or simulation search:

1. Define the search space.
2. Define bounds.
3. Define scoring function.
4. Define stop condition.
5. Define validation method.
6. Use deterministic seeds when possible.
7. Log every attempt or batch summary.
8. Track best candidate.
9. Stop on success, timeout, max attempts, or safety issue.

Create:

```text
experiments/results/<experiment_id>.md
```

Experiment result format:

```md
# Experiment Result: <experiment_id>

## Objective

## Search space

## Parameters

## Scoring function

## Best candidate

## Attempts

## Result

## Validation

## Decision impact

## Next experiment
```

---

## Execution style

Work in small visible increments.

After each major phase, update:

```text
DASHBOARD.md
PROGRESS.md
DECISIONS.md
```

Do not silently make major decisions.

Do not hide failed attempts.

Do not delete useful logs.

Do not claim something works unless it was validated.

If validation cannot be run, say so clearly in `VALIDATION.md`.

---

## Console response format

When responding to the user, use this format:

```md
## Status

Current phase:
Progress:
Last completed:
Currently doing:
Next:

## Files updated

- ...

## Important decisions

- ...

## Blockers

- ...

## How to inspect

Open:

- runs/<run_id>/DASHBOARD.md
- runs/<run_id>/DECISIONS.md
- runs/<run_id>/PROGRESS.md
```

Keep responses concise, but always show where the user can inspect progress.

---

## Safety rules

Never assist with:

* Unauthorized account brute force
* Password spraying
* Credential stuffing
* Rate-limit bypass
* Paywall bypassing
* Stealth automation
* Data exfiltration
* Attacking third-party systems without written authorization
* Secret/token extraction
* Malware or persistence

If the task is unsafe, stop and write:

```text
runs/<run_id>/SAFETY-BLOCKER.md
```

Then suggest a safe local, simulated, educational, or authorized alternative.

---

## Definition of done

A task is complete only when these exist:

```text
runs/<run_id>/DASHBOARD.md
runs/<run_id>/TASK.md
runs/<run_id>/PLAN.md
runs/<run_id>/PROGRESS.md
runs/<run_id>/DECISIONS.md
runs/<run_id>/VALIDATION.md
runs/<run_id>/RESULT.md
runs/<run_id>/NEXT-STEPS.md
```

For software tasks, also require:

```text
docs/UI-UX-SPEC.md
docs/ARCHITECTURE.md
```

For research tasks, also require at least one relevant note under:

```text
knowledge/
```

For experiment tasks, also require:

```text
experiments/results/
```

---

## Start behavior

When invoked, immediately do this:

1. Read `AGENTS.md`.
2. Read this `INSTRUCTIONS.md`.
3. Read any other mentioned files.
4. Find the `TASK:` block.
5. Create a run id.
6. Create dashboard and logs.
7. Generate the task file.
8. Generate the plan.
9. Begin safe execution.
10. Keep progress and decisions visible.

Do not wait for the user to manually create the task file.
