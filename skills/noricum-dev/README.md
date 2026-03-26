# Noricum Dev

Development conventions for the Noricum C-to-Rust migration agent. Architecture decisions, crate dependency graph, coding standards, state machine design, model routing, pipeline improvements (P0-P33), and key thresholds.

> **Note:** This skill contains project-specific conventions for Noricum. It is published as a **template** — if you are building your own multi-crate Rust agent or migration tool, fork this skill and adapt the conventions to your project. The patterns (layered crate dependencies, model routing, pipeline improvement tracking, quality thresholds) are broadly applicable.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install noricum-dev@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/noricum-dev-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/noricum-dev-skill.git
cp -r noricum-dev-skill ~/.claude/skills/noricum-dev
```

## What's Inside

- **Architecture** — agent orchestrator design, C2Rust as optional subprocess, LLM-first approach
- **Crate Dependency Graph** — 6-crate layered structure (cli, core, agents, tools, validation, ir)
- **Coding Standards** — edition 2024, thiserror/anyhow split, tracing, no unwrap, tokio async
- **State Machine** — migration lifecycle from Pending through Validated/FallbackUnsafe
- **Model Router** — difficulty-based model selection (Haiku/Sonnet/Opus)
- **Pipeline Improvements** — P0-P5 (quality floor, best-version, skip-c2rust, idiomatic hints) and P30-P33 (hybrid repair, assembly cleanup, brace-balance, type contracts)
- **Key Thresholds** — LOC breakpoints for chunking, repair iterations, quality gates

## Use as a Template

This skill demonstrates a pattern for encoding project conventions as an AI skill:

1. **Architecture overview** — what the system IS and IS NOT
2. **Dependency graph** — crate/module relationships
3. **Coding standards** — edition, error handling, logging, testing
4. **State machine** — lifecycle states and transitions
5. **Model routing** — which LLM for which task
6. **Improvement log** — numbered improvements with rationale
7. **Thresholds** — numeric constants that drive behavior

Fork and replace the Noricum-specific content with your own project's conventions.

## Requirements

None. This is a knowledge skill — no external tools or APIs needed.

## Part of the Noricum Ecosystem

This skill encodes the development conventions for [Noricum](https://github.com/JuanMarchetto/noricum), an autonomous C/C++ to Rust migration agent. Related skills:
- [c-cpp-analyzer-skill](https://github.com/JuanMarchetto/c-cpp-analyzer-skill) — C/C++ analysis
- [rust-migration-skill](https://github.com/JuanMarchetto/rust-migration-skill) — conversion patterns
- [migration-validator-skill](https://github.com/JuanMarchetto/migration-validator-skill) — safety verification

## License

[MIT](LICENSE)