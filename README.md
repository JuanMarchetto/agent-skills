# Agent Skills

Multi-agent evaluation systems, persistent error memory, C-to-Rust migration, composable pipelines, and browser automation for AI coding assistants.

28 open-source skills. Works with Claude Code, Codex CLI, Gemini CLI, Cursor, and Windsurf.

```
HACKATHON JURY SIMULATOR — ORE at Colosseum Renaissance
5 jurors based on real Colosseum judges | Grand Prize Winner (8,300 participants)

| Criterion (Weight)  | Matty T. | Nate L. | Mert M. | Clay R. | Chase B. |  Avg |
|---------------------|----------|---------|---------|---------|----------|------|
| Innovation (25%)    |    9     |    9    |    9    |    9    |    8     |  8.8 |
| Technical (25%)     |    7     |    9    |    9    |    7    |    8     |  8.0 |
| Impact (20%)        |   10     |    8    |    8    |    9    |   10     |  9.0 |
| UX/Design (15%)     |    7     |    7    |    6    |    8    |    7     |  7.0 |
| Presentation (15%)  |    9     |    7    |    8    |    9    |    8     |  8.2 |
| Weighted Total      |  8.40    |  8.20   |  8.20   |  8.35   |  8.25    | 8.28 |

"ORE spawned an entire sub-ecosystem: pools, CLIs, boost protocols,
 the steel framework. That is the definition of ecosystem contribution."
 — Chase Barker, Solana Foundation
```

---

## Skills

| Skill | Description | Category |
|-------|-------------|----------|
| [architect](skills/architect/) | Multidisciplinary idea and project evaluator. Dispatches 3-6 specialist evaluators in parallel, synthesizes into unified assessment with scores, Value Matrix, and next steps. | Multi-Agent Panels |
| [council](skills/council/) | Life advisory council with 8 parallel specialist advisors and synthesis. Covers finance, health, career, learning, systems, relationships, and creative. | Multi-Agent Panels |
| [full-eval](skills/full-eval/) | Complete strategic and personal evaluation. Runs architect and council in parallel, cross-references outputs, generates PDF report. | Multi-Agent Panels |
| [hackathon-jury](skills/hackathon-jury/) | Simulate a real hackathon jury. Researches actual jury members, builds personalized juror personas, dispatches parallel evaluations. | Multi-Agent Panels |
| [vc-evaluator](skills/vc-evaluator/) | Simulate a VC investment panel. Researches real investors, builds personas from their thesis and portfolio, synthesizes partner meeting deliberation. | Multi-Agent Panels |
| [oss-readiness](skills/oss-readiness/) | Evaluate open source readiness. 5 specialist agents audit licensing, docs, security, community, and API surface in parallel. | Multi-Agent Panels |
| [founder-mode](skills/founder-mode/) | End-to-end product builder with founder mindset. Orchestrates 9 phases from idea evaluation to launch with README, pitch, and Product Hunt draft. | Multi-Agent Panels |
| [idea-lab](skills/idea-lab/) | Automated idea laboratory. Generates diverse ideas, pre-screens them, evaluates best with multi-agent scoring, ranks winners. | Multi-Agent Panels |
| [c-to-rust-migration](skills/c-to-rust-migration/) | Complete C/C++ to Rust migration pipeline. Analyzes difficulty, converts to idiomatic safe Rust, validates results. | Rust Migration |
| [c-cpp-analyzer](skills/c-cpp-analyzer/) | Analyze C/C++ code for Rust migration planning. Classifies functions by difficulty, identifies unsafe patterns and pointer complexity. | Rust Migration |
| [rust-migration](skills/rust-migration/) | C/C++ to idiomatic Rust conversion patterns. Covers pointer translation, memory management, error handling, and quality gates. | Rust Migration |
| [migration-validator](skills/migration-validator/) | Safety verification for C-to-Rust migrations. Validates compilation, unsafe minimization, memory safety, and API compatibility. | Rust Migration |
| [noricum-dev](skills/noricum-dev/) | Development conventions for the Noricum C-to-Rust migration agent. Architecture decisions, crate structure, and coding standards. | Rust Migration |
| [demo-pipeline](skills/demo-pipeline/) | Record automated demos for mobile and web apps. Converts natural language scripts into Maestro flows or webreel configs. | Testing & Recording |
| [e2e-pipeline](skills/e2e-pipeline/) | Generate and run E2E tests for mobile and web. Discovers screens and flows, generates Maestro test flows, reports results. | Testing & Recording |
| [maestro-mobile-testing](skills/maestro-mobile-testing/) | Maestro mobile E2E testing patterns for React Native/Expo. YAML test flows, adaptive auth, GraalJS scripting, CI/CD integration. | Testing & Recording |
| [webreel](skills/webreel/) | Create scripted browser demo videos. Generates MP4, GIF, or WebM with cursor animation, keystroke overlays, and sound effects. | Testing & Recording |
| [agent-browser](skills/agent-browser/) | Browser automation for AI agents via inference.sh. Navigate, interact, screenshot, and record video from web pages. | Testing & Recording |
| [playwright-recording](skills/playwright-recording/) | Record browser interactions as video using Playwright. Cursor highlighting, click ripple effects, and window scaling. | Testing & Recording |
| [pdf-presentation](skills/pdf-presentation/) | Generate professional PDF reports and presentations. Tables, score visualizations, and styled sections from structured content. | Design |
| [mobile-design-system](skills/mobile-design-system/) | Comprehensive mobile UI/UX design system. React Native components, touch interactions, gesture patterns, and accessibility. | Design |
| [ios-glass-ui](skills/ios-glass-ui/) | Redesign mobile app UI with modern Apple-like glass materials. Translucency, blur, depth, and SF Pro typography. | Design |
| [app-store-screenshots](skills/app-store-screenshots/) | Create App Store and Google Play screenshots with exact platform specs. Device mockups, captions, and A/B testing. | Design |
| [ui-ux-polish](skills/ui-ux-polish/) | Iterative UI/UX polishing workflow. Achieve Stripe-level visual polish through multiple incremental passes. | Design |
| [learn-by-mistake](skills/learn-by-mistake/) | Persistent error memory. Analyzes failures, extracts root-cause lessons, prevents the same mistake twice. | Analysis |
| [post-run-analysis](skills/post-run-analysis/) | Automatic post-mortem analysis. Parses logs, compares with history, identifies recurring patterns, proposes fixes. | Analysis |
| [architecture-reviewer](skills/architecture-reviewer/) | Audit code against architecture documentation. Detects drift between design docs and actual code structure. | Analysis |
| [youtube-devrel](skills/youtube-devrel/) | Create developer YouTube content and technical screencasts. Tutorial structure, live coding, thumbnails, and SEO. | Development |

---

## Multi-Agent Panels

### [full-eval](skills/full-eval/)
One command: 6 business evaluators + 8 life advisors + PDF report. Orchestrates architect, council, and pdf-presentation into a single end-to-end evaluation. You describe an idea, it dispatches 14 specialist agents in parallel, synthesizes two independent verdicts, resolves cross-system conflicts, and delivers a polished PDF. The complete strategic + personal evaluation in one shot.
`Requires: Agent tool, WebSearch`

### [hackathon-jury](skills/hackathon-jury/)
Web-searches the actual judges of your hackathon, builds 3-7 juror personas from their real backgrounds and biases, dispatches each to evaluate your project independently, then simulates the deliberation — scores, individual feedback, placement estimate, and pitch coaching. Nothing comparable exists.
`Requires: WebSearch, Agent tool`

### [architect](skills/architect/)
6 parallel specialist evaluators — market, technical, risk, impact, resources, innovation — each assess your idea independently. A synthesizer resolves conflicts and produces a unified Opportunity Score, Value Matrix, and Go/No-Go recommendation. Dual-mode: raw ideas from scratch or existing codebase health scans.
`Requires: Agent tool, WebSearch`

### [vc-evaluator](skills/vc-evaluator/)
Simulate a real VC investment panel. Researches actual investors in your sector, builds personas from their investment thesis and portfolio, runs parallel evaluations, and simulates the Monday partner meeting with funding verdict, feedback, and pitch coaching.
`Requires: WebSearch, Agent tool`

### [oss-readiness](skills/oss-readiness/)
Open source readiness evaluator — 5 parallel agents audit licensing, documentation, security, community readiness, and API surface. Produces a readiness score and prioritized checklist for going open source.
`Requires: Agent tool`

### [council](skills/council/)
8 parallel life advisors — finance, health, career, relationships, creativity, productivity, social dynamics, personal growth. Each evaluates your situation independently, then a synthesizer unifies their recommendations. The personal counterpart to architect's business analysis.
`Requires: Agent tool`

---

## Error Memory

### [learn-by-mistake](skills/learn-by-mistake/)
Your AI never makes the same mistake twice. Analyzes every failure, extracts the root cause as a structured lesson, and persists it. Next time the same pattern appears, the fix is applied before the error can happen. Confidence gate (2 occurrences before promoting), secret sanitization, and automatic pruning built-in. Commands: `/learn`, `/lessons`, `/forget`.
`Requires: None (hooks optional)`

### [post-run-analysis](skills/post-run-analysis/)
Automatic post-mortem after iterative runs (migration, build, deploy, test suites). Parses logs, compares with previous runs, identifies recurring patterns, classifies findings as FIXABLE/NEEDS_INVESTIGATION, and updates project memory. The feedback loop closer.
`Requires: None`

---

## Architecture

### [architecture-reviewer](skills/architecture-reviewer/)
Audit code against architecture documentation. Detects drift between what was designed and what was built — boundary violations, dependency drift, responsibility creep, technology changes. Generates drift reports with severity classification. Includes ARCHITECTURE.md starter template.
`Requires: None`

---

## Rust Migration

### [c-to-rust-migration](skills/c-to-rust-migration/)
Complete C/C++ to Rust migration pipeline. Analyzes code difficulty (easy/medium/hard), converts to idiomatic safe Rust with proven patterns (malloc->Vec, error codes->Result, NULL->Option), validates with differential testing.
`Requires: Rust toolchain`

### [c-cpp-analyzer](skills/c-cpp-analyzer/)
Analyze C/C++ code for Rust migration planning. Classifies functions by migration difficulty, identifies unsafe patterns, pointer complexity, and macro usage.
`Requires: None`

### [rust-migration](skills/rust-migration/)
C/C++ to idiomatic Rust conversion patterns and pipeline. Covers pointer translation, memory management, error handling, string conversion, struct patterns, and quality gates.
`Requires: Rust toolchain`

### [migration-validator](skills/migration-validator/)
Safety verification checklist for C-to-Rust migrations. Validates compilation, unsafe block minimization, memory safety, API compatibility, and idiomatic Rust patterns.
`Requires: Rust toolchain`

### [noricum-dev](skills/noricum-dev/)
Development conventions for the Noricum C-to-Rust migration agent. Architecture decisions, crate structure, coding standards, and contribution guidelines.
`Requires: None`

---

## Ideation

### [idea-lab](skills/idea-lab/)
Automated idea laboratory. Describe your context (hackathon, need, problem type), and it generates N diverse ideas using forced divergence axes (SCAMPER, cross-domain analogies), pre-screens them with a quick evaluation, deep-evaluates the top ones via `/architect` (6 parallel evaluators each), and presents a ranked dashboard with scenario-based recommendations. Composes with `/founder-mode` to build the winning idea end-to-end.
`Requires: architect skill. Optional: founder-mode`

---

## Product Builder

### [founder-mode](skills/founder-mode/)
End-to-end product builder with founder mindset. Orchestrates 9 phases: idea evaluation (via architect) -> architecture -> TDD planning -> implementation -> E2E testing -> verification -> post-run analysis -> GTM launch kit (README, pitch, tweet thread, Product Hunt draft, CHANGELOG). Three human gates for Go/No-Go decisions. Crash recovery via state file. Supports new ideas and existing projects. The most ambitious skill in the marketplace — composes architect, learn-by-mistake, and post-run-analysis into a single pipeline.
`Requires: architect skill. Optional: learn-by-mistake, post-run-analysis`

---

## Pipelines

Skills that orchestrate other skills. One command in, finished artifact out.

### [demo-pipeline](skills/demo-pipeline/)
Describe a demo in plain English, get a recorded video. Discovers your app's screens via static analysis, generates a test script, executes it with maestro (mobile) or webreel (web), and outputs screenshots + video + QA report.
`Requires: maestro or webreel`

### [e2e-pipeline](skills/e2e-pipeline/)
Auto-generate and run E2E tests from static codebase analysis. Scans project structure, identifies testable flows, generates scripts, executes them, reports results. Pairs with mobile-design-system for design-informed test generation.
`Requires: maestro CLI`

---

## Testing

### [maestro-mobile-testing](skills/maestro-mobile-testing/)
Comprehensive Maestro E2E testing for React Native/Expo. 11 core patterns including auth pre-flight, adaptive flows, optimistic update verification, and OTP testing. iOS/Android gotchas, CI/CD with Maestro Cloud, and MCP server integration. The test execution engine for demo-pipeline and e2e-pipeline.
`Requires: maestro CLI, Java 17+`

---

## Recording & Automation

### [webreel](skills/webreel/)
Record scripted browser demos from a JSON config. Cursor animation, keystroke HUD overlays, sound effects. Outputs MP4, GIF, or WebM. Custom themes, viewport presets, shared step sequences, and watch mode. Used by demo-pipeline for web recordings.
`Requires: webreel (npm)`

### [agent-browser](skills/agent-browser/)
Browser automation built for AI agents. Navigate, interact with `@e` refs, fill forms, upload files, drag-and-drop, execute JavaScript, and record video. 6 reference docs and 3 ready-to-use templates.
`Requires: infsh CLI (inference.sh)`

### [playwright-recording](skills/playwright-recording/)
Record browser interactions as video using Playwright. Cursor highlighting, click ripple effects, cookie banner dismissal, and window scaling patterns.
`Requires: Playwright`

---

## Design

### [mobile-design-system](skills/mobile-design-system/)
Comprehensive mobile UI/UX design system covering React Native, iOS, and Android. Touch targets, gesture handling, haptic feedback, safe areas, accessibility, dark mode, and platform-specific patterns. Pairs with e2e-pipeline: design defines the rules, tests verify them.
`Requires: React Native or native platform`

### [ios-glass-ui](skills/ios-glass-ui/)
Redesign mobile app UI to feel unmistakably iOS-native with modern Apple-like glass materials (translucency, blur, depth). SF Pro typography, vibrancy layers, and material system.
`Requires: React Native or SwiftUI`

### [app-store-screenshots](skills/app-store-screenshots/)
Create App Store and Google Play screenshots with exact platform specs. Covers iOS/Android dimensions, gallery ordering, device mockups, captions, preview videos, localization, and A/B testing.
`Requires: None`

### [ui-ux-polish](skills/ui-ux-polish/)
Iterative UI/UX polishing workflow for web applications. Achieve Stripe-level visual polish through multiple passes — each iteration adds incremental improvements that compound dramatically.
`Requires: None`

---

## Documents

### [pdf-presentation](skills/pdf-presentation/)
Professional PDF reports and presentations from structured content. Multi-page layouts, charts, branding, export-ready formatting. Turns architect evaluations and council advisories into polished deliverables — the final stage of the pipeline.
`Requires: None`

---

## Development

### [youtube-devrel](skills/youtube-devrel/)
Create developer YouTube content, technical screencasts, and video tutorials. Covers tutorial structure, screen recording setup, live coding, shorts vs long-form, thumbnails, and SEO for technical content.
`Requires: None`

---

## How full-eval Orchestrates Everything

```
full-eval
  |
  |---> architect (6 evaluators in parallel)
  |       |-- Market Analyst
  |       |-- Technical Architect
  |       |-- Risk Assessor
  |       |-- Impact Evaluator
  |       |-- Resource Strategist
  |       |-- Innovation Scout
  |       └── Synthesizer --> Opportunity Score + Value Matrix
  |
  |---> council (8 advisors in parallel)
  |       |-- Finance       |-- Creativity
  |       |-- Health        |-- Productivity
  |       |-- Career        |-- Social Dynamics
  |       |-- Relationships |-- Personal Growth
  |       └── Synthesizer --> Unified Life Advisory
  |
  |---> Meta-synthesis (cross-system conflict resolution)
  |
  └──-> pdf-presentation --> Polished PDF Report
```

14 specialist agents. 2 synthesizers. 1 meta-synthesis. 1 PDF. One command.

The same multi-agent orchestration pattern powers hackathon-jury (3-7 jurors), vc-evaluator (3-5 investors), and oss-readiness (5 auditors) — each researching real people and evaluating from their genuine perspective.

---

## How They Compose

Skills invoke other skills, chain outputs, and form pipelines.

```
idea-lab ──► architect (deep evaluation per idea)
         ──► founder-mode (build the winning idea, optional)
         ──► outputs: ranked dashboard + scenario recommendations

founder-mode ──► architect (idea evaluation)
             ──► learn-by-mistake (error memory, optional)
             ──► post-run-analysis (phase 7, optional)
             ──► outputs: working product + GTM launch kit

full-eval ──► architect + council + pdf-presentation
              (the complete evaluation pipeline)

demo-pipeline ──► maestro-mobile-testing (mobile apps)
               ──► webreel (web apps)
               ──► outputs: screenshots + video + QA report

e2e-pipeline ──► maestro-mobile-testing (test generation + execution)
             ──► mobile-design-system (design-informed test patterns)

architect ──► pdf-presentation (evaluation → polished PDF)
council   ──► pdf-presentation (advisory → formatted deliverable)
```

Any skill works standalone. The composition is optional but powerful.

---

## Install

### From the monorepo (Claude Code)

```
/install JuanMarchetto/agent-skills:skills/<skill-name>
```

### Pick individual skills

```
/install JuanMarchetto/agent-skills:skills/learn-by-mistake
/install JuanMarchetto/agent-skills:skills/post-run-analysis
/install JuanMarchetto/agent-skills:skills/architecture-reviewer
/install JuanMarchetto/agent-skills:skills/hackathon-jury
/install JuanMarchetto/agent-skills:skills/full-eval
/install JuanMarchetto/agent-skills:skills/architect
/install JuanMarchetto/agent-skills:skills/vc-evaluator
/install JuanMarchetto/agent-skills:skills/oss-readiness
/install JuanMarchetto/agent-skills:skills/council
/install JuanMarchetto/agent-skills:skills/c-to-rust-migration
/install JuanMarchetto/agent-skills:skills/demo-pipeline
/install JuanMarchetto/agent-skills:skills/e2e-pipeline
/install JuanMarchetto/agent-skills:skills/maestro-mobile-testing
/install JuanMarchetto/agent-skills:skills/webreel
/install JuanMarchetto/agent-skills:skills/agent-browser
/install JuanMarchetto/agent-skills:skills/mobile-design-system
/install JuanMarchetto/agent-skills:skills/pdf-presentation
/install JuanMarchetto/agent-skills:skills/founder-mode
/install JuanMarchetto/agent-skills:skills/idea-lab
/install JuanMarchetto/agent-skills:skills/playwright-recording
/install JuanMarchetto/agent-skills:skills/ios-glass-ui
/install JuanMarchetto/agent-skills:skills/app-store-screenshots
/install JuanMarchetto/agent-skills:skills/ui-ux-polish
/install JuanMarchetto/agent-skills:skills/youtube-devrel
/install JuanMarchetto/agent-skills:skills/c-cpp-analyzer
/install JuanMarchetto/agent-skills:skills/rust-migration
/install JuanMarchetto/agent-skills:skills/migration-validator
/install JuanMarchetto/agent-skills:skills/noricum-dev
```

### Manual Install

```bash
git clone https://github.com/JuanMarchetto/agent-skills.git
cp -r agent-skills/skills/<skill-name> ~/.claude/skills/<skill-name>
```

### Compatibility

| Tool | Skills directory |
|------|-----------------|
| Claude Code | `~/.claude/skills/` |
| Codex CLI | `~/.agents/skills/` |
| Gemini CLI | `~/.agents/skills/` |
| Cursor | `~/.cursor/skills/` |
| Windsurf | `~/.agents/skills/` |

## License

All skills are [MIT](LICENSE) licensed.
