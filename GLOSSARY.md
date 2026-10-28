# GLOSSARY: crux-growth-skills

Crux growth skills: free skills any brand installs in its own Claude that carry Crux craft, best run over its own Growth Brain. The brain ships mechanism, the plugin ships craft (mcp_brain ADR-0026).

> How to use: read this before planning or building in this project. A skill's own terms live inside that skill, at `plugins/crux-growth-skills/skills/<name>/references/glossary.md`, because the skill is all a client's agent reliably reads; this file holds only the terms shared across skills, and points at each skill's glossary. Definitions stay tight, one or two sentences, opinionated. No dates, PRD numbers or rollout status; point to the ADR instead. Budget: 80 words an entry, 400 lines a file.

## Shared terms

- **Lever**: one term that, with the others in its tree, rebuilds a KPI exactly; a volume (visits, new customers, spend) or an efficiency (conversion, order value, margin %). The growth equation's three are levers: new customers, returning customer orders and order value. Every skill says lever. _Avoid_: pillar (the docs site and the analysis framework pages still use it), factor, component.

## Skill glossaries

- `plan-black-friday`: [`plan-black-friday/references/glossary.md`](plugins/crux-growth-skills/skills/plan-black-friday/references/glossary.md) (the windows, Lift, Target test, Last-year level, Lever gap, Scenario, Daily phasing, Discount ceiling, Source, Brain line, Black Friday plan).
- `audit-landing-pages`: [`audit-landing-pages/references/glossary.md`](plugins/crux-growth-skills/skills/audit-landing-pages/references/glossary.md) (Find, Audit, Brand guardrails, Page type, Benchmark, Revenue at stake, Orders at stake, Underperforming page, Non-sale page, Leaking step).
- `diagnose-performance`: [`diagnose-performance/references/glossary.md`](plugins/crux-growth-skills/skills/diagnose-performance/references/glossary.md) (Success KPI, Current period, Comparison period, Period timezone, Good direction, Lever, Lever tree, Source, Contribution, Main driver, Also large, Offset, Drill-down, Cause, Recommendation, Check-first, Brain line, Performance diagnosis).
