---
name: instruction-edit-guard
description: Use when invoked as /instruction-edit-guard, $instruction-edit-guard, or instruction-edit-guard, or before editing durable non-memory agent instructions such as SKILL.md, AGENTS.md, CLAUDE.md, .codex/.claude/.agents skills, or instruction files.
---

# Instruction Edit Guard

Use this when changing an agent's durable instructions. Do not casually rewrite guardrails.

## Workflow

1. Locate the target instruction files, read nearby conventions, and check related instructions for conflicts.
2. Create a timestamped pre-edit backup of each file in a local `.instruction-backups/` or equivalent backup folder. Keep it through validation, report the path, and delete it only if the user explicitly approves cleanup.
3. Ask a brief pop quiz only if intent is ambiguous: desired behavior, trigger, scope, and examples/non-examples.
4. Propose the exact instruction change, why it is durable, and any risks. Stop until the user says `approved` or clearly tells you to proceed.
5. Edit minimally in the file's existing format. Prefer durable behavior rules over one-off task notes.
6. Keep absolute rules clear: use `ALWAYS`/`NEVER` only when truly universal, and remove contradictory instructions.
7. Protect memories and worktrees: do not edit memory stores or unrelated worktree files unless explicitly asked.
8. Validate by diffing the backup against the edit; summarize changed files, backup paths, conflicts checked, and remaining risks.
