# Open Source Readiness Checklist

Comprehensive checklist for evaluating whether a project is ready to be open-sourced. Organized by category, with severity and effort estimates for each item.

Severity levels:
- **BLOCKER**: Must fix before publishing. Failure to address creates legal, security, or reputational risk.
- **HIGH**: Should fix before publishing. Not a showstopper, but significantly impacts adoption and trust.
- **MEDIUM**: Fix within first month. Improves quality of the open-source presence.
- **LOW**: Nice to have. Improves polish and professionalism.

Effort levels:
- **5 min**: Copy-paste a template, flip a setting
- **30 min**: Write a document, configure a tool
- **1-2 hr**: Research and implement, audit a category
- **Half day+**: Deep audit, major restructuring, history rewriting

---

## 1. Licensing

| # | Check | Severity | Effort | Details |
|---|-------|----------|--------|---------|
| L1 | LICENSE file exists at project root | BLOCKER | 5 min | Without this, the project is "all rights reserved" by default |
| L2 | License is OSI-approved | BLOCKER | 5 min | MIT, Apache-2.0, GPL-3.0, BSD-2/3, ISC, MPL-2.0, etc. |
| L3 | License text is complete and unmodified | HIGH | 5 min | Partial or modified license text may be legally invalid |
| L4 | Copyright holder and year are correct | MEDIUM | 5 min | Update year, ensure correct entity name |
| L5 | All dependency licenses are compatible | BLOCKER | 1-2 hr | GPL dep in MIT project = copyleft contamination |
| L6 | No dependencies with unknown licenses | HIGH | 1-2 hr | Unknown = unauditable risk |
| L7 | No SSPL/BSL dependencies misrepresented as OSS | HIGH | 30 min | Source-available is not open-source |
| L8 | Vendored/copied code retains original license | HIGH | 30 min | Copied files must keep their license |
| L9 | No conflicting license headers in source files | MEDIUM | 1-2 hr | "All Rights Reserved" contradicts OSS license |
| L10 | NOTICE file if required (Apache-2.0 deps) | MEDIUM | 30 min | Some licenses require attribution in a NOTICE file |
| L11 | Third-party assets attributed (fonts, images, icons) | MEDIUM | 30 min | Creative Commons, font licenses, icon packs |
| L12 | Patent considerations addressed | LOW | 30 min | Apache-2.0 includes patent grant, MIT does not |
| L13 | CLA decision made (needed or not) | LOW | 30 min | For projects expecting corporate contributions |

---

## 2. Documentation

| # | Check | Severity | Effort | Details |
|---|-------|----------|--------|---------|
| D1 | README.md exists | BLOCKER | 30 min | The single most important file for adoption |
| D2 | README: project name and description | BLOCKER | 5 min | What is this and why does it exist? |
| D3 | README: installation instructions | HIGH | 30 min | Copy-pasteable commands that work |
| D4 | README: quick start / basic usage | HIGH | 30 min | Get running in under 5 minutes |
| D5 | README: license badge or mention | MEDIUM | 5 min | Signal license at a glance |
| D6 | README: status badges (build, coverage) | LOW | 5 min | Signal project health |
| D7 | README: detailed usage / API reference | MEDIUM | 1-2 hr | Comprehensive feature documentation |
| D8 | README: real-world examples | MEDIUM | 1-2 hr | Beyond hello world |
| D9 | README: configuration docs | MEDIUM | 30 min | Env vars, config files, options |
| D10 | README: prerequisites / requirements | HIGH | 5 min | Runtime version, OS, system deps |
| D11 | README: screenshots or demo | LOW | 30 min | For visual projects |
| D12 | CONTRIBUTING.md exists | HIGH | 30 min | How to contribute |
| D13 | CONTRIBUTING: dev environment setup | HIGH | 30 min | Clone to running steps |
| D14 | CONTRIBUTING: contribution workflow | MEDIUM | 30 min | Fork, branch, PR process |
| D15 | CONTRIBUTING: coding standards | MEDIUM | 30 min | Style guide, linting rules |
| D16 | CONTRIBUTING: how to run tests | HIGH | 5 min | Single command ideally |
| D17 | CHANGELOG.md exists | MEDIUM | 30 min | Track changes over time |
| D18 | CHANGELOG follows structured format | LOW | 30 min | Keep a Changelog or similar |
| D19 | API docs for public functions (libraries) | MEDIUM | 1-2 hr | JSDoc, docstrings, rustdoc, etc. |
| D20 | Code comments on complex logic | LOW | 1-2 hr | "Why" comments, not "what" |
| D21 | SECURITY.md exists | HIGH | 30 min | How to report vulnerabilities |
| D22 | Architecture overview (complex projects) | LOW | 1-2 hr | How components fit together |

---

## 3. Security

| # | Check | Severity | Effort | Details |
|---|-------|----------|--------|---------|
| S1 | No hardcoded API keys in code | BLOCKER | 1-2 hr | Scan all files for key patterns |
| S2 | No hardcoded passwords in code | BLOCKER | 1-2 hr | Variables named password/secret with literals |
| S3 | No private keys committed | BLOCKER | 30 min | RSA, EC, ED25519 key blocks |
| S4 | No secrets in git history | BLOCKER | Half day+ | Even deleted secrets persist in history |
| S5 | .env files in .gitignore | BLOCKER | 5 min | Prevent future secret commits |
| S6 | .gitignore covers credential files | HIGH | 5 min | *.pem, *.key, credentials.json |
| S7 | .gitignore covers IDE/OS files | MEDIUM | 5 min | .DS_Store, .idea/, .vscode/ |
| S8 | .gitignore covers build artifacts | MEDIUM | 5 min | dist/, build/, node_modules/ |
| S9 | No known critical CVEs in dependencies | HIGH | 30 min | Run appropriate audit tool |
| S10 | Lock file present | HIGH | 5 min | package-lock.json, Cargo.lock, etc. |
| S11 | No debug mode in production config | MEDIUM | 30 min | DEBUG=true, verbose logging |
| S12 | No overly permissive CORS | MEDIUM | 30 min | CORS: * in production |
| S13 | No disabled SSL/TLS verification | HIGH | 30 min | verify=false, NODE_TLS_REJECT_UNAUTHORIZED=0 |
| S14 | No SQL injection vectors | HIGH | 1-2 hr | String concatenation in queries |
| S15 | No dynamic code execution with user input | HIGH | 30 min | Runtime code evaluation with untrusted data |
| S16 | SECURITY.md with disclosure process | HIGH | 30 min | Responsible disclosure instructions |
| S17 | No test credentials with real access | HIGH | 30 min | Test files with production creds |
| S18 | No terraform state files committed | BLOCKER | 30 min | Contains all infrastructure secrets |

---

## 4. Community Readiness

| # | Check | Severity | Effort | Details |
|---|-------|----------|--------|---------|
| C1 | Issue templates exist | HIGH | 30 min | Bug report, feature request templates |
| C2 | PR template exists | MEDIUM | 30 min | Checklist for contributors |
| C3 | CODE_OF_CONDUCT.md exists | HIGH | 5 min | Contributor Covenant is standard |
| C4 | CODEOWNERS file (multi-maintainer) | LOW | 5 min | Auto-assign reviewers |
| C5 | "Good first issue" labels | MEDIUM | 30 min | Onramp for new contributors |
| C6 | Governance model documented | LOW | 1-2 hr | Decision-making process |
| C7 | Maintainers listed | MEDIUM | 5 min | In README or MAINTAINERS.md |
| C8 | Communication channel exists | LOW | 30 min | Discussions, Discord, forum |
| C9 | CI/CD configured | MEDIUM | 1-2 hr | Automated tests, linting on PRs |
| C10 | Onboarding: clone to running in 3 steps | HIGH | 30 min | Makefile, setup script, docker-compose |
| C11 | Branch strategy documented | LOW | 5 min | main/develop/feature branches |
| C12 | Contributors acknowledged | LOW | 5 min | All-contributors bot or similar |
| C13 | Response time reasonable | LOW | N/A | Audit existing issues/PRs |

---

## 5. API Surface

| # | Check | Severity | Effort | Details |
|---|-------|----------|--------|---------|
| A1 | Public API clearly separated from internals | HIGH | 1-2 hr | Explicit exports, private modules |
| A2 | Exports are explicit (not wildcard) | MEDIUM | 30 min | No `export *` or `module.exports = everything` |
| A3 | Consistent naming conventions | MEDIUM | 1-2 hr | camelCase vs snake_case consistent |
| A4 | Version number present and meaningful | HIGH | 5 min | semver in package manifest |
| A5 | Type definitions for public API | MEDIUM | 1-2 hr | .d.ts, type hints, etc. |
| A6 | Error handling consistent | MEDIUM | 1-2 hr | Same error pattern throughout |
| A7 | No breaking changes in unreleased code | HIGH | 30 min | Compare against last release |
| A8 | Deprecated APIs marked with warnings | LOW | 30 min | @deprecated, warnings.warn |
| A9 | Deprecation policy documented | LOW | 30 min | Versions before removal |
| A10 | Backwards compatibility strategy | MEDIUM | 30 min | Documented approach |
| A11 | Edge cases handled (null, empty, invalid) | MEDIUM | 1-2 hr | Defensive programming |
| A12 | Semver posture clear (v0.x vs v1.x) | HIGH | 5 min | Set expectations for stability |

---

## Summary by Severity

| Severity | Count | Examples |
|----------|-------|---------|
| BLOCKER | 12 | Missing LICENSE, hardcoded secrets, copyleft contamination |
| HIGH | 22 | Missing CONTRIBUTING, no issue templates, CVE dependencies |
| MEDIUM | 21 | Badges, CHANGELOG, consistent naming, CI/CD |
| LOW | 13 | Governance, deprecation policy, architecture docs |

**Total items: 68**

## Quick Win Priorities (under 30 minutes, high impact)

1. Add LICENSE file (BLOCKER, 5 min)
2. Add `.env` to .gitignore (BLOCKER, 5 min)
3. Add .gitignore entries for IDE/OS/build (MEDIUM, 5 min)
4. Add CODE_OF_CONDUCT.md (HIGH, 5 min — use Contributor Covenant)
5. Add license badge to README (MEDIUM, 5 min)
6. Add SECURITY.md (HIGH, 30 min)
7. Add issue templates (HIGH, 30 min — use GitHub defaults)
8. Add PR template (MEDIUM, 30 min)
9. Add CONTRIBUTING.md (HIGH, 30 min)
10. Run dependency audit tool (HIGH, 5 min to run)
