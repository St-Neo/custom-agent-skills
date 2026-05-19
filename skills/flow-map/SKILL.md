---
name: flow-map
description: Use when invoked as /flow-map, $flow-map, or flow-map, or when the user wants a single-page interactive HTML architecture/workflow/table/package explorer driven by JSON, with clickable actions that highlight flows and annotate data passed between components.
---

# Flow Map

Create an interactive architecture explainer, not a static diagram.

## Workflow

1. Inspect the repo/docs/plans first. Map real packages, components, APIs, tables, jobs, tools, and external services; do not invent missing links.
2. If the user provides a style image, use it only as a visual cue for mood/layout/color density; do not copy its content or force an exact match.
3. Produce a JSON source of truth with: `meta`, `groups`, `components`, `edges`, and `flows`.
4. Components must include labels, kinds, status, group, position/size, description, and useful file/table/package references.
5. Edges must include `from`, `to`, `label`, and `payload` describing exactly what is passed.
6. Flows must be user actions or system workflows, with ordered steps plus component/edge ids to highlight.
7. Produce a polished single HTML file that loads the JSON, embeds it as fallback, and lets users click flows/components to highlight paths and read annotations.
8. Include all important parts of the target scope. If there are too many, group visually but keep details available in the inspector.
9. Verify the HTML opens locally, interactions work, text fits, and the JSON remains the editable source of truth.

Default filenames: `<topic>-flow-map.json` and `<topic>-flow-map.html`.
