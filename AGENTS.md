# VachaVox 99 — Agent Operating System

## Authority and reading order

This file is the permanent operating system for coding agents in this
repository. Follow higher-priority system/developer/user instructions first.
Then follow this file.

Before any command or edit, read files in this exact order:

1. `README.md`
2. `AGENTS.md`
3. `docs/00-FILE-ROUTING.md`
4. `docs/01-PRODUCT-NORTH-STAR.md`
5. `docs/09-CODEX-STATE.md`
6. `docs/10-EXECUTION-LOOP.md`
7. The documents named by the active phase in `docs/09-CODEX-STATE.md`.

Never rely on memory of a past session. `docs/09-CODEX-STATE.md` is the single
source of truth for current phase, completed evidence, next actions, blockers,
and the last verified build/test results.

## Mission

Build `VachaVox`: a paid USD $0.99, one-time-purchase Mac App Store utility
that lets ordinary people hold one shortcut, speak, and receive polished text
in the app they were already using.

The experience must be:
- private;
- offline after any required system/local speech asset is ready;
- effortless for nontechnical and older users;
- smaller, calmer, and more trustworthy than power-user dictation tools;
- native-feeling on current macOS;
- technically serious enough to be a flagship portfolio project.

## Product invariants — never violate

1. No subscriptions, accounts, ads, analytics, trackers, telemetry, backend,
   cloud transcription, API keys, or user database.
2. No technical model/engine names in normal customer UI.
3. No Terminal, manual model folders, manual model downloads, or model-choice
   research required during normal onboarding.
4. No Tauri, Rust, React, Electron, webview UI, Node runtime, or embedded web
   dashboard. Use native Swift/SwiftUI/AppKit/AVFoundation/Speech.
5. No fake Liquid Glass. Use current native controls/materials and preserve
   legibility/accessibility.
6. No competitor copying. Build an independent clean-room product.
7. No raw, unsupported shell automation that bypasses macOS privacy controls,
   App Sandbox, or App Review rules.
8. Never claim “App Store-ready,” “offline,” “private,” “faster,” “Apple
   model,” or “works anywhere” without proof in docs/qa.
9. Do not bundle large third-party model weights by default. Keep the binary
   light and use Apple system-managed/local assets where policy and APIs allow.
10. Do not broaden the product. A missing core promise is more important than
    twenty optional features.

## Source migration policy

The prior app `anujraja/VachaVox` is read-only source material. Do not change
it. Read `docs/04-SOURCE-MIGRATION.md` before porting.

Reuse/refactor only original, ownership-clear parts that support:
- microphone capture;
- dictation lifecycle and cancellation;
- hotkey abstraction;
- paste/copy delivery;
- permission handling;
- local transcript normalization;
- menu bar and lightweight overlay behaviour;
- tests and packaging lessons.

Do not migrate the old technical model browser, manual model roots,
file-transcription workflow, large Settings sidebar, benchmark controls,
debug surfaces, or any user-visible technical language.

## Hard feasibility gates

Before building deeply, prove these gates with a minimal native spike:

A. **Speech gate**  
   The current locally installed Xcode SDK can compile and run the chosen
   on-device speech path. Test current Apple APIs first. If they are absent,
   limited by locale/device, or unsuitable, implement a clearly documented
   local fallback that still preserves privacy and a simple onboarding flow.

B. **Mac App Store typing gate**  
   A sandboxed Release/archive candidate can responsibly support global
   shortcut + active-app text delivery using Apple-supported mechanisms and
   user-controlled permissions. Test on a clean user profile if practical.
   If direct paste is blocked or App Review compatibility is uncertain, do not
   hide it: preserve a reliable copy-to-clipboard fallback, document exact
   evidence, and avoid unsupported bypasses.

C. **Clean-up gate**  
   Deterministic local cleanup preserves URLs, code, file paths, identifiers,
   email addresses, numbers, and user meaning. Optional Apple on-device
   Foundation Models enhancement may improve results only when available; it
   can never be required for the core experience.

D. **Archive gate**  
   The Xcode project can produce a Release archive with App Sandbox,
   appropriate usage strings, a privacy manifest, proper app icon, and no
   unresolved compile/signing configuration defects that can be fixed without
   Anuj’s Apple credentials.

A hard gate is passed only when `docs/qa/QA-LOG.md` records:
- date/time;
- Mac and macOS/Xcode version;
- exact command or manual steps;
- result;
- any limitations;
- relevant screenshots/log artifact paths where available.

## Execution method

Work by the phase system in `docs/10-EXECUTION-LOOP.md`.

For every meaningful milestone:
1. Read the files governing that scope.
2. Make a small coherent change.
3. Run the exact relevant validation.
4. Record evidence in `docs/qa/QA-LOG.md`.
5. Update `docs/09-CODEX-STATE.md`.
6. Update `CHANGELOG.md` under `Unreleased` for user-visible behaviour.
7. Update the relevant spec/decision/risk doc if behaviour, permissions,
   packaging, licensing, or App Store scope changes.
8. Commit with a narrow, descriptive message.

Never make a giant unrelated sweep. Never leave docs claiming a feature exists
when it is only planned.

## “Keep going” rule

Continue autonomously to the next incomplete, unblocked milestone. Do not ask
for confirmation merely to proceed.

Ask only when:
- a required legal/ownership fact cannot be verified;
- an irreversible paid account/financial/identity action is needed;
- multiple options would materially change the product promise and the packet
  does not decide between them;
- a current platform rule must be verified but official primary sources are
  unavailable.

When a human-only task blocks something:
- create or update the exact task in `docs/12-HUMAN-ONLY-TASKS.md`;
- state the requested account, screen, field, and value;
- record the blocker in `docs/09-CODEX-STATE.md`;
- continue every task that does not require the human action.

## Documentation and source-of-truth rules

- Current user-facing promises: `docs/01-PRODUCT-NORTH-STAR.md`
- UI/interaction behaviour: `docs/02-UX-SPEC.md`
- Architecture/platform choices: `docs/03-TECHNICAL-DECISIONS.md`
- Original-product migration: `docs/04-SOURCE-MIGRATION.md`
- App Store/sandbox/review criteria: `docs/05-APP-STORE-GATE.md`
- Quality/performance/accessibility bar: `docs/06-QUALITY-BAR.md`
- Risks and unknowns: `docs/07-RISK-REGISTER.md`
- Release copy/assets/submission pack: `docs/08-RELEASE-PACK.md`
- Work state: `docs/09-CODEX-STATE.md`
- Phase gates: `docs/10-EXECUTION-LOOP.md`
- Primary-source references: `docs/11-OFFICIAL-REFERENCES.md`
- Human-only tasks: `docs/12-HUMAN-ONLY-TASKS.md`

Do not create duplicate “final plan,” “latest plan,” or hidden notes files.
Update the authoritative document instead.

## Engineering standards

- Use Swift concurrency responsibly. UI mutations on `@MainActor`; isolate
  long-running engine/asset work behind actors/services.
- Build the smallest dependency surface possible.
- Prefer Apple frameworks over third-party dependencies when they satisfy the
  requirement.
- Every dependency requires an owner, purpose, license audit, current version,
  and removal rationale in `docs/LEGAL_AND_ATTRIBUTION.md`.
- Every local speech asset route requires documented licence and redistribution
  status. Never assume a public Hugging Face asset may be embedded or
  auto-downloaded without checking its terms.
- No network call on the dictation hot path.
- Release audio and microphone resources immediately after each session.
- Never retain raw audio or clipboard contents longer than necessary.
- Default settings must be safe, modest, and understandable.
- Give every control a VoiceOver label and non-colour state cue.
- Protect password/secure fields where detectable; never imply the app can
  safely dictate into secrets.

## Validation baseline

After code changes, run the strongest applicable check:
- unit tests;
- UI/integration tests;
- lint/format/static analysis;
- debug build;
- release build/archive checks when packaging is affected;
- manual smoke path for permission, paste/copy, hotkey, offline, or overlay work.

If validation cannot run, record:
- what was attempted;
- why it was blocked;
- what is unverified;
- the next best available validation.

## Completion definition

“Submission-ready” requires every non-human gate in
`docs/10-EXECUTION-LOOP.md` marked passed with evidence. It does not include
clicking Submit for Review. That final click remains Anuj’s responsibility.
