# Log Patterns Reference

> Detection patterns, metric extraction, and error signatures for common tool types.
> Used by post-run-analysis to parse logs from different runners and build systems.

---

## Rust Compiler (rustc / cargo)

### Where to find logs
- `cargo build 2>&1` output (stderr for diagnostics)
- `cargo test` output (stdout for test results, stderr for compiler errors)
- `target/` directory for build artifacts

### Key metrics to extract
- **Compilation time**: `Finished ... in Xs`
- **Warning count**: `warning: ... generated N warning(s)`
- **Error count**: `error[EXXXX]: ...` -- count unique error codes
- **Unsafe blocks**: `unsafe { ... }` count in source
- **Binary size**: Check `target/release/` or `target/debug/` artifact size

### Error patterns
| Pattern | Regex | Category |
|---------|-------|----------|
| Type mismatch | `error\[E0308\]: mismatched types` | types |
| Borrow checker | `error\[E0502\]: cannot borrow .+ as mutable` | build |
| Missing import | `error\[E0432\]: unresolved import` | build |
| Unused variable | `warning: unused variable` | linter |
| Dead code | `warning: .+ is never used` | linter |
| Missing trait impl | `error\[E0277\]: the trait bound .+ is not satisfied` | types |
| Lifetime error | `error\[E0106\]: missing lifetime specifier` | types |

### Test output format
```
running N tests
test name::of::test ... ok
test name::of::test ... FAILED
test result: FAILED. X passed; Y failed; Z ignored
```

---

## Jest / Vitest (JavaScript/TypeScript)

### Where to find logs
- stdout from `npx jest`, `npx vitest`, `npm test`, `pnpm test`
- `coverage/` directory for coverage reports
- `--json` or `--reporter=json` for machine-readable output

### Key metrics to extract
- **Test count**: `Tests: N passed, M failed, P total`
- **Suite count**: `Test Suites: N passed, M failed, P total`
- **Duration**: `Time: Xs`
- **Coverage**: `All files | XX.XX% | ...` from coverage summary
- **Snapshots**: `Snapshots: N passed, M updated, P total`

### Error patterns
| Pattern | Regex | Category |
|---------|-------|----------|
| Assertion failure | `expect\(received\)\.(toBe\|toEqual)\(expected\)` | test |
| Snapshot mismatch | `Snapshot .+ mismatched` | test |
| Timeout | `Timeout - Async callback was not invoked within` | test |
| Import error | `Cannot find module '([^']+)'` | build |
| Type error | `TypeError: .+ is not a function` | runtime |
| Mock error | `Cannot spy .+ because it is not a function` | test |

### Test output format
```
PASS src/utils.test.ts
FAIL src/auth.test.ts
  ● Test name > should do something
    expect(received).toBe(expected)
    Expected: "foo"
    Received: "bar"
```

---

## pytest (Python)

### Where to find logs
- stdout from `pytest`, `python -m pytest`
- `--tb=short` or `--tb=long` for traceback format
- `--junitxml=report.xml` for CI-friendly output
- `htmlcov/` for coverage reports

### Key metrics to extract
- **Test count**: `N passed, M failed, P error, Q skipped`
- **Duration**: `in X.XXs`
- **Coverage**: `TOTAL ... XX%` from `pytest --cov`
- **Warnings**: `N warnings`

### Error patterns
| Pattern | Regex | Category |
|---------|-------|----------|
| Assertion failure | `AssertionError: assert .+` | test |
| Import error | `ModuleNotFoundError: No module named '([^']+)'` | build |
| Fixture error | `fixture '([^']+)' not found` | test |
| Type error | `TypeError: .+` | runtime |
| Attribute error | `AttributeError: .+ has no attribute '([^']+)'` | runtime |
| Timeout | `TimeoutError` | test |

### Test output format
```
============================= test session starts ==============================
collected N items
tests/test_foo.py ..F.x.
FAILED tests/test_foo.py::test_bar - AssertionError: assert 1 == 2
==================== M failed, N passed, P skipped in X.XXs ===================
```

---

## Go test

### Where to find logs
- stdout from `go test ./...`, `go test -v`
- `go test -bench` for benchmarks
- `go test -coverprofile=coverage.out` for coverage

### Key metrics to extract
- **Test count**: Count `--- PASS` and `--- FAIL` lines
- **Duration**: `ok  package  X.XXXs`
- **Coverage**: `coverage: XX.X% of statements`
- **Benchmark**: `BenchmarkName-N    NNNNN    XXX ns/op`

### Error patterns
| Pattern | Regex | Category |
|---------|-------|----------|
| Test failure | `--- FAIL: (.+) \((\d+\.\d+)s\)` | test |
| Build failure | `# (.+)\n.+\.go:\d+:\d+: (.+)` | build |
| Panic | `panic: .+` | runtime |
| Race condition | `WARNING: DATA RACE` | runtime |
| Timeout | `panic: test timed out after` | test |
| Vet error | `go vet: .+` | linter |

### Test output format
```
=== RUN   TestFoo
--- PASS: TestFoo (0.00s)
=== RUN   TestBar
--- FAIL: TestBar (0.01s)
    bar_test.go:15: expected 3, got 4
FAIL
exit status 1
FAIL  package  0.123s
```

---

## Docker

### Where to find logs
- stdout/stderr from `docker build`, `docker compose up`
- `docker logs <container>` for runtime logs
- Build cache output during `docker build`

### Key metrics to extract
- **Build time**: Total wall-clock time
- **Layer count**: Number of `Step N/M` lines
- **Image size**: `docker images` output after build
- **Cache hits**: `CACHED` vs rebuilt layers
- **Stage count**: Number of `FROM` directives (multi-stage)

### Error patterns
| Pattern | Regex | Category |
|---------|-------|----------|
| Build failure | `ERROR \[.+\]` | build |
| Missing file | `COPY failed: .+ not found` | config |
| Permission denied | `permission denied` | config |
| Network error | `Could not resolve host` | dependency |
| OOM killed | `OOMKilled` | runtime |
| Port conflict | `port is already allocated` | config |
| Stage failure | `failed to solve: .+` | build |

### Build output format
```
[+] Building 12.3s (8/12)
 => [internal] load build definition from Dockerfile
 => [1/6] FROM docker.io/library/node:18-alpine
 => CACHED [2/6] WORKDIR /app
 => [3/6] COPY package*.json ./
 => ERROR [4/6] RUN npm ci
```

---

## npm / pnpm / yarn

### Where to find logs
- stdout/stderr from install, build, and script commands
- `npm-debug.log`, `pnpm-debug.log`, `yarn-error.log`
- `node_modules/.cache/` for build caches

### Key metrics to extract
- **Install time**: Wall-clock duration
- **Package count**: `added N packages`
- **Warnings**: Count of `WARN` lines
- **Audit results**: `N vulnerabilities (X low, Y moderate, Z high, W critical)`
- **Build time**: From build script output

### Error patterns
| Pattern | Regex | Category |
|---------|-------|----------|
| Resolve failure | `ERESOLVE unable to resolve dependency tree` | dependency |
| Missing package | `404 Not Found - GET .+` | dependency |
| Peer dep warning | `WARN .+ requires a peer of` | dependency |
| Build script fail | `ERR! .+ failed` | build |
| Permission error | `EACCES: permission denied` | config |
| Integrity error | `EINTEGRITY .+ Integrity checksum failed` | dependency |
| Engine mismatch | `EBADENGINE .+ not compatible` | dependency |

---

## General Log Parsing Strategy

When encountering an unfamiliar log format:

1. **Find the summary line**: Most tools print a summary at the end (pass/fail counts, duration, exit code)
2. **Find error markers**: Search for `ERROR`, `FAIL`, `FATAL`, `PANIC`, `Exception`, non-zero exit codes
3. **Find timing data**: Search for `in X.Xs`, `elapsed`, `duration`, `took`, timestamps
4. **Find counts**: Search for `N passed`, `N failed`, `N warnings`, `N errors`
5. **Find the exit code**: `Process exited with code N` -- 0 is success, anything else is failure

When in doubt, extract what you can and note which metrics are missing. Partial data is better than no data.
