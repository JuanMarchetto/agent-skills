# C/C++ Analyzer

Analyze C/C++ code for Rust migration planning. Classifies every function by migration difficulty (easy/medium/hard), identifies unsafe patterns, pointer complexity, macro usage, and risk flags. Provides size-based translation strategies and pattern-to-Rust mapping tables.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install c-cpp-analyzer@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/c-cpp-analyzer-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/c-cpp-analyzer-skill.git
cp -r c-cpp-analyzer-skill ~/.claude/skills/c-cpp-analyzer
```

## What's Inside

- **Difficulty Classification** — 3-tier system (easy/medium/hard) with explicit signal lists for each level
- **Pattern Detection Table** — 17 C patterns mapped to their idiomatic Rust equivalents with difficulty ratings
- **Size-Based Strategy** — chunking thresholds and repair iteration counts by LOC range
- **Risk Flags** — platform-specific code, UB, variadic functions, setjmp/longjmp, macro-heavy code
- **Migration Ceiling** — patterns with no safe Rust equivalent that require algorithm redesign

## Example Output

```
Function: parse_request()
  Difficulty: Hard
  Signals: goto (3), void* (1), function pointers (2)
  Strategy: Chunked translation (1200 LOC), structural chunking
  Risk: goto state machine — rewrite at higher abstraction level
  Rust equivalent: line-based parsing with match loop
```

## Requirements

None. This is a knowledge skill — no external tools or APIs needed.

## Part of the Noricum Ecosystem

This skill is extracted from [Noricum](https://github.com/JuanMarchetto/noricum), an autonomous C/C++ to Rust migration agent. It works standalone but pairs well with:
- [rust-migration-skill](https://github.com/JuanMarchetto/rust-migration-skill) — conversion patterns
- [migration-validator-skill](https://github.com/JuanMarchetto/migration-validator-skill) — safety verification

## License

[MIT](LICENSE)