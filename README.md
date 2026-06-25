# AI-Assisted Bruteforce Framework

> AI-assisted bounded search framework for authorized testing, CTF/lab work, debugging, fuzzing, and combinatorial problem solving.

## What is this?

This project is a framework for running **AI-assisted brute-force/search tasks**.

The AI does not blindly attack targets. Instead, it helps with:

- Understanding the task
- Defining the search space
- Generating safe candidate strategies
- Running bounded experiments
- Reading results
- Refining the next attempt
- Logging what worked and what failed

The core idea:

```text
Task -> Safety Check -> Plan -> Generate Candidates -> Run -> Observe -> Refine -> Stop
```

## Allowed use cases

This framework is intended for:

* CTF challenges
* Local lab environments
* Owned systems
* Authorized security testing
* Fuzzing local programs
* Parameter search
* Input mutation testing
* Puzzle solving
* Debugging search-heavy problems
* Optimization experiments

## Disallowed use cases

Do not use this framework for:

* Brute-forcing real accounts
* Password spraying
* Credential stuffing
* Bypassing rate limits
* Attacking public systems without written authorization
* Evading detection
* Stealth, persistence, or unauthorized access
* Collecting or using leaked credentials

If the task involves a real third-party system, the task must include proof of authorization.

## Framework principles

1. **Authorization first**
   No task runs unless the target is owned, local, lab-based, or explicitly authorized.

2. **Bounded execution**
   Every run must define limits: max attempts, timeout, rate, scope, and stop condition.

3. **Human-controlled objective**
   The human defines the task. The AI assists planning and iteration.

4. **Reproducible logs**
   Every attempt should be logged with inputs, command, result, and conclusion.

5. **No unsafe escalation**
   The agent must refuse to add stealth, evasion, credential abuse, or public-target attack logic.

## Recommended repo structure

```text
.
├── README.md
├── AGENTS.md
├── CLAUDE.md
├── tasks/
│   ├── TEMPLATE.md
│   └── examples/
│       ├── local-fuzzing.md
│       ├── ctf-search.md
│       └── parameter-search.md
├── prompts/
│   ├── planner.md
│   ├── evaluator.md
│   └── safety-check.md
├── runs/
│   └── .gitkeep
├── policies/
│   ├── allowed-use.md
│   └── safety-rules.md
└── scripts/
    └── run_task.sh
```

## Task lifecycle

### 1. Create a task

Create a file under `tasks/`.

Use this format:

```yaml
task_id: example-local-search
mode: local_lab
authorization: owned_system
target: ./local-program
objective: Find input that triggers expected local behavior
constraints:
  max_attempts: 1000
  timeout_seconds: 300
  network_allowed: false
  destructive_actions_allowed: false
success_condition: Program returns expected local output
stop_condition: Success, timeout, or max attempts reached
```

### 2. Ask the AI agent to plan

Example prompt:

```text
Read AGENTS.md and tasks/example-local-search.md.
Do not execute yet.
Create a safe bounded plan in runs/example-local-search/PLAN.md.
```

### 3. Review the plan

The plan must include:

* Scope
* Assumptions
* Safety check
* Search strategy
* Candidate generation method
* Execution limits
* Logging format
* Stop condition

### 4. Execute only after review

Example prompt:

```text
Execute the approved plan.
Stay within the task constraints.
Log every attempt to runs/example-local-search/log.md.
Stop immediately when the stop condition is met.
```

### 5. Evaluate

After execution, the AI should produce:

```text
runs/<task_id>/
├── PLAN.md
├── log.md
├── result.md
└── next-steps.md
```

## Supported task modes

### `local_lab`

For local-only tasks.

```yaml
mode: local_lab
network_allowed: false
```

### `ctf`

For CTF, wargame, or challenge-box tasks.

```yaml
mode: ctf
authorization: challenge_environment
```

### `fuzzing`

For input mutation against a local binary, parser, API mock, or test harness.

```yaml
mode: fuzzing
target: ./target-local-binary
```

### `parameter_search`

For optimization or configuration search.

```yaml
mode: parameter_search
objective: Find best parameter combination under constraints
```

## Safety checklist

Before running any task, the agent must answer:

```text
[ ] Is the task local, owned, CTF, or explicitly authorized?
[ ] Is the target clearly defined?
[ ] Are max attempts and timeout defined?
[ ] Is network access disabled unless explicitly allowed?
[ ] Are destructive actions disabled?
[ ] Is the success condition measurable?
[ ] Is the stop condition clear?
[ ] Are logs enabled?
```

If any required item fails, the agent must stop and ask for correction.

## Example agent command

```text
You are assisting with an authorized bounded search task.
Read AGENTS.md.
Read the task file.
Perform the safety check.
Create a plan first.
Do not execute until the plan is approved.
```

## Naming note

The name "bruteforce" here means **bounded exhaustive search**, not unauthorized account attacks.
