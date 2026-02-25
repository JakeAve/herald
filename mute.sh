#!/usr/bin/env bash
CONFIG="$HOME/.herald.json"
jq '.audible = false' "$CONFIG" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"
echo "Herald muted"
