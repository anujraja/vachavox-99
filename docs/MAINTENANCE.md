# Maintenance

## Development principles

- Make all normal product changes on feature branches.
- Keep `CHANGELOG.md` under `Unreleased`.
- Update QA/state/decisions as part of code changes.
- Do not bump version/build until explicit release preparation.
- Do not commit local speech assets, private recordings, credentials, archive
  products, personal logs, or generated build folders.

## Expected commands after implementation

Codex must replace this section with exact project commands once the Xcode
project exists. At minimum document:
- dependency resolution;
- debug build;
- unit test;
- UI test;
- archive;
- export/archive validation;
- local launch;
- screenshot state generation if used.

## Support policy

V1 support should remain small:
- privacy question;
- permission recovery;
- offline speech repair;
- keyboard shortcut help;
- copy fallback behavior.

Do not create a server-side support workflow or remote logging system.
