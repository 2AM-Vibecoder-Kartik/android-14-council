#!/usr/bin/env bash
set -e
TARGET_DIR="$HOME/.claude/skills/android-14-council"
mkdir -p "$TARGET_DIR"
cp SKILL.md "$TARGET_DIR/SKILL.md"
echo "Installed android-14-council by @2AM-Vibecoder-Kartik to $TARGET_DIR/SKILL.md"
echo "Open Claude Code in your project root and run: /android-14-council"
