# VC Panel Evaluator

Simulate a real venture capital investment panel evaluating your startup. Researches actual investors in your sector, builds personalized personas from their investment thesis and portfolio, runs parallel evaluations from each VC's perspective, and synthesizes a Monday partner meeting with funding verdict, feedback, and pitch coaching.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install vc-evaluator@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/vc-evaluator-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/vc-evaluator-skill.git
cp -r vc-evaluator-skill ~/.claude/skills/vc-evaluator
```

## How It Works

```
"Would VCs fund this? B2B SaaS for construction logistics, raising seed"
                            |
              Startup Discovery (code, pitch, traction, team)
                            |
              Investor Research (real VCs in sector/stage, thesis, portfolio)
                            |
              Build 3-5 Investor Personas (from real people or archetypes)
                            |
              Parallel Evaluation (each VC evaluates independently)
                            |
              Partner Meeting Synthesis (simulate Monday meeting)
                            |
              Verdict + Scorecard + Pitch Coaching
```

Each investor evaluates independently as a parallel agent, then a synthesizer simulates the Monday partner meeting — who champions the deal, what gets debated, and whether a term sheet is likely.

## What You Get

- **Funding Verdict** — PASS / PARTNER MEETING / TERM SHEET LIKELY
- **Panel Scorecard** with per-criterion scores from each investor (Team, Market, Product, Traction, Moat)
- **Individual VC Feedback** — what impressed them, deal-breakers, questions they'd ask in the pitch
- **Partner Meeting Simulation** — who champions, who passes, key debates, and the outcome
- **Funding Probability** — X% chance at your target stage with current pitch
- **What Would Change The Outcome** — max 5 specific actions to move investors from pass to proceed
- **Pitch Coaching** — tailored to this specific panel's priorities

## Example

![vc-evaluator demo](demo/demo.gif)

```
VC PANEL EVALUATION
Startup: ORE Mining Protocol
Stage: Seed ($3M)
Sector: DeFi / Mining / Solana Infrastructure

VERDICT: TERM SHEET LIKELY
Funding Probability: 72% at Seed

| Criterion     | Weight | Lily Liu (Eco) | Kyle Samani (DeFi) | Anatoly Y. (Tech) | Tarun Chitra (Mech) | Avg  |
|---------------|--------|----------------|--------------------|--------------------|---------------------|------|
| Team          | 40%    | 7              | 7                  | 8                  | 7                   | 7.3  |
| Market        | 25%    | 9              | 8                  | 8                  | 7                   | 8.0  |
| Product       | 15%    | 7              | 7                  | 9                  | 8                   | 7.8  |
| Traction      | 10%    | 9              | 8                  | 9                  | 7                   | 8.3  |
| Moat          | 10%    | 6              | 6                  | 7                  | 5                   | 6.0  |
| **Overall**   |        | **7.6**        | **7.2**            | **8.2**            | **6.9**             | **7.5** |

PARTNER MEETING SIMULATION:
Anatoly champions hard — ORE becoming the highest-traffic program on Solana is the
exact network-effect proof point he looks for, and the PoW-on-PoS architecture is
technically novel. Lily backs him, framing ORE as a PayFi primitive that brings
Bitcoin-mining culture into Solana's ecosystem. Kyle is positive but pushes on token
emission sustainability — "What happens when rewards halve and miners leave?" Tarun
is the skeptic: he respects the mechanism design but wants formal analysis of the V2
staking game's equilibrium. After debate, the room converges — $3M seed with a
milestone tranche tied to V2 mainnet launch and staking TVL targets.

INDIVIDUAL FEEDBACK:
  Lily Liu (Ecosystem):
  ✓ "812 stars and highest-traffic program on Solana — this is organic, not bought"
  ✗ "Token emission schedule needs a clear sustainability model past year two"

  Kyle Samani (DeFi):
  ✓ "Proof-of-Work on Solana is contrarian enough to be interesting — and it worked"
  ✗ "The PoW-on-PoS tension is a narrative risk — how do you explain this to LPs?"

  Anatoly Yakovenko (Technical):
  ✓ "They stress-tested the network and survived — that's real technical validation"
  ✗ "V2 grid mechanics add complexity — is the team shipping fast enough for both?"

  Tarun Chitra (Mechanism Design):
  ✓ "The 5x5 strategic grid with SOL staking is genuinely novel game-theoretic design"
  ✗ "No formal equilibrium analysis — what stops degenerate strategies from dominating?"

WHAT WOULD CHANGE THE OUTCOME:
  1. Publish formal tokenomics paper with emission curves and sustainability analysis
  2. Ship V2 to mainnet with measurable staking TVL before closing the round
  3. Commission mechanism design audit for the grid game's Nash equilibria

PITCH COACHING:
  1. Lead with traction: "We became the #1 program on Solana by transaction count
     with zero marketing spend" — let the network data do the talking
  2. Pre-empt the PoW-on-PoS objection: frame it as "fair launch distribution on
     the fastest chain" not "Bitcoin mining on Solana"
  3. Show the V2 grid game live — investors in this room live for novel mechanism
     design, a 60-second demo beats 10 slides
```

## Requirements

- WebSearch capability (for researching real investors and their thesis)
- Agent tool (for parallel investor dispatch)

## License

[MIT](LICENSE)
