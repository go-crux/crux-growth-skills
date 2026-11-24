# GLOSSARY: crux-growth-skills

Crux growth skills: free skills any brand installs in its own Claude that carry Crux craft, best run over its own Growth Brain. The brain ships mechanism, the plugin ships craft (mcp_brain ADR-0026).

> How to use: read this before planning or building in this project. A skill's own terms live inside that skill, at `plugins/crux-growth-skills/skills/<name>/references/glossary.md`, because the skill is all a client's agent reliably reads; this file holds only the terms shared across skills, and points at each skill's glossary. Definitions stay tight, one or two sentences, opinionated. No dates, PRD numbers or rollout status; point to the ADR instead. Budget: 80 words an entry, 400 lines a file.

## Shared terms

- **Lever**: one term that, with the others in its tree, rebuilds a KPI exactly; a volume (visits, new customers, spend) or an efficiency (conversion, order value, margin %). The growth equation's three are levers: new customers, returning customer orders and order value. Every skill says lever. _Avoid_: pillar (the docs site and the analysis framework pages still use it), factor, component.

- **Recommendation**: one specific change a skill proposes on its evidence: the lever it moves, its size in £ or KPI terms, the evidence, a confidence, and the metric to watch. In an action skill it also carries a Mode and goes through the Hand-off. _Avoid_: action, suggestion, next step, insight.

- **Action skill**: a skill whose run ends in Recommendations specific enough to make in a platform, closed by the Hand-off (audit-ads, optimise-budget, audit-retention, plan-stock). Its Hand-off can go straight on to making the changes, through a connector the session holds that can make changes in the platform. _Avoid_: execution skill, agentic skill.

- **Hand-off**: the close of an action skill: it asks what the user wants to do with the Recommendations, implement now, save them to the Handover file, or leave them. Implementing is done however the user and the agent decide: the agent makes the changes through a connector the session holds that can make changes in the platform, once the user confirms them, or the user makes them in the platform. _Avoid_: execution, push, apply step.

- **Next run**: the close of a run, after the Hand-off in an Action skill: when to run the skill again, scaled to the brand's data volume, and the prompt to paste into that session. Where a calendar connector is in the session it offers to add the date as an event carrying the prompt. _Avoid_: cadence reminder, schedule.

- **Mode**: how a Recommendation should go live. Switch (make it and watch the metric; always for new ads and formats), Split test (the platform's own A/B tool, for strategic paid changes, flow and campaign changes and landing pages, only where traffic reads a result) or Holdout (geo or brand-off, to measure incrementality). _Avoid_: test type, rollout.

- **Handover file**: the markdown file the Hand-off gives the user holding every Recommendation they saved, self-contained enough to act on in a later session or to pass to a teammate. The skill never reads it back. _Avoid_: plan, action log, backlog.

## Growth system

The skills that run a growth team's operating rhythm on its own Notion: plan, prioritise, build, capture. Their shared files (`context-load.md`, `notion-schema.md`, `principles.md`) have one canonical copy in `shared/growth-system/`, synced byte for byte into each growth-system skill's `references/`, because a skill reads nothing outside its own folder.

- **Growth system**: the seven Notion databases (Initiatives, Projects, Tasks, Issues, Decisions, Learnings, Insights) plus the skills that read and write them, shared by everyone on the brand's team. _Avoid_: growth OS, operating system (in a skill), workspace.

- **Growth system page**: the Notion home page `/setup-growth-system` always creates fresh, titled `Growth system`: the explainer, the four principles, each database, the Strategy map and the Settings page laid out under Plan, Do and Learn, and the Initiatives board. Built in a teamspace the user confirms, so the team shares it (ADR-0021). _Avoid_: Growth Hub (that is the Crux product the system later moves into), dashboard, parent page.

- **Settings page**: the child of the Growth system page titled exactly `Growth system settings`, maintained by `/setup-growth-system` and never edited by hand, holding every database ID and the `Schema version`. Every growth-system skill finds it by that title and addresses databases only through it, by filter, never by saved-view ID. _Avoid_: config, reference file, IDs file.

- **Objective**: one of the quarter's 1 to 3 outcomes, chosen on the Strategy map from the growth model's weakest steps; a select on Initiatives. _Avoid_: goal, OKR, priority.

- **Key result**: an Initiative's own measurable outcome, with `Target`, `Target unit` and `Target date`; 3 to 5 initiatives, each with one key result, serve an Objective. _Avoid_: goal, KPI, target (that is the number inside it).

- **Strategy map**: the page under the Growth system page holding the quarter's Objectives and the growth-model reasoning behind them. _Avoid_: plan, roadmap, OKR doc.

- **Schema version**: the number on the Settings page saying which schema the brand's databases carry. A skill that needs a newer one stops and says to re-run `/setup-growth-system`, which only ever adds. _Avoid_: migration, upgrade.

- **Initiative**: a workstream serving one Objective, carrying one Key result and an owner. Projects hang from it. _Avoid_: epic, theme, bucket.

- **Project**: a row on Projects carrying the whole context of one piece of work, once, so no task under it restates it; hangs from one Initiative. _Avoid_: card, epic.

- **Task**: a row on Tasks, the Kanban board: the action somebody, or Claude, actually does. `Type` is Task or Experiment; a Task hangs from a Project, from an Initiative directly, or from nothing (standing work). _Avoid_: card, ticket, to-do.

- **Experiment**: a Task of `Type` Experiment, the only kind carrying a hypothesis, an ICE score and an `Outcome`; wins count experiments only. _Avoid_: test card, idea.

- **Decision**: a choice you comply with or breach, with what it rules out. Never edited into another decision: a replacement supersedes it. _Avoid_: ruling, policy.

- **Learning**: something we concluded and could be wrong about, rated on the evidence ladder (Proven, Validated, Directional, Anecdotal). _Avoid_: insight (that is what customers say), finding.

- **Insight**: something customers say, banked verbatim, one row per recurring thing. _Avoid_: learning, quote log, interview.

- **Issue**: an open problem nobody has the answer to yet, ranked on Impact × Urgency. Solving one creates Tasks or a Decision; it never becomes one. _Avoid_: blocker, risk, ticket.

- **Context load**: the opening reads a planning skill makes before proposing anything: Active decisions, Active learnings, Insights and open Issues on the subject, and the Initiative served. It names what it read and flags any Decision the proposal would breach. _Avoid_: context pull, research step.

## Skill glossaries

- `audit-ads`: [`audit-ads/references/glossary.md`](plugins/crux-growth-skills/skills/audit-ads/references/glossary.md) (CAC, Account blend, Peak CAC, Eligibility floors, Ramping, Low efficiency, Improving, Fatigued, Fatiguing, Winner, Healthy, Pause, Refresh, Iterate, Keep, Minimum live ads, Awareness campaign, Lead campaign, Reported ad, Source, Brain line, Judged spend share, Unattended run).
- `plan-black-friday`: [`plan-black-friday/references/glossary.md`](plugins/crux-growth-skills/skills/plan-black-friday/references/glossary.md) (the windows, Lift, Target test, Last-year level, Lever gap, Scenario, Daily phasing, Discount ceiling, Source, Brain line, Black Friday plan).
- `audit-landing-pages`: [`audit-landing-pages/references/glossary.md`](plugins/crux-growth-skills/skills/audit-landing-pages/references/glossary.md) (Find, Audit, Brand guardrails, Page type, Benchmark, Revenue at stake, Orders at stake, Underperforming page, Non-sale page, Leaking step, Page inventory).
- `diagnose-performance`: [`diagnose-performance/references/glossary.md`](plugins/crux-growth-skills/skills/diagnose-performance/references/glossary.md) (Success KPI, Current period, Comparison period, Period timezone, Good direction, Lever, Lever tree, Source, Contribution, Main driver, Also large, Offset, Drill-down, Cause, Recommendation, Check-first, Brain line, Performance diagnosis).
- `plan-ad-volume`: [`plan-ad-volume/references/glossary.md`](plugins/crux-growth-skills/skills/plan-ad-volume/references/glossary.md) (Viable ad, Viable share, Viable share target, Viable ad stock, Launched ad, Survival curve, Recent fit, Viable lifespan, Hit rate, Days viable per hit, Healthy lifespan, Spend per viable ad, Days to clear Ramping, Self-check, Ad stock check, Lever, Lever best, Limiting factor, On the table, Worn out now, Wearing out, Current pipeline, Budget, Steady-state number, Roadmap, Catch-up, Stay-level launches, Gap launches, Growth launches, Expected to work, Ads to launch, Live-by, Format, Format split, Roadmap file, Awareness campaign, Lead campaign, Source, Unattended run, Brain line, Creative deep dive, How it's worked out, Page label, Spend bar, Viable spend per hit, Creative score, Evergreen ad, Evergreen share, Spend degradation, Viable after week 1, Top-5 concentration, Low-spend rate, Outlier, Outlier rate, Top-10 turnover, Expected outliers a month, Weakest point, What it's worth, Production budget, Name coverage, Next run).
- `review-month`: [`review-month/references/glossary.md`](plugins/crux-growth-skills/skills/review-month/references/glossary.md) (Monthly performance review, Section, Action title, Brain slot, Brain line, Share toggle, Current period, Comparison period, Source, Month context, Focus question, Recommendation, Next month, Last month's actions, Unattended run, Margin rung, Discount rate, Discount depth, New customer, CAC, Active customer, Lapsed customer, LTV, Unknown row).
