# Risk Register

Update this document when evidence changes. Risks are not defects; they are
uncertainties that need a decision, test, or human action.

| ID | Risk | Severity | Current rule / mitigation | Exit evidence | Owner |
|---|---|---:|---|---|---|
| R-01 | Current Apple on-device Speech APIs may vary by SDK, macOS, device, or locale | High | Build a spike before architecture lock; fallback must be local and simple | QA spike on target Macs/locales | Codex |
| R-02 | Sandboxed Mac App Store app may have constraints around global hotkeys/active-app paste | Critical | Make it Phase 1 feasibility gate; preserve clipboard fallback; no TCC bypass | Sandbox Release test + reviewer notes | Codex / Anuj |
| R-03 | Third-party dependency/model licences may block embedding or auto-download | High | Audit before adding; keep weights out of binary by default | License matrix and notices | Codex |
| R-04 | $0.99 pricing leaves little room for support burden | Medium | Ruthlessly reduce settings and support surface | V1 scope maintained | Product |
| R-05 | Cleanup could alter meaning/code/identifiers | High | Deterministic safe rules + protected-token test suite; raw toggle | Fixture suite and manual tests | Codex |
| R-06 | macOS 27 APIs/visuals may be beta or unavailable | Medium | macOS 26 release baseline; optional availability-gated additions only | Stable SDK test | Codex |
| R-07 | Apple speech asset download may require network capability | Medium | Prove exact behaviour; disclose accurately; no hot-path network | Network audit/QA | Codex |
| R-08 | Open source + App Store paid distribution creates license/expectation confusion | Medium | Explain source vs signed store convenience; use license only after audit | README/legal doc | Codex / Anuj |
| R-09 | Source migration brings old user-specific paths/technical UI debt | Medium | Strict migration table and no direct UI copying | Architecture/code review | Codex |
| R-10 | Marketing could overclaim against Apple/competitors | Medium | Evidence-only claims; no competitor naming | Release copy review | Codex / Anuj |
| R-11 | Full Xcode is not installed/selected on this Mac | Critical | Continue only command-line SDK spikes; do not claim app build/archive readiness until Xcode is installed and selected | `xcodebuild -version` succeeds with full Xcode and P4 archive evidence exists | Anuj / Codex |

## P1 evidence updates

- R-01 reduced but not resolved: the installed macOS 26 Command Line Tools SDK
  exposes `SpeechAnalyzer`, `SpeechTranscriber`, and `AssetInventory`, but P2
  must prove runtime asset availability, locale support, and offline behaviour.
- R-03 remains open: package source licences are identified, but Parakeet and
  WhisperKit model asset redistribution/download terms are not verified.
- R-09 reduced: old absolute model paths and technical model UI are explicitly
  excluded from migration.

## P2 evidence updates

- R-01 reduced further but not fully resolved: `SpeechAnalyzer` +
  `SpeechTranscriber` produced transcripts from local `say`-generated files
  with `en_US` assets already installed. Live microphone, clean permission
  prompt, cancellation during capture, and network-isolated offline proof remain
  open.
- R-07 remains open: `AssetInventory` reports `installed` for `en_US` and no
  install attempt was needed, but a network-disabled run has not been completed.
- R-05 gained a concrete follow-up: system speech misrecognized the product name
  in one sample, so deterministic cleanup must preserve meaning and any context
  tuning must be tested before use.

## Decision protocol

When a risk is resolved:
1. Add proof to QA log.
2. Change this table from uncertainty to resolved with date.
3. Update the technical/app-store/product document that depends on it.
4. Update state so no future session reopens a settled issue.
