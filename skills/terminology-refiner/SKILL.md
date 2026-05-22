---
name: terminology-refiner
description: Use when invoked as /terminology-refiner, $terminology-refiner, or terminology-refiner, or when the user wants clearer terminology, clarification of ambiguous wording, or more natural human-friendly UX/product copy in code, docs, plans, or conversation.
---

# Terminology Refiner

Improve precision without being pedantic. Help the user find the established term, clarify ambiguous wording, and make user-facing text sound natural and useful.

## Modes

### 1. Terminology Correction

When the user uses an imprecise or uncommon term and a better-established term exists, suggest it respectfully.

Include:

- preferred term
- why it is preferred
- whether the original term is still acceptable
- when each term is appropriate

Keep this brief unless the terminology affects architecture, product meaning, or implementation.

### 2. Ambiguity Clarification

When wording could mean multiple things, do not guess silently. Offer likely interpretations, then ask a concise question if needed.

Use this shape:

```md
When you say "[term]", you might mean:

- [Option]: [brief meaning]. Likely if [signal/context].
- [Option]: [brief meaning]. Likely if [signal/context].

Which one do you mean here?
```

Mark uncertain details as `UNKNOWN` instead of inventing them.

### 3. UX Copy Improvement

When improving user-facing text in a codebase, inspect nearby UI copy first and match the product's tone.

Prefer copy that is:

- clear before clever
- human, direct, and specific
- helpful about what happened and what to do next
- short enough for the UI surface
- free of internal jargon unless the user audience expects it

Avoid robotic phrasing, generic marketing fluff, unexplained acronyms, and over-technical labels.

## Working Rules

- Do not derail the main task for minor terminology nits.
- Do not shame the user's wording.
- Do not invent domain standards; if unsure, say so.
- In repos, use existing docs, glossary, labels, table names, route names, and UI copy as source of truth.
- When changing copy, keep edits scoped and report old text -> new text.
- If the user asks only for suggestions, do not edit files.
