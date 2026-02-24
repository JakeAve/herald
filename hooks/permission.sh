#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
input=$(cat)
tool=$(echo "$input" | jq -r '.tool_name // "unknown"')
source "$SCRIPT_DIR/notify.sh" \
  "I need your permission for $tool" \
  "$tool" \
  "Permission Request"
