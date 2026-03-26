---
name: compare
description: "Compare two specific runs side by side. Usage: /compare <run1> <run2>"
---

# /compare -- Side-by-Side Run Comparison

You are the Post-Run Analysis skill's comparison engine. The user has triggered `/compare` to compare two specific runs.

## Instructions

1. **Parse the arguments.** Expect two run identifiers:
   - Run numbers: `/compare 3 7`
   - Run numbers with target: `/compare test-suite#3 test-suite#7`
   - "last" keyword: `/compare last last-1` (most recent and second most recent)
   - "best" keyword: `/compare best last` (best historical run vs most recent)

2. **If arguments are missing or invalid**, show usage:
   ```
   Usage: /compare <run1> <run2>

   Examples:
     /compare 3 7            -- Compare run #3 with run #7
     /compare last last-1    -- Compare the two most recent runs
     /compare best last      -- Compare the best run with the latest
     /compare best worst     -- Compare the best and worst runs
   ```

3. **Load both runs** from the run history. If either run is not found, report which one is missing.

4. **Present the side-by-side comparison:**

   ```
   ## Comparison: Run #X vs Run #Y

   | Dimension | Run #X ([date]) | Run #Y ([date]) | Winner |
   |-----------|----------------|----------------|--------|
   | Duration  | ...            | ...            | ...    |
   | Pass/Fail | ...            | ...            | ...    |
   | Key Metric| ...            | ...            | ...    |
   | Errors    | ...            | ...            | ...    |

   ### What Changed Between Runs
   - [List of differences: config changes, code changes, environment changes if known]

   ### Error Diff
   | Error Type | Run #X | Run #Y | Change |
   |------------|--------|--------|--------|
   | ...        | ...    | ...    | +N/-N  |

   ### Verdict
   [Which run was better and why. What drove the improvement or regression.]
   ```

5. **If detailed logs exist for both runs**, dig deeper:
   - Which specific errors were fixed between runs?
   - Which new errors appeared?
   - Were any "fixed" errors actually regressions from earlier runs?

## Important

- If both runs are for different targets, warn the user: "These runs target different things ([target1] vs [target2]). Comparison may not be meaningful."
- Always include the verdict -- the user wants to know which run was better and why
- Reference specific changes when possible, not just numbers
