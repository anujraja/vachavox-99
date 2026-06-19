---
name: project-qa
description: Test project flows, browser/manual behavior, command health, regressions, and QA records.
---

# Project QA

Use this for testing, verification, bug bash, preview checks, production smoke,
or the QA step of a milestone.

## Required Checks

- App or service starts in the documented local mode.
- No relevant console, server, or framework errors.
- Core flows touched by the change pass.
- Desktop and mobile behavior are checked when UI is touched.
- Accessibility basics are checked for UI changes: keyboard path, focus states,
  labels, contrast, and touch target size.
- Data changes are verified in both UI/API behavior and persistence where
  applicable.
- Cleanup status is recorded for test accounts, files, or data.

## Records

Append every meaningful QA run to `docs/qa/QA-LOG.md`.

If a limitation is found and not fixed in the same change, add it to
`docs/qa/KNOWN-ISSUES.md` with owner, status, and follow-up trigger.

If test accounts or durable test data are created, record them in
`docs/qa/TEST-ACCOUNTS.md` and mark cleanup status.

## Report Format

- Scope
- Environment or URL
- Commands run
- Browser and viewport coverage when relevant
- Scenario results: PASS, FAIL, or BLOCKED
- Evidence links or notes
- Cleanup performed
- Follow-ups filed

