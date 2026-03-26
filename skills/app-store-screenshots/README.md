# App Store Screenshots

Create App Store and Google Play screenshots with exact platform specs. Covers iOS/Android dimensions, gallery ordering, device mockups, captions, preview videos, localization, and A/B testing.

## Install

Via the marketplace:
```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install app-store-screenshots@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/app-store-screenshots-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/app-store-screenshots-skill.git
cp -r app-store-screenshots-skill ~/.claude/skills/app-store-screenshots
```

## What's Inside

- Platform specs for iOS App Store and Google Play Store
- The First 3 Rule -- what to show in the most visible positions
- Screenshot gallery ordering strategy (positions 1-10)
- Screenshot styles: device frame, full-bleed, lifestyle, feature highlight
- Caption writing rules (benefit-focused, max 2 lines)
- AI-powered screenshot generation via inference.sh CLI
- Preview video specs and structure (Apple + Google)
- Localization priorities by market
- A/B testing guidance (Google Play experiments)
- Common mistakes checklist

## Requirements

- inference.sh CLI (`infsh`) for AI-generated mockups

## License

[MIT](LICENSE)
