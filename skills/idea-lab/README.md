# Idea Lab

**From "what should I build?" to "here's your best option, evaluated by 6 specialists."**

An automated idea laboratory for Claude Code. Generates diverse ideas from your context, pre-screens them, deep-evaluates the best with multi-agent scoring, and surfaces the winners with a comparative dashboard.

## What It Does

1. **Generates N ideas** with forced diversity — SCAMPER, cross-domain analogies, axis rotation
2. **Pre-screens** with a quick 1-agent score per idea — filters weak ideas before expensive evaluation
3. **Deep evaluates** top ideas via `/architect` — 6 parallel evaluators (market, technical, risk, innovation, resources, impact)
4. **Ranks and recommends** — comparative matrix, scenario-based picks, top recommendation

## Install

```bash
npx skills add JuanMarchetto/idea-lab-skill
```

**Required dependency:**
```bash
npx skills add JuanMarchetto/architect-skill
```

**Optional (build the winning idea):**
```bash
npx skills add JuanMarchetto/founder-mode-skill
```

## Quick Start

```
/idea-lab "FinTech hackathon, 48 hours, team of 2, must use AI"
```

1. Config generated → review → reply `go`
2. 5 diverse ideas generated across different axes
3. Pre-screen dashboard shows estimated scores
4. Top 3 advance to deep evaluation (6 evaluators each)
5. Final dashboard: comparative matrix with scores
6. Choose: expand details, build with founder-mode, refine, or stop

## The Pipeline

```
idea-lab → generates + evaluates ideas
         → best idea selected
         → /founder-mode builds it (9 phases + TDD + GTM)
         → launched product

From "what should I build?" to "shipped product" in one pipeline.
```

## Config

Edit `.idea-lab/config.json` before saying `go`:

- **Idea count:** `ideaCount: 10` (default 5)
- **Deep eval slots:** `topK: 5` (default 3 advance to /architect)
- **Min score:** `minScore: 6.0` (default 5.0, filters weak ideas)
- **Diversity axes:** customize the categories for forced divergence
- **Dimension filters:** `dimensionFilters: {"Commercial": 7}` — only show high-commercial ideas

## Resume

```
/idea-lab resume
```

Picks up from the next unevaluated idea if your session crashes mid-evaluation.

## License

MIT
