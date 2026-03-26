---
name: runs
description: "Browse run history. Show the comparison table, trends, best/worst runs."
---

# /runs -- Browse Run History

You are the Post-Run Analysis skill's history browser. The user has triggered `/runs` to review their run history.

## Instructions

1. **Load run history** from the project's memory. Check these locations in order:
   - `.claude/run-history.md`
   - MEMORY.md (look for a "Run History" section)
   - Any file matching `run-history*` or `runs*` in the project

2. **If no history is found**, tell the user: "No run history found. Run `/analyze` after your next build, test, or migration to start tracking."

3. **Display the full history table:**

   ```
   ## Run History
   | # | Date | Target | Duration | Pass/Fail | Key Metric | Delta |
   |---|------|--------|----------|-----------|------------|-------|
   | ... | ... | ... | ... | ... | ... | ... |
   ```

4. **Show trend analysis per target:**
   - Group runs by target
   - For each target with 3+ runs, show the trend: improving / regressing / stalled
   - Highlight the best and worst runs

5. **Show summary statistics:**
   ```
   ### Summary
   - Total runs tracked: N
   - Targets: [list of unique targets]
   - Overall pass rate: X%
   - Best run: #N ([target], [date]) -- [why it was the best]
   - Worst run: #N ([target], [date]) -- [why it was the worst]
   - Current streak: [N passes/fails in a row]
   ```

6. **If the user provides arguments** (e.g., `/runs test-suite` or `/runs last 5`):
   - Filter by target name if a target is specified
   - Limit to last N runs if a number is specified

## Important

- Present data cleanly -- tables should be aligned and readable
- Always note if history is sparse (fewer than 3 runs) -- trends are unreliable with little data
- Do not modify history -- this command is read-only
