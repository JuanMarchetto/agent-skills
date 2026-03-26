# Migration Validator

Safety verification checklist for C-to-Rust migrations. Validates compilation, unsafe block minimization, memory safety, semantic equivalence, differential testing, and idiomatic Rust patterns. Includes a scoring formula, quality floor enforcement, and a table of validated production migrations as reference benchmarks.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install migration-validator@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/migration-validator-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/migration-validator-skill.git
cp -r migration-validator-skill ~/.claude/skills/migration-validator
```

## What's Inside

- **Compilation Check** — rustc edition 2024, clippy zero-warning target
- **Safety Check** — unsafe block counting, SAFETY comments, no raw pointer abuse, no transmute
- **Semantic Equivalence** — function signatures, overflow behavior, printf format matching, bool/int distinction
- **Differential Testing** — byte-by-byte output comparison between C and Rust binaries
- **Idiomatic Score** — formula with positive and negative signals (100-point scale)
- **Quality Floor (P0)** — prevents repair loops from regressing unsafe count
- **Best-Version Tracking (P1)** — keeps highest-quality version across repair iterations
- **Repair Loop Rules** — iteration scaling by file size, stall detection, temperature ramping
- **Validated Migrations Table** — 10 production-tested reference points from 50 to 4400 LOC

## Example Output

```
Validation Report: cjson_combined.c → cjson.rs
  Compilation:    PASS (rustc --edition 2024)
  Clippy:         PASS (0 warnings)
  Unsafe blocks:  0
  Diff test:      PASS (byte-exact match on 47 test cases)
  Idiomatic score: 100
  Verdict:        VALIDATED
```

## Requirements

- `rustc` (edition 2024 support)
- `cc` (for compiling C reference with `-std=gnu11 -lm`)
- `cargo clippy` (for lint validation)

## Part of the Noricum Ecosystem

This skill is extracted from [Noricum](https://github.com/JuanMarchetto/noricum), an autonomous C/C++ to Rust migration agent. It works standalone but pairs well with:
- [c-cpp-analyzer-skill](https://github.com/JuanMarchetto/c-cpp-analyzer-skill) — pre-migration analysis
- [rust-migration-skill](https://github.com/JuanMarchetto/rust-migration-skill) — conversion patterns

## License

[MIT](LICENSE)