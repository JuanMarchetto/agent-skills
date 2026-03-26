# Webreel Skill

Record scripted browser demos as MP4, GIF, or WebM with cursor animation, keystroke overlays, and sound effects. Define steps in a JSON config, webreel drives headless Chrome and encodes with ffmpeg.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install webreel@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/webreel-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/webreel-skill.git
cp -r webreel-skill ~/.claude/skills/webreel
```

## What's Inside

- Step types: click, type, key, scroll, drag, wait, navigate, screenshot, hover, select
- Custom cursor themes and keystroke HUD overlay
- Viewport presets (desktop, laptop, iPhone, Pixel, iPad, etc.)
- Watch mode for iterative development
- Shared step sequences via `include`

## Included Files

- `SKILL.md` — main skill instructions
- `examples.md` — annotated config examples
- `steps-reference.md` — detailed docs for all 12 step types

## Requirements

- [webreel](https://www.npmjs.com/package/webreel) (`npm install webreel`)

## License

[MIT](LICENSE)
