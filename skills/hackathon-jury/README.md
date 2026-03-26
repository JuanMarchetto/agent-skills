# Hackathon Jury Simulator

Simulate a real hackathon jury evaluating your project. Researches actual jury members, builds personalized personas, runs parallel evaluations from each juror's perspective, and synthesizes a deliberation with scores, feedback, and pitch coaching.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install hackathon-jury@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/hackathon-jury-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/hackathon-jury-skill.git
cp -r hackathon-jury-skill ~/.claude/skills/hackathon-jury
```

## How It Works

```
"Evaluate my project for the Colosseum Eternals hackathon"
                            |
              Project Discovery (code, README, git history)
                            |
              Hackathon Research (real judges, criteria, past winners)
                            |
              Build 3-7 Juror Personas (from real people or archetypes)
                            |
              Parallel Evaluation (each juror scores independently)
                            |
              Deliberation Synthesis (simulate jury discussion)
                            |
              Verdict + Scorecard + Pitch Coaching
```

Each juror evaluates independently as a parallel agent, then a synthesizer simulates the deliberation — where they'd agree, debate, and what would swing the decision.

## What You Get

- **Jury Scorecard** with per-criterion scores from each juror
- **Individual Feedback** — what impressed them, what concerned them, questions they'd ask at your demo
- **Deliberation Simulation** — how the jury discussion would play out
- **Placement Estimate** — Winner / Top 3 / Top 10 / Top 25% / Below threshold
- **Improvement Roadmap** — max 7 actions prioritized by impact
- **Pitch Coaching** — optimal demo flow, framing, and what to emphasize for this specific jury

## Real Example — ORE at Colosseum Renaissance

![hackathon-jury demo](demo/demo.gif)

Evaluated [ORE](https://github.com/regolith-labs/ore) (Proof-of-Work mining on Solana, 812 stars) — the actual grand prize winner of Colosseum Renaissance (8,300 participants, 1,071 submissions):

**Verdict: 8.6/10 — Grand Prize Winner**

```
| Criterion (Weight) | Matty Taylor | Nate Levine | Mert Mumtaz | Clay Robbins | Chase Barker | Avg  |
|---------------------|-------------|-------------|-------------|-------------|-------------|------|
| Innovation (25%)    | 9           | 9           | 9           | 9           | 8           | 8.8  |
| Technical (25%)     | 7           | 9           | 9           | 7           | 8           | 8.0  |
| UX/Design (15%)     | 7           | 7           | 6           | 8           | 7           | 7.0  |
| Impact (20%)        | 10          | 8           | 8           | 9           | 10          | 9.0  |
| Presentation (15%)  | 9           | 7           | 8           | 9           | 8           | 8.2  |
| **Weighted Total**  | **8.40**    | **8.20**    | **8.20**    | **8.35**    | **8.25**    |**8.28**|
```

**Juror Highlights:**

> **Mert Mumtaz** (Helius CEO): "This program single-handedly stress-tested Solana's scheduler and exposed priority-fee dynamics. That is infrastructure contribution through adversarial load."

> **Clay Robbins** (ex-Slow Ventures): "Three signals VCs love: protocol-level primitive, proven usage before fundraise, and an ecosystem that self-assembled."

> **Chase Barker** (Solana Foundation): "ORE spawned an entire sub-ecosystem: pools, CLIs, boost protocols, the steel framework. That is the definition of ecosystem contribution."

**Deliberation:** The jury reached consensus quickly on Innovation and Impact — no prior Solana program attempted a PoW mining primitive with its own hash algorithm (drillx). Debate centered on Technical execution vs UX polish: the CLI-first approach limits mainstream adoption, and the congestion incident raised questions about responsible mainnet citizenship. Ultimately, shipping a protocol that generates real network-level impact outweighs UX shortcomings.

**Pitch Coaching:** Lead with "We accidentally became the highest-traffic program on Solana." Show the ecosystem flywheel (30+ derivative repos). Address congestion risk head-on. Demo `ore mine` live — 60 seconds of working software beats any architecture diagram.

## Requirements

- WebSearch capability (for researching real jury members and criteria)
- Agent tool (for parallel juror dispatch)

## License

[MIT](LICENSE)
