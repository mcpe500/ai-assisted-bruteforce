# Claude Code Instructions

Read and follow `AGENTS.md` and `INSTRUCTIONS.md`.

This repository uses `AGENTS.md` as the canonical instruction file and `INSTRUCTIONS.md` as the orchestration protocol.

This project is an **AI-assisted research, simulation, and bounded brute-force exploration framework**. The word "bruteforce" means systematic bounded exploration, not unauthorized attacks.

## Single-shot invocation

When the user writes:

```text
@AGENTS.md
@INSTRUCTIONS.md

TASK: <task description>
```

Follow the full orchestration protocol in `INSTRUCTIONS.md`:

1. Parse the task and generate a task id.
2. Classify the task mode.
3. Create a task file under `tasks/generated/`.
4. Create a run workspace under `runs/<timestamp>-<task_id>/`.
5. Create DASHBOARD.md, PROGRESS.md, DECISIONS.md, PLAN.md.
6. Execute safe steps.
7. Validate outputs.
8. Produce RESULT.md and NEXT-STEPS.md.

For non-orchestrated tasks, do not execute until:

1. The task file is present under `tasks/`.
2. The task mode is classified.
3. Authorization is explicit.
4. A safety and feasibility check has been run.
5. A bounded plan has been written to `runs/<task_id>/PLAN.md`.
6. The user approves execution.

## Key directories

```text
knowledge/      - Papers, concepts, equations, algorithms, glossary
simulator/      - Physics models (models/), Three.js renderer (threejs/), validation (validation/)
experiments/    - Experiment definitions and results
tasks/          - Task files with required YAML fields
tasks/generated/ - Auto-generated task files from orchestrator
prompts/        - Role-specific prompts for agent behaviors
policies/       - Research ethics, copyright, allowed use
runs/           - Per-task output (dashboards, plans, logs, results)
docs/           - UI/UX specs, architecture docs, implementation notes
```

## Research rules

* Prefer open-access sources.
* Do not bypass paywalls.
* Store metadata and citations even when PDFs cannot be downloaded.
* Separate proven physics from assumptions and speculation.

## Simulation rules

* Keep simulation core (math/physics) separate from Three.js renderer.
* Document all assumptions.
* Use deterministic seeds for reproducibility.

## If conflict

If there is any conflict between this file, `AGENTS.md`, and `INSTRUCTIONS.md`, follow the safest instruction.
