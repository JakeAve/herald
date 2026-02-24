#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$SCRIPT_DIR/notify.sh" \
  "I am still open" \
  "Claude is waiting for your input" \
  "Claude Code"
