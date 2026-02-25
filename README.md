# Herald

Audio and macOS notification hooks for Claude Code. All hook logic lives here so `settings.json` just calls into these scripts.

## Setup

Requires `jq` and macOS (`say`, `osascript`).

Config lives at `~/.herald.json`:

```json
{
  "audible": true
}
```

- `true` — speaks via `say -v Daniel` + sends macOS notification
- `false` — macOS notification only (silent mode)

## Scripts

| Script | Purpose |
|---|---|
| `notify.sh` | Shared helper — reads config, conditionally speaks, always notifies |
| `hooks/permission.sh` | PermissionRequest hook — reads stdin for `tool_name` |
| `hooks/stop.sh` | Stop hook — "I am finished" |
| `hooks/idle.sh` | Notification/idle hook — "I am still open" |
| `hooks/session-start.sh` | SessionStart hook — prints date context (no audio) |
| `mute.sh` | Sets `audible` to `false` in `~/.herald.json` |
| `unmute.sh` | Sets `audible` to `true` in `~/.herald.json` |

## Shell aliases

Add to `~/.zshrc`:

```bash
alias mute-claude="/path/to/herald/mute.sh"
alias unmute-claude="/path/to/herald/unmute.sh"
```

## Claude Code settings

User-level (`~/.claude/settings.json`):

```json
{
  "hooks": {
    "PermissionRequest": [{ "matcher": "", "hooks": [{ "type": "command", "command": "cat | /path/to/herald/hooks/permission.sh" }] }],
    "Notification": [{ "matcher": "idle_prompt", "hooks": [{ "type": "command", "command": "/path/to/herald/hooks/idle.sh" }] }],
    "Stop": [{ "hooks": [{ "type": "command", "command": "/path/to/herald/hooks/stop.sh" }] }]
  }
}
```
