# The AI Avengers 🦸

Assemble several AI coding CLIs **side-by-side in one tmux session** — Claude Code, Codex,
opencode, Antigravity/Gemini, Aider, whatever you have — so they can **prompt each other**,
get **broadcast to all at once**, share **files, a feed, memory, and a clipboard**, and
**delegate** work to whichever model is best for each task.

You don't wire this up by hand. You **clone the repo and hand one master prompt to any AI
agent**, and it builds the whole thing for you, adapting to the CLIs you actually have.

## Quick start

```bash
git clone https://github.com/Jumpsy/ai-avengers.git
cd ai-avengers
```

Then open **[`MASTER_PROMPT.md`](./MASTER_PROMPT.md)**, copy the prompt in the box, and paste it
to your AI agent (Claude Code / Codex / Gemini / Cursor / opencode / Aider …) **from inside the
cloned directory**. It will detect your CLIs, install everything, launch the session, and
test it.

Prefer to do it yourself? Just run:

```bash
# edit config/agents.conf.example down to the CLIs you have, then:
bash install.sh
agents-start
```

## What you get

- **Prompt all agents at once** — inside tmux press **`prefix` + `a`** (default prefix `Ctrl-b`),
  type once, and it goes to every agent. Or from a shell: `askall "…"`.
- **Agent-to-agent** — `ask <agent> "…"` types into another agent's live terminal and returns its
  reply. `route "<task>"` auto-picks the best agent.
- **Shared clipboard** — `clip` / `paste` give every agent *and your laptop* one clipboard.
  Run `clip-sync` on your laptop for true two-way system-clipboard sync over SSH.
- **Shared everything else** — common workspace dir, a live feed (`convo -f`), long-term memory
  (`remember` / `recall`), cross-review (`crossreview <file>`), shared CLI/MCP installs.
- **Sane tmux** — mouse on (click any pane), OSC52 copy to your local clipboard, Alt+arrow pane
  nav, `clearall` to restart everyone.

## Layout

```
MASTER_PROMPT.md   the prompt you hand to an AI to build this for you
install.sh         idempotent installer (run on the host that runs the agents)
bin/               all the team commands (ask, askall, route, clip, paste, recall, …)
config/
  agents.conf.example   your roster: <key> : <launch command>, one per agent
  tmux.conf             tmux settings + the broadcast keybinding (merged into ~/.tmux.conf)
templates/AGENTS.md     orchestration instructions seeded into the agents' workspace
```

## Copying text out of a pane to your local clipboard
tmux copy-mode selections are piped to the shared clipboard (`clip-store`), so they reach your
machine via `clip-sync` even on terminals without OSC52.
- **Panes that don't grab the mouse** (claude/codex/antigravity): drag-select → release → paste
  (~1s), or hold **⌥ Option** and drag, then **⌘C** for an instant native copy.
- **Panes that grab the mouse** (e.g. opencode): a normal drag is eaten by the app. Use keyboard
  copy-mode — **`prefix` `[`**, move, **`v`** select, **`y`** copy — or **⌥-drag + ⌘C**.
  Keyboard copy-mode works in *every* pane regardless of mouse capture.

## Notes
- Agents run in **auto-approve / bypass mode** by design — they execute without prompting.
  Run this on a box you're comfortable giving that freedom (a VPS or a scratch machine is ideal).
- The shared clipboard syncs **text**. Images aren't synced.
- Works on Linux and macOS hosts; the clipboard daemon supports macOS (`pbcopy`/`pbpaste`),
  Wayland (`wl-clipboard`), and X11 (`xclip`).

## License
MIT
