# Decisions

## D-001 — Product scope

**Decision:** Build one small paid Mac dictation utility, not a suite.  
**Status:** Accepted.  
**Reason:** USD $0.99 price and zero-hosting model require low support burden and
a clear instant value proposition.

## D-002 — Native stack

**Decision:** Use Swift/SwiftUI/AppKit bridges and Xcode archive.  
**Status:** Accepted.  
**Reason:** VachaVox depends on macOS-native audio, permissions, menu bar,
accessibility-aware delivery, and app packaging.

## D-003 — Speech strategy

**Decision:** Verify Apple on-device speech as primary; retain original local
engine concepts only as audited fallback.  
**Status:** P1 platform symbols present; runtime proof pending P2.  
**Reason:** The system path may create a lighter onboarding and benefit from
current local OS capability, but availability cannot be guessed.

**P1 evidence:** On 2026-06-19, macOS 26.5.1 Command Line Tools SDK exposed
`SpeechAnalyzer`, `SpeechTranscriber`, `AssetInventory`, `Speech.framework`,
and `FoundationModels.framework`. `swift -e 'import Speech; import
FoundationModels; ...'` typechecked and printed those symbol names. Full Xcode
is not installed/selected, so archive/UI build evidence remains blocked.

## D-004 — macOS 27 policy

**Decision:** Ship baseline macOS 26; use macOS 27 only for optional
availability-gated refinement once verified locally.  
**Status:** Accepted.  
**Reason:** No submission-critical feature may depend on beta/unverified APIs.

## D-005 — Distribution

**Decision:** Paid Mac App Store at USD $0.99 with public source after license
audit.  
**Status:** Accepted.  
**Reason:** Apple handles payment and updates; source supports trust/portfolio.

## D-006 — Direct delivery feasibility

**Decision:** Make sandboxed hotkey/active-app paste a hard early gate; clipboard
fallback is always required.  
**Status:** Pending P3.  
**Reason:** No unsupported workaround is acceptable.

## D-007 — Source migration boundary

**Decision:** Reuse/refactor only the original audio capture, permission,
hotkey/session-state, text-delivery fallback, and relevant tests. Quarantine
FluidAudio/WhisperKit as fallback candidates and do not migrate the model
browser, manual folders, file transcription, diagnostics UI, old screenshots,
or technical engine labels.  
**Status:** Accepted after P1 audit.  
**Reason:** The reusable core supports VachaVox 99's promise, while the old
model-management UX violates the no-technical-setup invariant.

## D-008 — Build tooling prerequisite

**Decision:** Continue P2 command-line speech spikes with Swift 6.3.2 where
possible, but require full Xcode before claiming app build, preview macro,
archive, signing, or App Store readiness.  
**Status:** Accepted with human task H-09.  
**Reason:** Original `swift test` fails under Command Line Tools on
KeyboardShortcuts `#Preview` macro expansion, and `xcodebuild -version` reports
that only CommandLineTools is selected.
