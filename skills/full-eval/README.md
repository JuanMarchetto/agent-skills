# Full Eval

**Evaluate any idea from every angle -- 6 business evaluators + 8 life advisors in parallel, cross-referenced, delivered as PDF.**

No other tool combines business evaluation with personal life assessment. Most decision frameworks look at the opportunity *or* the person -- never both at the same time. Full Eval runs 14 specialist agents in parallel, cross-references their outputs, and produces a unified verdict that tells you not just "is this a good idea?" but "is this a good idea *for you, right now*?"

## What It Does

```
You: "Should I quit my job to build an AI meal planning app?"

Architect (strategic):
  Opportunity Score: 7.5/10
  Market: Growing, $4B TAM
  Technical: Feasible, proven stack
  Risk: Competitive but defensible

Council (personal):
  Finance: Only 3 months runway -- insufficient
  Health: Burnout indicators from current role
  Career: Strong alignment with ML trajectory
  Relationships: Startup hours strain family time

Meta-Synthesis:
  VERDICT: CONDITIONAL GO
  "Validate for 3 months while employed. Secure 9 months runway.
   Hit 50 beta users and $500 MRR before giving notice."
```

One command. Complete assessment. Professional PDF.

## The Flow

```
                          +-----------+
                          |   INPUT   |
                          | idea/path |
                          +-----+-----+
                                |
                     +----------+----------+
                     |                     |
               +-----v-----+        +-----v-----+
               |  ARCHITECT |        |  COUNCIL  |
               | 6 business |        | 8 life    |
               | evaluators |        | advisors  |
               +-----+-----+        +-----+-----+
                     |                     |
               +-----v-----+        +-----v-----+
               |  Strategic |        |  Personal |
               | Synthesizer|        | Synthesizer|
               +-----+-----+        +-----+-----+
                     |                     |
                     +----------+----------+
                                |
                     +----------v----------+
                     |  META-SYNTHESIZER   |
                     |  Cross-reference    |
                     |  Unified verdict    |
                     +----------+----------+
                                |
                     +----------v----------+
                     |     PDF REPORT      |
                     +---------------------+
```

## What Gets Evaluated

### Strategic (Architect -- 6 Evaluators)

| Evaluator | Analyzes |
|-----------|----------|
| Risk Assessor | Critical risks, failure modes, regulatory concerns |
| Technical Architect | Feasibility, architecture, stack, scalability |
| Market Analyst | TAM/SAM/SOM, competition, monetization, timing |
| Impact Evaluator | Social, educational, community value |
| Resource Strategist | Cost, timeline, team, bootstrapping viability |
| Innovation Scout | Tech readiness, first-mover advantage, adjacent opportunities |

**Output:** Value Matrix (6 dimensions scored 1-10), Opportunity Score, GO/NO-GO recommendation

### Personal (Council -- 8 Advisors)

| Advisor | Analyzes |
|---------|----------|
| Life Coach | Values alignment, life balance, holistic direction |
| Finance | Runway, budget impact, cash flow, investment risk |
| Health | Burnout risk, physical/mental sustainability |
| Career | Trajectory fit, skill development, positioning |
| Learning | Skill gaps, learning curve, knowledge investment |
| Systems | Time management, workflow impact, capacity |
| Relationships | Family/social impact, collaboration dynamics |
| Creative | Creative fulfillment, innovation satisfaction |

**Output:** Life Impact Assessment, Prioritized Action Plan, Watch List

### Cross-Reference (Meta-Synthesizer)

Maps strategic dimensions to personal dimensions, identifies where they align and where they conflict, and produces:

- **Combined Verdict**: GO / CONDITIONAL GO / NOT NOW / NO-GO
- **Combined Score**: Weighted blend of strategic + personal + alignment
- **Conditions**: Specific, measurable prerequisites for proceeding
- **Narrative**: Mentor-quality advice connecting opportunity to personal reality

## Install

### Via the Marketplace

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install full-eval@agent-skills
```

### Via skills.sh

```bash
npx skills add JuanMarchetto/full-eval-skill
```

### Manual

```bash
git clone https://github.com/JuanMarchetto/full-eval-skill.git
cp -r full-eval-skill ~/.claude/skills/full-eval
```

## Dependencies

This skill composes three existing systems. Install them first:

| Dependency | Purpose | Install |
|-----------|---------|---------|
| [architect](https://github.com/JuanMarchetto/architect-skill) | Strategic evaluation (6 evaluators) | `/plugin install architect@agent-skills` |
| [council](https://github.com/JuanMarchetto/council-skill) | Personal evaluation (8 advisors) | `/plugin install council@agent-skills` |
| [pdf-presentation](https://github.com/JuanMarchetto/pdf-presentation-skill) | PDF report generation | `/plugin install pdf-presentation@agent-skills` |

The skill degrades gracefully -- if PDF generation is unavailable, results are displayed as formatted text in the terminal.

## Example Verdicts

### GO (Score 8.5/10)
> "Both the market opportunity and your personal situation are strongly aligned. You have 18 months of runway, the technical skills to build an MVP in 6 weeks, and your career trajectory points directly at this space. Proceed with full commitment."

### CONDITIONAL GO (Score 6.8/10)
> "The opportunity scores 7.5/10 but your personal readiness is 5.5/10. Validate for 3 months while employed. Conditions: secure 9 months runway, hit 50 beta users, establish a hard stop date."

### NOT NOW (Score 4.5/10)
> "The idea has merit (6/10) but your current situation makes this the wrong time. Health advisor flags active burnout, Finance shows 2 months runway, and Career advisor notes you are mid-promotion cycle. Revisit in Q3 after addressing personal constraints."

### NO-GO (Score 2.1/10)
> "The market is saturated (Commercial: 3/10), the technology is immature (Technical: 4/10), and your financial situation cannot absorb the risk (Finance: critical). The Innovation Scout found no defensible angle. Redirect energy toward alternatives identified in the Architecture Proposal."

## Real Example — "Leave FAANG to build dev tools startup?"

![full-eval demo](demo/demo.gif)

```
FULL EVALUATION — "Leave FAANG to build dev tools startup?"

━━━ ARCHITECT (Strategic): 7.2/10 ━━━
  Commercial:    8/10  Strong TAM — dev tools market growing 18% YoY, $45B by 2028
  Technical:     7/10  OSS moat is real but requires 12-18mo to build community traction
  Risk:          5/10  73% of dev tool startups fail pre-Series A; OSS monetization unproven
  Innovation:    8/10  AI-native dev tools are a generational shift — timing is right
  Impact:        7/10  High developer leverage — 1 good tool can reach millions
  Resources:     6/10  Solo founder needs $150K+ runway; hiring senior OSS devs is expensive

━━━ COUNCIL (Personal): 5.8/10 ━━━
  Finance:       4/10  $320K TC → $0 is a cliff; 8 months savings won't survive pivot
  Health:        5/10  Startup stress is real — founders report 2x burnout vs employees
  Career:        7/10  FAANG brand + founder story = strong either way; reentry possible
  Relationships: 5/10  Partner depends on dual income; needs explicit alignment conversation
  Learning:      9/10  Massive growth across business, product, community — no comparison
  Systems:       4/10  No co-founder, no advisor network, no launch infrastructure yet
  Creative:      8/10  Full creative ownership vs implementing someone else's roadmap
  Life Coach:    6/10  Motivation is high but plan is vague — passion ≠ readiness

━━━ META-SYNTHESIS: CONDITIONAL GO (6.4/10) ━━━

  "The market window is real and your skills are aligned, but your
   infrastructure isn't. This is a 'yes' to the destination and a
   'not yet' to the departure date."

  Key Synergy: Career upside + innovation timing — even if the startup
    fails, the founder journey at this market inflection compounds your
    long-term value in ways staying at FAANG cannot.

  Key Conflict: Strategic opportunity (8/10) vs financial runway (4/10) —
    the market says go now, but your bank account says survive first.

  Conditions:
    1. Extend runway to 18 months ($240K liquid) before resigning
    2. Ship v0.1 nights/weekends and validate with 500+ GitHub stars
    3. Secure 1 design partner (paying or committed) pre-launch
    4. Have the partner/family financial conversation — get explicit buy-in

  PDF: strategic-evaluation.pdf (28 pages)
```

## Files

```
full-eval-skill/
├── SKILL.md                        # Complete guide and protocol
├── agents/
│   └── meta-synthesizer.md         # Cross-references architect + council outputs
├── .claude-plugin/plugin.json      # Plugin metadata
├── README.md                       # This file
├── LICENSE                         # MIT License
└── .gitignore
```

## License

[MIT](LICENSE)
