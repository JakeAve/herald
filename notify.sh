#!/usr/bin/env bash
# Usage: source notify.sh "speech text" "notification message" "notification title"
HERALD_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG="$HERALD_DIR/config.json"

SPEAK_TEXT="$1"
NOTIF_MSG="$2"
NOTIF_TITLE="${3:-Claude Code}"

AUDIBLE=$(jq -r '.audible // true' "$CONFIG" 2>/dev/null)

if [ "$AUDIBLE" = "true" ]; then
  say -v Daniel "$SPEAK_TEXT"
fi

osascript -e "display notification \"$NOTIF_MSG\" with title \"$NOTIF_TITLE\""
