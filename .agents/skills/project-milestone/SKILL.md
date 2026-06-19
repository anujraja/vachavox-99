---
name: project-milestone
description: Execute one approved project milestone or plan phase end to end with branch, checks, QA, docs, and PR handoff.
---

# Project Milestone

Use this for "execute milestone", "continue the plan", "do the next phase", or
any approved program work.

## Inputs

- `AGENTS.md`
- `docs/ARCHITECTURE.md`
- The approved plan in `docs/futurework/` or the issue linked by the user
- Relevant project skills for UI, architecture, QA, release, storage, or data

## Rules

- Work on one milestone only.
- Branch from fresh `main`.
- Keep unrelated findings out of the implementation; record them in
  `docs/qa/KNOWN-ISSUES.md` or `docs/futurework/ROADMAP.md`.
- Do not merge your own production PR unless explicitly instructed.
- Human-only setup belongs in `docs/humantask/CHECKLIST.md`.

## Procedure

1. Orient: read the inputs and identify the exact milestone scope.
2. Branch: `git fetch origin && git switch -c feat/<slug> origin/main`.
3. Implement the smallest complete version that satisfies the milestone.
4. Update or add tests for changed behavior.
5. Update docs in the same branch: changelog, architecture, QA, known issues,
   or roadmap as applicable.
6. Run the project checks from `AGENTS.md`.
7. Run `project-qa` for touched flows.
8. Push the branch and open a PR.
9. Stop and report PR, checks, QA result, and any deferred work.

## Done

- The milestone behavior works locally.
- Relevant checks are green or exact blockers are documented.
- QA records are current.
- The PR is ready for human review.

