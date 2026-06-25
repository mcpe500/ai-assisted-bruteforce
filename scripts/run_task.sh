#!/bin/bash
# run_task.sh - Execute an AI-assisted bounded search task
#
# Usage: ./scripts/run_task.sh <task_file>
#
# This script validates a task file and prepares the run directory.
# Actual execution is performed by the AI agent after plan approval.

set -euo pipefail

TASK_FILE="${1:?Usage: run_task.sh <task_file>}"

if [[ ! -f "$TASK_FILE" ]]; then
  echo "Error: Task file not found: $TASK_FILE" >&2
  exit 1
fi

# Extract task_id from YAML
TASK_ID=$(grep -E '^task_id:' "$TASK_FILE" | awk '{print $2}' | tr -d '"')

if [[ -z "$TASK_ID" ]]; then
  echo "Error: task_id not found in $TASK_FILE" >&2
  exit 1
fi

RUN_DIR="runs/$TASK_ID"

mkdir -p "$RUN_DIR"

echo "Task: $TASK_ID"
echo "Run directory: $RUN_DIR"
echo "Task file: $TASK_FILE"
echo ""
echo "Next steps:"
echo "  1. Ask the AI agent to create a plan: $RUN_DIR/PLAN.md"
echo "  2. Review the plan"
echo "  3. Approve execution"
