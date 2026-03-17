# Agent Skills

Your AI coding assistant, but with 6 business analysts and 8 life advisors running simultaneously — evaluating independently, disagreeing with each other, and a meta-synthesizer resolving their conflicts into one verdict.

13 open-source skills. Works with Claude Code, Codex CLI, Gemini CLI, Cursor, and Windsurf.

---

## The Star Skills

### [full-eval](https://github.com/JuanMarchetto/full-eval-skill)
One command: 6 business evaluators + 8 life advisors + PDF report. Orchestrates architect, council, and pdf-presentation into a single end-to-end evaluation. You describe an idea, it dispatches 14 specialist agents in parallel, synthesizes two independent verdicts, resolves cross-system conflicts, and delivers a polished PDF. The complete strategic + personal evaluation in one shot.
`Requires: Agent tool, WebSearch`

### [hackathon-jury](https://github.com/JuanMarchetto/hackathon-jury-skill)
Web-searches the actual judges of your hackathon, builds 3-7 juror personas from their real backgrounds and biases, dispatches each to evaluate your project independently, then simulates the deliberation — scores, individual feedback, placement estimate, and pitch coaching. Nothing comparable exists.
`Requires: WebSearch, Agent tool`

### [architect](https://github.com/JuanMarchetto/architect-skill)
6 parallel specialist evaluators — market, technical, risk, impact, resources, innovation — each assess your idea independently. A synthesizer resolves conflicts and produces a unified Opportunity Score, Value Matrix, and Go/No-Go recommendation. Dual-mode: raw ideas from scratch or existing codebase health scans.
`Requires: Agent tool, WebSearch`

### [council-skill](https://github.com/JuanMarchetto/council-skill)
8 parallel life advisors — finance, health, career, relationships, creativity, productivity, social dynamics, personal growth. Each evaluates your situation independently, then a synthesizer unifies their recommendations. The personal counterpart to architect's business analysis.
`Requires: Agent tool`

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

### [ios-glass-ui-skill](https://github.com/JuanMarchetto/ios-glass-ui-skill)
iOS-native glass material UI following Apple Human Interface Guidelines. SwiftUI components with blur effects, vibrancy, adaptive tinting, and proper accessibility. Sheets, cards, navigation bars, custom controls.
`Requires: Xcode, SwiftUI`

---

## Assets

### [app-store-screenshots](https://github.com/JuanMarchetto/app-store-screenshots-skill)
App Store and Google Play screenshot creation with exact platform specs. Device-framed screenshots at required resolutions for all device sizes, with text overlays, backgrounds, and marketing copy. Ready-to-upload assets.
`Requires: None`

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

---

## How They Compose

Skills invoke other skills, chain outputs, and form pipelines.

```
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
/plugin install full-eval@agent-skills
/plugin install hackathon-jury@agent-skills
/plugin install architect@agent-skills
/plugin install council-skill@agent-skills
/plugin install demo-pipeline@agent-skills
/plugin install e2e-pipeline@agent-skills
/plugin install maestro-mobile-testing@agent-skills
/plugin install webreel@agent-skills
/plugin install agent-browser@agent-skills
/plugin install mobile-design-system@agent-skills
/plugin install ios-glass-ui-skill@agent-skills
/plugin install app-store-screenshots@agent-skills
/plugin install pdf-presentation@agent-skills
```

## Manual Install

For any AI coding tool that supports the [Agent Skills](https://code.claude.com/docs/en/skills) standard:

```bash
git clone https://github.com/JuanMarchetto/<skill-name>.git
cp -r <skill-name> ~/.claude/skills/<skill-name>
```

Or install via npx:

```bash
npx @anthropic-ai/claude-code-skill install JuanMarchetto/<skill-name>
```

## License

MIT
