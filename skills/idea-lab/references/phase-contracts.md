# Phase Contracts Reference

Exact markdown schemas for every artifact that passes between phases. Each phase produces a structured markdown file consumed by the next phase. All artifacts are human-readable, editable, and git-committable.

---

## Phase 1: Idea Generation Output

**File:** `.idea-lab/phase1-ideas.md`

```markdown
# Generated Ideas
## Context: {user context}
## Ideas Generated: N
## Diversity Axes Used: {list}

### Idea 1: {name}
- Description: {one paragraph}
- Target User: {who}
- Key Differentiator: {why this vs alternatives}
- Diversity Axis: {which axis}

### Idea 2: {name}
- Description: {one paragraph}
- Target User: {who}
- Key Differentiator: {why this vs alternatives}
- Diversity Axis: {which axis}

...
```

Phase 1 generates `ideaCount` ideas (from config), each forced onto a different diversity axis to ensure divergent thinking. Every idea must include all four fields (Description, Target User, Key Differentiator, Diversity Axis) for downstream phases to consume.

---

## Phase 2: Pre-screen Output

**File:** `.idea-lab/phase2-prescreen.md`

```markdown
# Pre-screen Results
## Ideas Screened: N
## Advancing to Deep Eval: K
## Min Score Threshold: X

| # | Idea | Est. Score | Status | Rationale |
|---|------|-----------|--------|-----------|
| 1 | name | 7.5 | ADVANCE | strength |
| 2 | name | 4.2 | FILTERED | weakness |
...

## Advancing Ideas: {list of numbers}
## Filtered Ideas: {list with reasons}
```

Pre-screen performs a lightweight scoring pass (no architect delegation) to filter ideas before expensive deep evaluation. Only ideas scoring at or above `minScore` (from config) advance, up to `topK` ideas maximum. The table format allows the orchestrator to parse which ideas advance.

---

## Phase 3: Deep Evaluation Output (one per idea)

**File:** `.idea-lab/phase3-eval-{N}.md` (where N is the 1-indexed idea number)

```markdown
# Deep Evaluation: Idea {N} — {name}
## Description: {full description}
## Opportunity Score: X/10
## Go/No-Go: GO|NO-GO

## Value Matrix
| Dimension | Score |
|-----------|-------|
| Commercial | X/10 |
| Technical Feasibility | X/10 |
| Risk Level | X/10 |
| Innovation | X/10 |
| Resource Efficiency | X/10 |

## Key Strengths:
- {strength 1}
- {strength 2}
- {strength N}

## Key Risks:
- {risk 1}
- {risk 2}
- {risk N}

## Architecture Proposal: {if provided by architect, otherwise "Not included in evaluation"}
```

Each deep evaluation delegates to the architect skill for a full multi-evaluator assessment. The Value Matrix scores are extracted from the architect output into a structured table for the ranker to parse. One file per idea enables parallel evaluation.

---

## Phase 4: Final Ranking Output

**File:** `.idea-lab/phase4-ranking.md`

```markdown
# Final Ranking
## Ideas Evaluated: K
## Dimension Filters Applied: {if any}

| Rank | Idea | Score | Commercial | Technical | Risk | Innovation | Resources |
|------|------|-------|-----------|-----------|------|-----------|-----------|
| 1 | name | 8.2 | 9 | 8 | 7 | 9 | 8 |
...

## Top Recommendation
Idea: {name}
Score: X/10
Justification: {2-3 sentences}

## Scenario Recommendations
- Quickest to build: Idea #{N} — {reason}
- Highest commercial potential: Idea #{N} — {reason}
- Most innovative: Idea #{N} — {reason}
- Lowest risk: Idea #{N} — {reason}

## Trade-off Analysis
{comparison between top 2-3 ideas}
```

The ranker reads all Phase 3 evaluation files, applies any `dimensionFilters` from config (e.g., `{"Commercial": 7}` filters out ideas with Commercial < 7), sorts by Opportunity Score, and produces the final ranking with scenario-based recommendations.

---

## State File

**File:** `.idea-lab/state.json`

Tracks pipeline progress for crash recovery and resume.

```json
{
  "sessionId": "il-YYYYMMDD-HHMMSS",
  "context": "user context",
  "currentPhase": 3,
  "status": "in_progress",
  "ideas": {
    "total": 5,
    "generated": 5,
    "prescreened": 5,
    "advancedToDeepEval": 3,
    "evaluated": 2,
    "currentEval": 3
  }
}
```

Valid statuses: `pending`, `in_progress`, `completed`, `failed`.

Resume protocol: Read state.json, find `currentPhase` and `ideas.currentEval`, load prior evaluation artifacts for context, continue from the next unevaluated idea.

---

## Config File

**File:** `.idea-lab/config.json`

Generated during bootstrap from `templates/config.json`. User can edit before pipeline starts.

```json
{
  "context": "",
  "ideaCount": 5,
  "topK": 3,
  "minScore": 5.0,
  "diversityAxes": ["B2B SaaS", "B2C consumer", "open-source tool", "educational", "mobile-first"],
  "dimensionFilters": {},
  "outputDir": ".idea-lab"
}
```

Field reference:

| Field | Description | Default |
|-------|-------------|---------|
| `context` | User's problem/need description (populated by bootstrapper) | `""` |
| `ideaCount` | How many ideas to generate (max 20) | `5` |
| `topK` | How many ideas advance from pre-screen to deep eval | `3` |
| `minScore` | Minimum pre-screen score to advance | `5.0` |
| `diversityAxes` | Categories to force divergent thinking | 5 default axes |
| `dimensionFilters` | Optional filters, e.g. `{"Commercial": 7}` means only show ideas with Commercial >= 7 | `{}` |
| `outputDir` | Where artifacts go | `".idea-lab"` |

---

## Error Artifact

**File:** `.idea-lab/phase{N}-error.md` (where N is the failed phase number)

Written when any phase fails to produce its expected artifact (skill unavailable, API failures, parse errors).

```markdown
# Phase {N} Error
## Error Type: {type}
## Details: {message}
## Suggested Fix: {if determinable}
```

Phase status is set to `failed` in state.json. The orchestrator presents the error and can retry the failed phase.
