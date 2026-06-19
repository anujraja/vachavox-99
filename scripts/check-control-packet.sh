#!/usr/bin/env bash
set -euo pipefail

required=(
  README.md
  00-CODEX-GOAL.md
  AGENTS.md
  docs/00-FILE-ROUTING.md
  docs/01-PRODUCT-NORTH-STAR.md
  docs/02-UX-SPEC.md
  docs/03-TECHNICAL-DECISIONS.md
  docs/04-SOURCE-MIGRATION.md
  docs/05-APP-STORE-GATE.md
  docs/06-QUALITY-BAR.md
  docs/07-RISK-REGISTER.md
  docs/08-RELEASE-PACK.md
  docs/09-CODEX-STATE.md
  docs/10-EXECUTION-LOOP.md
  docs/11-OFFICIAL-REFERENCES.md
  docs/12-HUMAN-ONLY-TASKS.md
  docs/qa/QA-LOG.md
  docs/qa/KNOWN-ISSUES.md
)

missing=0
for path in "${required[@]}"; do
  if [[ ! -f "$path" ]]; then
    echo "MISSING: $path"
    missing=1
  fi
done

if [[ "$missing" -ne 0 ]]; then
  exit 1
fi

echo "Control packet structure is complete."
