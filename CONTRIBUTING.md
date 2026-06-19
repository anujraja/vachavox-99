# Contributing

{{PROJECT_NAME}} uses a trunk-based workflow: `{{DEFAULT_BRANCH}}` is the
mainline, work happens on short-lived branches, and changes land through a PR
that passes CI and review.

Read [docs/BRANCHING.md](docs/BRANCHING.md) and [AGENTS.md](AGENTS.md) before
starting.

```bash
git fetch origin
git switch -c feat/<slug> origin/{{DEFAULT_BRANCH}}
{{TYPECHECK_COMMAND}}
{{LINT_COMMAND}}
{{TEST_COMMAND}}
{{BUILD_COMMAND}}
git push -u origin feat/<slug>
```

Do not push directly to `{{DEFAULT_BRANCH}}`. Agents stop after opening a green,
QA-ready PR unless explicitly instructed otherwise.

