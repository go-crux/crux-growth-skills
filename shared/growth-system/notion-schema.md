# The growth system's Notion schema, version 1

Everything a growth-system skill needs to address and write the Growth system: how to find it, the seven databases with every property, option, formula and relation, and the views people use. This file describes **Schema version** 1. Terms are in `growth-system-glossary.md`.

Every Notion action here is named by capability (search, create page, create database, create view, update page, query with a filter), never by tool name, because each harness names its Notion tools differently. Use whichever tool in the session does the capability.

## Finding the system

The one lookup every growth-system skill makes, on every run, before it reads or writes a database. It returns the IDs below or stops with a reason.

1. **Search** Notion for the exact title `Growth system settings`.
2. **None found:** stop. Say the user has no growth system yet and to run `/setup-growth-system`. Make no other Notion call.
3. **More than one found:** list them (title, parent page, last edited) and ask which is the team's. Accept a pasted link instead. Use the one chosen for the rest of the run.
4. **One found:** open it and parse its fenced block of `key: value` lines (see "The Settings page" below).
5. **Check the block.** If `schema_version` is lower than 1, or `setup_state` is `in_progress`, stop and say to re-run `/setup-growth-system`. Make no other Notion call.
6. **Return** the block's values. Address every database by its `<name>_data_source` for a query and by its `<name>_database` for a link; address a page by its page value.

The lookup is the only way to a database. A skill never stores an ID of its own, never searches for a database by its title, and never reads through a saved view's ID: it queries a data source with a **filter** (for example `Status = Active`), so a teammate editing a view cannot break a run.

## The Settings page

Titled exactly `Growth system settings`, a child of the Growth system page. It opens with the line "Maintained by `/setup-growth-system`. Do not edit." and its body is one fenced block:

```
schema_version: 1
setup_state: complete
growth_system_page: <page ID>
strategy_map_page: <page ID>
initiatives_database: <database ID>
initiatives_data_source: <data source ID>
projects_database: <database ID>
projects_data_source: <data source ID>
tasks_database: <database ID>
tasks_data_source: <data source ID>
issues_database: <database ID>
issues_data_source: <data source ID>
decisions_database: <database ID>
decisions_data_source: <data source ID>
learnings_database: <database ID>
learnings_data_source: <data source ID>
insights_database: <database ID>
insights_data_source: <data source ID>
```

- `setup_state` is `in_progress` while `/setup-growth-system` is building or repairing, and `complete` once it has finished.
- A `<name>_prefix` line (`initiatives_prefix`, `projects_prefix`, `tasks_prefix`, `issues_prefix`, `decisions_prefix`, `learnings_prefix`, `insights_prefix`) is present only for a database whose `ID` prefix is not the default below. Absent means the default.
- A skill never writes the Settings page. Only `/setup-growth-system` does.

## Rules for writing the system

- **Additive only.** A schema change adds databases, properties and options. It never renames or deletes: removing a select option blanks every row that held it.
- **People columns.** Every owner, assignee or capturer is a Notion **people** property. There is no named-person select and no roster.
- **Select options.** A select listed with "no starting options" starts empty and fills as rows are written. Reuse an existing option before adding a new one.
- **No sample rows.** Setup creates no rows in any database.
- **Icons.** Setup gives each database and page the icon shown here when it creates it, on a build or a repair alike. It never adds or changes the icon of one that already exists: an icon is the team's to change. A page takes its icon directly. A database does not: setting the icon on the database itself is accepted and does nothing. Set it on the database's block in its parent page, the Growth system page: in that page's markdown the block is a `<database ...>` tag, and the update adds the database's own icon from its table below to that tag (for Initiatives, `icon="🎯"`) and changes nothing else, never a rewrite of the page. Then fetch the page to check the block shows it. Never write a new `<database>` tag for a database that exists: Notion makes a linked view called "View of <name>" from it. Moving a database means copying its fetched tag unchanged (the same `url` and `data-source-url`) to its new place in a page rewrite; that moves the original block, tested live, and makes no linked view.
- **Prefixes.** Each database's `ID` property is a unique ID with the prefix shown. A prefix can belong to only one data source in a workspace; if it is taken, setup uses `GS-` plus it (for example `GS-TSK`) and records it as `<name>_prefix`.

## The databases

Notation: **Name** (type; options). `Status` options are grouped as Notion's status property groups them: to do, in progress, complete.

### Initiatives (`INI`)

Icon: 🎯

A workstream serving one Objective, with one Key result.

| Property | Type | Notes |
|---|---|---|
| `Initiative` | title | |
| `Objective` | select | no starting options; the Strategy map's Objectives |
| `Key result` | rich text | |
| `Target` | number | |
| `Target unit` | rich text | |
| `Target date` | date | |
| `Quarter` | select | no starting options; written as `2027 Q1` |
| `Why` | rich text | |
| `Owned by` | people | |
| `Status` | select | On track, At risk, Off track, Done |
| `Projects` | relation → Projects | dual, shown on Projects as `Initiative` |
| `Tasks` | relation → Tasks | dual, shown on Tasks as `Initiative` |

### Projects (`PRJ`)

Icon: 📁

The whole context of one piece of work, once, hanging from one Initiative. A Project is chosen against its Initiative on `Priority`, never scored.

| Property | Type | Notes |
|---|---|---|
| `Project` | title | |
| `Status` | status | to do: Idea, Prioritised · in progress: In progress · complete: Done, Archived |
| `Priority` | select | P1, P2, P3 |
| `Initiative` | relation → Initiatives | the dual of `Initiatives.Projects` |
| `Owned by` | people | |
| `Due` | date | |
| `Started on` | date | |
| `Done on` | date | |
| `Result` | rich text | |
| `Tasks` | relation → Tasks | dual, shown on Tasks as `Project` |

### Tasks (`TSK`)

Icon: ✅

The Kanban board. `Type` is Task or Experiment.

| Property | Type | Notes |
|---|---|---|
| `Task` | title | |
| `Type` | select | Task, Experiment |
| `Status` | status | to do: Idea, Not started · in progress: In progress, Blocked, To review · complete: Done, Archived |
| `Runs as` | select | Claude, Person |
| `Assigned to` | people | |
| `Project` | relation → Projects | the dual of `Projects.Tasks` |
| `Initiative` | relation → Initiatives | the dual of `Initiatives.Tasks`; set directly only on a Task with no Project |
| `Due` | date | |
| `Started on` | date | |
| `Done on` | date | |
| `Result` | rich text | |

Experiment-only properties, blank on a Task by design:

| Property | Type | Notes |
|---|---|---|
| `Hypothesis` | rich text | |
| `Test KPI` | rich text | |
| `Lever` | select | New customers, Returning customer orders, Order value |
| `Impact` | number | 1 to 5 |
| `Confidence` | number | 1 to 5 |
| `Ease` | number | 1 to 5 |
| `ICE` | formula | the average of `Impact`, `Confidence` and `Ease`; blank unless all three are set, because Notion reads an empty number as 0 |
| `Outcome` | select | Win, Loss, Inconclusive, Invalid |
| `Learnings` | relation → Learnings | dual, shown on Learnings as `Experiments` |

- Wins count Experiments only: write `Outcome` on a Task of `Type` Experiment, never on a Task of `Type` Task.
- A skill that moves a Task sets `Started on` when it goes to In progress and `Done on` when it goes to Done. A Task moved by hand keeps them blank, and cycle time counts only Tasks with both.

### Issues (`ISS`)

Icon: 🚩

An open problem nobody has the answer to yet. Solving one creates Tasks or a Decision; an Issue never becomes one.

| Property | Type | Notes |
|---|---|---|
| `Issue` | title | |
| `Status` | select | Open, Solving, Solved, Parked |
| `Owned by` | people | |
| `Impact` | number | 1 to 5 |
| `Urgency` | number | 1 to 5 |
| `Priority score` | formula | `Impact` × `Urgency`; blank unless both are set |
| `Priority` | formula | the band of `Priority score`: Critical 20 and over, High 12 to 19, Medium 6 to 11, Low 1 to 5, Unscored when it is blank |
| `Due` | date | |
| `Outcome` | select | Task, Decision, Learning |
| `Resolution` | rich text | |
| `Created` | created time | |

### Decisions (`DEC`)

Icon: ⚖️

A choice you comply with or breach, with what it rules out. A Decision is never edited into a different decision: a replacement supersedes it.

| Property | Type | Notes |
|---|---|---|
| `Decision` | title | stated as a choice you comply with or breach |
| `Status` | select | Proposed, Active, Superseded |
| `Context` | rich text | |
| `Consequences` | rich text | |
| `Supersedes` | relation → Decisions | self-relation, dual with `Superseded by` |
| `Superseded by` | relation → Decisions | the dual of `Supersedes` |
| `Learnings` | relation → Learnings | dual, shown on Learnings as `Decisions` |
| `Owned by` | people | |
| `Decided on` | date | |
| `Source` | select | Meeting, Issue, Project close-out, Ad hoc |

### Learnings (`LRN`)

Icon: 💡

Something we concluded and could be wrong about, rated on the evidence ladder.

| Property | Type | Notes |
|---|---|---|
| `Learning` | title | |
| `Evidence strength` | select | Proven, Validated, Directional, Anecdotal; the human's field, never set by a skill without the user's say |
| `Sources` | number | independent sources behind it |
| `Confidence` | formula | base by `Evidence strength` (Proven 95, Validated 75, Directional 50, Anecdotal 25) × (0.8 + 0.05 × the smaller of `Sources` and 4), capped at 100 |
| `Confidence band` | formula | of `Confidence`: High 85 and over, Medium 60 and over, Low 35 and over, otherwise Speculative |
| `Status` | select | Active, Under review, Superseded, Disproven |
| `Theme` | select | no starting options |
| `Lever` | select | New customers, Returning customer orders, Order value |
| `Detail` | rich text | |
| `Implication` | rich text | |
| `Source detail` | rich text | |
| `Date learned` | date | |
| `Last validated` | date | |
| `Captured by` | people | |
| `Insights` | relation → Insights | dual, shown on Insights as `Learnings` |
| `Decisions` | relation → Decisions | the dual of `Decisions.Learnings` |
| `Experiments` | relation → Tasks | the dual of `Tasks.Learnings` |

### Insights (`INS`)

Icon: 💬

Something customers say, banked verbatim: one row per recurring thing, never per response.

| Property | Type | Notes |
|---|---|---|
| `Insight` | title | the recurring thing customers say, in their words |
| `Quotes` | rich text | verbatim |
| `Theme` | select | no starting options |
| `Source count` | number | independent sources |
| `Sources` | rich text | |
| `Captured by` | people | |
| `Learnings` | relation → Learnings | the dual of `Learnings.Insights` |

## Relations

Each relation is a pair, one property on each side (a Decisions self-relation is a pair on one database). Setup creates the databases first and the relations as a second step.

| From | Property | To | Dual property |
|---|---|---|---|
| Initiatives | `Projects` | Projects | `Initiative` |
| Initiatives | `Tasks` | Tasks | `Initiative` |
| Projects | `Tasks` | Tasks | `Project` |
| Tasks | `Learnings` | Learnings | `Experiments` |
| Decisions | `Supersedes` | Decisions | `Superseded by` |
| Decisions | `Learnings` | Learnings | `Decisions` |
| Learnings | `Insights` | Insights | `Learnings` |

The hierarchy is Objective → Initiative → Project → Task. A Task hangs from a Project, from an Initiative directly, or from nothing (standing work).

## Views

Views are for people. A skill never reads or depends on one (see "Finding the system"). Setup creates them as tabs on each database.

**`ID` first.** Every table view setup creates, the table Notion makes with each new database included, shows `ID` as its first column, then the title, then the other properties in the order the database's table above gives them. Every board view shows `ID` first on its cards. Set it with a view update that names the shown properties in that order, for example `SHOW "ID", "Task", ...` on Tasks. A view that already exists keeps the columns the team gave it.

| Database | View | Type | Filter | Sort or group |
|---|---|---|---|---|
| Tasks | Board | board | `Status` is not Archived | group by `Status` |
| Tasks | Experiments | table | `Type` = Experiment | sort by `ICE`, descending |
| Projects | Board | board | none | group by `Status` |
| Initiatives | By objective | table | none | group by `Objective` |
| Decisions | Active | table | `Status` = Active | none |
| Learnings | Active | table | `Status` = Active | none |
| Issues | Open | table | `Status` is Open or Solving | sort by `Priority score`, descending |

## Pages

- **Growth system page**: titled `Growth system`, icon 🌱, created at the top level of a teamspace, so the whole team shares one system. Only teamspaces the user can add pages to count, where the connector shows which those are. The Change list offers one, and the user's yes can name another:
  1. Where exactly one counts, that one.
  2. Where several count, the workspace's default teamspace (the one every member joins), where the connector shows which that is.
  3. Otherwise, the first in the list.

  Where none counts, or the connector cannot create a page in a teamspace, the page is created private, at the top level of the user's own pages, never under another page. It holds the Settings page, the seven databases, the Strategy map and an explainer.
- **Strategy map**: a page under the Growth system page, titled `Strategy map`, icon 🧭, with empty headings for the quarter's Objectives and the reasoning behind them.
- **Settings page**: icon ⚙️; see "The Settings page".
