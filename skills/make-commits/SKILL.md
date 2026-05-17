---
name: make-commits
description: Use when invoked as /make-commits, $make-commits, or make-commits, or when the user wants many uncommitted branch changes split into a small, coherent set of git commits instead of one giant commit.
---

# Make Commits

Make a clean commit series from the current branch work. If invoked by name alone, infer the task and do it.

## Workflow

1. Inspect `git status`, recent commits, and the full unstaged/staged diff.
2. Identify logical groups by intent, not by file count: setup/schema, core behavior, UI, tests, docs, bugfix follow-ups, cleanup.
3. Stage only the files or hunks for one group at a time. Avoid accidental secrets, env files, generated noise, and unrelated user changes.
4. Commit groups in dependency order with concise imperative messages, following the repo's existing commit style when obvious.
5. Do not rewrite, squash, amend, or reorder existing commits unless explicitly asked.
6. If a clean split is impossible, make the safest smaller set and explain the tradeoff briefly.
7. Run focused checks when practical; if skipped, say why.

Finish with the commit hashes, messages, what each commit contains, and any remaining uncommitted files.
