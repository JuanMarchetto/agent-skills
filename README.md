# Agent Skills

Skills that teach AI coding assistants real workflows — mobile E2E testing, automated demo recording, browser automation, and video capture. Each skill encodes domain expertise into repeatable, composable patterns.

Works with Claude Code, Codex CLI, Gemini CLI, Cursor, and Windsurf.

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
```

## Skills

### [maestro-mobile-testing](https://github.com/JuanMarchetto/maestro-mobile-testing)
Comprehensive Maestro E2E testing for React Native/Expo. 11 core patterns including auth pre-flight, adaptive flows, optimistic update verification, and OTP testing. Covers iOS/Android gotchas, CI/CD with Maestro Cloud, and MCP server integration.
`Requires: maestro CLI, Java 17+`

### [demo-pipeline](https://github.com/JuanMarchetto/demo-pipeline)
Describe a demo in plain English, get a recorded video. Discovers your app's screens via static analysis, generates a YAML script, executes it with Maestro (mobile) or webreel (web), and outputs screenshots + video + QA report.
`Requires: maestro or webreel`

### [agent-browser](https://github.com/JuanMarchetto/agent-browser-skill)
Browser automation built for AI agents. Navigate pages, interact with elements using `@e` refs, fill forms, upload files, drag-and-drop, execute JavaScript, and record video. Includes 6 reference docs and 3 ready-to-use templates.
`Requires: infsh CLI (inference.sh)`

### [webreel](https://github.com/JuanMarchetto/webreel-skill)
Record scripted browser demos from a JSON config. Cursor animation, keystroke HUD overlays, sound effects. Outputs MP4, GIF, or WebM. Supports custom themes, viewport presets, shared step sequences, and watch mode for iterative development.
`Requires: webreel (npm)`

### [hackathon-jury](https://github.com/JuanMarchetto/hackathon-jury-skill)
Simulate a real hackathon jury evaluating your project. Researches actual jury members via web search, builds 3-7 juror personas, dispatches parallel evaluations from each perspective, and synthesizes a deliberation with scores, individual feedback, placement estimate, and pitch coaching.
`Requires: WebSearch, Agent tool`

### [architect](https://github.com/JuanMarchetto/architect-skill)
Evaluate any idea or project from 6 angles simultaneously. Dispatches parallel specialist evaluators (market, technical, risk, impact, resources, innovation), then synthesizes their outputs into a unified assessment with Opportunity Score, Value Matrix, and Go/No-Go recommendation.
`Requires: Agent tool, WebSearch`

## How They Compose

```
demo-pipeline
  uses maestro-mobile-testing (for mobile apps)
  uses webreel (for web apps)
  outputs screenshots + video + report
```

Skills are designed to work independently or together. demo-pipeline orchestrates the others based on your project type — it's a pipeline skill that composes atomic skills.

## Manual Install

For any AI coding tool that supports the [Agent Skills](https://code.claude.com/docs/en/skills) standard:

```bash
git clone https://github.com/JuanMarchetto/<skill-name>.git
cp -r <skill-name> ~/.claude/skills/<skill-name>
```

## License

MIT
