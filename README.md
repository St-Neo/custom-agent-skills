# Custom Agent Skills

Small personal skills for Codex and Claude Code.

## Included

- `claude-review-triage` - verify Claude review/security-review findings before changing Codex-implemented code.
- `make-commits` - split a large branch diff into a small, coherent commit series.
- `instruction-edit-guard` - safely edit durable agent instructions with backups and approval.
- `flow-map` - create JSON-driven interactive HTML maps for architecture, workflows, packages, and tables.
- `agent-prompt` - convert rough instructions into structured prompts for coding/review agents.
- `terminology-refiner` - clarify terminology, resolve ambiguous wording, and improve UX/product copy.

## Excluded

This repo intentionally excludes:

- memory-derived personal workflow skills created from local chronicle/memory
- third-party skills installed from other repositories

## Install

Install into a shared source at `~/.agents/skills`, with symlinks into both Claude and Codex:

```bash
./scripts/install-shared.sh
```

Overwrite existing installed copies:

```bash
./scripts/install-shared.sh --force
```

Already-open Claude or Codex sessions may need a reload or restart to discover newly installed skills.
