# The context load

The opening step of every growth-system planning skill: five reads of the Growth system, made before the skill proposes anything, so the proposal starts from what the team has already decided, learned, heard and left open. Terms are in `growth-system-glossary.md`.

It addresses the databases only through "Finding the system" in `notion-schema.md`: run that lookup first and use the data sources it returns. Every read is a query with a filter, never a saved view.

## When it runs

- **Once, at the start of the run, before the first proposal.** Do not repeat it between proposals; a skill that has already loaded the context carries it forward.
- **It never writes.** A context load creates, updates and deletes nothing.

## The subject

The **subject** is the work in hand: the lever it pulls, the channel it runs in, and the Initiative it serves. Take the subject from the user's request and from the Initiative or Project they point at; where a skill has no Initiative yet, the lever and channel alone are the subject.

A row is **on the subject** when it shares the work's:

1. **Lever**: the row's `Lever` equals the work's (New customers, Returning customer orders or Order value), or its text is plainly about the same lever.
2. **Channel**: the row names the same channel (paid social, email, search, on-site and so on) in its title, `Theme`, `Detail` or `Context`.
3. **Initiative**: the row hangs from the same Initiative, or from a Project or Task under it.

One match is enough to open a row. Where nothing matches, say so; do not stretch a match to fill the read.

## The five reads

Each read has two passes.

- **Pass 1, the index.** Query with the filter below and ask for the title, the row's `ID` and its `Status` only. Cheap, and it shows everything the filter allows.
- **Pass 2, hydration.** Open, in full, only the rows from pass 1 that are on the subject (or, for read 1, every row). Opening everything is the failure the two passes exist to prevent.

| # | Read | Database | Pass 1 filter | Pass 2 opens |
|---|---|---|---|---|
| 1 | Active Decisions | Decisions | `Status` = Active | every row: a Decision binds the whole system, not one subject |
| 2 | Active Learnings on the subject | Learnings | `Status` = Active | the rows on the subject |
| 3 | Insights on the subject | Insights | none | the rows on the subject |
| 4 | Open Issues on the subject | Issues | `Status` is Open or Solving | the rows on the subject |
| 5 | The Initiative the work serves | Initiatives, then Projects | the Initiative the work names | the Initiative, and its Project where there is one |

For read 5, when the work names no Initiative, list the Initiatives with `Status` not Done, ask which the work serves, and open that one.

## The two obligations

1. **Name what you read.** Before the first proposal, tell the user, per read, what the index showed (how many rows, their titles) and what you opened. An empty read is stated, not skipped: "Active Decisions: none." "Insights: 14 in the index, 2 on the subject, both opened." A silent empty read looks like a read that never ran.
2. **Flag any breach.** Compare the proposal with every Active Decision. Where the proposal would breach one, say which Decision, quote its title, and put the conflict to the user before going on. The user may keep the Decision (change the proposal), or replace it (a new Decision that supersedes it, captured by the capture skills). Never work around a Decision quietly.

## Who runs what

| Skill | Reads |
|---|---|
| `strategy-map` | all five |
| `to-initiatives` | all five |
| `to-projects` | all five |
| `wrap-up` | all five |
| `to-tasks` | the Project only (read 5, its Project) |
| `do-task` | its Task, its Project, the rows the Project cites, and the full Active Decisions index (pass 1 of read 1, then every Active Decision it opens) |
| the capture skills and `add-issue` | none |

A skill's own `SKILL.md` names its row in this table in one line; the table is the single home of the assignment.
