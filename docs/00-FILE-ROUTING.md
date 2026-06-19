# File Routing — Which File to Use, When

This project is intentionally documented as a working system. Read only what
the active job needs, but never skip the mandatory start sequence in
`AGENTS.md`.

| Situation | Read first | Update when done |
|---|---|---|
| Starting/resuming work | `AGENTS.md`, `09-CODEX-STATE.md`, `10-EXECUTION-LOOP.md` | `09-CODEX-STATE.md` |
| Product scope or trade-off | `01-PRODUCT-NORTH-STAR.md` | `01`, `03`, and/or `07` |
| Onboarding/settings/overlay/menu bar | `02-UX-SPEC.md`, `06-QUALITY-BAR.md` | `02`, `QA-LOG` |
| Speech APIs/models/assets | `03-TECHNICAL-DECISIONS.md`, `04-SOURCE-MIGRATION.md`, `11-OFFICIAL-REFERENCES.md` | `03`, `04`, `07`, `QA-LOG` |
| Moving old VachaVox code | `04-SOURCE-MIGRATION.md`, `LEGAL_AND_ATTRIBUTION.md` | `04`, `LEGAL_AND_ATTRIBUTION`, `QA-LOG` |
| Sandbox, permissions, packaging, review | `05-APP-STORE-GATE.md`, `11-OFFICIAL-REFERENCES.md` | `05`, `08`, `12`, `QA-LOG` |
| Speed, memory, accessiblity, privacy | `06-QUALITY-BAR.md` | `06`, `QA-LOG`, `KNOWN-ISSUES` |
| Platform/technical uncertainty | `07-RISK-REGISTER.md`, official references | `07`, `03`, `QA-LOG` |
| App Store metadata/screenshots/reviewer instructions | `08-RELEASE-PACK.md` | `08`, `12` |
| A task needs Anuj/credentials/real device | `12-HUMAN-ONLY-TASKS.md` | `12`, `09` |
| Any test, manual check, build, archive, benchmark | `docs/qa/README.md` | `docs/qa/QA-LOG.md` |
| A known defect/constraint | `docs/qa/KNOWN-ISSUES.md` | `KNOWN-ISSUES`, `07`, `09` |

## Rules

- `09-CODEX-STATE.md` is the only active-work status file.
- `QA-LOG.md` is evidence, not a to-do list.
- `KNOWN-ISSUES.md` holds real known defects/limitations only.
- `07-RISK-REGISTER.md` holds unresolved uncertainty before it becomes a defect.
- Never create a new plan file because it is easier than updating the authoritative one.
