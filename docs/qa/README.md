# QA Evidence Rules

QA is evidence for a future reviewer, not a vague diary.

Every row in `QA-LOG.md` should include:
- timestamp;
- phase/gate;
- environment (Mac, RAM if useful, macOS, Xcode, build);
- exact command or manual steps;
- expected result;
- actual result;
- pass/fail;
- artifact/log/screenshot path where available;
- follow-up issue/risk if not a clean pass.

Use synthetic or benign speech/text fixtures. Do not commit private audio,
tokens, personal messages, or screenshots containing sensitive data.

Required test categories:
- build / archive;
- fresh onboarding;
- asset ready/no-asset/download failure;
- microphone denied/recovery;
- Accessibility denied/copy fallback;
- direct text delivery;
- hotkey and rapid stop/start;
- offline after setup;
- cleanup protected tokens;
- password/secure field safety;
- VoiceOver, keyboard, contrast, Reduce Motion, Reduce Transparency;
- memory/CPU/idle/network checks.

A QA item can be manual. “Not tested” is permitted only when the reason and
next required action are recorded.
