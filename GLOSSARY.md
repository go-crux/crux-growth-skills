# GLOSSARY: crux-growth-skills

Crux growth skills: free skills any brand installs in its own Claude that carry Crux craft, best run over its own Growth Brain. The brain ships mechanism, the plugin ships craft (mcp_brain ADR-0026).

> How to use: read this before planning or building in this project. A skill's own terms live inside that skill, at `plugins/crux-growth-skills/skills/<name>/references/glossary.md`, because the skill is all a client's agent reliably reads; this file holds only the terms shared across skills, and points at each skill's glossary. Definitions stay tight, one or two sentences, opinionated. No dates, PRD numbers or rollout status; point to the ADR instead. Budget: 80 words an entry, 400 lines a file.

## Shared terms

- **Lever**: one term that, with the others in its tree, rebuilds a KPI exactly; a volume (visits, new customers, spend) or an efficiency (conversion, order value, margin %). The growth equation's three are levers: new customers, returning customer orders and order value. Every skill says lever. _Avoid_: pillar (the docs site and the analysis framework pages still use it), factor, component.

- **Recommendation**: one specific change a skill proposes on its evidence: the lever it moves, its size in £ or KPI terms, the evidence, a confidence, and the metric to watch. In an action skill it also carries a Mode and goes through the Hand-off. _Avoid_: action, suggestion, next step, insight.

- **Action skill**: a skill whose run ends in Recommendations specific enough to make in a platform, closed by the Hand-off (audit-ads, optimise-budget, audit-retention, plan-stock). It recommends and never makes the change itself. _Avoid_: execution skill, agentic skill.

- **Hand-off**: the close of an action skill: it asks what the user wants to do with the Recommendations, implement now, save them to the Handover file, or leave them. Implementing is the user's own session with whatever connector they hold; the skill gives no platform steps. _Avoid_: execution, push, apply step.

- **Next run**: the close after the Hand-off: when to run the skill again, scaled to the brand's data volume, and the prompt to paste into that session. Where a calendar connector is in the session it offers to add the date as an event carrying the prompt. _Avoid_: cadence reminder, schedule.

- **Mode**: how a Recommendation should go live. Switch (make it and watch the metric; always for new ads and formats), Split test (the platform's own A/B tool, for strategic paid changes, flow and campaign changes and landing pages, only where traffic reads a result) or Holdout (geo or brand-off, to measure incrementality). _Avoid_: test type, rollout.

- **Handover file**: the markdown file the Hand-off gives the user holding every Recommendation they saved, self-contained enough to act on in a later session. The skill never reads it back. _Avoid_: plan, action log, backlog.

## Skill glossaries

- `audit-ads`: [`audit-ads/references/glossary.md`](plugins/crux-growth-skills/skills/audit-ads/references/glossary.md) (CAC, Account blend, Peak CAC, Eligibility floors, Ramping, Low efficiency, Improving, Fatigued, Fatiguing, Winner, Healthy, Pause, Refresh, Iterate, Keep, Minimum live ads, Reported ad, Source, Brain line, Judged spend share).
- `plan-black-friday`: [`plan-black-friday/references/glossary.md`](plugins/crux-growth-skills/skills/plan-black-friday/references/glossary.md) (the windows, Lift, Target test, Last-year level, Lever gap, Scenario, Daily phasing, Discount ceiling, Source, Brain line, Black Friday plan).
- `audit-landing-pages`: [`audit-landing-pages/references/glossary.md`](plugins/crux-growth-skills/skills/audit-landing-pages/references/glossary.md) (Find, Audit, Brand guardrails, Page type, Benchmark, Revenue at stake, Orders at stake, Underperforming page, Non-sale page, Leaking step, Page inventory).
- `diagnose-performance`: [`diagnose-performance/references/glossary.md`](plugins/crux-growth-skills/skills/diagnose-performance/references/glossary.md) (Success KPI, Current period, Comparison period, Period timezone, Good direction, Lever, Lever tree, Source, Contribution, Main driver, Also large, Offset, Drill-down, Cause, Recommendation, Check-first, Brain line, Performance diagnosis).
- `review-month`: [`review-month/references/glossary.md`](plugins/crux-growth-skills/skills/review-month/references/glossary.md) (Monthly performance review, Section, Action title, Brain slot, Brain line, Share toggle, Current period, Comparison period, Source, Month context, Focus question, Recommendation, Next month, Last month's actions, Unattended run, Margin rung, Discount rate, Discount depth, New customer, CAC, Active customer, Lapsed customer, LTV, Unknown row).
