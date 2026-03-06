#!/usr/bin/env bash
CONFIG="$HOME/.herald.json"
jq '.audible = true' "$CONFIG" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"
echo "Herald unmuted"

PHRASES=(
  "I have returned from the silence."
  "Herald online. Let's get loud."
  "Back from the void. Miss me?"
  "Unmuted and dangerous."
  "The herald speaks once more!"
  "Silence is overrated anyway."
  "Audio restored. You're welcome."
  "I was just resting my voice."
  "Broadcasting on all frequencies."
  "Did someone call for a herald?"
)

RANDOM_INDEX=$((RANDOM % ${#PHRASES[@]}))
PHRASE="${PHRASES[$RANDOM_INDEX]}"

afplay /System/Library/Sounds/Blow.aiff &
say -v Daniel "$PHRASE"
