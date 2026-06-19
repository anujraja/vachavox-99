# Codex State — Single Source of Truth

> Update this file at the end of every meaningful work session and every phase
> gate. Do not leave stale status.

## Project identity

- Repository: `anujraja/vachavox-99`
- App: VachaVox
- Goal: paid USD $0.99, one-time-purchase, App-Store-submission-ready native
  macOS dictation app
- Baseline: macOS 26, Apple Silicon
- Current packet version: 1.0
- Last updated: `2026-06-19 20:55 IST`

## Current phase

- Active phase: `P1 — Discovery, source audit, and constraints`
- Status: `IN PROGRESS`
- Next required action: Clone/read the original `anujraja/VachaVox` source
  read-only, audit dependencies/licences/source boundaries, inspect local SDK
  availability, and record the concrete migration map.
- Current blocker: Full Xcode is not selected: `xcodebuild -version` reports
  active developer directory `/Library/Developer/CommandLineTools`.

## Gate dashboard

| Gate | Status | Evidence location | Notes |
|---|---|---|---|
| P0 repository/template bootstrap | PASSED | `docs/qa/QA-LOG.md` P0 row | Public repo created, pushed, packet check passed, placeholders resolved, `main` protection requires CI |
| P1 source/license/platform discovery | IN PROGRESS | — | Full Xcode selection must be verified before SDK/build claims |
| P2 speech feasibility spike | NOT STARTED | — | — |
| P3 sandboxed hotkey/text-delivery spike | NOT STARTED | — | — |
| P4 native app foundation/archive path | NOT STARTED | — | — |
| P5 end-to-end dictation core | NOT STARTED | — | — |
| P6 onboarding/simple settings/cleanup | NOT STARTED | — | — |
| P7 accessibility/privacy/performance QA | NOT STARTED | — | — |
| P8 release pack/submission-ready | NOT STARTED | — | — |

Allowed statuses:
- NOT STARTED
- IN PROGRESS
- BLOCKED
- PASSED
- PASSED WITH LIMITATION

## Last verified commands

| Date | Command | Result | Environment |
|---|---|---|---|
| 2026-06-19 | `scripts/bootstrap-repository.sh` | PASS: created local repo and public remote `anujraja/vachavox-99`, pushed `main` | macOS 26.5.1 (25F80), git 2.50.1, gh authenticated as `anujraja` |
| 2026-06-19 | `scripts/check-control-packet.sh` | PASS: control packet structure is complete | macOS 26.5.1 (25F80) |
| 2026-06-19 | `scripts/setup/enable-main-protection.sh` | PASS: GitHub branch protection for `main` requires `ci` | GitHub repo `anujraja/vachavox-99` |
| 2026-06-19 | `xcodebuild -version` | BLOCKED: active developer directory is CommandLineTools, not full Xcode | macOS 26.5.1 (25F80) |

## Current known limitations

- Full Xcode is not currently selected. P1 must verify whether Xcode is
  installed and switch/install only through an Apple-supported path before any
  SDK, build, or archive evidence can pass.

## Human-only tasks awaiting Anuj

- H-02 Apple Developer Program/team remains needed for signed archive work.
- H-03 Bundle ID confirmation remains needed before final App Store records.
- H-04 macOS privacy prompt approvals remain needed during permission QA.
- H-05 through H-08 remain App Store Connect/final submission tasks.

## Next-session handoff

```text
Read AGENTS.md, this state file, docs/10-EXECUTION-LOOP.md, and the P1 routing
docs: docs/03-TECHNICAL-DECISIONS.md, docs/04-SOURCE-MIGRATION.md,
docs/11-OFFICIAL-REFERENCES.md, docs/LEGAL_AND_ATTRIBUTION.md, and
docs/07-RISK-REGISTER.md. Continue P1 by auditing the original source
read-only and resolving local Xcode/SDK availability before making build
claims.
```
