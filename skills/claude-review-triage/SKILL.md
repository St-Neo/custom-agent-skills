---
name: claude-review-triage
description: Use when the user pastes Claude Code /review or /security-review findings after Codex implemented a branch, and wants Codex to verify, dispute, or fix those findings without drifting from the original implementation intent.
---

# Claude Review Triage

Claude is a reviewer, not an oracle. `/review` is a general PR review; `/security-review` is a security-focused diff review for risks like injection, auth flaws, and data exposure.

## Workflow

1. Reconstruct what Codex changed from the branch diff, relevant files, tests, and prior stated intent.
2. For each Claude finding, verify it against current code and classify it: `valid`, `invalid`, `unclear`, or `pre-existing`.
3. Before changing code, ask: was the current implementation deliberate, constrained by existing patterns, or protecting another requirement?
4. Fix only validated issues, preserving the branch's design unless the finding proves the design is wrong.
5. For invalid or unclear findings, explain the evidence and leave code unchanged unless a small clarifying test/comment reduces future confusion.
6. Run focused tests or checks when available, especially for security or behavioral claims.

Report findings as a short triage table, then summarize the exact fixes made and checks run.
