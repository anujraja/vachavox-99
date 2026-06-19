# Human-Only Tasks — Anuj

Codex owns all code, documentation, tests, project configuration, and
submission preparation that can be completed locally. This file is only for
actions requiring Anuj’s identity, Apple account, payment/legal agreement, or
physical approval.

## Task format

Add every task with:
- ID
- exact system/site
- exact account/role required
- exact fields/values
- blocking impact
- screenshots/paths Codex prepared
- completion evidence Anuj should paste back

## Initial expected tasks

| ID | Task | When needed | Exact action | Status |
|---|---|---|---|---|
| H-01 | GitHub auth | P0 | Run `gh auth login` if CLI auth is unavailable; authorize access to `anujraja` | COMPLETE — verified `gh auth status` for `anujraja` on 2026-06-19 |
| H-02 | Apple Developer Program/team | P4/P8 | Confirm active team and Xcode signing access | NOT STARTED |
| H-03 | Bundle ID | P4/P8 | Confirm the final unique bundle identifier selected in docs/DECISIONS.md | NOT STARTED |
| H-04 | macOS privacy prompts | P2/P3/P7 | Approve/deny microphone and Accessibility in test scenarios as requested | NOT STARTED |
| H-05 | App Store Connect app record | P8 | Create app record, select paid price $0.99, add SKU/category/availability | NOT STARTED |
| H-06 | Legal/financial agreements | P8 | Complete Apple agreements, tax, banking as required | NOT STARTED |
| H-07 | Public pages | P8 | Publish support URL, privacy policy URL, marketing page, support email | NOT STARTED |
| H-08 | Final upload/submission | P8 | Upload/select archive, verify metadata, and submit for review | NOT STARTED |
| H-09 | Full Xcode install/selection | P1/P4 | Install current stable Xcode for macOS 26 from Apple, open it once to finish components/licence prompts, then run `sudo xcode-select -s /Applications/Xcode.app/Contents/Developer`; paste back `xcodebuild -version` | BLOCKING APP BUILD/ARCHIVE |

No task is complete until `Status` is changed and evidence is recorded.
