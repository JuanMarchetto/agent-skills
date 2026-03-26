#!/usr/bin/env bash
# Demo script for post-run-analysis skill
# Simulates a post-run analysis flow with colored output

set -e

# Colors
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
BOLD='\033[1m'
DIM='\033[2m'
RESET='\033[0m'

clear

# Header
echo ""
printf "${CYAN}${BOLD}━━━ Post-Run Analysis — Migration Run #4 ━━━${RESET}\n"
echo ""
sleep 0.3

# Processing lines
printf "${DIM}▸ Parsing log: run4-output.log (2,847 lines)${RESET}\n"
sleep 0.3
printf "${DIM}▸ Comparing with 3 previous runs${RESET}\n"
sleep 0.4

echo ""

# Metrics section
printf "${MAGENTA}${BOLD}METRICS${RESET}\n"
printf "${BOLD}┌──────────────┬──────────┬───────────┬─────────┐${RESET}\n"
printf "${BOLD}│${RESET} Metric       ${BOLD}│${RESET} Run #4   ${BOLD}│${RESET} Best (#3) ${BOLD}│${RESET} Delta   ${BOLD}│${RESET}\n"
printf "${BOLD}├──────────────┼──────────┼───────────┼─────────┤${RESET}\n"
printf "${BOLD}│${RESET} Duration     ${BOLD}│${RESET} 4m 12s   ${BOLD}│${RESET} 3m 45s    ${BOLD}│${RESET} ${YELLOW}+27s${RESET}    ${BOLD}│${RESET}\n"
printf "${BOLD}│${RESET} Pass Rate    ${BOLD}│${RESET} ${GREEN}89%%${RESET}      ${BOLD}│${RESET} 85%%       ${BOLD}│${RESET} ${GREEN}+4%%  ↑${RESET}  ${BOLD}│${RESET}\n"
printf "${BOLD}│${RESET} Errors       ${BOLD}│${RESET} ${GREEN}12${RESET}       ${BOLD}│${RESET} 17        ${BOLD}│${RESET} ${GREEN}-5   ↓${RESET}  ${BOLD}│${RESET}\n"
printf "${BOLD}│${RESET} Score        ${BOLD}│${RESET} ${GREEN}0.87${RESET}     ${BOLD}│${RESET} 0.82      ${BOLD}│${RESET} ${GREEN}+0.05 ↑${RESET} ${BOLD}│${RESET}\n"
printf "${BOLD}└──────────────┴──────────┴───────────┴─────────┘${RESET}\n"
sleep 0.4

echo ""

# Error breakdown
printf "${MAGENTA}${BOLD}ERROR BREAKDOWN${RESET}\n"
printf "${BOLD}│${RESET} Type          ${BOLD}│${RESET} Count ${BOLD}│${RESET} Recurring? ${BOLD}│${RESET} Status              ${BOLD}│${RESET}\n"
printf "${RED}│${RESET} Type mismatch ${RED}│${RESET}   5   ${RED}│${RESET} Yes (3rd)  ${RED}│${RESET} ${YELLOW}FIXABLE${RESET}             ${RED}│${RESET}\n"
printf "${GREEN}│${RESET} Import error  ${GREEN}│${RESET}   3   ${GREEN}│${RESET} No         ${GREEN}│${RESET} ${GREEN}FIXED${RESET}               ${GREEN}│${RESET}\n"
printf "${RED}│${RESET} Unsafe block  ${RED}│${RESET}   2   ${RED}│${RESET} Yes (2nd)  ${RED}│${RESET} ${RED}NEEDS_INVESTIGATION${RESET} ${RED}│${RESET}\n"
printf "${DIM}│${RESET} Timeout       ${DIM}│${RESET}   2   ${DIM}│${RESET} No         ${DIM}│${RESET} ${DIM}ACCEPTED${RESET}            ${DIM}│${RESET}\n"
sleep 0.4

echo ""

# Recommendations
printf "${MAGENTA}${BOLD}RECOMMENDATIONS${RESET}\n"
printf "  ${YELLOW}1.${RESET} ${BOLD}[FIXABLE]${RESET} Add explicit type annotations for return values\n"
printf "  ${RED}2.${RESET} ${BOLD}[INVESTIGATE]${RESET} Unsafe blocks in parser module need manual review\n"
sleep 0.3

echo ""

# Footer
printf "${GREEN}✅ Memory updated: 2 findings persisted, run #4 added to history${RESET}\n"
echo ""

sleep 1
