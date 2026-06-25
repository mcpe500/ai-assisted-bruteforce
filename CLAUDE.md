# Claude Code Instructions

Read and follow `AGENTS.md`.

This repository uses `AGENTS.md` as the canonical instruction file for AI coding agents.

This project is an **AI-assisted research, simulation, and bounded brute-force exploration framework**. The word "bruteforce" means systematic bounded exploration, not unauthorized attacks.

Do not execute any task until:

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
prompts/        - Role-specific prompts for agent behaviors
policies/       - Research ethics, copyright, allowed use
runs/           - Per-task output (plans, logs, results)
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

If there is any conflict between this file and `AGENTS.md`, follow the safer instruction.
