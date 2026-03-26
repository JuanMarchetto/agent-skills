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
echo -e "${BOLD}${CYAN}  Full Eval${RESET}"
echo -e "${DIM}  \"Leave FAANG to build dev tools startup?\"${RESET}"
echo ""
sleep 0.3

echo -e "${DIM}  Dispatching 14 agents (6 architect + 8 council) in parallel...${RESET}"
sleep 0.4
echo -e "${DIM}  Architect evaluators complete. Council advisors complete.${RESET}"
sleep 0.3
echo -e "${DIM}  Running meta-synthesis...${RESET}"
sleep 0.4

echo ""
echo -e "${BOLD}${CYAN}  ARCHITECT (Strategic): 7.2/10${RESET}"
echo -e "  ${DIM}──────────────────────────────────────────────────────────────────────${RESET}"
sleep 0.2
printf "  %-14s ${GREEN}%5s${RESET}  %-50s\n" "Commercial" "8/10" "Strong TAM -- dev tools market growing 18% YoY"
printf "  %-14s ${YELLOW}%5s${RESET}  %-50s\n" "Technical" "7/10" "OSS moat is real but requires 12-18mo to build"
printf "  %-14s ${YELLOW}%5s${RESET}  %-50s\n" "Risk" "5/10" "73% of dev tool startups fail pre-Series A"
printf "  %-14s ${GREEN}%5s${RESET}  %-50s\n" "Innovation" "8/10" "AI-native dev tools are a generational shift"
printf "  %-14s ${YELLOW}%5s${RESET}  %-50s\n" "Impact" "7/10" "High developer leverage -- 1 tool can reach millions"
printf "  %-14s ${YELLOW}%5s${RESET}  %-50s\n" "Resources" "6/10" "Solo founder needs \$150K+ runway"
echo ""
sleep 0.3

echo -e "${BOLD}${CYAN}  COUNCIL (Personal): 5.8/10${RESET}"
echo -e "  ${DIM}──────────────────────────────────────────────────────────────────────${RESET}"
sleep 0.2
printf "  %-14s ${RED}%5s${RESET}  %-50s\n" "Finance" "4/10" "\$320K TC to \$0 is a cliff; 8mo savings won't survive"
printf "  %-14s ${YELLOW}%5s${RESET}  %-50s\n" "Health" "5/10" "Founders report 2x burnout rate vs employees"
printf "  %-14s ${YELLOW}%5s${RESET}  %-50s\n" "Career" "7/10" "FAANG + founder story = strong either way"
printf "  %-14s ${YELLOW}%5s${RESET}  %-50s\n" "Relationships" "5/10" "Partner depends on dual income; needs alignment"
printf "  %-14s ${GREEN}%5s${RESET}  %-50s\n" "Learning" "9/10" "Massive growth across business, product, community"
printf "  %-14s ${RED}%5s${RESET}  %-50s\n" "Systems" "4/10" "No co-founder, no advisor network, no infrastructure"
printf "  %-14s ${GREEN}%5s${RESET}  %-50s\n" "Creative" "8/10" "Full ownership vs implementing someone else's roadmap"
printf "  %-14s ${YELLOW}%5s${RESET}  %-50s\n" "Life Coach" "6/10" "Motivation is high but plan is vague"
echo ""
sleep 0.3

echo -e "${BOLD}${YELLOW}  META-SYNTHESIS: CONDITIONAL GO (6.4/10)${RESET}"
echo ""
echo -e "  ${DIM}\"The market window is real and your skills are aligned, but your"
echo -e "   infrastructure isn't. A 'yes' to the destination and a 'not yet'"
echo -e "   to the departure date.\"${RESET}"
echo ""
sleep 0.2
echo -e "  ${GREEN}Synergy:${RESET}  Career upside + innovation timing -- even if the startup"
echo -e "           fails, the founder journey compounds long-term value."
echo -e "  ${RED}Conflict:${RESET} Strategic opportunity (8/10) vs financial runway (4/10) --"
echo -e "           the market says go now, your bank account says survive first."
echo ""
sleep 0.2
echo -e "  ${BOLD}Conditions:${RESET}"
echo -e "  ${GREEN}1.${RESET} Extend runway to 18 months (\$240K liquid) before resigning"
echo -e "  ${GREEN}2.${RESET} Ship v0.1 nights/weekends, validate with 500+ GitHub stars"
echo -e "  ${GREEN}3.${RESET} Secure 1 design partner (paying or committed) pre-launch"
echo -e "  ${GREEN}4.${RESET} Have the partner/family financial conversation -- get explicit buy-in"
echo ""
