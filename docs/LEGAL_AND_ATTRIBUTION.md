# Legal and Attribution Audit

This file records licence evidence gathered in P1. Model asset terms are still
separate from package source licences and must be verified before any fallback
model download or embedding.

## Product source policy

- VachaVox 99 may reuse original work owned by Anuj from `anujraja/VachaVox`.
- Do not copy TypeWhisper or other third-party competitor source/design.
- Do not copy old licensing text blindly.
- Intended new repository license: MIT **only if** a complete dependency and
  model audit confirms compatibility. Otherwise escalate to Anuj before release.

## Audit matrix

| Component | Version/commit | Purpose | License verified | Redistribution allowed | Attribution location | Status |
|---|---|---|---|---|---|---|
| Apple frameworks | macOS 26.5.1 Command Line Tools SDK; Swift 6.3.2 | Native app/speech | Apple platform terms; SDK interfaces present for Speech and FoundationModels | N/A | App bundle privacy strings/manifest as required | SOURCE OK; runtime/App Store rules still need P2-P4 evidence |
| Original VachaVox code | `df2c4044514ca98fcde12bb0f153effe6860a95d` | Migration source | Old repo uses MIT plus Commons Clause; Anuj-owned source may be refactored, but old licence text is not copied | Owner-controlled code only; third-party/model parts audited separately | `docs/04-SOURCE-MIGRATION.md` | ALLOWED WITH BOUNDARIES |
| FluidAudio | 0.14.1, `d302273d49ef4d8914b27f20d342be482e8810f1` | Possible local fallback | Apache-2.0 in resolved checkout | Source redistribution allowed under Apache-2.0 notice/license obligations; model assets separate | Future `NOTICE`/attribution bundle if used | PACKAGE OK; model terms unresolved |
| WhisperKit | 0.18.0, `e2adabbe7d98dc4d0ab9a5b75424ecc42a9cdbef` | Possible local fallback | MIT in resolved checkout | Source redistribution allowed with copyright/license notice; model assets separate | Future attribution bundle if used | PACKAGE OK; model terms unresolved |
| KeyboardShortcuts | 2.4.0, `1aef85578fdd4f9eaeeb8d53b7b4fc31bf08fe27` | Possible shortcut support | MIT in resolved checkout | Source redistribution allowed with copyright/license notice | Future attribution bundle if used | PACKAGE OK; current version requires full Xcode for previews macro build |
| swift-argument-parser | 1.7.1, `626b5b7b2f45e1b0b1c6f4a309296d1d21d7311b` | Transitive dependency | Apache-2.0 in resolved checkout | Allowed with Apache-2.0 notice/license obligations | Future attribution bundle if used | TRANSITIVE PACKAGE OK |
| swift-asn1 | 1.7.0, `eb50cbd14606a9161cbc5d452f18797c90ef0bab` | Transitive dependency | Apache-2.0 in resolved checkout | Allowed with Apache-2.0 notice/license obligations | Future attribution bundle if used | TRANSITIVE PACKAGE OK |
| swift-collections | 1.4.1, `6675bc0ff86e61436e615df6fc5174e043e57924` | Transitive dependency | Apache-2.0 in resolved checkout | Allowed with Apache-2.0 notice/license obligations | Future attribution bundle if used | TRANSITIVE PACKAGE OK |
| swift-crypto | 4.5.0, `1b6b2e274e85105bfa155183145a1dcfd63331f1` | Transitive dependency | Apache-2.0 in resolved checkout; NOTICE present | Allowed with Apache-2.0 notice/license obligations | Future attribution bundle if used | TRANSITIVE PACKAGE OK |
| swift-jinja | 2.3.5, `0aeefadec459ce8e11a333769950fb86183aca43` | Transitive dependency | Apache-2.0 in resolved checkout | Allowed with Apache-2.0 notice/license obligations | Future attribution bundle if used | TRANSITIVE PACKAGE OK |
| swift-transformers | 1.1.9, `150169bfba0889c229a2ce7494cf8949f18e6906` | Transitive dependency | Apache-2.0 in resolved checkout | Allowed with Apache-2.0 notice/license obligations | Future attribution bundle if used | TRANSITIVE PACKAGE OK |
| yyjson | 0.12.0, `8b4a38dc994a110abaec8a400615567bd996105f` | Transitive dependency | MIT in resolved checkout | Source redistribution allowed with copyright/license notice | Future attribution bundle if used | TRANSITIVE PACKAGE OK |
| Parakeet Core ML model assets | Not bundled; old catalog points to FluidInference Hugging Face repos | Possible fallback speech | NOT VERIFIED | NOT VERIFIED | None until selected | BLOCKED UNTIL MODEL TERMS VERIFIED |
| WhisperKit Core ML model assets | Not bundled; old catalog points to argmaxinc Hugging Face repos | Possible fallback speech | NOT VERIFIED | NOT VERIFIED | None until selected | BLOCKED UNTIL MODEL TERMS VERIFIED |

## Prohibited until audit passes

- embedding model weights;
- automated third-party model download;
- publishing a final license;
- claiming an engine/model feature in marketing;
- removing required third-party notices.

## P1 licensing decision

The new repository keeps its current all-rights-reserved placeholder until the
final dependency and model route is chosen. MIT for VachaVox 99 remains possible
for original app code, but no final public-source licence may be declared until
P2/P5 decide whether third-party fallback packages or model assets ship.
