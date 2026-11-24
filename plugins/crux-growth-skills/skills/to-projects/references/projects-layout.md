# Projects layout

What steps 3, 6 and 7 write and show, so two Projects and two brands read the same. The page body is fixed by `project-contract.md`. Terms are in `growth-system-glossary.md` and `glossary.md`. Properties are those of Projects in `notion-schema.md`.

## A Projects row

| Property | Existing Project | Loose idea (new) | From a Split |
|---|---|---|---|
| `Project` | unchanged unless the user renames it | the outcome in a short phrase, such as "Win-back email flow for lapsed buyers" | named after the outcome, as agreed in step 3 |
| `Initiative` | set if blank, from the Initiative the work serves | the Initiative it serves, never the nearest plausible row; left blank and reported where none fits | the Initiative from step 3's placement |
| `Status` | unchanged unless the user asks | `Idea` unless the user asks for `Prioritised` | as agreed in step 3 |
| `Due` | as agreed in step 4, else unchanged | blank unless the Initiative's `Plan` places it and the user agrees | as agreed in step 3 |
| `Owned by` | unchanged | a person who is a member of the Notion workspace, as the user says; blank otherwise. A name that matches nobody is reported and left blank | as the user says, else blank |
| `Priority` | unchanged | `P1`, `P2` or `P3` only when the user gives one | as the user says, else blank |

`Status` is `Idea` or `Prioritised` here; a Project becomes `In progress` when its first Task starts. A `Prioritised` write follows the check in `wip-limits.md` first. This skill never writes `Tasks`, `Started on`, `Done on` or `Result`, and never creates a select option to fit a value.

## The split table (step 3)

One table, one row per proposed Project, in the recommended sequence:

| Column | Holds |
|---|---|
| Project | named after the outcome |
| Outcome | its one KPI, target and date |
| Surfaces | the Surfaces it touches |
| Depends on | the Projects in this table, or already on the board, that must deliver first |
| Open questions | the source's Open questions that land on it |
| Existing Project | the live Project it becomes, keeping its `ID`, or `New` |

Under the table: the sequence with its reason, and any Open question named Initiative-level with the reason. **Every Open question in the source lands on exactly one Project**, or is named Initiative-level.

For each Project agreed, ask one question for status and `Due` together, with a recommendation per Project and each date's derivation. Recommend `Prioritised` for a Project the user commits to working next that depends on nothing unfinished, and `Idea` for the rest. Any status the user names is written, with the WIP warning where `Prioritised` would pass a limit.

## A stub Project's body

All ten sections, grounded from the source and the context load:

- Facts are transcribed, not summarised: numbers, object names and wording as the source has them.
- `Why` names the Initiative, the source by title and link as provenance, each dependency by its `ID`, and the Decisions, Learnings and Insights that bear on it.
- `Decisions` carries each decision the source records, with its date and who made it.
- `Open questions` carries each question that landed on this Project, with owner, date and the work it blocks.
- A section the source and the reads leave empty reads `None`.

## The report (step 7)

For a Project written or rewritten: its `ID` and link, whether it was created or rewritten, its `Status`, `Due` and Initiative, and the Open questions with owner, date and blocked work. Then each Decision to log through the capture skills, the risks, and the next move.

After a Split, one table in sequence order: `ID`, Project, `Status`, `Due`, depends on, and the count of Open questions, with the fully scoped Project marked.

Risks to name: a `Due` later than the Initiative's `Target date`, a `Due` left blank and why, an Initiative with no `Target date`, an owner who matched nobody, and any proposal the user left waiting.
