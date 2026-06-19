# Execution Loop — Build Until Submission-Ready

This is the canonical phase gate system. The agent works down this document in
order. It may parallelize research only when there is no overlapping file
ownership and integration remains verified.

A phase cannot pass because code exists. It passes only when the evidence
requirement is met.

## P0 — Bootstrap and repository identity

### Work
- Verify current directory and GitHub auth.
- Run safe bootstrap using `scripts/bootstrap-repository.sh` or equivalent.
- Create `anujraja/vachavox-99` public repo from the project template.
- Replace all template placeholders.
- Confirm the control-packet docs are preserved.
- Create normal branch workflow and first baseline commit.

### Pass criteria
- Repo exists locally and remotely or exact auth blocker documented.
- `scripts/check-control-packet.sh` passes.
- Template documentation contract exists.
- No unresolved placeholder in user-visible docs.
- State/QA record exists.

## P1 — Discovery, source audit, and constraints

### Work
- Clone original VachaVox read-only to a temporary folder.
- Read `Package.swift`, resolved dependencies, license, AGENTS, README, changelog,
  source/tests/scripts.
- Build/test original baseline without editing it if environment permits.
- Create new `docs/DECISIONS.md`, `docs/ARCHITECTURE.md`,
  `docs/LEGAL_AND_ATTRIBUTION.md`, `docs/MAINTENANCE.md`, `docs/PRODUCT.md`,
  `docs/humantask/CHECKLIST.md`, `docs/futurework/ROADMAP.md`,
  `docs/qa/README.md`, and `docs/qa/KNOWN-ISSUES.md` from the template/prompt.
- Audit third-party licences and model distribution restrictions.
- Inspect current local Xcode/macOS SDK rather than guessing API availability.

### Pass criteria
- Migration map is concrete.
- Dependency/license matrix has no “assumed” entries.
- Platform/SDK facts recorded.
- No old absolute path or old UX is copied into new code.
- Risks updated.

## P2 — Speech feasibility spike

### Work
- Build minimal native Swift spike for current Apple on-device speech APIs.
- Test locale support, asset availability/installation, actual transcript loop,
  offline-after-setup behaviour, cancellation, latency, and failure messaging.
- Test carefully and record what the local SDK/device actually supports.
- Define `SpeechEngine` protocol and mock boundaries.
- Decide primary engine based on evidence, not desired branding.
- If Apple route fails materially, evaluate original local fallback under audit.

### Pass criteria
- A genuine local speech loop works or a documented local fallback works.
- No technical names required in normal product UI.
- Offline claim is evidence-backed for the tested path.
- QA log includes exact build/run environment.
- Architecture/risks updated.

## P3 — Sandboxed shortcut and text-delivery spike

### Work
- Make minimal native app target with App Sandbox.
- Test default shortcut capture.
- Test active-app text delivery under explicit user permissions.
- Test clipboard fallback.
- Test secure/password field safety.
- Test in a clean user account or equivalent clean permission state when practical.
- Inspect archive/entitlement output early.

### Pass criteria
- Direct delivery feasibility is proven or an honest product-safe fallback is
  documented.
- Text is never lost on failed direct delivery.
- No unsupported sandbox/TCC workaround is used.
- Exact App Review disclosure need is documented.

## P4 — App foundation and archive path

### Work
- Create native Xcode project and targets.
- Build menu-bar shell, app state, settings skeleton, permissions service,
  native overlay shell, preferences store, test targets.
- Add App Sandbox, Info.plist usage descriptions, privacy manifest, asset
  catalogs, build configurations, archive scripts/instructions.
- Produce first Release archive up to the point credentials allow.

### Pass criteria
- Debug build/test works.
- Archive path is verified as far as local credentials permit.
- No webview/Node/Tauri/Rust exists.
- Docs for build/test/archive are exact.

## P5 — End-to-end dictation core

### Work
- Implement audio capture, dictation coordinator, speech engine selection,
  cleanup pipeline, delivery abstraction, shortcut service, error/retry states.
- Port only audited original code.
- Add tests for session state, rapid cancel/restart, output preservation,
  protected tokens, permission states, offline ready state, and no-asset state.

### Pass criteria
- From a fresh ready state, a person can trigger, speak, release, and receive
  text through direct delivery or clipboard fallback.
- Every failure state is understandable and recoverable.
- Tests prove core paths.

## P6 — Onboarding, simplicity, and native polish

### Work
- Implement exact five-screen onboarding from `02-UX-SPEC.md`.
- Implement compact settings only.
- Remove model/engine jargon from all customer-facing UI.
- Implement material/native visual treatment with accessibility variants.
- Create screenshot deterministic states.

### Pass criteria
- First-run success requires no technical decision.
- Settings fits the intended small window and scope.
- A first-time user has no manual model/folder/Terminal work.
- UX checks pass for all listed states.

## P7 — Quality, privacy, accessibility, and performance

### Work
- Execute unit/UI/integration/manual test plan.
- Measure startup/idle/session resource use on available Apple Silicon hardware.
- Test no-network after asset readiness.
- Test VoiceOver, keyboard, contrast, reduced transparency/motion.
- Audit binary/dependencies/network behaviour.
- Resolve or document all known limitations.

### Pass criteria
- QA log has evidence for the product claims.
- Privacy policy/data declaration matches actual binary behaviour.
- No P0 product invariant is violated.
- Remaining limitations are acceptable and visible to reviewer/user where relevant.

## P8 — Release pack and submission-ready handoff

### Work
- Complete release metadata, screenshots plan/assets, reviewer notes, privacy
  answers draft, support/privacy URL placeholders, changelog, versioning,
  archive command, and human-only checklist.
- Re-run final fresh-install/release smoke tests.
- Prepare a concise final handoff with artifact paths and all human tasks.

### Pass criteria
- Every non-human item is complete and evidence-backed.
- Final app archive can be built as far as signing credentials allow.
- App Store submission materials are internally consistent.
- `docs/12-HUMAN-ONLY-TASKS.md` contains only real account/device tasks.
- State says `P8 PASSED` or `P8 PASSED WITH LIMITATION` with clear evidence.

## Loop after every phase

1. Update `09-CODEX-STATE.md`.
2. Add QA evidence.
3. Update risks/decisions/release docs.
4. Commit.
5. Continue to next unblocked phase.

Do not stop merely because a phase was passed.
