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

## 0. HARD RULES — read FIRST, apply to EVERY build (learned from user feedback)
1. **NO OVERSIZED FONTS.** Big display type reads as cheap/AI. Cap the hero headline at
   ~clamp(2rem, …, 3.25rem) and section headings at ~1.75–2.25rem. Pricing numbers must be
   restrained (not 5rem). Hierarchy comes from weight, spacing, and color — not giant text.
2. **RESEARCH FAST-MOVING FACTS EVERY TIME.** Never hardcode model names/versions, prices,
   stats, or "latest X" from training data — they age fast and look embarrassing. WebSearch the
   current names on every build. (e.g. as of mid-2026 the flagships are Claude Opus 4.x, GPT-5.x,
   Gemini 3.x, Grok 4.x — verify each time, do NOT write "GPT-4o" / "Claude 3.5".)
3. **HERO = the make-or-break.** Visitors bounce in seconds. Research proven high-converting
   hero patterns first. Default to a **split-screen** hero (tight benefit headline <44 chars +
   ONE primary CTA + social-proof row on the left; a LIVE, animated product demo on the right)
   that shows product value in 3–5s. Never ship a bland centered wall of text.
4. **MOTION EVERYWHERE (tasteful).** Scroll-reveal sections, a live/animated product demo (e.g.
   typing effect), hover lifts, marquees. Not one lonely fade. Respect prefers-reduced-motion.
5. **REALISTIC PRODUCT MOCKS.** Include the real controls users expect (send button, voice /
   conversation-mode button, input affordances). NO decorative "AI-generated-looking" sparkle
   icons or fake status chips — they scream slop. Make mocks look like the real shipping product.
6. **SHIP THE WHOLE SITE.** A real product site needs legal pages (privacy policy, terms) and
   working states, not just a landing page. Build them.
7. **Dark mode is a first-class citizen** — many users prefer it; make it look as good or better
   than light, and consider defaulting to it when the brand is dark/premium.
8. **NEVER fabricate facts or social proof.** No invented stats ("12,000+ users", "4.9/5"),
   no fake "proprietary" claims, no features the app does not have. If there is no real number,
   use an honest value prop instead. The user will call out bullshit.
9. **Use REAL brand assets, in color.** Third-party logos (model providers, integrations) must
   use their authentic brand colors (lobehub `.Color` variants), not flat gray. Use the product's
   OWN logo (not generic robot/sparkle icons) for its avatar, and animate it for loading states.
10. **Symmetry in comparisons.** In pricing/feature tables, parallel elements (e.g. both price
    numbers) must be the EXACT same size and treatment. Mismatched sizes read as sloppy.
11. **Loading states.** Provide skeletons (route loading.tsx + a Skeleton primitive) so the app
    never flashes blank.
12. **Be colorful, with REAL + custom assets.** Lean into authentic brand color (no flat gray
    logos). Build custom, on-brand icons rather than generic stock/AI-sparkle glyphs. For any AI
    chat mock, the assistant avatar must be the PRODUCT'S OWN logo with a custom loading animation,
    never a generic robot.
13. **No gratuitous motion on focal content.** Do NOT float/bob the hero product window up and
    down. Motion should be purposeful (reveal on scroll, typing, hover). A constantly drifting
    mock looks broken. Keep the product demo still; animate inside it instead.
14. **No fake people or avatars either.** Beyond fake numbers, do not invent fake testimonial
    avatars/initials (no "MK/JD/SR"). Honest proof or none.
15. **Iconography: use Iconify.** Install `@iconify/react` (+ offline sets like
    `@iconify-json/lucide`, `@iconify-json/simple-icons`) for 200k+ real, consistent icons.
    `import { Icon } from "@iconify/react"` then `<Icon icon="lucide:send" />`. Use real brand
    marks from `simple-icons` for third-party logos (in their brand colors), and a coherent icon
    family elsewhere. Never hand-roll generic AI-looking glyphs when a real icon exists.
16. **Branded loading animation.** Every product gets a reusable loader built from ITS OWN logo
    (orbital/morph motion, ~1.8s ease-in-out, sizes 18-40px, framer-motion + a CSS fallback,
    light/dark via currentColor, reduced-motion = simple pulse). Use it for the chat "thinking"
    avatar and other async states. Premium and subtle, never flashy.
17. **SELF-UPDATING SKILL (meta-rule).** Whenever the user states a new preference, rule, fact,
    standard, agent, product detail, or "I want X every time" that is NOT already captured here,
    ADD IT to this SKILL.md (the right section, or a new one) in the same session, then continue
    the task. This skill is the team's living memory: nothing the user teaches should have to be
    said twice. After meaningful edits to it, offer to push to the AI Avengers repo (§7).

## 0.5 WEBSITE BUILD STANDARD — what we ship EVERY time (the "every time" checklist)
When the task is "build a website/landing page/app front end," deliver ALL of this by default
(scale copy/sections to the product, but the bar and the parts do not change):

**Stack & foundation**
- Next.js (App Router) + TypeScript + Tailwind v4. Design tokens in `globals.css` via `@theme inline`
  + CSS vars that flip for `.dark`. Class-based dark mode with a no-flash inline script in layout;
  **default to dark** for dark/premium brands. One distinctive display font + one clean body font
  (e.g. Space Grotesk + Geist via next/font or the `geist` package).
- A `.bg-grid`/mask backdrop must live on its OWN absolute layer — never put a masked utility on a
  content `<section>`, it clips all children (recurring bug).

**Required sections (landing)**: sticky Navbar (blur, mobile menu, theme toggle, Log in + primary CTA)
→ split-screen Hero (tight headline, ONE primary CTA, honest proof, LIVE animated product demo)
→ honest social-proof / logo strip → Features (bento, real icons) → Models/integrations marquee
(brand-COLORED logos, clickable to detail) → Pricing (parallel cards, EQUAL price sizes) → FAQ
(accordion, shared data feeding JSON-LD) → final CTA → Footer (columns + legal links repeated in
the bottom bar). Order tells a story.

**Required pages**: `/` , `/privacy`, `/terms`, a detail page for the core offering (e.g. `/models`
with what/cost/how-it-works), placeholder `/auth/sign-in` + `/auth/sign-up` (no dead links), and a
custom `not-found.tsx`. Add product/docs pages ("how it works", "setup") when the product has
multiple offerings.

**Required components/primitives**: Logo (themed inline SVG, `currentColor` + brand accent),
animated logo Loader, ThemeToggle (no-flash), Skeleton + route `loading.tsx`, StructuredData.

**SEO (always)**: `buildMetadata` helper (title/description/canonical/OG/Twitter, keyword-rich,
metadataBase, robots), JSON-LD suite (Organization, WebSite+SearchAction, the product schema with
Offers, FAQPage from shared data), `sitemap.ts`, `robots.ts`, `opengraph-image`.

**Motion**: scroll-reveal on sections (CSS `animation-timeline: view()`), typing caret in the demo,
hover lifts, a brand marquee. NO floating/bobbing of focal content. Respect reduced-motion.

**A11y & responsive**: semantic tags, aria, visible focus, keyboard nav, alt text, mobile-first
(check 375px + 1440px). **Verify in the browser with screenshots in BOTH themes before claiming done.**

**Honesty (non-negotiable)**: zero fabricated stats, ratings, avatars, or features. Describe only
what the product actually is/does.

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

**Video / ads:** `remotion-best-practices` — make ad / promo / launch videos programmatically with
Remotion (React → MP4). Scaffold with `npm create video@latest`, render with `npx remotion render`.
Apply the same anti-slop bar: real brand type/color, tasteful motion with easing (no infinite
spinny loops), readable text with safe margins, licensed/authentic footage or ChatGPT-generated
clips that don't look AI, captions, and a 9:16 / 1:1 / 16:9 cut per platform.

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

## 5. Luxury Color Psychology + Conversion Design Layer
This layer makes every color, theme, and palette decision a deliberate sales decision. It applies
ON TOP OF everything above (it never overrides §0–§4; it sharpens them).

**Core rule: colors are not decoration, they are sales tools.** Every color choice must increase
perceived value, trust, clarity, emotion, and conversion. If you cannot say *why* a color earns
its place, it does not go in.

**Premium principle:** basic brands use bright, flat, obvious colors. Premium brands use deeper,
richer, more muted, more intentional colors with one disciplined accent. Restraint reads as money.

### When this layer activates (always, for these)
Landing pages, dashboards, AI chat UIs, SaaS products, mobile apps, brand systems, pitch decks,
onboarding flows, pricing pages, product cards, skeleton loaders, buttons, modals, empty states,
and marketing sections. If you are designing OR reviewing any of these, run this layer.

### Analyze every palette across these 9 lenses
1. Emotional impact  2. Buyer psychology  3. Luxury perception  4. Trust  5. Conversion
6. Contrast / accessibility (WCAG)  7. Light + dark mode consistency  8. Brand memorability
9. Does it feel cheap / generic, or premium?

### Hard color rules (add to the §0 rules)
- Never pick a color just because it looks nice. Every palette element has a stated reason.
- No cheap neon overload. No random gradients. No default blue SaaS button unless truly justified.
- No low-contrast gray-on-gray body text. No accent soup (keep accents few and intentional).
- No flat primary that makes the product feel childish/generic.
- Prefer deep, rich, intentional colors for premium AI products; use bright colors only as
  controlled accents, never everywhere.
- CTA color must stand out yet still match the brand's emotion (not a random "pop" color).
- Dark mode must feel powerful, not muddy. Light mode must feel clean, not boring/bland.
- Skeleton loaders, cards, buttons, gradients must look polished and intentional, never vibe-coded.

### Default premium direction for JumpGPT / JumpStudy-style AI products
- **Base:** near-black, charcoal, off-white, soft gray, midnight navy.
- **Brand energy:** electric pink + deep purple / violet (a restrained violet gradient is allowed
  HERE as the brand signature), small **gold** accents only for premium moments (Pro, awards,
  upgrades), deep **emerald/teal** only for success / growth states.
- Keep it to a tight core + one signature accent + reserved semantic colors. (Note: for the
  current JumpGPT build the locked accent is flat pink #FF2E88 with NO gradients — honor the
  per-project lock over this default when one exists.)

### Required output sections when giving design advice
Whenever the Avengers produce or review a design, emit these three blocks:

**Color Strategy** — Main palette · Accent palette · Light-mode colors · Dark-mode colors · CTA
colors · Text colors · Border colors · Shadow/glow style · and one line per color on *why it helps
sell the product*.

**Cheap vs Premium Fix** — What currently feels cheap · which color choices cause it · what to
replace them with · why the replacements feel more premium · exact hex codes.

**Implementation Tokens** — ready-to-paste CSS variables, Tailwind color tokens, and shadcn theme
values when relevant.

### Premium check (run BEFORE finalizing any design)
- Does it look premium within 3 seconds?  - Is there exactly ONE clear CTA color?
- Are there too many competing accents?  - Does dark mode feel expensive (not muddy)?
- Does light mode feel clean (not boring)?  - Are the colors selling the product's emotion?
- Would a paying customer find it trustworthy?  - Does it avoid the vibe-coded look?
- Are skeleton loaders, cards, buttons, and gradients all polished?

### Orchestrator roles for color/design work
- **Claude (lead):** owns the brand + color *reasoning* — decides the strategy and the three
  output blocks above before anyone implements.
- **Codex:** implements the tokens (CSS vars, Tailwind/shadcn theme).
- **Antigravity:** integrates the color/UI system across the app's screens and components.
- **Opencode:** sweeps for inconsistencies (stray colors, off-token values, contrast misses).
- **Visual QA pass:** compare EVERY screen against the Color Strategy and flag anything that
  feels cheap or off-brand (screenshot light + dark, both required).

## 5.5 Psychology-Driven Website Intelligence Layer
This layer decides WHAT belongs on a page and WHY (content + structure + persuasion), where §5
decides how it looks. Applies to websites, landing pages, dashboards, app screens, pricing, onboarding,
and product sections. Additive to §0–§5.

**Core principle:** a great site is not just beautiful. It must guide attention, build trust, reduce
confusion, handle objections, raise perceived value, and make the next action obvious.

### The 15 psychology rules
1. **First 3-second judgment.** Every page instantly answers: What is this? Who is it for? Why care?
   What do I click? Why is it better than alternatives? Not clear in 3s = the design fails.
2. **Clarity over cleverness.** Reject vague startup copy ("Unlock your potential", "The future of X",
   "Next-gen AI platform", "Supercharge your workflow"). Replace with specific copy on what it does + why.
3. **Pain → Solution → Result.** Show the user's pain, how the product solves it, and the result they
   get. Show transformation, do not just list features.
4. **Trust signals** wherever needed: testimonials, screenshots, real examples, before/after,
   privacy/security notes, social proof, founder story, comparison charts, honest usage stats,
   school/student-specific language when relevant.
5. **Perceived value** via premium colors, strong type, clean spacing, high-quality screenshots,
   polished UI states, confident copy, fewer cheap elements, no clutter, no random gradients, no
   childish color overload.
6. **Specificity creates belief.** Replace "Study faster" with "Turn a 20-page PDF into summaries,
   flashcards, and quizzes in seconds." Specific claims beat generic ones.
7. **Social identity.** Know what the user wants to BECOME (students: organized, prepared, smart,
   ahead, less stressed). The site should say "this is for people like me."
8. **Loss aversion (careful).** Show what they avoid (wasted time, messy notes, late assignments,
   panic studying, lost marks) to create urgency. Do not overdo fear.
9. **Reduce cognitive load.** One job per section. Avoid too many CTAs, too many features at once,
   confusing nav, walls of text, too many colors, unclear pricing, cluttered dashboards.
10. **Visual hierarchy.** Decide what's seen 1st/2nd/3rd; important = bigger/stronger/contrasted;
    secondary = quieter. If everything screams, nothing matters.
11. **Friction removal.** Clear CTAs ("Try it free", "Upload a PDF", "Start studying", "See example",
    "Generate quiz", "Create workspace") + helpers ("No credit card required", "Takes < 30 seconds",
    "Works with your notes", "Private by default").
12. **Objection handling.** Predict and answer on the page: Is this just ChatGPT? Why not
    Quizlet/NotebookLM/Claude? Will it actually help? Allowed for school? Data safe? Expensive? Hard
    to use? Works for my class?
13. **Competitor contrast.** Position as its own category. (ChatGPT = general AI; Quizlet = flashcards;
    NotebookLM = doc Q&A; JumpStudy = school-focused AI workspace combining notes, summaries, quizzes,
    writing help, study planning.) Always explain why it's a new category.
14. **Proof through product.** Prefer SHOWING over telling: screenshots, mini demos, before/after
    cards, sample outputs, interactive previews, upload→output flows. No product proof feels fake.
15. **One big promise.** Identify the single main promise BEFORE designing ("Turn all your schoolwork
    into a study system." / "All your AI tools in one clean workspace." / "Upload notes. Get quizzes,
    summaries, and a plan."). No page with 5 competing messages.

### Required output: "Psychology Strategy"
Main user pain · Main user desire · One big promise · Trust signals needed · Objections to handle ·
Emotional target · Primary CTA · Secondary CTA · What the user understands in 3 seconds · What the
user feels after scrolling.

### Required output: "Page Content Blueprint"
Recommend the section order (Hero · Social proof · Problem · Product demo · Features · Use cases ·
Comparison · Testimonials · Pricing · FAQ · Final CTA). For EACH section give: why it exists · what
psychology it uses · what copy goes there · what visual goes there · what action it pushes.

### Final psychology checklist (before approving any design/site)
Clear in 3 seconds? · One obvious CTA? · Copy specific? · Design premium? · Pain clear? · Result
clear? · Objections handled? · Enough proof? · Screenshots/examples included? · Feels trustworthy? ·
Reduces confusion? · Sells without sounding desperate? · Does every section have a reason to exist?

## 5.6 Viral Marketing Hooks + Video Script Intelligence Layer
Prompt-library-grade marketing brain (inspired by f/awesome-chatgpt-prompts thinking, but custom to
the user's brand + short-form video). Use for TikTok, Reels, Shorts, Snapchat Spotlight, ads, launch /
founder / demo videos, and product marketing copy. Never write generic marketing: write videos that
stop the scroll, spark curiosity, explain the product fast, build trust, and make people try it.

### Rules
1. **First 1-second hook** — visual shock, bold claim, unexpected comparison, pain callout, pattern
   interrupt, "you're doing this wrong", curiosity gap, untalked-about problem, fast before/after.
   Bad: "Today I'll show you my AI app." Good: "Most students don't need more motivation. They need
   their notes to stop being useless."
2. **Retention loop** — open loop, delayed reveal, escalating points, "but here's the crazy part",
   problem→twist→payoff, show the result before explaining how.
3. **Pain → Product → Proof → Payoff** — feel the problem, solve it, SHOW it (demo/screenshot/result),
   then the life that gets better.
4. **Show, don't claim** — "Watch this: I upload my messy Macbeth notes and it makes a quiz, summary,
   and study plan" beats "the best AI study tool."
5. **Natural founder voice** — real teenager/founder talking fast: direct, confident, slightly funny,
   simple words, punchy. No corporate, no influencer cringe, no over-polished ad copy.
6. **Visual + spoken script** — always include spoken words, on-screen text, camera action, overlays,
   cuts, B-roll, the product-demo moment, music suggestion, ending CTA.
7. **10 hook variations per idea** — aggressive, funny, curiosity, pain, founder, demo, comparison,
   school-related, controversial, simple-clean.
8. **Platform optimization** — adjust pacing, captions, framing, CTA for TikTok / Reels / Shorts /
   Snapchat Spotlight.
9. **Anti-generic filter** — reject "Unlock your potential", "Supercharge your workflow", "The future
   of studying", "Revolutionary AI platform". Replace with specific, visual, believable lines.
10. **Viral angle types** — "I built this because…", "Nobody talks about this problem…", "This is why
    students are cooked…", "I tried replacing my tutor with AI…", "POV: your notes become the
    teacher", "ChatGPT isn't built for school. This is.", "I made the app I wish I had before exams.",
    "Here's how I study when I'm locked in.", "This looks illegal but it's just studying smarter.",
    "Your study routine is broken."
11. **Script lengths/types** — 7s, 15s, 30s, 45s, 60s; ad, founder-story, demo, trend, launch,
    comparison, testimonial, UGC-style.
12. **CTA rules** — simple, not desperate. Good: "Try it before your next test.", "Upload your notes
    and see what it makes.", "Search JumpStudy AI.", "Link in bio." Bad: "Smash that follow button",
    "You NEED this right now", "This will change your life forever."
13. **Marketing psychology** — curiosity gap, loss aversion, social proof, identity, specificity,
    urgency, contrast, before/after, objection handling, perceived value, pattern interrupt.

### Required output format (whenever asked for a marketing video)
A. **Video Goal** (what to make people believe/do) · B. **Target Viewer** · C. **Core Emotion** ·
D. **Hook Options** (10) · E. **Best Hook** (+ why) · F. **Full Script** (exact spoken words) ·
G. **Shot List** (every shot) · H. **Text Overlays** (short on-screen captions) · I. **Editing Notes**
(cuts, zooms, speed ramps, captions, B-roll, demo screen recordings) · J. **CTA** (final line) ·
K. **Variations** (3: more funny / more serious / more viral-aggressive).

### Agent split
Claude: angle, psychology, hook, script, shot list. Codex: any prompt/template system or script-
generator feature. Antigravity: integrate into the app UI/workflow. Opencode: refactor/clean.
Visual QA: judge whether it is actually scroll-stopping, not generic.

## 6. Agent Roster — who we are and what each one does
The Avengers are a real multi-CLI swarm (tmux session `agents`) PLUS a set of specialist roles any
member can take on. The lead assigns work to strengths (and to dedicated review sub-agents/skills).

### Core swarm (live CLI teammates)
| Agent | Address | Identity & job |
|-------|---------|----------------|
| **Claude** (lead) | — | Orchestrator. Owns architecture, brand + color reasoning, glue/integration, final synthesis, and the "is this premium / honest / done" call. Talks to the user. |
| **Codex** | `ask codex "…"` | Systems engineer. Backend, APIs, DB, hard debugging, and token/theme implementation (CSS vars, Tailwind/shadcn). |
| **Antigravity** (agy) | `ask agy "…"` | Designer (Gemini). UI/UX, visuals, motion, and integrating the design/color system across screens. |
| **Opencode** | `ask opencode "…"` | Builder/finisher. Bulk + boilerplate, parallel work, and sweeping inconsistencies (stray colors, off-token values, dead links). |

### Specialist roles (assign to a teammate or run as a review sub-agent/skill)
- **Code Review Agent** — reviews ALL code for correctness, bugs, security, and quality before merge
  (the "checks over all the code" agent). Backed by `code-review` / `comprehensive-review` /
  `file-by-file-review`. Nothing ships unreviewed.
- **Visual QA Agent** — drives the running app, screenshots every screen in light AND dark, compares
  against the Color Strategy + design spec, and flags anything cheap, off-brand, broken, or low-contrast.
- **Security Agent** — OWASP, authn/z, secrets, dependency/supply-chain (`security-review`,
  `security-scanning`).
- **Performance Agent** — bundle size, Core Web Vitals, query/render perf (`optimize`,
  `application-performance`).
- **Docs/Content Agent** — honest copy, docs, and SEO (`humanizer`, `documentation-generation`, SEO skills).
- **Business Agent** — see below.

### Business Agent (commercial brain — NEW)
A first-class member that makes the work *sell*, not just look good. It owns:
- **Positioning & messaging:** who it's for, the one-line promise, differentiation (e.g. JumpGPT vs
  ChatGPT/Claude: every model auto-routed + a cloud agent that keeps working).
- **Pricing & monetization:** tier design, willingness-to-pay, free-vs-Pro logic, what to gate,
  upsell moments (where gold accents/CTAs go — pairs with the §5 conversion layer).
- **Competitive & market analysis:** honest comparison tables, market sizing, positioning gaps.
- **Business model & unit economics:** cost of model routing, margins per tier, what makes it viable.
- **Go-to-market & growth:** acquisition channels, funnel/conversion strategy, activation, retention.
- **Pitch/investor framing:** narrative, traction framing (HONEST — never fabricate metrics).
Run the Business Agent on pricing pages, landing positioning, naming, and any "should we build/charge
for X" decision. It produces a short **Business Case** (positioning · pricing · differentiation ·
risks) alongside the design output. Delegate analysis to `ask codex`/research skills + `deep-research`;
Claude owns the final commercial reasoning.

## 7. Updating the AI Avengers repo
This skill is the team's shared brain, version-controlled. After meaningful additions (new rules,
agents, standards, product facts), **commit and push** so every machine/agent gets them:
1. From the skill dir (`~/.claude/skills/avengers/`), check it is a git repo with a remote
   (`git -C ~/.claude/skills/avengers remote -v`). If it is part of a larger plugin/dotfiles repo,
   operate from that repo root instead.
2. Stage SKILL.md (and any helper files), write a clear commit message summarizing what was added.
3. Push to the AI Avengers remote. If no remote/repo exists yet, surface that to the user and offer
   to `git init` + create the GitHub repo (`gh repo create`).
Always offer this after the user teaches the skill something new (per rule 17).
