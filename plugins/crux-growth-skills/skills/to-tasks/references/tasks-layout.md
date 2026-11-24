# Tasks layout

What steps 4, 5, 6 and 7 write and show, so two Cuts and two brands read the same. The Task bodies and the dates are fixed by `project-contract.md`, an Experiment's by `experiment-scoping.md`. Terms are in `growth-system-glossary.md` and `glossary.md`. Properties are those of Tasks in `notion-schema.md`.

## The proposal table (step 4)

One table, one row per Drafted Task and per existing Task, in Run order. Under it, the gaps and the risks.

| Column | Holds |
|---|---|
| # | the position in Run order |
| Task | the title, with its `ID` where it matches a Task already on the board, `New` otherwise |
| Type | Task or Experiment |
| Runs as | Claude or Person |
| Assigned to | the person |
| Due | the date, with its derivation in a few words (`Project Due, 2 working days before`; `after TSK-12 + 1 day`; `verdict date`) |
| Blocked by | each Blocker: an Open question by its wording, a Task by its title |
| Change | `New`; `Updated`, with what the field says now and what it would say; `Untouched` (at `To review` or `Done`) |

Existing Tasks that match nothing drafted follow the table under "Not in the Cut, left as they are", each with its `ID`, `Status` and why it matched nothing, and the line that archiving is the user's call.

Risks to name: a Task's `Due` the Project's `Due` cannot hold, a Sitting carrying three or more sign-offs, an Experiment whose Verdict date falls after the Project's `Due`, a Task with no assignee, a Project `Due` blank or lapsed.

## A Task's properties (step 5)

| Property | New Task | Matched Task, updated in place |
|---|---|---|
| `Task` | the title, an action in the imperative, naming the exact object only where it narrows the Project's | unchanged unless the user renames it |
| `Type` | Task or Experiment | as drafted |
| `Project` | the Project (the relation) | unchanged |
| `Initiative` | blank: it is set only on a Task with no Project | unchanged |
| `Runs as` | as drafted | as drafted |
| `Assigned to` | the Project's `Owned by`, unless the Project names someone else for this Task (an approver, an Open question's owner); blank where nobody is named, and reported | set where blank, otherwise unchanged |
| `Due` | as agreed | as agreed where it was blank, past or out of line; otherwise unchanged |
| `Status` | `Idea` under a Project at `Idea`; otherwise `Not started` (Ready); the status the user names where they say otherwise | unchanged |
| `Hypothesis`, `Test KPI`, `Lever`, `Impact`, `Confidence`, `Ease` | an Experiment only, as `experiment-scoping.md` sets them | as drafted, Experiments only |
| `Outcome`, `Learnings`, `Started on`, `Done on`, `Result` | never written | never written |

A Task blocked on an Open question or on another Task is cut at the same `Status` as the rest: the block is recorded under `Blocked by`. A Task has a `Started on` only once somebody starts it.

## A Task's body (step 5)

A Task: three `heading_2` blocks, `What to do`, `Done when`, `Blocked by`, each with paragraph or list blocks beneath. An Experiment: the seven in `experiment-scoping.md`. Nothing else is on the page. `Blocked by` holds one entry per line, or `None`: an Open question by its wording as written on the Project, a Task by its `ID`.

## The `## Tasks` section (step 6)

A `heading_2` block `Tasks`, then one `to_do` block per Task in Run order, nothing else. Each reads:

`<mention of the Task page> · <Runs as> · due <date> · blocked by: <each Blocker>`

- The Task is a page mention (a working link that shows its title), never a bare `ID`.
- `blocked by:` is left off a Task with `None`. An Open question is written by its wording, a Task as a mention of its page.
- A Task at `To review` or `Done` is ticked, so a re-cut never unticks built work. Every other Task is unticked.

Its place: below the ten sections and anything left below them, above `## Close-out` and `## Feedback` where either is on the page. On a re-cut the existing `## Tasks` is replaced in place, never repeated.

## The report (step 7)

For the Project: its `ID`, link, `Status` and `Due`. Then one table in Run order: `ID`, Task, Type, Runs as, Assigned to, `Due`, what blocks it, and whether it was created, updated or left untouched. Then:

- the Tasks left as they are, and why;
- every Gap for `/to-projects`, each with the work it affects;
- the Open questions holding Tasks, with owner and date;
- the Person Tasks that others wait on, with who and by when;
- every Decision the user made while scoping an Experiment that binds beyond the Project, to log through the capture skills;
- the risks above, and anything proposed and left waiting.

The next move: `/do-task` on the first Task that is unblocked and Ready. `/do-task` is coming; until it is installed, that Task is the one to start by hand.
