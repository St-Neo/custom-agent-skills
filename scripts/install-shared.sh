#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGENTS_DIR="${AGENTS_SKILLS_DIR:-$HOME/.agents/skills}"
CODEX_DIR="${CODEX_SKILLS_DIR:-$HOME/.codex/skills}"
CLAUDE_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
FORCE="false"

if [[ "${1:-}" == "--force" ]]; then
  FORCE="true"
fi

mkdir -p "$AGENTS_DIR" "$CODEX_DIR" "$CLAUDE_DIR"

for skill_dir in "$ROOT_DIR"/skills/*; do
  [[ -d "$skill_dir" ]] || continue
  name="$(basename "$skill_dir")"
  target="$AGENTS_DIR/$name"

  if [[ -e "$target" ]]; then
    if [[ "$FORCE" != "true" ]]; then
      echo "Refusing to overwrite existing skill: $target"
      echo "Run with --force to replace installed copies."
      exit 1
    fi
    rm -rf "$target"
  fi

  cp -R "$skill_dir" "$target"

  for app_dir in "$CODEX_DIR" "$CLAUDE_DIR"; do
    link="$app_dir/$name"
    if [[ -e "$link" || -L "$link" ]]; then
      if [[ "$FORCE" != "true" ]]; then
        echo "Refusing to overwrite existing link/skill: $link"
        echo "Run with --force to replace installed copies."
        exit 1
      fi
      rm -rf "$link"
    fi
    ln -s "../../.agents/skills/$name" "$link"
  done

  echo "Installed $name"
done
