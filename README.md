# Agent Skills

15 production-ready skills for AI coding assistants — multi-agent advisory systems, E2E testing, mobile design systems, PDF presentations, app store assets, UI/UX design workflows, content creation pipelines, mobile testing, and browser automation. Several skills dispatch parallel specialist agents and synthesize their outputs into unified assessments, going well beyond single-purpose prompts.

Works with Claude Code, Codex CLI, Gemini CLI, Cursor, and Windsurf.

## Highlights

These skills stand out for doing things nothing else in the ecosystem does:

- **hackathon-jury** -- Researches real jury members, builds personas, runs parallel evaluations, simulates deliberation. Blue ocean: nothing comparable exists anywhere.
- **architect** -- 6 parallel specialist evaluators (market, technical, risk, impact, resources, innovation) with a synthesizer that resolves conflicts. Unique multi-agent pattern.
- **council** -- 8 parallel life advisors covering finance, health, career, relationships, creativity, productivity, social dynamics, personal growth. The most personal multi-agent system available.
- **demo-pipeline** -- Pipeline composition: a skill that orchestrates other skills (maestro + webreel) to produce demo videos from plain English descriptions.
- **pdf-presentation** -- Professional PDF reports and presentations from structured content. New category, empty niche in the skills ecosystem.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
```

Then pick what you need:

```
/plugin install maestro-mobile-testing@agent-skills
/plugin install demo-pipeline@agent-skills
/plugin install agent-browser@agent-skills
/plugin install webreel@agent-skills
/plugin install hackathon-jury@agent-skills
/plugin install architect@agent-skills
/plugin install council-skill@agent-skills
/plugin install ui-ux-polish-skill@agent-skills
/plugin install youtube-devrel-skill@agent-skills
/plugin install ios-glass-ui-skill@agent-skills
/plugin install e2e-pipeline@agent-skills
/plugin install app-store-screenshots@agent-skills
/plugin install playwright-recording@agent-skills
/plugin install mobile-design-system@agent-skills
/plugin install pdf-presentation@agent-skills
```

## Skills

### Multi-Agent Systems

### [hackathon-jury](https://github.com/JuanMarchetto/hackathon-jury-skill)
Simulate a real hackathon jury evaluating your project. Researches actual jury members via web search, builds 3-7 juror personas, dispatches parallel evaluations from each perspective, and synthesizes a deliberation with scores, individual feedback, placement estimate, and pitch coaching.
`Requires: WebSearch, Agent tool`

### [architect](https://github.com/JuanMarchetto/architect-skill)
Evaluate any idea or project from 6 angles simultaneously. Dispatches parallel specialist evaluators (market, technical, risk, impact, resources, innovation), then synthesizes their outputs into a unified assessment with Opportunity Score, Value Matrix, and Go/No-Go recommendation.
`Requires: Agent tool, WebSearch`

### [council-skill](https://github.com/JuanMarchetto/council-skill)
Life advisory council with 8 parallel specialist advisors covering finance, health, career, relationships, creativity, productivity, social dynamics, and personal growth. Each advisor evaluates independently, then a synthesizer unifies their recommendations into actionable guidance.
`Requires: Agent tool`

### Testing & Automation

### [maestro-mobile-testing](https://github.com/JuanMarchetto/maestro-mobile-testing)
Comprehensive Maestro E2E testing for React Native/Expo. 11 core patterns including auth pre-flight, adaptive flows, optimistic update verification, and OTP testing. Covers iOS/Android gotchas, CI/CD with Maestro Cloud, and MCP server integration.
`Requires: maestro CLI, Java 17+`

### [e2e-pipeline](https://github.com/JuanMarchetto/e2e-pipeline-skill)
Auto-generate and run E2E tests from static codebase analysis. Scans your project structure, identifies testable flows, generates test scripts, and executes them. Works with Maestro for mobile apps.
`Requires: maestro CLI`

### [agent-browser](https://github.com/JuanMarchetto/agent-browser-skill)
Browser automation built for AI agents. Navigate pages, interact with elements using `@e` refs, fill forms, upload files, drag-and-drop, execute JavaScript, and record video. Includes 6 reference docs and 3 ready-to-use templates.
`Requires: infsh CLI (inference.sh)`

### [playwright-recording](https://github.com/JuanMarchetto/playwright-recording-skill)
Record browser interactions as video using Playwright. Navigate, click, type, scroll -- everything gets captured as an MP4. Useful for creating demo recordings, bug reproductions, and visual documentation.
`Requires: Playwright`

### Demo & Content Creation

### [demo-pipeline](https://github.com/JuanMarchetto/demo-pipeline)
Describe a demo in plain English, get a recorded video. Discovers your app's screens via static analysis, generates a YAML script, executes it with Maestro (mobile) or webreel (web), and outputs screenshots + video + QA report.
`Requires: maestro or webreel`

### [webreel](https://github.com/JuanMarchetto/webreel-skill)
Record scripted browser demos from a JSON config. Cursor animation, keystroke HUD overlays, sound effects. Outputs MP4, GIF, or WebM. Supports custom themes, viewport presets, shared step sequences, and watch mode for iterative development.
`Requires: webreel (npm)`

### [youtube-devrel-skill](https://github.com/JuanMarchetto/youtube-devrel-skill)
Developer YouTube content creation end-to-end. Covers tutorial structure, screen recording scripts, YouTube Shorts optimization, SEO metadata, thumbnail design briefs, and audience growth strategy for technical channels.
`Requires: None`

### [pdf-presentation](https://github.com/JuanMarchetto/pdf-presentation-skill)
Generate professional PDF reports and presentations from structured content. Supports multi-page layouts, charts, branding, and export-ready formatting. Can export outputs from architect and council evaluations into polished deliverables.
`Requires: None`

### Design & UI

### [ui-ux-polish-skill](https://github.com/JuanMarchetto/ui-ux-polish-skill)
Iterative UI/UX polishing workflow for achieving Stripe-level visual polish. Runs multiple passes analyzing spacing, typography, color, animations, and micro-interactions, producing specific code changes each round until the interface reaches production quality.
`Requires: Browser/screenshot capability`

### [ios-glass-ui-skill](https://github.com/JuanMarchetto/ios-glass-ui-skill)
iOS-native glass material UI design following Apple Human Interface Guidelines. Generates SwiftUI components with blur effects, vibrancy, adaptive tinting, and proper accessibility. Covers sheets, cards, navigation bars, and custom controls.
`Requires: Xcode, SwiftUI`

### [mobile-design-system](https://github.com/JuanMarchetto/mobile-design-system-skill)
Comprehensive mobile UI/UX design system covering React Native, iOS, and Android. Touch targets, gesture handling, haptic feedback, safe areas, accessibility, dark mode, and platform-specific patterns. A complete reference for building production mobile interfaces.
`Requires: React Native or native platform`

### App Store Assets

### [app-store-screenshots](https://github.com/JuanMarchetto/app-store-screenshots-skill)
App Store and Google Play screenshot creation with exact platform specs. Generates device-framed screenshots at required resolutions for all device sizes, with text overlays, backgrounds, and marketing copy. Ready-to-upload assets.
`Requires: None`

## How They Compose

```
demo-pipeline
  uses maestro-mobile-testing (for mobile apps)
  uses webreel (for web apps)
  outputs screenshots + video + report

architect + council
  architect evaluates the idea/project (6 specialist evaluators)
  council advises on life impact (8 specialist advisors)
  together: full strategic + personal assessment

e2e-pipeline
  uses maestro-mobile-testing (test generation + execution)
  auto-generates tests from static codebase analysis

pdf-presentation
  can export architect evaluation results as polished PDF reports
  can export council advisory outputs as formatted deliverables

mobile-design-system + e2e-pipeline
  design system defines interaction patterns and accessibility rules
  e2e-pipeline tests those patterns automatically
  together: design-informed testing
```

Skills are designed to work independently or together. demo-pipeline orchestrates testing skills based on your project type. architect and council are both multi-agent systems that can provide complementary evaluations. pdf-presentation turns any skill's output into a professional deliverable.

## Manual Install

For any AI coding tool that supports the [Agent Skills](https://code.claude.com/docs/en/skills) standard:

```bash
git clone https://github.com/JuanMarchetto/<skill-name>.git
cp -r <skill-name> ~/.claude/skills/<skill-name>
```

## License

MIT
