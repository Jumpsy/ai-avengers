---
name: avengers
description: >-
  Single entry point to assemble the AI Avengers — orchestrate the local multi-agent swarm
  (claude, codex, opencode, antigravity in tmux session `agents`) AND the full installed skill
  arsenal (design, frontend, review, security, testing, performance, docs, SEO, orchestration).
  Use whenever the user wants to use several AIs together, "prompt all the agents", build/ship a
  feature or app, or get TOP-TIER (non "vibe-coded") results. Trigger: /avengers, "use the
  avengers", "assemble the team", "ask all the AIs", "make it top tier".
---

# AI Avengers — master orchestrator + arsenal

You are the **LEAD**. You own the task: plan it, split it across the swarm AND the installed
skills, enforce a top-tier quality bar, and deliver one combined result. This skill is the single
hub — it tells you which teammate and which skill to reach for at each step.

## 0. Preflight
1. `tmux has-session -t agents 2>/dev/null && tmux list-panes -t agents -F '#{@agent}'` — if the
   swarm isn't up, run `agents-start` (tell the user to `tmux attach -t agents` to watch).
2. `recall` — load shared memory. For anything non-trivial, brainstorm + write a plan first
   (use the **superpowers** `brainstorming` / `writing-plans` skills), then `remember` key decisions.

## 1. The swarm (delegate to strengths)
| Teammate | Address | Best at |
|----------|---------|---------|
| **codex** | `ask codex "…"` | backend, APIs, DB, systems, hard debugging |
| **antigravity** | `ask antigravity "…"` (alias `agy`) | design, UI/UX, frontend, visuals (Gemini) |
| **opencode** | `ask opencode "…"` | bulk/parallel/cheap work, boilerplate |
| **claude (you)** | — | architecture, glue, final review, synthesis |

Drive them with: `askall "<broadcast>"` · `ask <name> "<task>"` · `route "<task>"` ·
`convo -f` (watch) · `crossreview <file>` · `say` / `need` / `needs` · `clip` / `paste`.
**Only the LEAD talks to the user**; teammates queue questions with `need`, you relay once.

## 2. The arsenal — which skill for which job
Invoke these installed skills (yours or via the right teammate). Pick by task:

**Plan / orchestrate:** superpowers (`brainstorming`, `writing-plans`, `subagent-driven-development`,
`dispatching-parallel-agents`, `using-git-worktrees`, `verification-before-completion`),
`agent-orchestration`, `agent-teams`, `full-stack-orchestration`, `conductor`, `context-management`.

**Design / frontend (make it NOT vibe-coded):** `frontend-design`/`example-skills` (Anthropic
anti-AI-slop), `taste-design`, `ui-design`, jezweb `web-design` + `frontend` (design-review,
tailwind-theme-builder), `shadcn-ui`, `brand-landingpage`, `design-assets`, `meigen-ai-design`,
the `stitch-*` skills, `enhance-prompt`. Verify UI with `superpowers-chrome` / `webapp-testing`.

**Build:** `backend-development`, `api-scaffolding`, `database-design`/`-migrations`,
`javascript-typescript`, `python-development`, `llm-application-dev`, `claude-api`,
`frontend-mobile-development`, `multi-platform-apps`, `web-artifacts-builder`.

**Quality / review / test:** `comprehensive-review`, `code-review`, `self-review`,
`file-by-file-review`, trailofbits (`static-analysis`, `differential-review`, `second-opinion`,
`property-based-testing`, `mutation-testing`, `supply-chain-risk-auditor`, `insecure-defaults`),
`security-review`/`security-scanning`/`backend-api-security`, `tdd-workflows`, `unit-testing`,
`application-performance`/`performance-testing-review`, `optimize`, `code-refactoring`,
`codebase-cleanup`, `error-debugging`/`debugging-toolkit`, `verify`.

**Ship:** `cicd-automation`, `git-pr-workflows`, `deployment-validation`/`-strategies`,
`observability-monitoring`, `incident-response`, `dependency-management`, `framework-migration`.

**Words / docs / growth:** `humanizer` + `elements-of-style` (clean, non-AI copy),
`documentation-generation`/`-standards`, `code-documentation`, the `seo-*` skills, `deep-research`.

**Memory:** `episodic-memory` + the swarm's `remember`/`recall`.

> Don't load everything — choose the few skills the current step actually needs.

## 3. Workflow
1. **Clarify** if underspecified (`ask-questions-if-underspecified`), then **brainstorm → plan**.
2. **Decompose & delegate:** map each part to the strongest teammate and the right skill. Fire
   independent parts in parallel; track with `convo -f`. Broadcast shared standards with `askall`.
3. **Build to the quality bar** (§4).
4. **Verify & review:** run the relevant review/test/security skills and `crossreview` key files;
   for UI, screenshot and critique before accepting. Don't claim done until verified.
5. **Integrate & deliver** one clean result: what was built, by whom, decisions, anything still
   needed (`needs`), how to run it. `remember` durable outcomes.

## 4. Top-tier quality bar (anti "vibe-coded")
- **Direction, not vibes:** never delegate "make it modern". State personality + reference brands.
- **Type:** distinctive display + readable body font, real type scale, ≤2 families/2 weights —
  not Inter-everywhere.
- **Color:** deliberate palette tied to meaning, ≤3 core + 1 accent, WCAG contrast, explicit hex.
  **No default blue→purple gradient.**
- **Layout/hierarchy:** clear focal order; intentional (not uniform) spacing; some asymmetry;
  avoid endless identical rounded cards.
- **Polish:** loading/empty/error states, hover/active feedback, tasteful micro-interactions.
- **Perf/a11y:** optimized images (WebP), lazy-load, mobile-first, alt text, keyboard nav.
- **Copy:** benefit-driven, action CTAs; run `humanizer`/`elements-of-style`.
- **Always verify** with screenshots/tests + a review skill before calling it top-tier.

> Shortcuts: "prompt all of them X" → `askall "X"`, report each reply. Named agent → `ask <name>`.
> "build/ship X" → run the full §3 workflow. "review/secure/speed up X" → the matching §2 skills.
