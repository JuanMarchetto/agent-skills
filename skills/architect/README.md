# Architect

Evaluate any idea or project from 6 angles simultaneously. Dispatches specialist evaluators in parallel — market, technical, risk, impact, resources, innovation — then synthesizes their outputs into a unified assessment with scores and actionable next steps.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install architect@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/architect-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/architect-skill.git
cp -r architect-skill ~/.claude/skills/architect
```

## How It Works

```
"Evaluate my idea: a marketplace for AI agent skills"
                        |
            Mode Detection (new idea vs existing project)
                        |
            Select 3-6 Evaluators by type
                        |
    ┌───────┬───────┬───────┬───────┬───────┬───────┐
    │Market │ Tech  │ Risk  │Impact │Resource│Innov. │
    │Analyst│Archit.│Assess.│ Eval. │Strateg.│ Scout │
    └───┬───┴───┬───┴───┬───┴───┬───┴───┬───┴───┬───┘
        └───────┴───────┼───────┴───────┴───────┘
                        |
                   Synthesizer
                        |
            Value Matrix + Opportunity Score
            Risk Assessment + Next Steps
```

Each evaluator runs as a parallel agent with its own analysis frameworks, scoring rubrics, and tracking data. The synthesizer resolves conflicts between evaluators and identifies cross-domain synergies.

## What You Get

- **Opportunity Score** (1-10) with breakdown
- **Value Matrix**: Commercial / Educational / Social / Technical Feasibility / Risk / Resources
- **Risk Assessment**: Go / No-Go / Conditional Go recommendation
- **Prioritized Next Steps**: max 7 actions
- **Project Health Score** (for existing projects)

## Setup

After installing, fill in `data/context.md` with your interests, skills, and risk tolerance to personalize evaluations.

## Real Example — Decentralized Storage Protocol

![architect demo](demo/demo.gif)

Evaluated a Solana-based decentralized storage protocol (inspired by [Tape](https://github.com/spool-labs/tape), Colosseum Breakout grand prize winner):

```
Opportunity Score: 7.8/10

VALUE MATRIX
┌──────────────────────┬───────┬─────────────────────────────────────────────┐
│ Dimension            │ Score │ Assessment                                  │
├──────────────────────┼───────┼─────────────────────────────────────────────┤
│ Commercial           │  8/10 │ $15B+ TAM, 1400x cost edge is defensible   │
│ Educational          │  6/10 │ Novel PoA model advances storage research  │
│ Social               │  7/10 │ Censorship-resistant data as public good   │
│ Technical Feasibility│  7/10 │ Solana throughput fits; erasure coding hard │
│ Risk Level           │  6/10 │ Network congestion + regulatory uncertainty │
│ Resource Efficiency  │  8/10 │ Lean protocol team, hackathon-validated    │
└──────────────────────┴───────┴─────────────────────────────────────────────┘

RISK ASSESSMENT: CONDITIONAL GO
  Critical: Solana outages could halt proof-of-access verification
  Significant: Filecoin/Arweave network effects; SEC storage token scrutiny
  Monitoring: Erasure coding overhead at scale; miner incentive sustainability

NEXT STEPS (prioritized):
  1. Ship devnet with 100-node miner testnet and benchmark vs Arweave costs
  2. Publish erasure coding spec + formal verification of PoA consensus
  3. Secure ecosystem grant (Solana Foundation) for mainnet launch runway
  4. Build S3-compatible SDK — adoption depends on developer experience
  5. Partner with 2-3 Solana dApps for real-world storage pilot programs
```

## Requirements

- Agent tool (for parallel evaluator dispatch)
- WebSearch (evaluators research real market data)

## License

[MIT](LICENSE)
