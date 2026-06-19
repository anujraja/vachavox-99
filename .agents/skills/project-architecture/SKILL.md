---
name: project-architecture
description: Plan or implement system-shape changes, data model changes, external integrations, cross-cutting refactors, and architecture documentation updates.
---

# Project Architecture

Use this for changes that affect system boundaries, data models, APIs,
integrations, storage, auth, permissions, deployment, or cross-cutting patterns.

## Rules

- Read `docs/ARCHITECTURE.md` and `AGENTS.md` before changing system shape.
- Prefer additive changes and backwards-compatible interfaces.
- Keep external integrations optional or clearly gated unless the product
  requires them.
- Document new failure modes, env vars, migration steps, and rollback paths.
- Do not perform destructive migrations without explicit approval and a backup
  plan.

## Documentation

Update `docs/ARCHITECTURE.md` when any of these change:

- Runtime or deployment topology
- Data model or persistence boundaries
- API contracts or event flows
- Auth, permissions, privacy, or secrets
- External services or queues
- Known scaling, reliability, or security risks

