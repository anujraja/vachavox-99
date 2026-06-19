# Maintenance

## Development principles

- Make all normal product changes on feature branches.
- Keep `CHANGELOG.md` under `Unreleased`.
- Update QA/state/decisions as part of code changes.
- Do not bump version/build until explicit release preparation.
- Do not commit local speech assets, private recordings, credentials, archive
  products, personal logs, or generated build folders.

## Verified commands

Current P2 SwiftPM spike commands:
- Build: `swift build`
- Core boundary self-test: `swift run VachaVoxCoreSelfTest`
- Speech asset inspection: `swift run SpeechFeasibilitySpike --locale en_US`
- Local file transcript probe:
  `swift run SpeechFeasibilitySpike --locale en_US --audio-file /tmp/vachavox-p2-sample.aiff`

Blocked until full Xcode is installed/selected:
- `swift test` with XCTest/Swift Testing;
- native app debug build;
- UI tests;
- archive/export validation;
- sandboxed app launch and screenshot states.

## Support policy

V1 support should remain small:
- privacy question;
- permission recovery;
- offline speech repair;
- keyboard shortcut help;
- copy fallback behavior.

Do not create a server-side support workflow or remote logging system.
