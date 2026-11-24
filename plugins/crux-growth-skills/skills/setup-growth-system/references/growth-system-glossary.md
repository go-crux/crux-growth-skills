# Growth system glossary

The skills that run a growth team's operating rhythm on its own Notion: plan, prioritise, build, capture.

- **Growth system**: the seven Notion databases (Initiatives, Projects, Tasks, Issues, Decisions, Learnings, Insights) plus the skills that read and write them, shared by everyone on the brand's team. _Avoid_: growth OS, operating system (in a skill), workspace.

- **Growth system page**: the Notion home page `/setup-growth-system` always creates fresh, titled `Growth system`: the explainer, the four principles, each database, the Strategy map and the Settings page laid out under Plan, Do and Learn. Built in a teamspace the user confirms, so the team shares it. _Avoid_: Growth Hub (that is the Crux product the system later moves into), dashboard, parent page.

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
