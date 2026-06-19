# Branching And Release Workflow

This repo uses a trunk-based workflow optimized for small, reviewable changes.

## Rule

`{{DEFAULT_BRANCH}}` is the mainline. Do not push directly to it.

All code reaches `{{DEFAULT_BRANCH}}` through a PR that passes CI, receives the
required review, and has QA notes for touched flows.

AI agents open a green, QA-ready PR and stop for human review unless explicitly
instructed otherwise.

## Branches

| Branch | Purpose |
| --- | --- |
| `{{DEFAULT_BRANCH}}` | Production or mainline trunk |
| `feat/<slug>` | Features and milestones |
| `fix/<slug>` | Bug fixes |
| `docs/<slug>` | Documentation-only changes |
| `hotfix/<slug>` | Production-down fixes with explicit approval |

Branch from fresh `{{DEFAULT_BRANCH}}`:

```bash
git fetch origin
git switch -c feat/<slug> origin/{{DEFAULT_BRANCH}}
```

## Lifecycle

1. Branch from fresh `{{DEFAULT_BRANCH}}`.
2. Implement one focused change.
3. Run the commands listed in `AGENTS.md`.
4. Update tests, changelog, architecture, QA records, and known issues as needed.
5. Push the feature branch.
6. Open a PR.
7. QA the preview or local build.
8. Stop for human review and merge.

## Hard Rules

- Never commit secrets.
- Never force-push shared branches.
- Never self-merge production PRs as an agent unless explicitly instructed.
- Keep migrations additive unless a destructive change has explicit approval,
  backup, rollback, and maintenance-window notes.
- Business or strategy docs can live on a separate planning branch if the
  project needs one; engineering docs should travel with the code change.

## Release Notes

Release instructions, environment details, and rollback steps live in
`docs/MAINTENANCE.md`. Use the `project-release` skill before production
deploys or version tags.

