# Council

Life advisory council with 8 parallel specialist advisors. Bring any life topic and get coordinated advice from domain experts — finance, health, career, learning, systems, relationships, creative — synthesized into a unified action plan.

## Install

Via the marketplace:
```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install council@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/council-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/council-skill.git
cp -r council-skill ~/.claude/skills/council
```

## How It Works

```
"I'm considering a career change — convene the council"
                        |
            Topic Analysis & Advisor Selection
                        |
    ┌──────┬──────┬──────┬──────┬──────┬──────┬──────┬──────┐
    │ Life │Finan.│Health│Career│Learn.│Syste.│Relat.│Creat.│
    │Coach │Advis.│Dir.  │Strat.│Arch. │Engin.│Advis.│Dir.  │
    └──┬───┴──┬───┴──┬───┴──┬───┴──┬───┴──┬───┴──┬───┴──┬───┘
       └──────┴──────┴──────┼──────┴──────┴──────┴──────┘
                            |
                       Synthesizer
                            |
            Prioritized Action Plan (max 7 items)
            Key Synergies + Watch List
```

Each advisor runs as a parallel agent with its own domain frameworks, scoring rubrics, and tracking data. The synthesizer resolves conflicts between advisors and identifies cross-domain synergies.

## What You Get

- **Council Summary** — holistic overview of the topic
- **Key Synergies** — actions that serve multiple life domains
- **Prioritized Action Plan** — max 7 focused, achievable actions
- **Watch List** — items to monitor
- **Recommended Follow-ups** — which advisor to consult next

## Advisors

| Advisor | Domain | Use For |
|---------|--------|---------|
| Life Coach | Direction & values | Life direction, goal-setting, values alignment |
| Finance | Money | Budgeting, investing, debt strategy, financial planning |
| Health | Wellness | Fitness, nutrition, sleep, mental health, stress |
| Career | Professional growth | Career strategy, networking, positioning, skills |
| Learning | Skill development | Learning plans, courses, deliberate practice |
| Systems | Productivity | Workflows, automation, time management, routines |
| Relationships | Social | Communication, social dynamics, community building |
| Creative | Innovation | Creative projects, design thinking, aesthetics |

Each advisor can also be used standalone for focused sessions.

## Periodic Reviews

Use `commands/council-review.md` for structured quarterly or annual reviews across all domains, with scoring rubrics and templated output.

## Setup

After installing, fill in `data/profile.md` with your personal context, values, priorities, and constraints. This personalizes all advisory sessions.

## Requirements

- Agent tool (for parallel advisor dispatch)
- WebSearch (advisors research relevant data)

## License

[MIT](LICENSE)
