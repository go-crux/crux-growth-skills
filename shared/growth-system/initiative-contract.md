# The initiative contract

What an Initiative's page body holds, so every Project under it inherits one plan and none rediscovers it. Terms are in `growth-system-glossary.md`; the row's properties are those of Initiatives in `notion-schema.md`.

## What the page is for

An Initiative is a workstream serving one Objective, with one owner and one Key result, spanning several Projects. Its row holds the fields (`Key result`, `Target`, `Target unit`, `Target date`, `Quarter`, `Why`, `Owned by`, `Status`, `Objective`). Its **page body holds the plan the Projects inherit**: the shape of the work, its sequence, and the context every Project under it would otherwise rediscover.

- **The primary reader is whoever scopes the Projects**, a person or a skill. Write for them: concrete, sourced, with numbers and object names transcribed rather than summarised.
- **A short overview sits on top for people**, so somebody opening the page cold gets it in one read.
- **The page is a snapshot, not a status page.** Status lives on the row. Do not copy a Project's status or owner onto the page: it goes stale within a week and nothing owns the update. The page changes when the plan changes.
- **The page never restates the row.** The row's fields show above the body. The body says what the properties cannot: what counts as done, how the target is read, and why the work is shaped the way it is.

## The six sections

Each is a second-level heading on the page body, written as an explicit `heading_2` block (a markdown write can silently drop headings), with the heading text exactly as written here and in this order. A skill matches on the heading text, so a reworded or reordered heading is a missing section. **Every heading is always present.** A section with nothing to say reads `None`, with the reason where it is not obvious, so a reader can tell empty from never written.

1. **`Overview`**: a callout block of three to five lines for people: what the Initiative does, by when, who owns it, and where it stood on the date written (dated). The one place a status word may appear, because it is dated.
2. **`Outcome`**: what counts as done, in terms the Key result can be counted against (what makes a flow "live", a customer "onboarded"); how and when the target is read; what steady state looks like after. No number that sits on the row.
3. **`Plan`**: the Projects in sequence. A table block with the columns **#, Project, Job, KPI, Link**, one row per Project, each linking its `PRJ-n`. No status column and no owner column. Foundations or enabling work that the target does not count gets its own row, marked as such. Then one line per phase saying what it covers, what gates it, and its date where one is agreed. A Plan row whose Project is not filed yet reads `Not filed` in Link (see "A Plan row with no Project"). An Initiative with no planned Project has the table's header row and one line under it: `None: no Project is planned yet.`
4. **`Constraints`**: the Active Decisions and Learnings from the context load that bind every Project under the Initiative, one line each on what it means here, each cited by `ID` and title; plus the decisions made for this Initiative, each logged as a Decision through the capture skills. A row that binds a single Project belongs on that Project's `Why`, not here.
5. **`Open questions`**: questions above any one Project, each with an owner and what it gates. A question about one Project goes on that Project.
6. **`Sources`**: the Objective, plan documents, transcripts, boards and documents the page was drafted from, so the next re-plan starts from the same evidence.

## The level test

For every line: **would a second Project under this Initiative need it?** If yes, it belongs here. If only one Project needs it, it belongs on that Project.

| Belongs on the Initiative | Belongs on the Project |
|---|---|
| which Projects exist, their order and what gates each | a Project's splits, timings, copy and Tasks |
| Decisions and constraints that bind every Project | the Decisions, Learnings and Insights only one Project uses |
| questions that block a phase or several Projects | questions that block one Project's Tasks |

## A Plan row with no Project

A row in the `Plan` table with no Project is invisible on the board. It reads `Not filed` in Link, and the run lists it as a candidate stub Project at `Idea`, related to this Initiative, for `/to-projects` to file. The Initiative skill never files it.

## Writing the body

- **A blank body** is written whole on the user's yes.
- **A body with anything on it** is proposed section by section and changes on the user's confirmation only. Every fact already there is kept in its nearest section, never dropped, and leftover prose that fits no section stays below `Sources` until the user says to remove it.
- **Read the page back** after writing and check all six headings are present, verbatim and in order.
