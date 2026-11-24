---
name: prioritise
description: Prioritise the team's Projects and Tasks in the growth system. Use when the user asks what to work on next, to prioritise or triage the board, or to check the work in flight against the WIP limits. Use when the user asks what is stale, stuck or blocked, or which Project or Task to pull next. Use when the user asks to move a Project to Prioritised or a Task into In progress and wants the whole board weighed first. Not for scoping a Project, which is /to-projects, or cutting Tasks, which is /to-tasks. Needs the growth system in Notion; a Growth Brain is not used.
---

# Prioritise the board

Leave the team with the Projects and Tasks boards read against the WIP limits, every stale or unexplained card named with what to do about it, and a ranked proposal of what to pull next. Nothing on the boards changes until the user says yes. The user sees only the chat and their Notion, never this skill or its references: say what was found and what will be written in plain words, and never name a file, a key or a tool.

This skill runs the `prioritise` row of the Who runs what table in `references/context-load.md`: none, it reads the boards. It runs without a Growth Brain (ADR-0001) and uses none. The terms Project, Task, Initiative, Experiment, Ready, WIP limit and Settings page are those of `references/growth-system-glossary.md`; In flight, Room, Stale card, Unexplained block, Stranded Task, Candidate, Pull, Rank, Over-limit move and Proposal are those of `references/glossary.md`. Use them as written. `references/notion-schema.md` is the one home of every property and of "Finding the system"; `references/wip-limits.md` fixes the two limits, the count before a move and the dates on a move; `references/project-contract.md` fixes the lifecycle; `references/prioritise-layout.md` fixes what steps 3 to 7 show. Every Notion action here is a capability (search, fetch a page, query with a filter, update a page): use whichever tool in the session does it, and read every database by a filter, never through a saved view.

This skill is advisory (ADR-0023). It proposes moves and never refuses one; it writes a card's `Status` and the dates a move sets, and nothing else: no page body, no scope, no assignee.

## 1. Find the system

Serves the principle Stay agile: every run starts from the system as it is now.

Check that the session can search Notion. Without it, stop and say, in plain words, that this runs on the team's own Notion: add the Notion connector in the app's connector settings, give it access to the workspace, then ask again. Then run "Finding the system" in `references/notion-schema.md`. Stop with its message where it stops: no system, or a `schema_version` below 2, or a setup in progress, each sending the user to `/setup-growth-system`. Make no other Notion call before it has passed. Note today's date.

**Done when** the lookup has returned the data sources of Initiatives, Projects and Tasks, or the message says why the run stops. Nothing has been written.

## 2. Read the boards

Serves the principle Stay agile: the board is read as it stands, so the limits are counted on live cards.

Query, each with a filter and to the end of its pages:

- **Projects** with `Status` not `Done` and not `Archived`.
- **Tasks** with `Status` not `Done` and not `Archived`.
- **Initiatives** with `Status` not `Done`.

Ask for the title, `ID`, `Status`, last edited time and the properties the later steps use (`Priority`, `Initiative`, `Project`, `Due`, `Owned by`, `Assigned to`, `Runs as`, `Type`, `ICE`). Relate each Task to its Project and each Project to its Initiative by `ID`; where a Task's Project is not in the read (it is `Done` or `Archived`), fetch that Project for its `Status`. Fetch the page of every Task at `Blocked` and read its `Blocked by` section.

Tell the user in one line what was read: how many Projects, Tasks and Initiatives.

**Done when** every page of every query has been read, every Task has its Project's `Status` where it has a Project, every Task at `Blocked` has its `Blocked by` read, and the line of counts is sent.

## 3. Report the work in flight

Serves the principle Stay agile: the limits keep started and unfinished work visible.

Count against `references/wip-limits.md`: Projects at `Prioritised` or `In progress` against 4, and Tasks at `In progress` against 4 for each person by `Assigned to`, a `Runs as` Claude Task counting against its assignee. Show the table in `references/prioritise-layout.md`, with the cards in flight under every limit that is at 4 or over.

**Done when** every limit has its count and its state (Room for n, At the limit, or Over by n), every person with a Task at `In progress` has a row, and every card is listed under each limit that is at or over it.

## 4. Flag what needs a person

Serves the principle Stay agile: work that has stopped moving is named while it can still be moved.

Flag three kinds, each as its own list in `references/prioritise-layout.md`:

1. **Stale cards**: Projects and Tasks at `In progress` whose last edited time is 14 days or more before today.
2. **Unexplained blocks**: Tasks at `Blocked` whose `Blocked by` names no Open question and no Task.
3. **Stranded Tasks**: Ready Tasks whose Project is not at `Prioritised` or `In progress`.

Each flagged card carries the one action the layout gives for its kind.

**Done when** all three lists are shown, an empty one as `None`, and every flagged card has its action.

## 5. Rank what to pull next

Serves the principle Seek impact: effort goes first to the Initiatives in trouble and the work the team has already marked most important.

Take the Candidates: Projects at `Idea`, and Ready Tasks whose Project is at `Prioritised` or `In progress` or who have no Project. Read the `Blocked by` of each Ready Task that would rank in the first ten; one whose `Blocked by` names an open Task (not `Done` or `Archived`) or an open question is passed over, said so under the table, and the next Task takes its place.

Rank each board's Candidates by these rules, each deciding only what the rule above leaves tied:

1. The Initiative the card serves, through its Project or directly, at `At risk` or `Off track` before any other `Status`, and before a card with no Initiative.
2. The Project's `Priority`: `P1`, then `P2`, then `P3`, then none. A Task takes its Project's.
3. `ICE`, highest first, on Experiments; a card with no `ICE` after one with.
4. `Due`, soonest first; a card with no `Due` last.

Cards still tied keep the order the board returned them in. Show the two tables in `references/prioritise-layout.md`.

**Done when** every Candidate is ranked, every row of a table states the rule that placed it, every passed-over Task is named with its blocker, and the count of rows not shown is stated.

## 6. Propose the moves and write on a yes

Serves the principles Seek impact and Stay agile: the user sees every move and every limit it touches before anything changes.

Build the Proposal as one table in `references/prioritise-layout.md`, in this order:

1. A move for each Stranded Task, as the flag's action: the Task back to `Idea`, unless item 2 below pulls its Project to `Prioritised`, which ends the strand.
2. Pulls from step 5, in rank order, for each limit as far as Room allows. A Task pulled into `In progress` whose Project is at `Prioritised` brings the Project's move to `In progress` with it. Where a limit has no Room, propose its top-ranked Candidate once, named as an Over-limit move; propose no other card to make way for it.

Count each row by `references/wip-limits.md`, together with every row above it. Show the count after each row, the cards already in flight under each Over-limit move, and the dates each row will write. Then ask once: "Write these n moves?", adding "including the n past a limit?" where any row is over one.

Wait for the user's answer. "Yes" writes every row; "just write it" is the same. The user may name rows to leave out, change a row's target `Status`, or add a move: a move added or changed is counted again, with the rows around it, and an Over-limit move that was not shown as one waits for a yes of its own. On "no", or no answer, write nothing and say so.

Write each agreed row, in order: update the card's `Status`, and `Started on` to today on a move into `In progress` or `Done on` to today on a move into `Done`, as `references/wip-limits.md` sets out. Write no other property. Read each card back.

**Done when** every row is recorded as written, left out or not written; every written card reads back at the agreed `Status` with the dates its move sets; no card was written without the user's yes; and no property other than `Status`, `Started on` and `Done on` was changed.

## 7. Report

Serves the principles Seek impact and Stay agile: what moved, what is waiting and what to do next is in the chat.

Tell the user, in the chat, as `references/prioritise-layout.md` sets out: each move written, each not written and why, the flags still open, and the work in flight after the writes. Then the next move.

**Done when** nothing proposed and unwritten, no open flag and no limit still at or over its count is missing from the message, and it names the next move.
