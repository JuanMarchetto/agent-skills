# Founder Mode — Design Specification

**Date:** 2026-03-17
**Status:** Approved
**Type:** New skill for agent-skills-marketplace
**Repository:** `founder-mode-skill/` (new repo)

---

## 1. Overview

Founder Mode is a Claude Code skill that orchestrates the full product lifecycle — from idea evaluation to launched product with GTM artifacts. It composes existing marketplace skills and built-in agent logic into a 9-phase sequential checkpoint pipeline (Phase 0 bootstrap + Phases 1-8) with human gates, crash recovery, and configurable iteration loops.

**Positioning:** "From idea to launched product. Not just code — a product."

**Key differentiators vs. competitors:**
- Only tool combining idea rejection + TDD + verification + GTM in one open-source skill
- Local-first (runs in user's repo, not a cloud platform)
- Composes proven skills rather than rebuilding from scratch
- "Founder-assisted" — 3 human gates where the user makes Go/No-Go decisions
- learn-by-mistake integration means the skill improves with every run

---

## 2. Skill Structure

```
founder-mode-skill/
├── SKILL.md                          # Frontmatter + overview + usage docs
├── README.md                         # Install + quick start
├── LICENSE                           # MIT
├── .gitignore
├── .claude-plugin/
│   └── plugin.json                   # Registry metadata
├── commands/
│   └── founder-mode.md               # Main orchestrator
├── agents/
│   ├── bootstrapper.md               # Phase 0: config, mode detection, lessons
│   ├── evaluator.md                  # Phase 1: invokes architect skill
│   ├── architect-gen.md              # Phase 2: generates architecture
│   ├── planner.md                    # Phase 3: TDD plan decomposition
│   ├── implementer.md               # Phase 4: chunk-with-summary loop
│   ├── e2e-runner.md                 # Phase 5: E2E test generation + execution
│   ├── verifier.md                   # Phase 6: false-positive + spec-to-test gap
│   ├── analyzer.md                   # Phase 7: post-run analysis + lessons
│   └── gtm-drafter.md               # Phase 8: README, pitch, tweets, PH, CHANGELOG
├── templates/
│   ├── config.json                   # Default config template
│   ├── readme-template.md            # GTM README template
│   ├── pitch-template.md             # One-pager pitch template
│   ├── tweet-thread-template.md      # Launch thread template
│   └── producthunt-template.md       # PH launch draft template
└── references/
    └── phase-contracts.md            # Artifact schemas for inter-phase handoff
```

**Architecture pattern:** Orchestrator + Agents (same as `architect` and `full-eval` skills). Orchestrator manages pipeline flow, config, state, and gates. Agents do the actual work within each phase and get dispatched via the Agent tool with fresh context windows.

### Skill invocation pattern
Each agent is dispatched via the Agent tool with a self-contained prompt. When an agent needs an external marketplace skill (e.g., `architect`), the agent prompt instructs Claude to invoke the skill's slash command (e.g., `/architect "evaluate: {idea}"`). The agent prompt does NOT duplicate the external skill's logic — it delegates and parses the output. When an agent needs behavior from `superpowers:*` skills (writing-plans, TDD, verification), the agent prompt embeds the relevant methodology directly (these are patterns, not external dependencies).

### plugin.json schema
```json
{
  "name": "founder-mode",
  "description": "End-to-end product builder — from idea evaluation to launched product with GTM artifacts",
  "version": "1.0.0",
  "author": { "name": "Juan Marchetto" },
  "homepage": "https://github.com/JuanMarchetto/founder-mode-skill",
  "repository": "https://github.com/JuanMarchetto/founder-mode-skill",
  "license": "MIT"
}
```

---

## 3. Config File

Generated at `.founder/config.json` during Phase 0 bootstrap:

```json
{
  "idea": "",
  "mode": "new",
  "techStack": "auto",
  "maxIterations": 3,
  "outputDir": ".founder",
  "gates": {
    "postEval": "pause",
    "postImplementation": "pause",
    "postVerification": "pause"
  },
  "phases": {
    "eval": true,
    "architecture": true,
    "tdd": true,
    "implementation": true,
    "e2e": true,
    "verification": true,
    "postRunAnalysis": true,
    "gtm": true
  },
  "tdd": {
    "strictness": "unit+integration",
    "coverageThreshold": 80
  },
  "gtm": {
    "readme": true,
    "pitch": true,
    "tweetThread": true,
    "productHunt": true,
    "changelog": true
  },
  "acceptanceCriteria": []
}
```

### Config flow:
1. User runs `/founder-mode "Build a CLI that converts markdown to slides"`
2. Bootstrapper generates `.founder/config.json` with `idea` populated, `mode` auto-detected
3. Skill prints: "Config written to `.founder/config.json`. Review and edit, then reply `go` to start the pipeline — or just reply `go` to use defaults."
4. User edits or says `go`
5. Pipeline starts

### Mode auto-detection:
- Idea contains `./`, `../`, `/`, or resolves to an existing directory → `"mode": "existing"`
- Idea contains a GitHub URL → clone first, then `"mode": "existing"`
- Everything else → `"mode": "new"`
- User can override in config

### Gate options:
- `"pause"` — print results, wait for user input (continue/iterate/stop/edit)
- `"auto"` — print results, auto-continue unless blocking issue (NO-GO, NEEDS_FIXES)
- `"skip"` — no output, no pause, pipeline continues

### Tech stack resolution:
When `techStack` is `"auto"`:
- **New ideas:** Phase 1 recommends a tech stack based on the idea. Phase 2 finalizes it. Config is updated to the finalized stack after Phase 2.
- **Existing projects:** Phase 0 auto-detects from package.json/Cargo.toml/go.mod/etc.

---

## 4. Pipeline State & Crash Recovery

### State file: `.founder/state.json`

```json
{
  "sessionId": "fm-20260317-143022",
  "startedAt": "2026-03-17T14:30:22Z",
  "currentPhase": 4,
  "phaseName": "implementation",
  "status": "in_progress",
  "iteration": 2,
  "maxIterations": 3,
  "mode": "new",
  "phases": {
    "0": { "status": "completed", "artifact": ".founder/phase0-bootstrap.md" },
    "1": { "status": "completed", "artifact": ".founder/phase1-eval.md" },
    "2": { "status": "completed", "artifact": ".founder/phase2-arch.md" },
    "3": { "status": "completed", "artifact": ".founder/phase3-plan.md" },
    "4": {
      "status": "in_progress",
      "artifact": ".founder/phase4-impl.md",
      "chunks": {
        "total": 5,
        "completed": 3,
        "current": 4,
        "summaries": ".founder/phase4-summaries.md"
      }
    },
    "5": { "status": "pending" },
    "6": { "status": "pending" },
    "7": { "status": "pending" },
    "8": { "status": "pending" }
  },
  "gateDecisions": {
    "postEval": { "decision": "continue", "timestamp": "2026-03-17T14:35:10Z" },
    "postImplementation": null,
    "postVerification": null
  }
}
```

### Crash recovery:
1. User runs `/founder-mode resume`
2. Orchestrator reads `.founder/state.json`
3. Finds `currentPhase` and chunk progress
4. Prints: "Resuming session `fm-20260317-143022` — Phase 4 (Implementation), chunk 4 of 5"
5. Reads summaries for context, continues from current chunk

**Mid-gate crash handling:** If `currentPhase` is marked as completed but the corresponding gate decision is `null`, the resume displays the gate again (re-shows results and options) rather than re-running the phase.

### Artifact directory after full run:
```
.founder/
├── config.json
├── state.json
├── phase0-bootstrap.md
├── phase1-eval.md
├── phase2-arch.md
├── phase3-plan.md
├── phase4-impl.md
├── phase4-summaries.md
├── phase5-e2e.md
├── phase6-verify.md
├── phase7-analysis.md
├── phase8-gtm/
│   ├── README.md
│   ├── PITCH.md
│   ├── TWEET-THREAD.md
│   ├── PRODUCTHUNT.md
│   └── CHANGELOG.md
└── lessons-learned.md
```

---

## 5. Phase Contracts

Each phase produces a structured markdown artifact consumed by the next phase.

### Phase 0 → Phase 1: Bootstrap Output
```markdown
# Founder Mode Bootstrap
## Session: {sessionId}
## Mode: new|existing
## Idea: {raw idea text}
## Tech Stack: {auto-detected or user-specified}
## Acceptance Criteria: {from config or empty for Phase 1 to generate}
## Relevant Lessons: {loaded from learn-by-mistake, domain-filtered}
## Codebase Scan: {if existing mode: directory tree, package.json, key files}
```

### Phase 1 → Phase 2: Evaluation Output
```markdown
# Idea Evaluation
## Opportunity Score: X/10
## Go/No-Go: GO|NO-GO
## Market Summary: {2-3 sentences}
## Key Risks: {bulleted list}
## Acceptance Criteria: {extracted or user-provided, numbered list}
## Target User: {one sentence}
## Differentiators: {bulleted list}
## Recommended Tech Stack: {if not specified by user}
```

### Phase 2 → Phase 3: Architecture Output
```markdown
# Architecture
## System Overview: {C4 context-level description}
## Components: {named components with responsibilities}
## Data Flow: {how data moves between components}
## Tech Stack: {finalized stack with rationale}
## File Structure: {proposed directory layout}
## Key Interfaces: {public APIs between components}
## Constraints: {non-functional requirements}
```

### Phase 3 → Phase 4: TDD Plan Output
```markdown
# TDD Plan
## Chunks: {ordered list}
### Chunk 1: {name}
- Files to create: {list}
- Tests to write first: {list with descriptions}
- Implementation scope: {what this chunk builds}
- Dependencies: {which chunks must come before}
- Acceptance tests: {which acceptance criteria this covers}
### Chunk 2: ...
```

### Phase 4 → Phase 5: Implementation Output
```markdown
# Implementation Log
## Chunks Completed: X/Y
### Chunk 1: {name}
- Files created: {list}
- Tests passing: X/Y
- Summary: {what was built, interfaces exposed}
### Chunk 2: ...
## Cross-Chunk Summary: {overall state, what works, dependencies}
## Known Issues: {failing tests, TODOs, deferred items}
```

### Phase 5 → Phase 6: E2E Output
```markdown
# E2E Test Results
## Tests Generated: X
## Tests Passing: X/Y
## Coverage Map: {which acceptance criteria are covered}
## Uncovered Criteria: {which acceptance criteria have no E2E test}
## Test Files: {list of created test files}
```

### Phase 6 → Phase 7: Verification Output
```markdown
# Verification Report
## False Positives Found: X
## Spec-to-Test Gap Analysis:
- Criteria covered: {list}
- Criteria NOT covered: {list with explanation}
- Tests that verify internal consistency only: {list — circular validation flags}
## Architecture Drift: {deviations from Phase 2 design}
## Verdict: PASS|NEEDS_FIXES
## Required Fixes: {if NEEDS_FIXES, specific items}
```

### Phase 7 → Phase 8: Analysis Output
```markdown
# Post-Run Analysis
## Recurring Patterns: {errors that appeared multiple times}
## Lessons Extracted: {new lessons for learn-by-mistake store}
## Performance: {per-phase timing, token usage estimates}
## Recommendations: {what to improve in next run}
```

### Phase 8: GTM Output
Five files in `.founder/phase8-gtm/`. Consumes Phase 1 (market data, differentiators, target user) + Phase 2 (architecture, tech stack) + Phase 4 (what was built).

**Design rule:** Every artifact is markdown, human-readable, and git-committable. No binary formats. The user can read, edit, or override any artifact between phases.

### Acceptance Criteria Quality Gate
Phase 1 must produce at least 3 testable acceptance criteria. If the idea is too vague (e.g., "Build something cool with AI"), the evaluator flags this in Key Risks and marks the criteria section as `NEEDS_REFINEMENT`. Gate 1 then prompts the user: "The idea is too vague for testable criteria. Please refine your idea or provide acceptance criteria before continuing."

### Phase Failure Protocol
If any phase fails to produce its expected artifact (build errors, skill unavailable, API failures):
1. Orchestrator writes `.founder/phaseN-error.md` with failure details
2. Phase status set to `failed` in state.json
3. The next applicable gate triggers with the error report
4. Gate presents: `[retry]` (re-run the phase), `[skip]` (skip this phase and continue), or `[stop]` (save and exit)

### E2E Strategy by Project Type
Phase 5 adapts its E2E approach based on the project type detected in Phase 2 architecture:
- **Web app:** Playwright-style browser tests
- **CLI tool:** Shell script integration tests
- **Library/SDK:** Integration tests exercising the public API
- **Mobile app:** Maestro tests (existing e2e-pipeline patterns)
- **API server:** HTTP request tests (curl/fetch-based)

The E2E agent detects project type from the Phase 2 architecture and selects the appropriate strategy automatically.

---

## 6. Human Gates

### Gate UX Pattern
```
═══════════════════════════════════════════════════
GATE: {gate name}
═══════════════════════════════════════════════════

{Phase results summary — key metrics, score, or verdict}

Full results: .founder/{artifact file}

Options:
  [continue]  — proceed to Phase {N+1}
  [iterate]   — re-run Phase {N} with feedback (iteration {X}/{max})
  [stop]      — save state and exit (resume later with /founder-mode resume)
  [edit]      — edit the artifact manually, then reply 'continue'

Your choice:
═══════════════════════════════════════════════════
```

### Gate 1: Post-Evaluation (after Phase 1)
- Shows: Opportunity Score, Go/No-Go, key risks, acceptance criteria
- Extra option: `[reject]` — idea scored too low, exit with eval as output
- If architect says NO-GO, gate auto-triggers with recommendation to reject
- If user chooses `[continue]` on a NO-GO: orchestrator prints warning ("Proceeding despite NO-GO recommendation. Acceptance criteria may be weak.") and continues to Phase 2. The NO-GO override is logged in state.json for Phase 7 post-run analysis
- `[iterate]` = re-evaluate with different framing or additional context

### Gate 2: Post-Implementation (after Phase 4)
- Shows: chunks completed, tests passing/failing, known issues
- `[iterate]` = fix issues and re-run failing chunks
- Iteration counter tracked here
- When `iteration >= maxIterations`:
  ```
  You've completed {N} iteration cycles. Current state:
  - Tests passing: X/Y
  - Known issues: {list}

  Want to extend? [yes + how many more / no, continue to E2E]
  ```
- User says "yes, 2" → maxIterations updated, loop continues
- User says "no" → proceeds to Phase 5

### Gate 3: Post-Verification (after Phase 6)
- Shows: false positives, spec-to-test gaps, architecture drift, verdict
- `[iterate]` = go back to Phase 4 to fix issues (counts against shared iteration counter)
- `[continue]` only if verdict is PASS or user explicitly overrides
- Gate 3 iterate loops back to Phase 4, not Phase 6 — forces fix through implementation → E2E → verification again

**Gate 3 re-entry contract:** When Gate 3 triggers `[iterate]`:
- Phase 4 receives: Phase 6 verification report (specifically `Required Fixes`) + Phase 3 original plan + Phase 4 previous implementation log
- Only failing/flagged chunks are re-run (not all chunks)
- After Phase 4 completes, Phases 5 and 6 execute again automatically before Gate 3 re-triggers

### Iteration counter semantics
There is a single `iteration` counter shared across Gate 2 and Gate 3. Any `[iterate]` action at either gate increments the counter. When `iteration >= maxIterations`, both gates offer the extension prompt. This is intentional — it caps total implementation rework regardless of which gate triggers it.

### Auto-skip behavior:
- `"auto"` gate: print summary, auto-continue unless blocking issue (NO-GO, NEEDS_FIXES)
- `"skip"` gate: no output, no pause, pipeline continues silently

### Iteration flow:
```
Phase 4 (Implementation)
    │
    ▼
  Gate 2 ──[iterate]──► Phase 4 (re-run failing chunks only)
    │                         │
    │                         ▼
    │                       Gate 2 (iteration 2/3)
    │                         │
    │◄──[iterate]─────────────┘
    │
    ▼ [continue]
Phase 5 (E2E)
    │
    ▼
Phase 6 (Verification)
    │
    ▼
  Gate 3 ──[iterate]──► Phase 4 (fix verification issues, failing chunks only)
    │                         │ (counts against shared iteration counter)
    │                         ▼
    │                       Gate 2
    │                         │ [continue]
    │                         ▼
    │                       Phase 5 (E2E re-run)
    │                         │
    │                         ▼
    │                       Phase 6 (Verification re-run)
    │                         │
    │                         ▼
    │                       Gate 3
    │                         │
    │◄────────────────────────┘ [continue]
    │
    ▼ [continue]
Phase 7 (Analysis)
```

---

## 7. Existing Project Mode

### Mode detection:
- Idea contains `./`, `../`, `/`, or resolves to existing directory → existing mode
- Idea contains GitHub URL → clone first, then existing mode
- Everything else → new idea mode
- User can override in `config.json`

### Existing project bootstrap (Phase 0):
Bootstrapper runs a codebase scan producing:
```markdown
# Codebase Scan
## Root: /path/to/project
## Package Manager: npm|pnpm|yarn|cargo|go|...
## Framework: Next.js|Express|FastAPI|...
## Language: TypeScript|Python|Rust|Go|...
## Structure: {directory tree, key files}
## Existing Tests: {test files found, framework used, count}
## Dependencies: {from package.json/Cargo.toml/go.mod/etc.}
## README Exists: yes|no
## CI/CD: {detected config files}
## Git History: {last 5 commits, branch info}
```

### Phase behavior by mode:

| Phase | New Idea | Existing Project |
|-------|----------|-----------------|
| 0 - Bootstrap | Config gen, lesson loading | Config gen + codebase scan |
| 1 - Eval | Full 6-evaluator run | Skipped by default (can enable in config) |
| 2 - Architecture | Generate from scratch | Best-effort reverse-engineer from codebase scan (directory structure, import graph, README, framework patterns). Marked as `<!-- DRAFT: Verify against actual architecture -->`. User can edit at Gate 2's `[edit]` option |
| 3 - TDD Plan | Plan from architecture | Plan from architecture + existing test audit — identify gaps |
| 4 - Implementation | Build from zero | Extend/fix existing code guided by plan |
| 5 - E2E | Generate all E2E tests | Generate E2E respecting existing test framework |
| 6 - Verification | Full verification | Full verification + regression check against existing tests |
| 7 - Analysis | Standard | Standard + before/after comparison |
| 8 - GTM | Generate all artifacts | Update existing README, generate only missing artifacts |

### Acceptance criteria for existing projects:
- User must provide in config (no Phase 1 to extract them)
- If empty, bootstrapper prompts: "What are you trying to achieve? List your goals."

---

## 8. GTM Templates

Phase 8 produces 5 artifacts in `.founder/phase8-gtm/`:

### README.md
Generated from Phase 1 (target user, differentiators) + Phase 2 (architecture, tech stack) + Phase 4 (what was built). Sections: what it does, why it exists, install, quick start, architecture overview, contributing.

### PITCH.md
One-page pitch summary. Sections: problem, solution, target user, key differentiators, traction metrics (test coverage, passing tests), tech stack, what's next.

### TWEET-THREAD.md
4-6 tweet thread: hook → key feature demos → composition/architecture → install CTA. Each tweet marked with character count. Follows proven pattern from agent-skills marketplace launch thread.

### PRODUCTHUNT.md
Tagline (60 chars), description (260 chars), 3 key features with one-liners, maker comment draft, suggested categories/topics.

### CHANGELOG.md
Initial release entry with all features categorized (Added/Changed/Fixed), following Keep a Changelog format.

### Quality controls:
- GTM drafter reads Phase 1 eval data for market language — not hallucinated positioning
- Tweet thread uses actual feature names and real metrics from the build
- All artifacts marked with `<!-- Generated by founder-mode. Edit before publishing. -->` header
- No invented metrics, testimonials, or claims — only facts from pipeline artifacts

---

## 9. Skills Composed

| Phase | Dependency | Invocation | Notes |
|-------|-----------|------------|-------|
| 0 - Bootstrap | `learn-by-mistake` | Slash command (`/learn`) | Load domain-relevant lessons. Requires skill installed. |
| 1 - Eval | `architect` | Slash command (`/architect`) | Full 6-evaluator dispatch. Requires skill installed. |
| 2 - Architecture | None (built-in) | Agent prompt in `architect-gen.md` | Uses architecture-reviewer patterns but logic is embedded in agent prompt. |
| 3 - TDD Plan | None (built-in) | Agent prompt in `planner.md` | Embeds writing-plans methodology directly. No external dependency. |
| 4 - Implementation | None (built-in) | Agent prompt in `implementer.md` | Embeds TDD methodology. learn-by-mistake hooks active if installed. |
| 5 - E2E | None (built-in) | Agent prompt in `e2e-runner.md` | E2E strategy selected by project type (web/CLI/library/mobile/API). |
| 6 - Verification | None (built-in) | Agent prompt in `verifier.md` | Embeds verification + gap analysis logic. |
| 7 - Analysis | `post-run-analysis` | Slash command (`/post-run-analysis`) | Optional. If not installed, analyzer agent does built-in analysis. |
| 8 - GTM | None (built-in) | Agent prompt in `gtm-drafter.md` | Uses templates from `templates/` directory. |

**Hard dependencies (must be installed):** `architect` (Phase 1)
**Soft dependencies (enhance but not required):** `learn-by-mistake` (Phase 0, 4), `post-run-analysis` (Phase 7)
**No external dependency (logic embedded in agent prompts):** Phases 2, 3, 4, 5, 6, 8

---

## 10. Risk Mitigations (from Architect Evaluation)

| Risk | Mitigation | Implementation |
|------|-----------|----------------|
| Compounding failure (~20% e2e success) | 3 human gates | Gates at post-eval, post-implementation, post-verification |
| Circular AI validation | Spec-to-test gap analysis | Phase 6 verifier compares acceptance criteria vs. actual test coverage |
| Context window degradation | Checkpoint pipeline | Each agent gets fresh context, reads only its input artifact |
| Undefined MVP exit criteria | Acceptance criteria + iteration cap | Extracted at Phase 1, tracked through pipeline, extendable by user |
| GTM without market signal | Downscoped to launch template | Templates fed by Phase 1 eval data, marked as drafts |
| Crash/context loss | State file + resume | `.founder/state.json` tracks phase, chunk, iteration progress |

---

## 11. Competitive Positioning

| Capability | founder-mode | gstack | Lovable | Replit | Devin |
|---|---|---|---|---|---|
| Idea Evaluation | Yes | No | No | No | No |
| Architecture (reviewable) | Yes | Review only | Hidden | Hidden | Partial |
| TDD Enforcement | Yes | No | No | No | No |
| Implementation | Yes | No (raw Claude) | Yes | Yes | Yes |
| E2E Testing | Yes | Yes (browser QA) | No | Yes | Partial |
| Verification | Yes | Partial | No | Partial | Partial |
| GTM Draft | Yes | No | No | No | No |
| Phase Orchestration | Yes (automated) | No (manual) | No | Partial | Partial |
| Error Memory | Yes | No | No | Partial | Partial |
| Open Source | Yes (MIT) | Yes (MIT) | No | No | No |
| Local-First | Yes | Yes | No | No | No |
| Cost | Claude sub only | Claude sub | $20-100+/mo | $20-300+/mo | $20-500+/mo |

**vs gstack:** "gstack gets your code shipped. founder-mode gets your product launched."
**vs Lovable/Replit/Bolt:** "They build code in their cloud. founder-mode builds products in your repo."
**vs Devin:** "Devin needs clear specs. founder-mode starts where founders start — with uncertainty."
