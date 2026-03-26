# Architect - Multidisciplinary Idea & Project Evaluator

## Overview
Architect is a multidisciplinary evaluation system that assesses ideas and existing projects from multiple angles — commercial, educational, social, technical, risk, resource, and innovation perspectives. It uses parallel specialist agents that evaluate independently, then synthesizes their outputs into a unified assessment with scores, recommendations, and actionable next steps.

## Data Locations (absolute paths)
- **Context**: `./data/context.md` - Evaluator preferences and skills
- **Tracking**: `./data/tracking/<domain>.md` (market, technical, risk, impact, resources, innovation)
- **Journal**: `./data/journal/` - Session logs (YYYY-MM-DD-architect-<slug>.md)
- **Frameworks**: `./references/frameworks.md`
- **Scoring Rubrics**: `./references/scoring-rubrics.md`
- **Agents**: `./agents/` - Evaluator and synthesizer agent files
- **Commands**: `./commands/architect*.md` - Slash commands

## Dual Mode
- **New Idea mode**: Input is a description/concept. Evaluate from scratch.
- **Existing Project mode**: Input references a path/codebase. Scan project first, then evaluate both health AND strategic direction.

## Evaluator Roster
| Evaluator | Agent File | Auto-Include Rule |
|-----------|-----------|-------------------|
| Risk Assessor | evaluator-risk.md | Always included |
| Technical Architect | evaluator-technical.md | Auto for software ideas/projects |
| Market Analyst | evaluator-market.md | Auto for revenue-generating ideas |
| Impact Evaluator | evaluator-impact.md | Selected by relevance |
| Resource Strategist | evaluator-resources.md | Selected by relevance |
| Innovation Scout | evaluator-innovation.md | Selected by relevance |

## Session Protocol
1. Read context.md first
2. Detect mode (new idea vs existing project)
3. For existing projects: run Project Discovery (Explore agent)
4. Select and dispatch evaluators in parallel
5. Synthesize with synthesizer agent
6. Present results
7. Discuss and refine
8. Save journal + update tracking files

## Language
All evaluators respond in the same language the user writes in. Detected automatically.

## Key Artifacts
- **Value Matrix**: Commercial / Educational / Social scores table
- **Opportunity Score**: 1-10 overall with 6 sub-scores
- **Risk Assessment**: Go/No-Go recommendation
- **Architecture Proposal**: For software ideas/projects
- **Project Health Score**: For existing projects only
