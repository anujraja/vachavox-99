# Quality Bar

## Feeling

VachaVox should feel like a small Apple-quality utility:
- quiet;
- immediate;
- readable;
- respectful of focus;
- predictable;
- recoverable;
- never “AI demo” energy.

## Accessibility requirements

Every UI pass must check:
- VoiceOver labels, values, hints, and focus order;
- keyboard navigation and visible focus;
- non-colour state distinction;
- dynamic type / Larger Text where applicable;
- Dark Interface;
- sufficient contrast;
- Reduce Transparency;
- Increase Contrast;
- Reduce Motion;
- no required precision dragging;
- no essential audio-only feedback.

## Performance targets — measured, not marketed

Set/measure targets on representative Apple Silicon Macs:
- quick menu-bar readiness;
- minimal idle CPU/battery impact;
- no microphone capture when not actively dictating;
- fast cleanup/delivery after transcript finalization;
- no unbounded memory growth across repeated sessions;
- no background network after setup;
- no large model weights bundled by default.

The QA log must record actual measurements, test environment, and limitations.
Do not publish a number until it is reproducible.

## Reliability requirements

- Every state has an exit/recovery.
- All text survives a failed direct paste through clipboard fallback.
- Permission denied never dead-ends onboarding.
- Asset download failures have retry/cancel/recover routes.
- Shortcut misconfiguration is detected or shown honestly.
- Fast repeated start/stop cannot crash or paste stale text.
- No automatic dictation in secure/password fields where detectable.
- Updates preserve preferences and do not corrupt asset state.

## Privacy requirements

- No speech/transcript/audio upload.
- No analytics/telemetry.
- No cross-app capture beyond the narrow accessibility/paste need.
- Raw audio discarded after session.
- Clipboard used only as necessary for fallback/delivery.
- No background network except an explicit asset request.
- Network behaviour documented and testable.

## Visual requirements

- Native system controls and materials.
- No imitation web glass, neon gradients, oversized dashboard cards, or
  low-contrast text.
- Liquid Glass is a system-native quality, not an aesthetic gimmick.
- One visual focus at a time.
- Purposeful micro-motion only.
- Easy to understand without a tutorial.
