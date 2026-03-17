# Agent Skills

Multi-agent evaluation systems, persistent error memory, C-to-Rust migration, composable pipelines, and browser automation for AI coding assistants.

18 open-source skills. Works with Claude Code, Codex CLI, Gemini CLI, Cursor, and Windsurf.

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

## Multi-Agent Panels

### [full-eval](https://github.com/JuanMarchetto/full-eval-skill)
One command: 6 business evaluators + 8 life advisors + PDF report. Orchestrates architect, council, and pdf-presentation into a single end-to-end evaluation. You describe an idea, it dispatches 14 specialist agents in parallel, synthesizes two independent verdicts, resolves cross-system conflicts, and delivers a polished PDF. The complete strategic + personal evaluation in one shot.
`Requires: Agent tool, WebSearch`

### [hackathon-jury](https://github.com/JuanMarchetto/hackathon-jury-skill)
Web-searches the actual judges of your hackathon, builds 3-7 juror personas from their real backgrounds and biases, dispatches each to evaluate your project independently, then simulates the deliberation — scores, individual feedback, placement estimate, and pitch coaching. Nothing comparable exists.
`Requires: WebSearch, Agent tool`

### [architect](https://github.com/JuanMarchetto/architect-skill)
6 parallel specialist evaluators — market, technical, risk, impact, resources, innovation — each assess your idea independently. A synthesizer resolves conflicts and produces a unified Opportunity Score, Value Matrix, and Go/No-Go recommendation. Dual-mode: raw ideas from scratch or existing codebase health scans.
`Requires: Agent tool, WebSearch`

### [vc-evaluator](https://github.com/JuanMarchetto/vc-evaluator-skill)
Simulate a real VC investment panel. Researches actual investors in your sector, builds personas from their investment thesis and portfolio, runs parallel evaluations, and simulates the Monday partner meeting with funding verdict, feedback, and pitch coaching.
`Requires: WebSearch, Agent tool`

### [oss-readiness](https://github.com/JuanMarchetto/oss-readiness-skill)
Open source readiness evaluator — 5 parallel agents audit licensing, documentation, security, community readiness, and API surface. Produces a readiness score and prioritized checklist for going open source.
`Requires: Agent tool`

### [council-skill](https://github.com/JuanMarchetto/council-skill)
8 parallel life advisors — finance, health, career, relationships, creativity, productivity, social dynamics, personal growth. Each evaluates your situation independently, then a synthesizer unifies their recommendations. The personal counterpart to architect's business analysis.
`Requires: Agent tool`

---

## Error Memory

### [learn-by-mistake](https://github.com/JuanMarchetto/learn-by-mistake-skill)
Your AI never makes the same mistake twice. Analyzes every failure, extracts the root cause as a structured lesson, and persists it. Next time the same pattern appears, the fix is applied before the error can happen. Confidence gate (2 occurrences before promoting), secret sanitization, and automatic pruning built-in. Commands: `/learn`, `/lessons`, `/forget`.
`Requires: None (hooks optional)`

### [post-run-analysis](https://github.com/JuanMarchetto/post-run-analysis-skill)
Automatic post-mortem after iterative runs (migration, build, deploy, test suites). Parses logs, compares with previous runs, identifies recurring patterns, classifies findings as FIXABLE/NEEDS_INVESTIGATION, and updates project memory. The feedback loop closer.
`Requires: None`

---

## Architecture

### [architecture-reviewer](https://github.com/JuanMarchetto/architecture-reviewer-skill)
Audit code against architecture documentation. Detects drift between what was designed and what was built — boundary violations, dependency drift, responsibility creep, technology changes. Generates drift reports with severity classification. Includes ARCHITECTURE.md starter template.
`Requires: None`

---

## Rust Migration

### [c-to-rust-migration](https://github.com/JuanMarchetto/c-to-rust-migration-skill)
Complete C/C++ to Rust migration pipeline. Analyzes code difficulty (easy/medium/hard), converts to idiomatic safe Rust with proven patterns (malloc→Vec, error codes→Result, NULL→Option), validates with differential testing.
`Requires: Rust toolchain`

---

## Product Builder

### [founder-mode](https://github.com/JuanMarchetto/founder-mode-skill)
End-to-end product builder with founder mindset. Orchestrates 9 phases: idea evaluation (via architect) → architecture → TDD planning → implementation → E2E testing → verification → post-run analysis → GTM launch kit (README, pitch, tweet thread, Product Hunt draft, CHANGELOG). Three human gates for Go/No-Go decisions. Crash recovery via state file. Supports new ideas and existing projects. The most ambitious skill in the marketplace — composes architect, learn-by-mistake, and post-run-analysis into a single pipeline.
`Requires: architect skill. Optional: learn-by-mistake, post-run-analysis`

---

## Pipelines

Skills that orchestrate other skills. One command in, finished artifact out.

### [demo-pipeline](https://github.com/JuanMarchetto/demo-pipeline)
Describe a demo in plain English, get a recorded video. Discovers your app's screens via static analysis, generates a test script, executes it with maestro (mobile) or webreel (web), and outputs screenshots + video + QA report.
`Requires: maestro or webreel`

### [e2e-pipeline](https://github.com/JuanMarchetto/e2e-pipeline-skill)
Auto-generate and run E2E tests from static codebase analysis. Scans project structure, identifies testable flows, generates scripts, executes them, reports results. Pairs with mobile-design-system for design-informed test generation.
`Requires: maestro CLI`

---

## Testing

### [maestro-mobile-testing](https://github.com/JuanMarchetto/maestro-mobile-testing)
Comprehensive Maestro E2E testing for React Native/Expo. 11 core patterns including auth pre-flight, adaptive flows, optimistic update verification, and OTP testing. iOS/Android gotchas, CI/CD with Maestro Cloud, and MCP server integration. The test execution engine for demo-pipeline and e2e-pipeline.
`Requires: maestro CLI, Java 17+`

---

## Recording & Automation

### [webreel](https://github.com/JuanMarchetto/webreel-skill)
Record scripted browser demos from a JSON config. Cursor animation, keystroke HUD overlays, sound effects. Outputs MP4, GIF, or WebM. Custom themes, viewport presets, shared step sequences, and watch mode. Used by demo-pipeline for web recordings.
`Requires: webreel (npm)`

### [agent-browser](https://github.com/JuanMarchetto/agent-browser-skill)
Browser automation built for AI agents. Navigate, interact with `@e` refs, fill forms, upload files, drag-and-drop, execute JavaScript, and record video. 6 reference docs and 3 ready-to-use templates.
`Requires: infsh CLI (inference.sh)`

---

## Design

### [mobile-design-system](https://github.com/JuanMarchetto/mobile-design-system-skill)
Comprehensive mobile UI/UX design system covering React Native, iOS, and Android. Touch targets, gesture handling, haptic feedback, safe areas, accessibility, dark mode, and platform-specific patterns. Pairs with e2e-pipeline: design defines the rules, tests verify them.
`Requires: React Native or native platform`

---

## Documents

### [pdf-presentation](https://github.com/JuanMarchetto/pdf-presentation-skill)
Professional PDF reports and presentations from structured content. Multi-page layouts, charts, branding, export-ready formatting. Turns architect evaluations and council advisories into polished deliverables — the final stage of the pipeline.
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

```
/plugin marketplace add JuanMarchetto/agent-skills
```

Then pick what you need:

```
/plugin install learn-by-mistake@agent-skills
/plugin install post-run-analysis@agent-skills
/plugin install architecture-reviewer@agent-skills
/plugin install hackathon-jury@agent-skills
/plugin install full-eval@agent-skills
/plugin install architect@agent-skills
/plugin install vc-evaluator@agent-skills
/plugin install oss-readiness@agent-skills
/plugin install council-skill@agent-skills
/plugin install c-to-rust-migration@agent-skills
/plugin install demo-pipeline@agent-skills
/plugin install e2e-pipeline@agent-skills
/plugin install maestro-mobile-testing@agent-skills
/plugin install webreel@agent-skills
/plugin install agent-browser@agent-skills
/plugin install mobile-design-system@agent-skills
/plugin install pdf-presentation@agent-skills
/plugin install founder-mode@agent-skills
```

## Manual Install

```bash
git clone https://github.com/JuanMarchetto/<skill-name>.git
cp -r <skill-name> ~/.claude/skills/<skill-name>
```

## License

MIT
