# Source Migration Audit — Original VachaVox to VachaVox 99

## Source product snapshot

Read-only source repository:
- `https://github.com/anujraja/VachaVox`
- audited at commit `df2c4044514ca98fcde12bb0f153effe6860a95d` on
  2026-06-19 from `/tmp/vachavox-original-p1-audit`;
- public SwiftPM macOS app;
- package baseline declares macOS 14;
- dependencies include FluidAudio, WhisperKit, and KeyboardShortcuts;
- original product has a native menu-bar dictation architecture;
- existing release notes identify local dictation, Fn/custom shortcut support,
  paste fallback, local model handling, overlay states, permissions, and tests.

This source is valuable because the difficult product behaviour already exists.
It is not the desired product UX or App Store architecture.

## Migration table

| Source capability | VachaVox 99 treatment | Conditions |
|---|---|---|
| Microphone capture | Reuse/refactor | Must be sandbox-safe, cancellable, memory-safe |
| Dictation coordinator/state | Reuse/refactor | Replace technical status language |
| Fn and custom shortcut knowledge | Reuse/refactor | Validate App Store/sandbox behaviour early |
| Paste/copy fallback | Reuse/refactor | Must preserve text and respect secure fields |
| Permission status/recovery | Reuse/refactor | Simplify UI and explain permissions before prompts |
| Menu-bar state system | Reuse/refactor | Reduce to Ready / Listening / Finishing / Needs attention |
| Compact overlay positioning | Reuse/refactor | Rebuild to current native visual/accessibility bar |
| Local transcript normalization | Reuse/refactor | Make deterministic and test protected tokens |
| Parakeet / WhisperKit engine ideas | Quarantine as fallback | Full dependency/model licence and UX audit first |
| Manual models folder / download catalog | Do not migrate | Replace with asset coordinator |
| Model selector / engine labels | Do not migrate | No technical UI in V1 |
| File transcription to Markdown | Do not migrate | Future only |
| Settings sidebar: Home/Models/Dictation/Hotkeys/etc. | Do not migrate | One compact Settings window |
| Debug/model diagnostics UI | Do not migrate | Internal logs/QA only |
| Old license wording (MIT + Commons Clause) | Do not copy blindly | New repo needs independent legal/attribution decision |
| Old scripts/packages | Reference only | Replace with Xcode archive and current automation |

## P1 source audit results

Reusable implementation material:
- `AudioCaptureService`: AVAudioEngine input tap, mono sample extraction, input
  level reporting, and immediate tap removal on stop.
- `PermissionsService`: microphone authorization and Accessibility trust checks.
- `HotKeyService`: push-to-talk state tracking and key-up/key-down session
  semantics, subject to P3 sandbox review.
- `TextOutputService`: target snapshot, restore attempt, copy fallback, and
  clipboard preservation concept. Secure-field handling is not proven.
- State-machine tests around readiness, rapid output fallback, overlay
  positioning, model readiness, and settings persistence.

Quarantined fallback material:
- `TranscriptionEngineRouter`, `FluidAudioParakeetTranscriptionEngine`, and
  `WhisperKitTranscriptionEngine` may inform a local fallback only after P2/P3
  evidence and model licence review.
- `ModelCatalog`, `ModelStore`, and `ModelDownloadService` must not be copied
  directly because they expose technical engine names, manual model folders,
  Hugging Face URLs, and old path assumptions.

Do not migrate:
- the model browser/settings sidebar, file transcription workflow, diagnostics
  panes, technical engine labels, manual download instructions, benchmark/debug
  surfaces, old screenshots/copy, or the old MIT plus Commons Clause licensing
  text.

Detected source inconsistencies:
- README and docs describe `~/vachavox/models`, while current source defaults to
  `/Users/macbookpro/local_ai_models/voice_models`.
- Original build/test fails under Command Line Tools because
  KeyboardShortcuts 2.4.0 uses SwiftUI preview macros that need Xcode's
  `PreviewsMacros` plugin.
- Original entitlements plist is empty, so Mac App Store sandbox requirements
  remain unproven for paste/hotkey delivery.

## Important source inconsistencies to remove

The old product history contains different local model path conventions. VachaVox
99 must not inherit user-specific absolute paths or expose folders in ordinary
UI. Speech assets are system-managed or app-managed through one internal
coordinator.

## Required migration procedure

1. Clone original repo to a temporary read-only folder.
2. Build/test its current baseline without changing it.
3. Map source modules/functions to new ownership in `docs/DECISIONS.md`.
4. Port the smallest independent unit at a time.
5. Rewrite product-facing UI/copy, do not copy old UI.
6. Keep all third-party notices and audit provenance.
7. Add new tests before declaring parity.
8. Remove source path assumptions and developer-specific machine details.
