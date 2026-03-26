# Agent Browser

Browser automation for AI agents via [inference.sh](https://inference.sh). Navigate web pages, interact with elements using `@e` refs, take screenshots, and record video.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install agent-browser@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/agent-browser-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/agent-browser-skill.git
cp -r agent-browser-skill ~/.claude/skills/agent-browser
```

## Core Workflow

1. **Open** — navigate to URL, get `@e` refs for interactive elements
2. **Interact** — click, fill, drag, upload using refs
3. **Re-snapshot** — refresh refs after navigation
4. **Close** — end session (returns video if recording)

## Included

- 6 reference docs (commands, snapshots, sessions, auth, video, proxy)
- 3 ready-to-use templates (form automation, authenticated session, content capture)

## Requirements

- [inference.sh CLI](https://inference.sh) (`infsh`)

## License

[MIT](LICENSE)
