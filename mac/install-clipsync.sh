#!/usr/bin/env bash
# install-clipsync.sh  — run on your Mac to keep your system clipboard in two-way sync with
# the agents' shared clipboard. Installs clip-sync + a launchd service that auto-starts at login.
#
# Usage:  ./install-clipsync.sh <ssh-host> [remote-clipboard-path]
#   <ssh-host>              your ~/.ssh/config alias for the agents box (e.g. "agents")
#   [remote-clipboard-path] default: /root/agent-shared/clipboard
set -euo pipefail
HOST="${1:?usage: install-clipsync.sh <ssh-host> [remote-clipboard-path]}"
REMOTE="${2:-/root/agent-shared/clipboard}"
REPO="$(cd "$(dirname "$0")/.." && pwd)"

mkdir -p "$HOME/.local/bin"
install -m 0755 "$REPO/bin/clip-sync" "$HOME/.local/bin/clip-sync"

LABEL=com.agentswarm.clipsync
PLIST="$HOME/Library/LaunchAgents/$LABEL.plist"
mkdir -p "$HOME/Library/LaunchAgents"
cat > "$PLIST" <<PLISTEOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>$LABEL</string>
  <key>ProgramArguments</key><array><string>$HOME/.local/bin/clip-sync</string></array>
  <key>EnvironmentVariables</key><dict>
    <key>CLIP_SSH_HOST</key><string>$HOST</string>
    <key>CLIP_REMOTE</key><string>$REMOTE</string>
    <key>PATH</key><string>/usr/bin:/bin:/usr/local/bin:$HOME/.local/bin</string>
  </dict>
  <key>RunAtLoad</key><true/>
  <key>KeepAlive</key><true/>
  <key>StandardOutPath</key><string>/tmp/agentswarm-clipsync.log</string>
  <key>StandardErrorPath</key><string>/tmp/agentswarm-clipsync.err</string>
</dict>
</plist>
PLISTEOF

launchctl unload "$PLIST" 2>/dev/null || true
launchctl load "$PLIST"
echo "✅ clip-sync running and set to start at login."
echo "   host=$HOST  remote=$REMOTE"
echo "   logs: /tmp/agentswarm-clipsync.{log,err}"
echo "   stop with:  launchctl unload $PLIST"
