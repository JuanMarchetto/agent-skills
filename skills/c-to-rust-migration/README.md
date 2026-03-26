# C to Rust Migration

Complete pipeline for migrating C/C++ codebases to safe, idiomatic Rust. Analyzes code difficulty, converts with proven patterns, and validates the result with differential testing.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install c-to-rust-migration@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/c-to-rust-migration-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/c-to-rust-migration-skill.git
cp -r c-to-rust-migration-skill ~/.claude/skills/c-to-rust-migration
```

## Pipeline

```
C/C++ Source → ANALYZE (classify difficulty) → CONVERT (idiomatic Rust) → VALIDATE (tests + safety) → Safe Rust
```

**Phase 1 — Analyze**: Classify functions as easy/medium/hard based on pointer complexity, macros, goto usage. Plan conversion strategy per function.

**Phase 2 — Convert**: Apply proven migration patterns (malloc→Vec, error codes→Result, NULL→Option, arrays→slices). Quality gate: re-translate if >5 unsafe blocks.

**Phase 3 — Validate**: Compile check, clippy with 0 warnings, unsafe minimization, differential testing (same inputs → same outputs as original C).

## References

| File | Content |
|------|---------|
| `references/analysis-patterns.md` | Difficulty classification, C pattern catalog |
| `references/conversion-patterns.md` | C→Rust translation patterns with real examples |
| `references/validation-checklist.md` | Safety verification protocol, idiomatic scoring |

## Origin

Patterns extracted from real-world migrations of open-source C libraries: cJSON, genann, http-parser.

## License

[MIT](LICENSE)
