# Legal and Attribution Audit

This file is deliberately incomplete until P1 verifies every item.

## Product source policy

- VachaVox 99 may reuse original work owned by Anuj from `anujraja/VachaVox`.
- Do not copy TypeWhisper or other third-party competitor source/design.
- Do not copy old licensing text blindly.
- Intended new repository license: MIT **only if** a complete dependency and
  model audit confirms compatibility. Otherwise escalate to Anuj before release.

## Audit matrix

| Component | Version/commit | Purpose | License verified | Redistribution allowed | Attribution location | Status |
|---|---|---|---|---|---|---|
| Apple frameworks | SDK-dependent | Native app/speech | Apple platform terms | N/A | App/docs as required | TODO |
| Original VachaVox code | Read-only source | Migration source | Owner-controlled, verify third-party provenance | Owner decision | Repo docs | TODO |
| FluidAudio | TODO | Possible local fallback | TODO | TODO | TODO | TODO |
| WhisperKit | TODO | Possible local fallback | TODO | TODO | TODO | TODO |
| KeyboardShortcuts | TODO | Possible shortcut support | TODO | TODO | TODO | TODO |
| Any model asset | TODO | Possible fallback speech | TODO | TODO | TODO | TODO |

## Prohibited until audit passes

- embedding model weights;
- automated third-party model download;
- publishing a final license;
- claiming an engine/model feature in marketing;
- removing required third-party notices.
