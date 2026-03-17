# Agent Skills

Skills that dispatch parallel AI agents, orchestrate multi-step pipelines, and produce professional deliverables -- not single-purpose prompts, but composable systems where skills invoke other skills and specialist agents argue with each other before giving you a unified answer.

15 open-source skills. Works with Claude Code, Codex CLI, Gemini CLI, Cursor, and Windsurf.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
```

Then pick what you need:

```
/plugin install hackathon-jury@agent-skills
/plugin install architect@agent-skills
/plugin install council-skill@agent-skills
/plugin install demo-pipeline@agent-skills
/plugin install e2e-pipeline@agent-skills
/plugin install pdf-presentation@agent-skills
/plugin install webreel@agent-skills
/plugin install playwright-recording@agent-skills
/plugin install agent-browser@agent-skills
/plugin install mobile-design-system@agent-skills
/plugin install ios-glass-ui-skill@agent-skills
/plugin install ui-ux-polish-skill@agent-skills
/plugin install youtube-devrel-skill@agent-skills
/plugin install app-store-screenshots@agent-skills
/plugin install maestro-mobile-testing@agent-skills
```

---

## Multi-Agent Systems

The differentiator. Each of these dispatches multiple specialist AI agents in parallel, lets them evaluate independently, then synthesizes their (often conflicting) outputs into a single unified assessment.

### [hackathon-jury](https://github.com/JuanMarchetto/hackathon-jury-skill)
Simulate a real hackathon jury evaluating your project. Web-searches the actual judges of your hackathon, builds 3-7 juror personas from their real backgrounds and biases, dispatches each to evaluate your project independently, then simulates the deliberation -- complete with scores, individual feedback, placement estimate, and pitch coaching. Nothing comparable exists anywhere.
`Requires: WebSearch, Agent tool`

### [architect](https://github.com/JuanMarchetto/architect-skill)
6 parallel specialist evaluators -- market, technical, risk, impact, resources, innovation -- each assess your idea or project independently. A synthesizer resolves conflicts between evaluators and produces a unified Opportunity Score, Value Matrix (commercial/educational/social), and Go/No-Go recommendation. Dual-mode: evaluates raw ideas from scratch or scans existing codebases for project health.
`Requires: Agent tool, WebSearch`

### [council-skill](https://github.com/JuanMarchetto/council-skill)
8 parallel life advisors covering finance, health, career, relationships, creativity, productivity, social dynamics, and personal growth. Each advisor evaluates your situation independently, then a synthesizer unifies their recommendations. Run alongside architect for full strategic + personal assessment of any decision.
`Requires: Agent tool`

---

## Pipelines

Skills that orchestrate other skills. This is the composition pattern -- one skill dispatches others, chains their outputs, and delivers a finished artifact.

### [demo-pipeline](https://github.com/JuanMarchetto/demo-pipeline)
Describe a demo in plain English, get a recorded video. Discovers your app's screens via static analysis, generates a YAML test script, executes it with maestro (mobile) or webreel (web), and outputs screenshots + video + QA report. The full pipeline: natural language in, polished demo out.
`Requires: maestro or webreel`

### [e2e-pipeline](https://github.com/JuanMarchetto/e2e-pipeline-skill)
Auto-generate and run E2E tests from static codebase analysis. Scans project structure, identifies testable flows, generates test scripts, executes them, and reports results. Pairs with mobile-design-system for design-informed test generation.
`Requires: maestro CLI`

### [pdf-presentation](https://github.com/JuanMarchetto/pdf-presentation-skill)
Generate professional PDF reports and presentations from structured content. Multi-page layouts, charts, branding, export-ready formatting. Designed to turn the output of architect evaluations and council advisories into polished deliverables -- the final stage of the pipeline.
`Requires: None`

---

## Recording & Automation

### [webreel](https://github.com/JuanMarchetto/webreel-skill)
Record scripted browser demos from a JSON config. Cursor animation, keystroke HUD overlays, sound effects. Outputs MP4, GIF, or WebM. Supports custom themes, viewport presets, shared step sequences, and watch mode for iterative development. Used by demo-pipeline for web app recordings.
`Requires: webreel (npm)`

### [playwright-recording](https://github.com/JuanMarchetto/playwright-recording-skill)
Record browser interactions as video using Playwright. Navigate, click, type, scroll -- everything captured as MP4. Useful for demo recordings, bug reproductions, and visual documentation.
`Requires: Playwright`

### [agent-browser](https://github.com/JuanMarchetto/agent-browser-skill)
Browser automation built for AI agents. Navigate pages, interact with elements using `@e` refs, fill forms, upload files, drag-and-drop, execute JavaScript, and record video. Includes 6 reference docs and 3 ready-to-use templates.
`Requires: infsh CLI (inference.sh)`

---

## Design & UI

### [mobile-design-system](https://github.com/JuanMarchetto/mobile-design-system-skill)
Comprehensive mobile UI/UX design system covering React Native, iOS, and Android. Touch targets, gesture handling, haptic feedback, safe areas, accessibility, dark mode, and platform-specific patterns. Pairs with e2e-pipeline: design system defines interaction patterns, e2e-pipeline tests them automatically.
`Requires: React Native or native platform`

### [ios-glass-ui-skill](https://github.com/JuanMarchetto/ios-glass-ui-skill)
iOS-native glass material UI following Apple Human Interface Guidelines. SwiftUI components with blur effects, vibrancy, adaptive tinting, and proper accessibility. Covers sheets, cards, navigation bars, and custom controls.
`Requires: Xcode, SwiftUI`

### [ui-ux-polish-skill](https://github.com/JuanMarchetto/ui-ux-polish-skill)
Iterative UI/UX polishing workflow for Stripe-level visual quality. Multiple passes analyzing spacing, typography, color, animations, and micro-interactions, producing specific code changes each round until the interface reaches production polish.
`Requires: Browser/screenshot capability`

---

## Content & Publishing

### [youtube-devrel-skill](https://github.com/JuanMarchetto/youtube-devrel-skill)
Developer YouTube content creation end-to-end. Tutorial structure, screen recording scripts, YouTube Shorts optimization, SEO metadata, thumbnail design briefs, and audience growth strategy for technical channels.
`Requires: None`

### [app-store-screenshots](https://github.com/JuanMarchetto/app-store-screenshots-skill)
App Store and Google Play screenshot creation with exact platform specs. Device-framed screenshots at required resolutions for all device sizes, with text overlays, backgrounds, and marketing copy. Ready-to-upload assets.
`Requires: None`

---

## Testing

### [maestro-mobile-testing](https://github.com/JuanMarchetto/maestro-mobile-testing)
Comprehensive Maestro E2E testing for React Native/Expo. 11 core patterns including auth pre-flight, adaptive flows, optimistic update verification, and OTP testing. iOS/Android gotchas, CI/CD with Maestro Cloud, and MCP server integration. Used by demo-pipeline and e2e-pipeline as the test execution engine.
`Requires: maestro CLI, Java 17+`

---

## How They Compose

This is the moat. Skills are not isolated -- they invoke each other, chain outputs, and form pipelines.

```
demo-pipeline ──► maestro-mobile-testing (mobile apps)
               ──► webreel (web apps)
               ──► outputs: screenshots + video + QA report

e2e-pipeline ──► maestro-mobile-testing (test generation + execution)
             ──► mobile-design-system (design-informed test patterns)

architect ──► pdf-presentation (evaluation → polished PDF report)
council   ──► pdf-presentation (advisory → formatted deliverable)

architect + council ──► full strategic + personal assessment
                    ──► both use parallel agent dispatch + synthesis

mobile-design-system + e2e-pipeline ──► design defines the rules,
                                       tests verify them automatically
```

Any skill works standalone. The composition is optional but powerful -- demo-pipeline selects the right recording tool for your project type, pdf-presentation turns any evaluation into a client-ready document, and the multi-agent systems can run in tandem for complementary perspectives.

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
