#!/usr/bin/env bash
# agent-swarm installer — run this on the machine that will HOST the agents
# (your VPS, a Linux box, or your Mac). Idempotent: safe to re-run.
set -euo pipefail
REPO="$(cd "$(dirname "$0")" && pwd)"

WORKSPACE="${AGENTS_WORKSPACE:-$HOME/agent-workspace}"
SHARED="${AGENT_SHARED:-$HOME/agent-shared}"
CONFDIR="$HOME/.config/agent-swarm"

# 1) pick a bin dir that's on PATH and writable
if [ -w /usr/local/bin ] 2>/dev/null; then BINDIR=/usr/local/bin
elif command -v sudo >/dev/null 2>&1 && [ "${USE_SUDO:-}" = "1" ]; then BINDIR=/usr/local/bin
else BINDIR="$HOME/.local/bin"; fi
mkdir -p "$BINDIR" "$WORKSPACE" "$SHARED/memory" "$CONFDIR"

# 2) install the command scripts
echo "Installing commands to $BINDIR"
for f in "$REPO"/bin/*; do
  install -m 0755 "$f" "$BINDIR/$(basename "$f")" 2>/dev/null || { cp "$f" "$BINDIR/"; chmod +x "$BINDIR/$(basename "$f")"; }
done

# 3) make sure BINDIR is on PATH for future shells
case ":$PATH:" in
  *":$BINDIR:"*) : ;;
  *) for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
       [ -e "$rc" ] || continue
       grep -q "agent-swarm PATH" "$rc" 2>/dev/null || printf '\n# agent-swarm PATH\nexport PATH="%s:$PATH"\n' "$BINDIR" >> "$rc"
     done
     echo "Added $BINDIR to PATH in your shell rc (open a new shell or: export PATH=\"$BINDIR:\$PATH\")" ;;
esac

# 4) agent roster
if [ ! -f "$CONFDIR/agents.conf" ]; then
  cp "$REPO/config/agents.conf.example" "$CONFDIR/agents.conf"
  echo "Created $CONFDIR/agents.conf — EDIT IT to match the CLIs you actually have."
fi

# 5) seed the shared workspace agent instructions (claude/codex/gemini all read these names)
for name in AGENTS.md CLAUDE.md GEMINI.md; do
  cp "$REPO/templates/AGENTS.md" "$WORKSPACE/$name"
done
touch "$SHARED/conversation.log" "$SHARED/clipboard"

# 5b) ALSO place the team instructions in each agent's GLOBAL config dir, so an agent that
# cd's into a subproject doesn't lose the "how to message teammates" rules.
#  - opencode auto-loads ~/.config/opencode/AGENTS.md
#  - codex auto-loads ~/.codex/AGENTS.md
#  - claude searches up the tree for CLAUDE.md (covered by the workspace copy)
[ -d "$HOME/.config/opencode" ] && cp "$REPO/templates/AGENTS.md" "$HOME/.config/opencode/AGENTS.md"
[ -d "$HOME/.codex" ] && cp "$REPO/templates/AGENTS.md" "$HOME/.codex/AGENTS.md"

# 6) tmux config: write our block with BINDIR baked in, source it from ~/.tmux.conf
sed "s#__BINDIR__#$BINDIR#g" "$REPO/config/tmux.conf" > "$CONFDIR/tmux.conf"
TMUXRC="$HOME/.tmux.conf"; touch "$TMUXRC"
if ! grep -q ">>> agent-swarm >>>" "$TMUXRC" 2>/dev/null; then
  {
    echo ""
    echo "# >>> agent-swarm >>>"
    echo "source-file $CONFDIR/tmux.conf"
    echo "# <<< agent-swarm <<<"
  } >> "$TMUXRC"
  echo "Added source-file line to $TMUXRC"
fi
tmux source-file "$TMUXRC" 2>/dev/null || true

echo ""
echo "✅ agent-swarm installed."
echo "   1) Edit your roster:   $CONFDIR/agents.conf"
echo "   2) Launch the team:    agents-start"
echo "   3) Broadcast to all:   inside tmux press  prefix + a  (default prefix is Ctrl-b)"
echo "                          or from a shell:   askall \"your prompt\""
echo "   Shared clipboard:      'clip' / 'paste' on the host; run 'clip-sync' on your Mac for 2-way sync."
