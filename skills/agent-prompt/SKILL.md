---
name: agent-prompt
description: Use when invoked as /agent-prompt, $agent-prompt, or agent-prompt, or when the user gives rough instructions and wants them rewritten into a clear, structured, execution-ready prompt for Codex, Claude, or another coding/review agent.
---

# Agent Prompt

Transform rough natural-language instructions into agent-ready prompts. Focus on the task, repository, plan, bug, constraints, expected behavior, and required output, not on the user.

## Core Rules

- Preserve the original intent and clarify the actual task.
- Separate facts from assumptions.
- Add missing structure without inventing details.
- Define source of truth, implementation/review constraints, and expected output.
- Prevent drift from the current branch, existing codebase, docs, and architecture.
- Use `UNKNOWN` for unclear details and tell the agent to inspect the repo.
- Label speculative suggestions as `Proposed` or `Optional`.
- Do not make the agent blindly implement everything.
- Require reasoning before code changes, available checks/tests, and clear reporting.

## Default Prompt Structure

```md
# Task

[Clear one-paragraph summary of what the agent needs to do.]

## Context

[Summarize the background from the user's rough instruction.]

## Goal

[State the desired final outcome.]

## Source of Truth

Use the current repository, current branch, existing code, existing docs, and any files mentioned in the instruction as the source of truth.

Do not invent missing behavior. If something is unclear, inspect the repo and mark unknowns clearly.

## Constraints

- Stay aligned with the existing architecture and code style.
- Do not introduce unnecessary rewrites.
- Do not change unrelated files.
- Do not invent features beyond the requested scope.
- Do not claim something works unless verified.
- Preserve existing behavior unless the task explicitly requires changing it.

## Tasks

1. Inspect the relevant files and current implementation.
2. Identify what currently exists.
3. Compare the current state against the requested behavior or issue.
4. Decide what needs to change.
5. Implement or recommend the smallest safe change.
6. Update documentation if relevant.
7. Add or update tests if appropriate and feasible.
8. Run available validation checks.

## Validation

After completing the task, report:

- Files inspected.
- Files changed.
- Tests/checks run.
- Tests/checks not run and why.
- Any risks, assumptions, or follow-up work.

## Output Format

Return:

1. Summary of understanding.
2. What you found in the repo.
3. What you changed or recommend changing.
4. Why this approach was chosen.
5. Validation results.
6. Remaining risks or open questions.
```
