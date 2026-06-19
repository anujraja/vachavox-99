# Claude Notes

Claude Code should read `AGENTS.md` first. That file is canonical for product
context, commands, workflow, and guardrails.

Project procedure skills live in `.agents/skills/`. If you want Claude Code
auto-discovery, create symlinks from `.claude/skills/<skill-name>` to the
matching `.agents/skills/<skill-name>` directory after repo setup.

Do not edit duplicated skill copies. Keep `.agents/skills/` as the source of
truth.

