#!/bin/bash

BOLD='\033[1m'
DIM='\033[2m'
CYAN='\033[36m'
GREEN='\033[32m'
YELLOW='\033[33m'
RED='\033[31m'
MAGENTA='\033[35m'
WHITE='\033[37m'
RESET='\033[0m'

echo ""
echo -e "${BOLD}${CYAN}  Hackathon Jury Simulator${RESET}"
echo -e "${DIM}  ORE at Colosseum Renaissance (8,300 participants, 1,071 submissions)${RESET}"
echo ""
sleep 0.3

echo -e "${DIM}  Analyzing project (812 stars, PoW mining on Solana)...${RESET}"
sleep 0.3
echo -e "${DIM}  Researching judges from Colosseum Renaissance...${RESET}"
sleep 0.3
echo -e "${DIM}  Found 5 jury members. Dispatching evaluations...${RESET}"
sleep 0.4
echo -e "${DIM}  Running synthesis and deliberation...${RESET}"
sleep 0.4

echo ""
echo -e "${BOLD}${GREEN}  VERDICT: 8.6/10 — Grand Prize Winner${RESET}"
echo ""
sleep 0.3

echo -e "${BOLD}${CYAN}  SCORECARD${RESET}"
echo -e "  ${DIM}────────────────────────────────────────────────────────────────────────${RESET}"
printf "  ${BOLD}%-20s %6s %6s %6s %6s %6s %6s${RESET}\n" "Criterion (Weight)" "Matty" "Nate" "Mert" "Clay" "Chase" "Avg"
echo -e "  ${DIM}────────────────────────────────────────────────────────────────────────${RESET}"
sleep 0.2
printf "  %-20s ${GREEN}%6s %6s %6s %6s${RESET} ${YELLOW}%6s${RESET} ${GREEN}%6s${RESET}\n" "Innovation (25%)" "9" "9" "9" "9" "8" "8.8"
printf "  %-20s ${YELLOW}%6s${RESET} ${GREEN}%6s %6s${RESET} ${YELLOW}%6s${RESET} ${GREEN}%6s %6s${RESET}\n" "Technical (25%)" "7" "9" "9" "7" "8" "8.0"
printf "  %-20s ${YELLOW}%6s %6s %6s${RESET} ${GREEN}%6s${RESET} ${YELLOW}%6s %6s${RESET}\n" "UX/Design (15%)" "7" "7" "6" "8" "7" "7.0"
printf "  %-20s ${GREEN}%6s %6s %6s %6s %6s %6s${RESET}\n" "Impact (20%)" "10" "8" "8" "9" "10" "9.0"
printf "  %-20s ${GREEN}%6s${RESET} ${YELLOW}%6s${RESET} ${GREEN}%6s %6s %6s %6s${RESET}\n" "Presentation (15%)" "9" "7" "8" "9" "8" "8.2"
echo -e "  ${DIM}────────────────────────────────────────────────────────────────────────${RESET}"
printf "  ${BOLD}%-20s ${GREEN}%6s %6s %6s %6s %6s %6s${RESET}\n" "Weighted Total" "8.55" "8.20" "8.25" "8.50" "8.40" "8.6"
echo ""
sleep 0.3

echo -e "${BOLD}${CYAN}  JUROR HIGHLIGHTS${RESET}"
echo ""
echo -e "  ${MAGENTA}Mert Mumtaz${RESET} ${DIM}(Helius CEO):${RESET}"
echo -e "  \"This program single-handedly stress-tested Solana's scheduler"
echo -e "   and exposed priority-fee dynamics. Infrastructure contribution"
echo -e "   through adversarial load.\""
echo ""
sleep 0.2
echo -e "  ${MAGENTA}Clay Robbins${RESET} ${DIM}(ex-Slow Ventures):${RESET}"
echo -e "  \"Three signals VCs love: protocol-level primitive, proven usage"
echo -e "   before fundraise, and an ecosystem that self-assembled.\""
echo ""
sleep 0.2
echo -e "  ${MAGENTA}Chase Barker${RESET} ${DIM}(Solana Foundation):${RESET}"
echo -e "  \"ORE spawned an entire sub-ecosystem: pools, CLIs, boost"
echo -e "   protocols, the steel framework. That is ecosystem contribution.\""
echo ""
sleep 0.3

echo -e "${BOLD}${CYAN}  PITCH COACHING${RESET}"
echo -e "  ${GREEN}1.${RESET} Lead with \"We accidentally became the highest-traffic program on Solana.\""
echo -e "  ${GREEN}2.${RESET} Demo ${BOLD}ore mine${RESET} live — 60 seconds of working software beats any slide deck."
echo ""
