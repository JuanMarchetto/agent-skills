# Founder Mode

**From idea to launched product. Not just code — a product.**

An end-to-end product builder skill for Claude Code that orchestrates 9 phases with quality gates, TDD enforcement, and a go-to-market launch kit.

## What It Does

1. **Evaluates your idea** — 6 parallel evaluators score market viability, technical feasibility, risk, and more
2. **Generates architecture** — system design, components, data flow, tech stack
3. **Plans TDD chunks** — decomposes architecture into ordered test-first work units
4. **Implements with TDD** — writes tests first, then code, with cross-chunk summaries
5. **Runs E2E tests** — strategy auto-selected by project type (web/CLI/library/API/mobile)
6. **Verifies quality** — catches false-positive tests, spec-to-test gaps, architecture drift
7. **Analyzes the run** — extracts lessons, identifies patterns, recommends improvements
8. **Drafts GTM kit** — README, pitch, tweet thread, Product Hunt listing, CHANGELOG

Three human gates let you steer: approve, iterate, or stop at any checkpoint.

## Install

```bash
npx skills add JuanMarchetto/founder-mode-skill
```

**Required dependency:**
```bash
npx skills add JuanMarchetto/architect-skill
```

**Optional (recommended):**
```bash
npx skills add JuanMarchetto/learn-by-mistake-skill
npx skills add JuanMarchetto/post-run-analysis-skill
```

## Quick Start

```
/founder-mode "Build a CLI that converts markdown to presentation slides"
```

1. Config generated → review `.founder/config.json` → reply `go`
2. Idea evaluated → Gate 1: approve or reject
3. Architecture + TDD plan generated automatically
4. Implementation with TDD → Gate 2: approve or iterate
5. E2E tests + verification → Gate 3: approve or fix
6. Analysis + GTM kit generated
7. All artifacts in `.founder/`

## Existing Projects

```
/founder-mode "./my-project"
```

Skips evaluation, reverse-engineers architecture from your codebase, plans around existing tests, extends your code.

## Resume After Crash

```
/founder-mode resume
```

Picks up exactly where you left off — even mid-gate.

## Config

Edit `.founder/config.json` before saying `go`:

- **Skip phases:** Set `phases.gtm: false` to skip GTM generation
- **Auto-gates:** Set `gates.postEval: "auto"` to auto-continue unless blocking issue
- **Iteration cap:** Set `maxIterations: 5` for more implementation cycles
- **TDD:** Set `tdd.strictness: "unit"` for unit tests only

## Competitive Positioning

| | founder-mode | gstack | Lovable | Replit | Devin |
|---|---|---|---|---|---|
| Idea Evaluation | Yes | No | No | No | No |
| TDD Enforcement | Yes | No | No | No | No |
| Verification | Yes | Partial | No | Partial | Partial |
| GTM Draft | Yes | No | No | No | No |
| Open Source | MIT | MIT | No | No | No |
| Local-First | Yes | Yes | No | No | No |

**vs gstack:** "gstack gets your code shipped. founder-mode gets your product launched."

## License

MIT
