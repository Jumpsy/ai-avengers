# ⚠️ HOW TO MESSAGE ANOTHER AGENT — DO THIS, DO NOT FAKE IT

When the user asks you to prompt / ask / tell / message another agent, you MUST run this
shell command with your bash tool (one of the keys from agents.conf, e.g. claude/codex/opencode/agy):

    ask <agent> "<message>"

Examples:
- User: "prompt claude 12345"            -> run:  ask claude "12345"
- User: "ask codex to fix the login bug" -> run:  ask codex "fix the login bug"
- User: "tell antigravity to design X"   -> run:  ask antigravity "design X"

RULES:
- ALWAYS actually execute the `ask` command. It types your message into that agent's LIVE
  terminal so the human watches it happen in real time.
- NEVER answer on another agent's behalf. NEVER just print the message yourself.
- To message everyone at once: `askall "<message>"`.

# AI Agent Team — shared workspace

You are ONE of several CLI agents sharing this folder. You can all read each other's files,
prompt each other, and see each other's prompts.

## Talk to each other / shared feed
- `ask <name> "<prompt>"`  – ask one teammate, get its reply
- `askall "<prompt>"`      – ask everyone at once (broadcast)
- `route "<task>"`         – auto-send a task to the best-suited agent
- `say "<msg>"`            – post a note to the shared feed
- `convo` / `convo -f`     – read / live-follow everyone's prompts & replies
- `bus send/read/log`      – async file inboxes for messages that can wait

## Review each other's work
- `crossreview <file>` – every agent reviews the file and reports bugs + fixes.
- You share the filesystem: read a teammate's files directly and flag issues via `say`
  or `ask <author> "<your concern + fix>"`.

## Shared clipboard
- `clip` / `paste` – one clipboard shared by every agent AND the human's machine.
  `clip <text>` (or pipe into it) puts text on the shared clipboard; `paste` prints it.
  Anything the human copies on their computer is available here via `paste`, and vice versa.

## Shared tools
- `cli-add <npm-pkg>`  – install a CLI globally; all agents get it on PATH.
- `mcp-add <name> <command> [args...]` – register one MCP server into every agent.

## Long-term memory (persists across restarts, shared by all agents)
- `recall`            load everything the team has learned
- `recall <query>`    search memory
- `remember "<fact>"` save a durable fact (a decision, convention, gotcha, where something lives)
At the START of a task, run `recall`. When you learn something future-you should know, `remember` it.

## Orchestration protocol
0. **Claude leads with the `/avengers` skill.** When claude is the lead, it should use its
   `/avengers` Claude Code skill (installed to ~/.claude/skills/avengers) to plan, delegate to the
   strongest teammate, enforce the top-tier quality bar, and synthesize the result.
1. **The agent the user is talking to is the LEAD (orchestrator).** It owns the task.
2. The lead plans the work and delegates sub-tasks to the strongest teammates with
   `ask <name> "..."` (or `askall` / `route`).
3. Teammates do their part, write files to this shared workspace, and report back.
4. **Only the LEAD talks to the user.** If any agent needs something from the human
   (a key, a decision, an asset) it must NOT ask the user directly — it runs `need "<question>"`.
   The lead periodically runs `needs`, consolidates everything into ONE message to the user,
   then `needs clear`. The user is asked once, by one agent.
5. Use `convo` to stay aware of what everyone else is doing.

## Pick the right model for the job
Switch to a fast/cheap model for simple work and a stronger one for hard tasks, using each
CLI's own command (e.g. `/model` in claude/codex, `/models` in opencode, in-app for antigravity).

## Mode
Everyone runs in auto-approve / bypass mode — actions execute without prompts. Be deliberate.
