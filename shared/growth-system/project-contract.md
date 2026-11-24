# The project contract

What a Project's page body holds, what a Task under it holds, and the rules that tie them: size, blocking, status and dates. Every skill that scopes, cuts or runs work reads this one file. Terms are in `growth-system-glossary.md`; the rows' properties are those of Projects and Tasks in `notion-schema.md`; the WIP limits are in `wip-limits.md`.

## The model

Work runs Project by Project. A **Project** is a row on Projects whose page body carries the whole context of one piece of work, once, in the ten sections below. The work is cut into slim **Tasks**: rows on Tasks related to the Project through `Project`, each carrying only what to do, when it is done and what blocks it, and reading everything else from the Project. There are no sprints. What is worked next is a Project's `Prioritised` status and a Task's Ready status (`Not started`).

## The ten sections

Each is a second-level heading on the Project's page body, written as an explicit `heading_2` block (a markdown write can silently drop headings), with the heading text exactly as written here and in this order. A skill matches on the heading text, so a reworded or reordered heading is a missing section. **Every heading is always present.** A section with nothing to say reads `None`, with the reason where it is not obvious, so a reader can tell empty from never written.

1. **`Current state`**: what exists today, and the baseline number with the source and window it was read from.
2. **`Outcome`**: the goal, the KPI, its baseline, its target and the date it is read.
3. **`Why`**: the Initiative served, and the Decisions, Learnings and Insights chosen by the context load, each cited by `ID` and title with one line on what it means for this Project. Where this Project cannot start until another has delivered, the other is named here by its `ID` with what it needs from it. This is the record of what the context load chose, so later runs read it instead of repeating the triage.
4. **`Audience`**: who it is for, how they enter, and who is excluded.
5. **`Approach`**: the shape of the solution; for communications, the key messages, the sender and the offer stance.
6. **`Decisions`**: choices made for this Project, each with its date and who made it. One that binds beyond the Project is also logged as a Decision through the capture skills, and cited here by its `ID`.
7. **`Open questions`**: each as `<the question>. Owner: <person>. By: <date>. Blocks: <the work it blocks>.` (see "Open questions block per Task").
8. **`Scope`**: what is in, and what is out.
9. **`Surfaces and access`**: every system the Project touches and the exact object on it (which draft theme and section, which email flow, which campaign and ad set, which product and variant), and the access needed.
10. **`Done when`**: objective acceptance criteria, and how the result is read after launch.

**Every fact is grounded.** It came from a read in the run or from an answer the user gave. Anything else is an Open question, never the nearest plausible value.

## What may be written, by status

`/to-projects` writes the ten sections and nothing below them.

| Project `Status` | What `/to-projects` does |
|---|---|
| `Idea` | writes the ten sections on the user's yes |
| `Prioritised`, `In progress` | re-scopes only as a proposal the user confirms before anything is written, naming the Tasks already cut that the change touches, for `/to-tasks` to re-cut |
| `Done`, `Archived` | nothing: says so and stops |

### Old layout

A Project whose body lacks any of the ten headings, or a Task whose body lacks its sections, is **old layout**. Skills that only read it do not repair it: they send a Project to `/to-projects` and a Task to `/to-tasks`, and stop.

## The size of a Project

A Project is **one outcome that one owner can ship and read on its own**. Its ten sections hold together only at that size: past it, `Outcome` carries several KPIs, `Approach` grows sub-headings and `Open questions` turns into a register. Test the work against this table before interviewing on it.

| Test | One Project | Too big |
|---|---|---|
| **Outcome** | one KPI, one target, one date | two or more KPIs that move independently |
| **Audience and approach** | one entry point, one shape of solution | several audiences, or an `Approach` that needs sub-headings |
| **Ships alone** | its `Done when` can be checked without waiting on another workstream | parts that could launch, and be read, at different times |
| **Surfaces** | a few related ones, such as an email flow and its sign-up form | several separate systems, each a build of its own |
| **Tasks** | roughly 3 to 10 | more than about 12, or Tasks that fall into clusters |
| **Elapsed time** | roughly 1 to 4 weeks from `Prioritised` to `Done when` checked | a quarter-long programme |
| **Open questions** | each blocks a few Tasks | one blocks a whole branch of work, which is usually a Project of its own |

**Two or more signals in the right-hand column mean the work is several Projects.** A source that carries a programme-level goal, its own sequence of gates and a register of decisions (a functional or technical specification, a plan page) is usually an Initiative's worth of work, and the Projects hang from that Initiative.

**Projects depend on each other through `Why`, not through Tasks.** A Task never names a Task in another Project. Where one Project cannot start until another has delivered, its `Why` names the other and says what it needs, and the sequence is held by which Projects are `Prioritised`.

## Below the ten

Sections written by other skills, appended below the ten (and below an experiment doc, where a Project carries one), in this order. `/to-projects` never writes or reorders them.

| Section | Written by | Holds |
|---|---|---|
| `## Tasks` | `/to-tasks` | a checklist of the Project's Tasks, each a mention of its Task page, blocked ones marked with what they wait on |
| `## Close-out` | `/do-task`, after the Project's last Task | the four parts below |
| `## Feedback` | whoever routes the Close-out | the follow-up Tasks, traced to the Close-out line that raised them |

### The Close-out

Four parts. The split between belief and choice is the point, and the line that gets skipped.

| Part | Routed through | The test |
|---|---|---|
| What we now **believe** | the Learning capture skill | a claim you can be wrong about |
| What we **chose** | the Decision capture skill | something you comply with or breach |
| What is still a **problem** | the Issue capture skill | nobody knows the answer yet |
| **Follow-ups** | become Tasks, traced under `## Feedback` | it is still work |

`/do-task` writes the Close-out; the person closing the Project routes its lines. There is no close-project skill.

## The Task contract

A **Task** is a row on Tasks with `Type` Task (or Experiment), its `Project` set, and a body of **only** these three second-level sections, written as explicit `heading_2` blocks and headed exactly so:

1. **`What to do`**: the action, plus any parameter that overrides the Project's. Anything not named here is read from the Project, never restated.
2. **`Done when`**: the check for this Task alone.
3. **`Blocked by`**: what it waits on, or `None`. One entry per line, of two kinds mixed freely: an Open question, by its wording on the Project, and another Task, by its `ID`.

Plus the select `Runs as`:

- **Claude**: built cold by `/do-task` and left at `To review`.
- **Person**: a sign-off, an approval, offline work, or an account Claude cannot reach. `/do-task` still runs it with the user, step by step, and an approval stays the named person's to give.

An Experiment's body carries the experiment doc in place of `What to do`, and keeps `Done when` and `Blocked by`.

A Task with no `Project` is standing work: it may hang from an Initiative directly or from nothing, and is outside this contract.

### Open questions block per Task, not per Project

An Open question on a Project names the work it blocks, and `/to-tasks` maps it to the Tasks doing that work. Every Task is cut, the blocked ones marked with what they wait on. A Task whose `Blocked by` names a question that is still open is **not runnable**: `/do-task` refuses it until the question is answered and the answer is moved into the Project's `Decisions`. The rest of the Project proceeds. A question that blocks no work is not a question for this Project: drop it, or move the point into `Scope`.

### A Task can wait on another Task

Where one Task cannot start until another has finished, the waiting Task names the other under `Blocked by` by its `ID`: a build that needs a copy sign-off, a form that needs tracking installed first. The block clears **when the named Task reaches `Done`**. At `To review` it is an unapproved draft, or a sign-off not yet given, and building on it risks rework, so `/do-task` warns, names the Task, and goes ahead only on the user's yes, recording in `Result` that it did. Short of `To review` it warns more strongly, since the named work has not been done at all, and still goes ahead on the user's yes, so a Task can be fast-tracked ahead of its blocker. It never refuses a Task for the status of another; an open question still refuses.

The `## Tasks` order is the order the work runs, and it does not block on its own. A dependency holds only when it is written on the waiting Task. Name only the Tasks that truly gate it, never every Task above it in the list, and never a Task outside the same Project. A dependency cycle (A waits on B, B on A) is never written.

## The lifecycle

### Projects

| `Status` | Means |
|---|---|
| `Idea` | raised, not committed |
| `Prioritised` | chosen to be worked next; counts toward the WIP limit |
| `In progress` | its first Task has started; counts toward the WIP limit |
| `Done` | closed by a person, once its `Done when` has been checked |
| `Archived` | out of play, filtered from every read |

A Project stays `In progress` until a person closes it: `/do-task` reports when every Task is done and the `Done when` can be checked.

### Tasks

| `Status` | Means |
|---|---|
| `Idea` | raised, not committed (the backlog) |
| `Not started` | **Ready**: prioritised and waiting to be pulled |
| `In progress` | being worked; counts toward the per-person WIP limit |
| `Blocked` | waiting on an Open question or a Task, named under `Blocked by` |
| `To review` | built to draft, or a sign-off waiting; nothing launched |
| `Done` | accepted |
| `Archived` | out of play, filtered from every read |

### Who moves what

- `/to-projects` sets the Project's `Status` the user asks for, `Idea` by default, as the table above allows.
- `/to-tasks` cuts Tasks for a Project at any status except `Done` and `Archived`. New Tasks take `Idea` under a Project at `Idea`, and `Not started` (Ready) under one at `Prioritised` or `In progress`, unless the user says otherwise.
- **Any skill** moving a Project into `Prioritised` or `In progress`, or a Task into `In progress`, checks the WIP limits in `wip-limits.md` first, warns when the move would pass one, and makes it on the user's yes (ADR-0023).

## Dates

A Project and every Task under it carry a `Due` the user has agreed, scheduled back from the Initiative's delivery date. A board full of blank or lapsed dates cannot tell anyone whether an Initiative will land, and a date nobody agreed is a guess nobody is held to.

### Where a date comes from

Each date is derived, never picked in isolation:

1. The Initiative's `Target date` is the outer bound. Nothing under it is due later unless named as a risk.
2. The Initiative's page body places each Project in sequence in its `Plan` table and phase lines. A Project's `Due` comes from the `Target date` and the Project's place in that sequence, and from a phase date the `Plan` line states where there is one.
3. A Project is due after every Project its `Why` depends on.
4. A Task is due before every Task whose `Blocked by` names it, and on or before its Project's `Due`, except a post-launch read.

### The rules every date follows

- **A Project's `Due` is the date its `Done when` can be checked**: the go-live, not a later KPI read. The KPI date in `Outcome` may fall later. A Task that reads a result after launch (a day-30 or day-60 read) is due on the read's date, after the Project's `Due`; it is the one kind of Task that may be.
- **An Experiment's `Due` is its verdict date**, the date its result is read, because that is when its `Done when` can be checked.
- **Never in the past.** A `Due` already lapsed is re-proposed, never kept, and the proposal says what it was. "Past" is measured against today's date as the session gives it.
- **Never on a weekend.** A date that lands on a Saturday or Sunday moves to the Friday before.
- **A sign-off gets lead time.** A `Runs as` Person approval by someone other than the builder is due at least one working day after the work it approves.
- **One approver's sign-offs in a week share a date**, so they review in one sitting. Batching never breaks the lead time or the Project's `Due`: a sign-off that cannot join the week's sitting without doing so keeps its own date. A sitting that collects three or more sign-offs is named as a risk.
- **A Project at `Idea` is dated only where the Initiative's `Plan` already places it.** An idea the plan does not name is committed to no date and stays blank.
- **A date beyond the Initiative's `Target date` is never written quietly.** Where the work cannot fit, say so, propose the realistic date and name it as a risk to the Initiative.

### Agreed, not imposed

The skill proposes every date with its derivation and writes only the dates the user agrees. With nobody present to agree one (a loose idea filed cold), the `Due` stays blank and the report names it. An Initiative with no `Target date` is a gap to name: ask the user for the delivery date, with a recommendation, and point at `/to-initiatives` so the next Project does not have to ask.

`/to-projects` agrees a Project's `Due` and `/to-tasks` schedules its Tasks'. Either re-proposes a Project `Due` that is blank or lapsed; `/to-tasks` writes only the `Due` property, and where the new date overtakes the KPI date in `Outcome` it names that as a gap for `/to-projects` rather than editing the page.

## Writing the body

- **A blank body** is written whole on the user's yes.
- **A body with anything on it** is restructured into the ten sections, every fact already there kept in its nearest section and never dropped. Leftover prose that fits no section stays where it is, below the ten and above any `## Tasks`, until the user says to remove it. Everything below the ten is left untouched.
- **Read the page back** after writing and check all ten headings are present, verbatim and in order.
