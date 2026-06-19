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
- Last updated: `2026-06-19 21:43 IST`

## Current phase

- Active phase: `P3 — Sandboxed shortcut and text-delivery spike`
- Status: `BLOCKED`
- Next required action: Complete H-09 full Xcode install/selection, then create
  a minimal sandboxed native app target to test global shortcut, active-app
  text delivery, secure-field safety, and clipboard fallback.
- Current blocker: Full Xcode is not selected: `xcodebuild -version` reports
  active developer directory `/Library/Developer/CommandLineTools`. P3 requires
  a sandboxed app target/release candidate and cannot pass with Command Line
  Tools alone.

## Gate dashboard

| Gate | Status | Evidence location | Notes |
|---|---|---|---|
| P0 repository/template bootstrap | PASSED | `docs/qa/QA-LOG.md` P0 row | Public repo created, pushed, packet check passed, placeholders resolved, `main` protection requires CI |
| P1 source/license/platform discovery | PASSED WITH LIMITATION | `docs/qa/QA-LOG.md` P1 rows | Original source audited; package licences mapped; model asset terms and full Xcode remain unresolved |
| P2 speech feasibility spike | PASSED WITH LIMITATION | `docs/qa/QA-LOG.md` P2 rows | System `en_US` asset installed and local file transcript loop works; live mic/offline/no-network/cancellation tests pending |
| P3 sandboxed hotkey/text-delivery spike | BLOCKED | `docs/12-HUMAN-ONLY-TASKS.md` H-09 | Full Xcode needed for sandboxed app target/release candidate |
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
| 2026-06-19 | `swift test` in `/tmp/vachavox-original-p1-audit` | BLOCKED: KeyboardShortcuts `#Preview` macro needs Xcode `PreviewsMacros` plugin | Original VachaVox commit `df2c4044514ca98fcde12bb0f153effe6860a95d` |
| 2026-06-19 | `swift -e 'import Speech; import FoundationModels; ...'` | PASS: printed `SpeechAnalyzer`, `SpeechTranscriber`, `AssetInventory` | Swift 6.3.2, Command Line Tools macOS 26 SDK |
| 2026-06-19 | `swift build` | PASS: SwiftPM core/spike package builds | Swift 6.3.2, Command Line Tools macOS 26 SDK |
| 2026-06-19 | `swift run VachaVoxCoreSelfTest` | PASS: mock SpeechEngine boundary self-test passed | Swift 6.3.2 |
| 2026-06-19 | `swift run SpeechFeasibilitySpike --locale en_US --audio-file /tmp/vachavox-p2-sample.aiff` | PASS WITH LIMITATION: transcript produced from local generated speech | `assetStatus=installed`, transcript included `Hello from Vatchavox...` |
| 2026-06-19 | `swift test` | BLOCKED: no XCTest/Swift Testing modules under current Command Line Tools package environment | Swift 6.3.2, no full Xcode |

## Current known limitations

- Full Xcode is not currently selected. H-09 must be completed before any app
  build, signing, or archive evidence can pass.
- Original fallback model package source licences are mapped, but model asset
  redistribution/download terms are not verified.
- P2 has not proven live microphone permission flow, cancellation during
  recording, or network-isolated offline operation.
- System speech misrecognized `VachaVox` as `Vatchavox` in one generated sample.

## Human-only tasks awaiting Anuj

- H-02 Apple Developer Program/team remains needed for signed archive work.
- H-03 Bundle ID confirmation remains needed before final App Store records.
- H-04 macOS privacy prompt approvals remain needed during permission QA.
- H-05 through H-08 remain App Store Connect/final submission tasks.
- H-09 Full Xcode install/selection is required before app build/archive gates.

## Next-session handoff

```text
Read AGENTS.md, this state file, docs/10-EXECUTION-LOOP.md, and the P3 routing
docs: docs/05-APP-STORE-GATE.md, docs/11-OFFICIAL-REFERENCES.md,
docs/07-RISK-REGISTER.md, docs/12-HUMAN-ONLY-TASKS.md, and docs/qa/README.md.
P3 is blocked until H-09 installs/selects full Xcode. Continue only unblocked
documentation or command-line spike refinements without claiming sandbox,
archive, live microphone, or offline readiness.
```
