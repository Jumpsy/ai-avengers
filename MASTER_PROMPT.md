# MASTER PROMPT — paste this to any AI agent / CLI after cloning this repo

> Copy everything in the box below and give it to your AI coding agent (Claude Code, Codex,
> Gemini/Antigravity, Cursor, opencode, Aider, etc.) **from inside the cloned repo directory**.
> The agent will set up a multi-agent "swarm" for you: several AI CLIs running side-by-side in
> one tmux session that can prompt each other, be broadcast to all at once, and share a clipboard.

---

```
You are setting up "agent-swarm" for me on THIS machine. The repo is already cloned into the
current directory — its files are your source of truth; install them, don't reinvent them.

GOAL (what I get when you're done):
- A tmux session with one pane per AI CLI I have, each running in auto-approve mode.
- I can prompt ALL agents at once (one keystroke / one command), not just one at a time.
- The agents can prompt each other and share files, a feed, memory, and a clipboard.
- A clipboard that is literally shared between this machine and the agents (and, if I connect
  from a Mac/laptop over SSH, between that laptop and here too).

DO THIS, STEP BY STEP — and actually run the commands, reporting what happened:

1. DETECT MY AGENTS. Check which AI CLIs are installed and runnable here. Probe at least:
   claude, codex, opencode, agy (Antigravity/Gemini), gemini, aider, cursor-agent.
   Run `command -v <name>` for each. Tell me which you found.

2. BUILD THE ROSTER. Open config/agents.conf.example. Create config/agents.conf (and after
   install, ~/.config/agent-swarm/agents.conf) containing ONLY the agents I actually have,
   one per line as `key : launch-command`, each in its no-prompt/auto-approve mode
   (e.g. `claude --dangerously-skip-permissions`, `codex --dangerously-bypass-approvals-and-sandbox`,
   `opencode`, `agy --dangerously-skip-permissions`). If I appear to have none, tell me what to
   install and stop. If you're unsure of a CLI's exact auto-approve flag, check its `--help`.

3. INSTALL. Run `bash install.sh`. It copies the bin/ commands onto my PATH, seeds the shared
   workspace + AGENTS.md/CLAUDE.md/GEMINI.md, and merges the tmux config (mouse on, the
   broadcast keybinding, OSC52 copy) into my ~/.tmux.conf. Make sure my chosen agents.conf is
   the one in place at ~/.config/agent-swarm/agents.conf before or right after this step.

4. VERIFY THE TOOLS EXIST. Confirm tmux is installed (install it if not, via the system package
   manager). Confirm these commands are now on PATH: agents-start, ask, askall, say, convo,
   route, clip, paste, recall, remember, clearall. If PATH didn't pick them up, tell me the one
   line to run (e.g. `export PATH="$HOME/.local/bin:$PATH"`).

5. LAUNCH. Start the session with `agents-start`. (If you're running non-interactively and can't
   attach, just create it: `agents-start` still builds the session; I can attach later with
   `tmux attach -t agents`.) Confirm each agent pane came up by running
   `tmux list-panes -t agents -F '#{@agent} #{pane_current_command}'`.

6. TEST THE BROADCAST. Run `askall "reply with one short line to confirm broadcast works"`.
   Wait ~8 seconds, then capture each pane (`tmux capture-pane -p -t <pane>`) and show me that
   every agent received and answered. Report the result honestly.

7. SET UP THE SHARED CLIPBOARD.
   - On THIS host, `clip` writes to a shared file and `paste` reads it; every agent uses them.
   - If I reach this machine over SSH from another computer (a Mac/laptop), set up two-way sync
     so my laptop's system clipboard and the agents' shared clipboard mirror each other:
       * Copy bin/clip-sync to my laptop (or tell me to), and run it there in the background:
         `CLIP_SSH_HOST=<my-ssh-alias-for-this-box> clip-sync &`
       * For zero-friction reuse, add SSH multiplexing to my laptop's ~/.ssh/config for that
         host (ControlMaster auto / ControlPath ~/.ssh/cm-%r@%h:%p / ControlPersist 10m) so the
         1-second polling is cheap. On macOS, offer to install it as a launchd LaunchAgent so it
         starts automatically; on Linux, offer a systemd --user service. Ask me before installing
         a background service.
   - Test it: put text on one side and read it on the other (`paste` here vs the laptop clipboard).

8. TELL ME HOW TO USE IT. Print a short cheat-sheet: prefix+a to broadcast (default prefix
   Ctrl-b), `askall`, `ask <agent> "..."`, `route`, `convo -f`, `clip`/`paste`, `clearall`,
   `recall`/`remember`. Note that clicking a pane focuses it (mouse is on) and prefix+m toggles
   mouse off if I want native text selection.

CONSTRAINTS:
- Prefer the repo's scripts as-is; only adapt agents.conf and paths to my environment.
- This runs agents in auto-approve mode by design — say so plainly, don't silently change it.
- If a step fails, show the actual error and your fix; don't claim success you didn't verify.
- Don't touch unrelated files. When done, summarize exactly what you installed and where.
```

---

## What each piece is (for humans skimming)

| Command | Does |
|---|---|
| `agents-start` | Launch/attach the tmux session, one pane per agent from `agents.conf` |
| **prefix + a** | Type a prompt once → sent to **all** agents at once |
| `askall "…"` | Same broadcast, from any shell |
| `ask <agent> "…"` | Prompt one agent and get its reply |
| `route "<task>"` | Auto-send a task to the best-suited agent |
| `say` / `convo` | Post to / read the shared feed |
| `clip` / `paste` | The shared clipboard (host ⇄ agents ⇄ your laptop) |
| `clip-sync` | Background daemon on your laptop for 2-way clipboard sync |
| `recall` / `remember` | Shared long-term memory across restarts |
| `crossreview <file>` | Every agent reviews a file and reports fixes |
| `clearall` | Restart every agent fresh |

The agents read `AGENTS.md` / `CLAUDE.md` / `GEMINI.md` (same content) in the workspace, which
teaches them the orchestration protocol (lead-agent owns the task, delegates, only the lead talks
to you, others use `need`).
