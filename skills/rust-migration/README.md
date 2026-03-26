# Rust Migration

C/C++ to idiomatic Rust conversion patterns and pipeline. Covers every major translation category: memory management, error handling, string handling, pointer patterns, struct migration, control flow, state machines, numeric formatting, and function pointer dispatch. Includes battle-tested pitfalls learned from production migrations.

## Install

```
/plugin marketplace add JuanMarchetto/agent-skills
/plugin install rust-migration@agent-skills
```

Or via [skills.sh](https://skills.sh):
```bash
npx skills add JuanMarchetto/rust-migration-skill
```

Or manually:
```bash
git clone https://github.com/JuanMarchetto/rust-migration-skill.git
cp -r rust-migration-skill ~/.claude/skills/rust-migration
```

## What's Inside

- **Pipeline Process** — 6-stage translation workflow with quality gates and fallback strategies
- **Memory Management** — malloc/free to Vec/Box, linked lists to Vec, realloc patterns
- **Data Model Migration** — C type tags + unions to Rust enums (learned from cJSON)
- **Error Handling** — error codes to Result, NULL returns to Option
- **String Handling** — const char* to &str, char* to String, escape sequences
- **Function Pointer Migration** — typedef callbacks to enum dispatch (learned from genann)
- **Pointer Patterns** — const T* to slices, nullable pointers to Option, void* to generics
- **State Machine Migration** — goto-based state machines to line-based parsing (learned from http-parser)
- **Numeric Formatting** — C printf %.17g to custom Rust format_g()
- **Common Pitfalls** — 12 production-learned gotchas with solutions

## Example Output

```rust
// C: typedef double (*actfun)(const struct genann *ann, double a);
// Rust: enum dispatch (no Fn trait objects needed)
#[derive(Clone, Copy, PartialEq)]
enum ActivationFn { Sigmoid, SigmoidCached, Threshold, Linear }

impl ActivationFn {
    fn apply(&self, ann: &Genann, a: f64) -> f64 {
        match self {
            ActivationFn::Sigmoid => sigmoid(a),
            // ...
        }
    }
}
```

## Requirements

None. This is a knowledge skill — no external tools or APIs needed.

## Part of the Noricum Ecosystem

This skill is extracted from [Noricum](https://github.com/JuanMarchetto/noricum), an autonomous C/C++ to Rust migration agent. It works standalone but pairs well with:
- [c-cpp-analyzer-skill](https://github.com/JuanMarchetto/c-cpp-analyzer-skill) — pre-migration analysis
- [migration-validator-skill](https://github.com/JuanMarchetto/migration-validator-skill) — post-migration verification

## License

[MIT](LICENSE)