# OSS Readiness — Open Source Readiness Evaluator

**78% of audited codebases contain at least one open-source vulnerability.** Most projects that go public have leaked secrets in git history, incompatible dependency licenses, or zero contribution guidelines. No integrated tool checks all five dimensions simultaneously.

**OSS Readiness** is a Claude Code skill that evaluates whether your project is ready for open source. Five specialist agents audit your codebase in parallel — licensing, documentation, security, community readiness, and API surface — then a synthesizer produces a unified readiness score with prioritized fixes sorted by severity.

## What It Checks

| Agent | Scans For |
|-------|-----------|
| License Auditor | LICENSE file, dependency license compatibility, copyleft contamination, attribution |
| Documentation Reviewer | README quality, CONTRIBUTING.md, CHANGELOG, API docs, code comments |
| Security Scanner | Hardcoded secrets, .env exposure, git history leaks, vulnerable dependencies |
| Community Readiness | Issue templates, PR templates, Code of Conduct, governance, onboarding friction |
| API Surface Analyzer | Public API stability, semver readiness, breaking change risk, type definitions |

## Output

A structured readiness report with:

- **Overall Readiness Score** (1-10) with verdict: GO / CONDITIONAL GO / NOT READY
- **Dimension Scores** — weighted matrix across all 5 areas
- **Blockers** — must fix before publishing (with exact fix instructions)
- **High Priority** — should fix soon
- **Recommended** — improve over time
- **Quick Wins** — fixes that take under 30 minutes
- **Phased Release Plan** — if the project is not ready yet

```
Overall Readiness: 7.2/10 — CONDITIONAL GO

| Dimension      | Score | Critical Issues                          |
|----------------|-------|------------------------------------------|
| Licensing      | 9/10  | MIT license, all deps compatible         |
| Documentation  | 6/10  | README good, missing CONTRIBUTING.md     |
| Security       | 4/10  | 2 hardcoded API keys found in git history|
| Community      | 5/10  | No issue templates, no CoC              |
| API Surface    | 8/10  | Stable public API, semver ready          |

BLOCKERS (fix before publishing):
1. [SECURITY] Remove API keys from git history
2. [SECURITY] Add .env to .gitignore
```

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install oss-readiness@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/oss-readiness-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/oss-readiness-skill.git
cp -r oss-readiness-skill ~/.claude/skills/oss-readiness
```

## Usage

```
"Is my project ready to open source?"
"Evaluate open source readiness for ./my-project"
"What do I need to fix before publishing this code?"
"Prepare this repo for public release"
"Open source checklist for my library"
```

## How It Works

1. You provide a project path
2. Five specialist agents scan the project **in parallel**
3. Each agent produces a structured assessment with scores and issues
4. The synthesizer combines all five into a unified report with weighted scoring
5. Issues are classified as BLOCKER / HIGH PRIORITY / RECOMMENDED
6. A phased release plan is generated if the project is not ready

### Scoring Weights

| Dimension | Weight | Why |
|-----------|--------|-----|
| Security | 30% | Leaked secrets cause immediate harm |
| Licensing | 25% | License issues can force takedowns |
| Documentation | 20% | Docs are the gateway to adoption |
| API Surface | 15% | Unstable APIs break downstream users |
| Community | 10% | Can be built incrementally post-release |

### Verdict Thresholds

| Score | Verdict | Meaning |
|-------|---------|---------|
| 8.0+ | **GO** | Ready to publish |
| 5.0-7.9 | **CONDITIONAL GO** | Fix blockers first |
| 0.0-4.9 | **NOT READY** | Significant work needed |

## Structure

```
oss-readiness-skill/
├── SKILL.md                          # Skill definition and frontmatter
├── agents/
│   ├── license-auditor.md            # License and dependency compliance
│   ├── docs-reviewer.md              # Documentation completeness and quality
│   ├── security-scanner.md           # Secrets, vulnerabilities, .gitignore
│   ├── community-readiness.md        # Issue templates, CoC, governance
│   ├── api-surface-analyzer.md       # API stability, semver, breaking changes
│   └── synthesizer.md               # Combines all 5 into unified assessment
├── references/
│   └── oss-checklist.md              # 78-item checklist by category and severity
├── .claude-plugin/plugin.json
├── README.md
├── LICENSE
└── .gitignore
```

## Comprehensive Checklist

The `references/oss-checklist.md` contains a 78-item checklist organized by:

- **Category**: Licensing (13), Documentation (22), Security (18), Community (13), API Surface (12)
- **Severity**: BLOCKER (12), HIGH (22), MEDIUM (21), LOW (13)
- **Effort**: 5 min, 30 min, 1-2 hr, Half day+

## Why This Exists

Existing tools check individual dimensions — license scanners, secret detectors, documentation linters — but none combine all five into a unified assessment with weighted scoring and prioritized action plans. The multi-agent approach means each dimension gets deep specialist attention while the synthesizer resolves cross-cutting concerns (e.g., a license that requires attribution flagged by the License Auditor gets cross-referenced with the Docs Reviewer to check if NOTICE file exists).

## License

MIT
