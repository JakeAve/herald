#!/usr/bin/env bash
CONFIG="$HOME/.herald.json"
jq '.audible = true' "$CONFIG" > "$CONFIG.tmp" && mv "$CONFIG.tmp" "$CONFIG"
echo "Herald unmuted"
