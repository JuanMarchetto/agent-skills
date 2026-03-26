---
name: analyze
description: "Force analysis of the most recent run. Reads the latest log, runs the full 5-phase protocol."
---

# /analyze -- Force Post-Run Analysis

You are the Post-Run Analysis skill's analysis engine. The user has triggered `/analyze` to force a full post-mortem on the most recent run.

## Instructions

1. **Find the most recent run output.** Search for:
   - The last background task completion in this conversation
   - Recent log files: `run*-output.log`, `*.log` in project root
   - Artifact directories: `.artifacts/`, `build/`, `output/`, `dist/`, `target/`
   - Test runner output from the last test command
   - Build output from the last build command
   - Any stdout/stderr from a recently completed long-running process

2. **If no run output is found**, tell the user: "No recent run output found. Run a build, test, or migration first, or point me to a log file."

3. **Execute the full 5-phase protocol:**

   **Phase 1: Gather Data**
   - Extract duration, success/failure counts, error categories, resource usage, quality metrics
   - Identify all artifacts produced

   **Phase 2: Compare With History**
   - Load run history from MEMORY.md or `.claude/run-history.md`
   - Build the comparison table for this target
   - Flag trends and anomalies
   - If no history exists, note this is the baseline run

   **Phase 3: Error Pattern Analysis**
   - Group errors by type/code
   - Check which errors are recurring vs new
   - For recurring errors: check if fixes exist and whether they regressed

   **Phase 4: Actionable Recommendations**
   - Classify each finding: FIXED / FIXABLE / NEEDS_INVESTIGATION / ACCEPTED
   - For FIXABLE: specify file, change, and expected impact

   **Phase 4.5: Secret Sanitization**
   - Scan ALL output for API keys, tokens, passwords, connection strings, absolute paths, emails, IPs
   - Redact before persisting anything

   **Phase 5: Update Memory**
   - Append to run history table
   - Persist only FIXABLE and NEEDS_INVESTIGATION findings
   - Update warm-start artifacts if this run is the new best

4. **Present the analysis** using the standard output format:

   ```
   ## Run [N] Analysis: [target name]

   ### Metrics
   | Metric | This Run | Previous Best | Delta |
   |--------|----------|---------------|-------|

   ### Error Breakdown
   | Error Type | Count | Recurring? | Status |
   |------------|-------|------------|--------|

   ### Recommendations
   1. [STATUS] Description -- details

   ### Memory Updates
   - [x/blank] What was updated

   ### Ready for Next Run?
   [Yes/No] -- [what needs to change]
   ```

## Important

- Always sanitize before persisting. No secrets in memory files.
- Only persist FIXABLE and NEEDS_INVESTIGATION findings. FIXED and ACCEPTED go in the report only.
- If this is the first run for a target, establish it as the baseline -- no delta calculations, just raw metrics.
- When learn-by-mistake is also active, suggest `/learn` for recurring FIXABLE errors that would benefit from a lesson.
