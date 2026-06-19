# Source Migration Audit — Original VachaVox to VachaVox 99

## Source product snapshot

Read-only source repository:
- `https://github.com/anujraja/VachaVox`
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
