---
name: project-release
description: Prepare and verify releases, changelog entries, tags, deployment checks, rollback notes, and post-release smoke tests.
---

# Project Release

Use this for release candidates, production deploys, version tags, changelog
cleanup, release notes, and rollback planning.

## Procedure

1. Confirm the release candidate branch or commit.
2. Confirm CI and required QA are green.
3. Review `CHANGELOG.md` for user-facing changes, fixes, risks, and migration
   notes.
4. Verify environment variables and human setup tasks in `docs/humantask/`.
5. Deploy or promote using the documented command in `docs/MAINTENANCE.md`.
6. Run a scoped smoke test after deploy.
7. Tag the release if the project uses versions.
8. Record release notes and any follow-up risks.

## Rollback

Every release should identify:

- Previous known-good version or deployment
- Data migrations that cannot be rolled back automatically
- Feature flags or config switches
- Manual recovery steps and owner

