# Technical Decisions

## Decision summary

| Decision | Chosen approach | Why |
|---|---|---|
| Product UI | Native SwiftUI + small AppKit bridges | Deep macOS integration, native accessibility, minimal stack |
| Packaging | Xcode archive for Mac App Store | Best alignment with signing, sandbox, App Store workflow |
| Tauri/Rust | Explicitly not used | Adds a WebView/Rust surface without helping core macOS speech/permission work |
| Speech primary | Current Apple on-device Speech APIs, proven by a feasibility spike | Keeps ordinary UX simple and can benefit from system-local capability updates |
| Speech fallback | Refactored local original-engine layer only where proven necessary | Preserves offline capability without exposing technical setup |
| Cleanup default | Deterministic local rules | Works on every supported Mac, no model/cloud dependency |
| Cleanup enhancement | Optional Apple on-device Foundation Models only after availability proof | Nice-to-have improvement, never a product dependency |
| Data | In-memory per session only; local preferences | No backend, no accounts, no analytics |
| Minimum platform | macOS 26 baseline; Apple Silicon | Focused, modern product boundary |
| macOS 27 | Optional additive polish only when current local SDK proves API availability | Do not make V1 depend on beta-only features |
| Pricing | Paid app at USD $0.99 | Apple handles purchase; no StoreKit/IAP needed for V1 |
| Source | Public repository after a full license/attribution audit | Trust and portfolio value |

## Native Swift instead of Tauri 2

Tauri can build small desktop apps, but VachaVox is not a browser-shaped product.
Its hard requirements are native macOS behaviour:
- microphone/audio lifecycle;
- global shortcut policy;
- Accessibility-aware active-app delivery;
- menu bar;
- lightweight overlay;
- Apple Speech assets;
- App Sandbox and Archive;
- native system materials/accessibility.

Adding Rust/WebView/JavaScript would increase integration boundaries without
improving the customer promise. Build this as a small Swift app.

## Architecture boundary

```text
VachaVoxApp
├── AppState (@MainActor)
├── OnboardingCoordinator
├── DictationCoordinator
│   ├── AudioCaptureService
│   ├── SpeechEngineSelector
│   │   ├── SystemSpeechEngine
│   │   └── LocalFallbackSpeechEngine
│   ├── TextCleanupPipeline
│   └── TextDeliveryService
├── ShortcutService
├── PermissionService
├── SpeechAssetCoordinator
├── MenuBarController
├── OverlayController
└── PreferencesStore
```

No service should know more than it needs:
- `AudioCaptureService` does not decide model/engine.
- `SpeechEngine` does not paste into other apps.
- `TextDeliveryService` does not transcribe.
- `TextCleanupPipeline` never accesses network.
- UI never performs long-running speech work directly.
- asset installation and fallback logic must be mockable in tests.

## Speech engine requirements

### Primary: system on-device speech

First, create a spike to test the locally installed SDK and the current
supported Apple APIs (for example `SpeechAnalyzer`, `SpeechTranscriber`, and
the relevant asset inventory/install APIs).

The spike must determine:
- Mac/macOS/Xcode availability;
- locale support;
- asset readiness/download behaviour;
- offline behaviour after preparation;
- latency and memory characteristics;
- any distribution or entitlement requirements;
- safe cancellation semantics.

Do not assume API availability. Capture evidence in QA.

P2 evidence on 2026-06-19:
- Added a SwiftPM `SpeechFeasibilitySpike` executable and `VachaVoxCore`
  `SpeechEngine` protocol/mock boundary.
- `SpeechTranscriber` supports `en_US`; installed locales include `en_US`,
  `en_IN`, `en_GB`, and other English variants.
- `AssetInventory.status(forModules:)` reports `installed` for `en_US` and
  best compatible audio format is 16 kHz mono.
- Local `say`-generated audio files transcribed through `SpeechAnalyzer` with
  no asset installation attempt.
- Unsupported locale `zz_ZZ` fails with a clear error.

Limitations:
- Live microphone loop, user permission prompt behaviour, and network-isolated
  offline proof are not complete until H-04/H-09 test conditions are available.
- Recognition quality needs product-name/context tuning; one sample heard
  “VachaVox” as “Vatchavox.”

### Local fallback

The old VachaVox has local Parakeet/Whisper-family capability. It can be
refactored behind `LocalFallbackSpeechEngine` only after:
- dependency licences are audited;
- model terms are audited;
- automatic download/redistribution legality is verified;
- binary weight and memory impact are measured;
- a simple user-facing recovery story exists.

Fallback implementation must not force a technical model screen. It must appear
as “Offline speech needs repair” or a clear “Recommended/Quick/Extra accuracy”
choice only when it produces real, verified difference.

## Text cleanup

### Deterministic local pipeline — required

Rules must:
- normalize whitespace;
- clean accidental duplicate words/phrases only when unambiguous;
- capitalize sentence starts conservatively;
- add obvious terminal punctuation conservatively;
- remove isolated filler words only when low-risk;
- preserve URLs, paths, code, terminal commands, IDs, emails, names, numbers,
  and code-like snippets;
- preserve meaning, tone, and factual assertions;
- have explicit test fixtures for false-positive protection.

### Optional Apple model enhancement

Use only current Apple on-device Foundation Models APIs when confirmed:
- available on the device;
- permitted by product/privacy requirements;
- accessible without user configuration;
- subject to a safe deterministic fallback.

Never make it a visible “AI rewrite” feature. Never make it essential. If it
cannot run, users receive the deterministic cleaned result without an error.

## App Store feasibility rule

The hotkey and active-app paste interaction must be tested early in:
- debug development;
- a sandboxed release candidate;
- a clean user profile;
- common apps;
- a secure/password field.

If a part needs an entitlement/temporary exception or causes review risk:
- document it;
- use an Apple-supported path if available;
- keep clipboard fallback;
- do not hack around privacy/TCC/sandbox boundaries.

## Performance design

- lazy-load expensive fallback engines;
- do not bundle huge weights by default;
- do not run network calls in dictation;
- release audio/session resources immediately;
- use cancellation and backpressure;
- no polling loops;
- keep UI operations on main actor only;
- log metrics only locally in debug/QA, never as analytics.

## SDK policy

Use the newest stable Xcode/SDK that exists on the development machine.
Support macOS 26 as the release baseline. If a macOS 27 API exists locally,
guard optional behaviour with availability checks and preserve a complete
macOS 26 path. Do not describe an unverified macOS 27 feature in public
marketing.
