# Contributing

VachaVox uses a trunk-based workflow: `main` is the
mainline, work happens on short-lived branches, and changes land through a PR
that passes CI and review.

Read [docs/BRANCHING.md](docs/BRANCHING.md) and [AGENTS.md](AGENTS.md) before
starting.

```bash
git fetch origin
git switch -c feat/<slug> origin/main
swift test or xcodebuild test after project creation
No linter configured yet
swift test or xcodebuild test after project creation
xcodebuild build after project creation
git push -u origin feat/<slug>
```

Do not push directly to `main`. Agents stop after opening a green,
QA-ready PR unless explicitly instructed otherwise.

