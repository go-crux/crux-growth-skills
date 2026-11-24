# Prioritise layout

What steps 3 to 7 show, so two runs and two teams read the same. The limits and the dates on a move are fixed by `wip-limits.md`, the lifecycle by `project-contract.md`. Terms are in `growth-system-glossary.md` and `glossary.md`. Properties are those of Initiatives, Projects and Tasks in `notion-schema.md`.

## The WIP report (step 3)

One table, one row per limit, then the cards.

| Column | Holds |
|---|---|
| Limit | `Projects at Prioritised or In progress`, or `Tasks In progress` with the person's name, one row per person who has a Task there |
| In flight | the count |
| At most | 4 |
| State | `Room for n`, `At the limit`, or `Over by n` |

Under it, the cards in flight for each row that is At the limit or Over: `ID`, title, `Status`, and for a Task who it is assigned to and `Runs as`. A Task with no `Assigned to` is listed once, under `Unassigned`, and counts against nobody. A row with room lists no cards.

## The flags (step 4)

Three lists, always all three, each headed with its count. A list with nothing in it reads `None`.

| List | Row holds |
|---|---|
| In progress and not touched for 14 days or more | `ID`, title, who owns it (`Owned by` or `Assigned to`), days since the last edit, the action |
| Blocked with no blocker named | `ID`, title, `Assigned to`, the action |
| Ready under a Project that is not Prioritised or In progress | `ID`, title, the Project (`ID`, title, `Status`), the action |

Actions, one per row, in the user's terms:

- **Stale:** ask the owner whether it is still moving; where it is not, it goes to `Blocked` with a named blocker, to `To review` if it is built, or back to `Not started`.
- **Unexplained block:** name the Open question or Task it waits on under `Blocked by`, or move it out of `Blocked`.
- **Stranded Task:** Prioritise the Project, or send the Task back to `Idea`.

## The ranked candidates (step 5)

Two tables, because the limits differ: Projects to Prioritise, then Tasks to pull. Ten rows each at most; the rest are counted under the table ("6 more, ranked lower").

| Column | Holds |
|---|---|
| # | the rank |
| Card | `ID` and title; a Task also shows its Project |
| Initiative | its title and `Status`, or `None` |
| Priority | the Project's `Priority`, or blank |
| ICE | the Experiment's `ICE`, or blank |
| Due | the date, or blank |
| Why here | the first rule that put it above the next card, in a few words (`Initiative Off track`, `P1 over P2`, `ICE 4.0 over 3.3`, `Due 3 Dec before 10 Dec`, `tie, board order`) |

Under the Tasks table: each Ready Task passed over because its `Blocked by` names an open Task or an open question, with the blocker.

## The proposal (step 6)

One table, one row per move, in the order the moves would be made. The `WIP after` column counts every earlier row of the table as well as the cards already in flight.

| Column | Holds |
|---|---|
| # | the row number the user can answer by |
| Card | `ID` and title |
| From | the `Status` now |
| To | the `Status` after |
| Reason | the rule from step 4 or the rank from step 5 that put it here |
| WIP after | `Projects 3 of 4`, or `<person> 2 of 4`, or `no limit` (a move that touches neither count, such as into `Not started` or `Idea`), or `<person> 5 of 4, over the limit`, or `unassigned, counts for nobody` |

A row past a limit starts with `Over the limit:` in its Reason. Under the table, for each over-limit row, in this message, the count the move makes against the limit and the cards already there (`ID`, title, `Status`; for Tasks who they are assigned to). Then the one question, "Write these n moves?" worded so "yes" accepts it, and where any row is over a limit, "including the n past a limit?".

Move rows, by what the user can pull:

| Pull | From | To | Dates written |
|---|---|---|---|
| a Project | `Idea` | `Prioritised` | none |
| a Task | `Not started` | `In progress` | `Started on` today |
| the Project of that Task, when it is at `Prioritised` | `Prioritised` | `In progress` | `Started on` today |
| a Stranded Task | `Not started` | `Idea` | none |
| an `Idea` Task the user asks to ready | `Idea` | `Not started` | none |

A move the user adds writes the dates in `wip-limits.md`: `Started on` into `In progress`, `Done on` into `Done`.

## The report (step 7)

- Each move written, by `ID`, from and to, with the dates set, read back.
- Each proposed move not written, and why (left out, declined, or no answer).
- The flags still open, by `ID`, with the action each is waiting on.
- The WIP state after the writes, in the shape of the WIP report, with its counts.
- The next move: `/to-projects` for each Project just Prioritised whose page does not yet carry the ten headings, `/to-tasks` for a Project with no Tasks. `/do-task` is coming; until it is installed, the first unblocked Ready Task is the one to start by hand.
