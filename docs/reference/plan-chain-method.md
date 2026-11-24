# The plan-chain method: contracts and skill outlines

> **Provenance.** Transcribed 2026-11-24 from a private growth-system plugin Crux built for a client
> team; sanitised and adapted to this repo's schema (`notion-schema.md` v2, ADR-0020, ADR-0022,
> ADR-0023). Deviations from the source are flagged inline as **Deviation:**. The source ran on a
> weekly team meeting (an L10) that owned prioritising, target sign-off and status reads; this repo
> has no such meeting, so every rule that leaned on it is either given to the user in the session or
> dropped, and flagged where it happens.
>
> This file is the build reference for PRD220's plan-chain slices. It is **not** installed: the
> parts a skill needs are carried into `shared/growth-system/` (`project-contract.md`,
> `initiative-contract.md`, `experiment-scoping.md`, `wip-limits.md`) and each skill's own
> `SKILL.md`. Terms are those of `GLOSSARY.md` § Growth system.

**Naming in this file.** Skills are named as this repo names them: `to-objectives`,
`to-initiatives`, `to-projects`, `to-tasks`, `prioritise`, `do-task`, `capture-decision`,
`capture-learning`, `capture-insight`, `add-issue`. Rows are named by their `ID` prefix: `OBJ-n`,
`INI-n`, `PRJ-n`, `TSK-n`, `DEC-n`, `LRN-n`, `INS-n`, `ISS-n` (the prefix may differ where setup
recorded a `<name>_prefix`).

**Deviation (structure):** the source kept projects, experiments and tasks on one board split by a
`Type` select, with a `Parent card` self-relation and `CARD-n` IDs. Here Projects are their own
database (`PRJ-n`), Tasks are another (`TSK-n`), a Task hangs from its Project through the `Project`
relation, and Experiment is a `Type` of Task, not of project (ADR-0020).

---

## 1. The project contract

### The model in one paragraph

Work runs **project by project**. A **Project** is a row on Projects whose page body carries the
project's whole context in the ten sections below. Work is cut into slim **Tasks**: rows on Tasks
related to the project through `Project`, each carrying only what to do, when it is done and what
blocks it, and reading everything else from the project. There are no sprints. Choosing what is
worked next is a Project's `Prioritised` status and a Task's Ready (`Not started`) status.

**Deviation:** in the source only the weekly meeting (or the user agreeing a split) could set
`Prioritised`. Here any growth-system skill sets it when the user asks, checking the WIP limits and
warning when a move would go over, never blocking (ADR-0023).

### The ten sections

Each is an **H2 on the project page body**, with the heading exactly as written here and in this
order. A skill matches on the heading text, so a reworded or reordered heading is a missing section.

1. **`Current state`**: what exists today and the baseline number.
2. **`Outcome`**: goal, KPI, baseline, target, date.
3. **`Why`**: the initiative served and the `DEC-n`, `LRN-n` and `INS-n` rows chosen by the context
   load, each with a line on what it means for this project. This is the record of what the full
   context load chose, so later runs (`to-tasks`, `do-task`) read it rather than repeating the triage.
4. **`Audience`**: who it is for, how they enter, who is excluded.
5. **`Approach`**: the shape of the solution; for comms, the key messages, the sender and the offer
   stance.
6. **`Decisions`**: choices made for this project. One that binds beyond the project is also logged
   as a `DEC-n` through `capture-decision`.
7. **`Open questions`**: each with an **owner**, a **date** and the **tasks it blocks** (see "Open
   questions block per task, not per project").
8. **`Scope`**: in and out.
9. **`Surfaces and access`**: every system and the exact object touched on it (which draft theme
   and section, which email flow, which campaign and ad set, which product and variant), and the
   access needed.
10. **`Done when`**: objective acceptance criteria, and how the result is read after launch.

`to-projects` may write or rewrite these ten at `Idea`, and at later statuses only as a proposal
confirmed before writing. It writes nothing below them.

### The size of a project

A project is **one outcome that one owner can ship and read on its own**. Its ten sections hold
together only at that size; past it, `Outcome` carries several KPIs, `Approach` grows sub-headings
and `Open questions` turns into a register. Test the work against this table before interviewing on
it:

| Test | One project | Too big |
|---|---|---|
| **Outcome** | one KPI, one target, one date | two or more KPIs that move independently |
| **Audience and approach** | one entry point, one shape of solution | several audiences, or an `Approach` that needs sub-headings |
| **Ships alone** | its `Done when` can be checked without waiting on another workstream | parts that could launch, and be read, at different times |
| **Surfaces** | a few related ones, such as an email flow and its sign-up form | several separate systems, each a build of its own |
| **Tasks** | roughly 3 to 10 | more than about 12, or tasks that fall into clusters |
| **Elapsed time** | roughly 1 to 4 weeks from `Prioritised` to `Done when` checked | a quarter-long programme |
| **Open questions** | each blocks a few tasks | one blocks a whole branch, which is usually a project of its own |

**Two or more signals in the right-hand column mean the work is several projects.** A source that
carries a programme-level goal, its own sequence of gates and a decision register (a functional or
technical specification, a plan page) is usually an initiative's worth of work, and the projects
hang from that initiative. The source's worked case was a specification with five outcomes, six
systems, a nine-step build sequence and over fifty decisions, which cut into nine or ten projects.

**Projects depend on each other through `Why`, not through tasks.** A task never names a task in
another project. Where one project cannot start until another has delivered, its `Why` names the
other by `PRJ-n` and says what it needs from it, and the sequence is held by which projects are
`Prioritised`.

### The downstream sections

Appended **below** the ten (and below an experiment doc, where a project carries one), in this
order, and never written by `to-projects`:

| Section | Written by | Holds |
|---|---|---|
| `## Tasks` | `to-tasks` | a checklist of the project's tasks, each a mention of its `TSK-n`, blocked ones marked with what they wait on |
| `## Close-out` | `do-task`, after the project's last task | the four-part close-out below |
| `## Feedback` | whoever routes the close-out | the follow-up tasks, traced back to the close-out line that raised them |

### The Close-out

Four parts, and the split is the point: the belief-versus-choice line is the one that gets skipped.

| Part | Routed through | The test |
|---|---|---|
| What we now **believe** | `capture-learning` | a claim you can be wrong about |
| What we **chose** | `capture-decision` | something you comply with or breach |
| What is still a **problem** | `add-issue` | nobody knows the answer yet |
| **Follow-ups** | become Tasks, traced under `## Feedback` | it is still work |

`do-task` writes the Close-out; **the person closing the project routes its lines**. There is no
close-project skill. (The Close-out is #306's and #305's to build; it is here so the contract is
whole.)

---

## 2. The task contract

A **Task** is a row on Tasks with:

- `Type` = Task (or Experiment, see section 4),
- `Project` set to its project, and
- a body of **only** these three H2 sections, headed exactly so:
  1. **`What to do`**: the action, plus any parameter that **overrides** the project's. Anything not
     named here is read from the project, never restated.
  2. **`Done when`**: the check for this task.
  3. **`Blocked by`**: what it waits on, or `None`. Two kinds of entry, one per line, mixed freely:
     an open question, by its wording on the project, and another task, by its `TSK-n`.

Plus the select **`Runs as`**:

- **Claude**: built cold by `do-task` and left at `To review`.
- **Person**: a sign-off, an approval, offline work, or an account Claude cannot reach. `do-task`
  still runs it, collaboratively: it checks in with the user at each step, and an approval stays the
  named person's to give.

**A Task with no `Project`** is standing work (it may hang from an Initiative directly, or from
nothing) and is outside this contract.

An Experiment's body carries the experiment doc of section 4 in place of the three sections'
`What to do`, keeping `Done when` and `Blocked by`. **Deviation:** in the source an Experiment was a
project carrying the ten sections plus the doc; here it is a Task (ADR-0020). Whether an Experiment
keeps all three task sections beside the doc is a build call for the to-tasks slice; the default is
the doc plus `Done when` and `Blocked by`.

### Open questions block per task, not per project

An open question on a project names the tasks it blocks. `to-tasks` cuts **every** task, marking the
blocked ones with what they wait on. A task whose `Blocked by` names a question that is still open is
**not runnable**: `do-task` refuses it until the question is answered and the answer moved into the
project's `Decisions`. The rest of the project proceeds. A question that blocks no task is not a
question for this project: drop it, or move the point into `Scope`.

### A task can wait on another task

Where one task cannot start until another has finished, the waiting task names the other under
`Blocked by` by its `TSK-n`: a build that needs a copy sign-off, a form that needs tracking installed
first. The block clears **when the named task reaches `Done`**. At `To review` it is an unapproved
draft, or a sign-off not yet given, and building on it risks rework, so `do-task` warns, names the
task, and goes ahead only on the user's yes, recording in `Result` that it did. Short of `To review`
it warns more strongly, since the named work has not been done at all, and still goes ahead on the
user's yes, so a task can be fast-tracked ahead of its blocker. It never refuses a task for the
status of another; an open question still refuses.

The `## Tasks` order is the order the work runs, and it **does not block on its own**. A dependency
holds only when it is written on the waiting task. Name only the tasks that truly gate it, never
every task above it in the list, and never a task outside the same project. A dependency cycle (A
waits on B, B on A) is never written.

---

## 3. The lifecycle

**Deviation:** the source had one status list shared by projects and tasks (Idea, Not started,
Prioritised, In progress, Blocked, To Review, Done, Archived). This repo's schema splits it.

### Projects

| Status | Means |
|---|---|
| `Idea` | raised, not committed |
| `Prioritised` | chosen to be worked next; counts toward the WIP limit |
| `In progress` | its first task has started; counts toward the WIP limit |
| `Done` | closed by a person, once its `Done when` has been checked |
| `Archived` | out of play, filtered from every read |

**Deviation:** Projects have no `Not started`, `Blocked` or `To Review`. A project stays `In
progress` until a person closes it; `do-task` reports when every task is done and the `Done when`
can be checked.

### Tasks

| Status | Means |
|---|---|
| `Idea` | raised, not committed (the backlog) |
| `Not started` | **Ready**: prioritised and waiting to be pulled |
| `In progress` | being worked; counts toward the per-person WIP limit |
| `Blocked` | waiting on an open question or a task, named under `Blocked by` |
| `To review` | built to draft, or a sign-off waiting; nothing launched |
| `Done` | accepted |
| `Archived` | out of play, filtered from every read |

### What each skill may do, by status

- **`to-projects`** writes the ten sections on a project at `Idea`, and re-scopes one at
  `Prioritised` or `In progress` only as a proposal confirmed before writing, naming the tasks
  already cut that the change touches, for `to-tasks` to re-cut. At `Done` or `Archived` it does
  nothing. It sets the status the user asks for, `Idea` by default.
- **`to-tasks`** cuts tasks for a project at any status except `Done` and `Archived`. **Deviation:**
  the source refused unless the project was `Prioritised` or later. New tasks take `Idea` under a
  project at `Idea`, and `Not started` (Ready) under one at `Prioritised` or `In progress`, unless the
  user says otherwise.
- **Any skill** moving a Project into `Prioritised` or `In progress`, or a Task into `Not started` or
  `In progress`, checks the WIP limits in `wip-limits.md` first, warns when the move would go over,
  and makes it on the user's yes (ADR-0023).
- **`do-task`** (#306), given a task, runs it. Given none, it picks the highest-`Priority` (the
  project's) task at Ready that is unblocked. Its exact pick rule is #306's.

### WIP limits (for `wip-limits.md`)

- Projects at `Prioritised` or `In progress`: at most **4** across the team.
- Tasks at `In progress`: at most **4 per person**, counted by `Assigned to`. A `Runs as` Claude task
  counts against whoever is assigned to review it.
- Fixed defaults, no per-team setting. A move over a limit is warned and made on the user's yes,
  never blocked.

### Dates when a card moves

A skill that moves a Task or Project sets `Started on` when it goes to `In progress` and `Done on`
when it goes to `Done`. A card moved by hand keeps them blank. Cycle time and the cumulative flow
chart are not built in this PRD.

---

## 4. Dates

A project and every task under it carry a **`Due`** that the user has agreed, scheduled back from the
initiative's delivery date. A board full of blank or lapsed dates cannot tell anyone whether an
initiative will land, and a date nobody agreed is a guess nobody is held to.

**Where the dates come from.** Each date is derived, never picked in isolation:

1. The **initiative's `Target date`** is the outer bound. Nothing under it is due later unless named
   as a risk (below).
2. The initiative page's **`Plan`** places each project in sequence and in a phase. **Deviation:** the
   source also had a `Milestones` section giving each phase a date; this repo's initiative page has no
   `Milestones` (section 5), so a project's `Due` is derived from the `Target date` and the project's
   place in the `Plan` sequence, and a phase date the `Plan` line states is used where there is one.
3. A project is due **after every project its `Why` depends on**.
4. A task is due before every task whose `Blocked by` names it, and on or before its project's `Due`,
   except a post-launch read (below).

**The rules every date follows.**

- **A project's `Due` is the date its `Done when` can be checked**: the go-live, not a later KPI read.
  The KPI target date in `Outcome` may fall later. A task that reads a result after launch (a day-30
  or day-60 read) is due on the read's date, after the project's `Due`; it is the one kind of task
  that may be.
- **An Experiment's `Due` is its verdict date**, the date its result is read, because that is when its
  `Done when` can be checked.
- **Never in the past.** A `Due` already lapsed is re-proposed, never kept, and the proposal says what
  it was.
- **Never on a weekend.** A date that lands on a Saturday or Sunday moves to the Friday before.
- **A sign-off gets lead time.** A `Runs as` Person approval by someone other than the builder is due
  at least one working day after the work it approves.
- **One approver's sign-offs in a week share a date**, so they review in one **sitting** (one date on
  which one approver, or a pair who always sign off together, reviews several sign-offs at once).
  Batching never breaks the lead time or the project's `Due`: a sign-off that cannot join the week's
  sitting without doing so keeps its own date. Name a sitting that collects three or more sign-offs
  as a risk.
- **A project at `Idea` is dated only where the initiative's `Plan` already places it.** An idea the
  plan does not name is not committed to any date, and stays blank.
- **A date beyond the initiative's `Target date` is never written quietly.** Where the work cannot
  fit, say so, propose the realistic date, and name it as a risk to the initiative.

**Agreed, not imposed.** The skill proposes every date with its derivation and writes only the dates
the user agrees. With nobody present to agree one (a loose idea filed cold), the `Due` stays blank and
the report names it. An initiative with no `Target date` is a gap to name: ask the user for the
delivery date, with a recommendation, and point at `to-initiatives` so the next project does not have
to ask.

**Who re-proposes a project's date.** `to-projects` agrees a project's `Due`, and `to-tasks`
schedules its tasks'. Either re-proposes a project `Due` that is blank or lapsed: `to-tasks` derives
it from the initiative's `Target date` and `Plan` as `to-projects` would, proposes it with the cut and
writes only the `Due` property. Where the new date overtakes the KPI date in the project's `Outcome`
section, it names that as a gap for `to-projects` rather than editing the page.

### Old layout

A project whose body lacks the ten headings, or a task whose body lacks its sections, is
**old-layout**. Skills do not handle it: they send a project to `to-projects` and a task to
`to-tasks`, and stop.

---

## 5. The initiative contract (six sections)

### What the page is for

An **Initiative** is a workstream serving one Objective, with one owner and one Key result, spanning
several projects. Its row holds the fields (`Key result`, `Target`, `Target unit`, `Target date`,
`Quarter`, `Why`, `Owned by`, `Status`, `Objective`). Its **page body holds the plan the projects
inherit**: the shape of the work, its sequence, and the context every project under it would
otherwise rediscover.

- **The primary reader is whoever scopes the projects**, human or skill. Write for them: concrete,
  sourced, with numbers and object names transcribed rather than summarised.
- **A short overview sits on top for humans**, so somebody opening the page cold gets it in one read.
- **It is a snapshot, not a status page.** Status lives on the row (`Status`). Do not copy a
  project's status or owner onto the page; it goes stale within a week and nothing owns the update.
  The page changes when the plan changes.
- **It never restates the row.** The row's fields are shown above the body. The body says what the
  properties cannot: what counts as done, how the target is read, and why the work is shaped the way
  it is.

### The six sections

Each is an **H2 on the page body**, with the heading exactly as written here and in this order. A
skill matches on the heading text, so a reworded or reordered heading is a missing section. **Every
heading is always present**; a section with nothing to say reads `None`, with the reason where it is
not obvious, so a reader can tell empty from never written.

1. **`Overview`**: a callout of three to five lines for humans: what the initiative does, by when,
   who owns it, and where it stood on the date written (dated). The one place a status word may
   appear, because it is dated.
2. **`Outcome`**: what counts as done, in terms the Key result can be counted against (what makes a
   flow "live", a customer "onboarded"); how and when the target is read; what steady state looks
   like after. No numbers that sit on the row.
3. **`Plan`**: the projects in sequence. A table of **#, Project, Job, KPI, Link**: one row per
   project, each linking its `PRJ-n`. **No status and no owner columns.** Foundations or enabling
   work that the target does not count gets its own row, marked as such. Then one line per phase
   saying what it covers, what gates it, and its date where one is agreed.
4. **`Constraints`**: the Active `DEC-n` and `LRN-n` rows from the context load that bind every
   project under the initiative, one line each on what they mean here, plus the decisions made for
   this initiative, **each a `DEC-n`** logged through `capture-decision`. Rows that bind a single
   project belong on that project's `Why`, not here.
5. **`Open questions`**: questions above any one project, each with an owner and what it gates. A
   question about one project goes on that project.
6. **`Sources`**: the Objective, plan documents, transcripts, boards and documents the page was
   drafted from, so the next re-plan starts from the same evidence.

**Deviation:** the source had twelve sections. Dropped: `Current state` (the Objective's evidence and
the Strategy map snapshot carry it), `Scope` (each project carries its own), `Milestones`,
`How the work runs`, `Decisions` (folded into `Constraints`) and `Risks and dependencies`. The
dropped ones served a weekly governance meeting (phase dates checked mid-quarter, a shared agency
process, a risk register) that a small team does not run, and each added an interview per
initiative. The source also drafted the body in a separate "initiative plan" mode; here
`to-initiatives` writes the body in the same run once the row is agreed.

### Initiative level, not project level

The test for every line: **would a second project under this initiative need it?** If yes, it
belongs here. If only one project needs it, it belongs on that project.

| Belongs on the initiative | Belongs on the project |
|---|---|
| which projects exist, their order and what gates each | a project's splits, timings, copy and tasks |
| decisions and constraints that bind every project | the `DEC-n`, `LRN-n` and `INS-n` rows only one project uses |
| questions that block a phase or several projects | questions that block one project's tasks |

### A project with no row

A row in the `Plan` table with no project is invisible on the board. When drafting finds one,
propose filing it as a stub project at `Idea` through `to-projects`, related to this initiative, so
every Plan row links to a project. Filing is that skill's job.

**Deviation:** the source had a catch-all initiative carrying no body. There is none here: work
serving no initiative is a Task hanging from nothing (standing work).

---

## 6. Experiment scoping

> Reached only when a Task's `Type` is **Experiment**. **Deviation:** in the source an experiment was
> a project; here it is a Task (ADR-0020), cut by `to-tasks`, carrying the experiment properties
> (`Hypothesis`, `Test KPI`, `Lever`, `Impact`, `Confidence`, `Ease`, the `ICE` formula, `Outcome`,
> `Learnings`) and the experiment doc in its body. A Project may be "a series of experiments"; each
> experiment is still a Task under it. Most tasks are not experiments and never open this.

**Three things this file deliberately does not carry.** No fields, options or IDs (those are
`notion-schema.md`'s). No copy rules (a brand's own copy guidance, where it has one, is the
authority). No project contract (section 1).

**A scoped experiment flags what it does not know.** A missing baseline, an unchecked claim, a variant
nobody has chosen: each is named in the doc rather than filled in with something plausible, because a
plausible filler reads exactly like a measured one and nobody can tell them apart a month later.
Scoping is not the act of leaving no blanks.

### Scope the test before you score it

A rough idea is under-specified in ways that change what the test measures, and scoring or writing it
up first just fixes the ambiguity in place. Three decisions, resolved with the person who raised it,
and only where the idea has not already answered them.

- **The variants, and what is held constant.** What is being tested, against what. There may be an
  incumbent **control**, or it may be a fresh head to head, which is the normal case on a surface with
  no baseline. Everything not being tested is held constant, and saying which things those are is the
  part that gets skipped.
- **The primary KPI.** The single metric the test is judged on. A full-funnel test can be read at the
  ad, at the page or across the whole funnel, and the choice is a real trade-off between a faster
  signal and a truer one. Pick one; a test judged on two metrics is a test with no decision rule.
- **Baseline and power.** Either there is enough history to compute a sample size and a minimum
  detectable effect, or there is not. Where there is not, scope it as a **relative** test, judged by
  comparing variants against each other on a spend or conversion threshold, and flag it as one.

### ICE

Each of the three is scored 1 to 5.

- **Impact.** If it wins, how far does it move the primary KPI? 5 = a step change; 3 = a useful lift;
  1 = marginal.
- **Confidence.** How strong is the evidence that it will win? 5 = prior data, or proven elsewhere;
  3 = a plausible mechanism; 1 = a hunch. An `LRN-n` behind the idea is what moves this, so the
  context load is what you score from.
- **Ease.** How cheap and fast to ship and run? 5 = hours, no dependencies; 3 = a few days; 1 = a new
  build, or a dependency on someone outside the team.

The three average into a score the database computes, so never score one of them to reach a total
you have already decided on.

### The hypothesis

One sentence: **If** [the change], **then** [the predicted effect on the primary KPI], **because**
[the reasoning or the evidence].

The **because** is the half that carries the value and the half that gets fudged. It has to add the
reasoning, not restate the *then* in other words. "Because more people will convert" is the *then*
again; "because this audience wants social proof before committing, and we have three interviews
saying so" is a reason, and it is what makes the result readable when the test loses.

Two worked examples:

- *If we move the testimonial block above the fold on the quiz landing page, then more visitors will
  start and complete the quiz, because on-site feedback says this audience wants social proof before
  committing.*
- *If we lead our cold-audience ads and the matching landing-page hero with a single, sharply distinct
  message angle, then one angle will drive a materially higher session to purchase rate than the
  others, because a cold audience converts on the angle that best matches its dominant buying
  motivation, and we do not yet know which that is.* (A head to head with no incumbent control.)

### The experiment doc

Five sections, written into the Experiment task's body. The Results section is a scaffold, because
scoping happens before the test runs, and it is filled in when the result is read. The `Hypothesis`
and `Test KPI` written here are also set as the task's properties.

```markdown
## Description
[The change, where it runs, and the decision it informs, in two or three sentences. For a variants
test, a table with one row per variant, and a line on what is held constant.]

| # | Angle | Ad headline | Landing-page hero |
| --- | --- | --- | --- |
| A | … | … | … |

**Claims to substantiate before launch:**
- [Any efficacy, timeframe or offer claim that is not cleared yet. Omit the heading if there are
  none; never omit a claim to avoid writing the heading.]

## Hypothesis
If __, then __, because __.

## Control / Holdout
[Platform-handled, for example a 50/50 split test, or defined by hand. Where there is no incumbent
control, say so and say how the variants are compared instead: equal budget and targeting, winner on
the primary KPI.]

## Experiment Plan
- Test KPI: [the primary metric]
- Baseline: [value and the window it covers, or "none yet" and how one will be established]
- Sample size per week: [value, or "to confirm once live"]
- Minimum detectable effect: [value, or "relative: leading variant once each clears <threshold>"]
- Decision rule: [when the test is called, and what each outcome triggers]

## Results & Key Learnings
### Key takeaways
1. __
### Primary metric
[Primary KPI] by variant.
### Secondary metrics
By variant.
### Performance against hypothesis
Did the result support or refute it?
### Next steps
Iterate, roll out, or kill.
```

**Flag every unknown in the plan rather than filling it**, and say how it will be established. A
baseline, a sample size or an MDE that nobody measured is still sitting there when the test is
called, by which point it is indistinguishable from one somebody actually took.

### The claims check

**Deviation:** the source cleared every claim against its brand's approved-claims bank. Generically:
where the brand has copy or claims guidance (a skill, a document, an approved list), every headline,
hero line and claim written into the doc is checked against it; where it has none, any efficacy,
timeframe or offer claim is listed under *Claims to substantiate before launch* for a person to clear.

- **Where the intent is sound but the wording overclaims, reframe it** and keep the angle. The angle
  is usually right and the sentence is usually the problem.
- **Where the claim itself is not cleared**, soften it **and** list the original under *Claims to
  substantiate before launch*. Softening without listing it loses the fact that somebody wanted to
  make that claim.
- **Flag the tension rather than resolving it silently.** Quietly dropping a chosen angle and quietly
  shipping an uncleared claim are the two failures here, and they look identical from the outside.

The check runs over the doc as written rather than the idea as pitched, so a claim that arrives in
the Description is as much a claim as one in an ad headline.

### Done when (experiment scoping)

- All three ICE scores are set.
- The hypothesis is one sentence in the three-part form, and its *because* would still be a reason if
  the *then* were deleted.
- Every one of the five sections has content, Results is left as a scaffold, and every unknown in the
  plan is flagged rather than filled.
- Every claim in the doc has either cleared the brand's guidance or is listed under *Claims to
  substantiate before launch*.

---

## 7. Skill outlines

The source skills' steps, adapted. Each step keeps its **Done when**. Rules that hold for all three:

- **Find the system first**, through "Finding the system" in `notion-schema.md`; every read is a
  filtered query, never a saved view, and every read filters out `Archived`.
- **Ground first, then ask.** Draft from reads silently; ask only about what the reads leave
  ungrounded. Facts are the skill's to find; only decisions go to the user. Never fill a gap with the
  nearest plausible value.
- **Match before write.** Match every proposed row against existing rows **on the work, not the
  wording**, and update the match in place, keeping its ID, rather than filing a duplicate.
- **Propose, then write.** Show the whole proposal and wait for one yes. A field an existing row
  already carries and the proposal states differently is **proposed and waits**, shown as what it
  says now and what it would say; a new row and a blank field apply on the yes.
- **Write headings as explicit `heading_2` blocks** with paragraph, list, callout, table and to-do
  blocks beneath; a markdown write can silently drop headings. Headings exactly as the contract spells
  them, in its order.
- **Read back** every row and page written, and check it against the step's Done when.
- **If a field to be written does not exist**, report it and write nothing partial.
- **Never create a select option to fit a value** except where `notion-schema.md` says the select
  starts empty and fills as rows are written (`Quarter`, `Theme`).

### 7.1 `to-initiatives` (source: "break a plan into initiatives")

**Deviation (input):** the source took any agreed plan document as "the author" and transcribed it.
Here the plan is **the quarter's Active Objectives** (written by `to-objectives`) and that quarter's
section of the Strategy map (the Growth model snapshot and the candidate initiatives named under each
Objective). Any other plan document the user hands over is supporting evidence. `to-initiatives`
proposes 3 to 5 Initiatives per Objective, from the weak steps, and grills them with the user.

**Deviation (fields):** no `Bucket`, no horizon `Project` option, no catch-all initiative, no `RAG`,
no legacy `Owner` select, no `Sprints` relation. `Quarter` (multi-select) replaces the horizon;
`Status` (On track, At risk, Off track, Done) replaces RAG. The Key result, `Target`, `Target unit`,
`Target date` and owner are **written on the user's yes** in the session, not proposed for a meeting.

1. **Resolve the quarter and read the plan.** Name the quarter (`2027 Q1`), read its Active
   Objectives and its Strategy map section in full, and name them in the output. Rows on other
   quarters are history, not drift: count them, do not read them in full. **Done when** the output
   names the quarter, its Objectives by `OBJ-n` and the Strategy map section read.
2. **Run the context load** (all five reads, per `context-load.md`); read 5 is the Initiatives on the
   quarter, which doubles as the before state. **Done when** the context load's two obligations are
   discharged.
3. **Carry review** (start of a quarter, for Initiatives under a carried Objective): for each, show its
   `Status` and Key result, and propose **carry** (add the new quarter to `Quarter`; new `Target date`
   only if the user moves it), **Done**, or **Dropped**. **Done when** every Initiative under a
   carried Objective has the user's carry, Done or Dropped. (New in this repo.)
4. **Break each Objective into Initiatives**, one per workstream with **one owner and one outcome**:
   two owners, or two outcomes judged separately, is two initiatives; a goal stated only as a step
   towards another is part of that initiative; a standing commitment with no outcome to move is not
   an initiative (it is standing Tasks). Each carries one Key result. `Why` is why it was picked (its
   weak step, the evidence, what it unlocks), never a restatement of the Key result; where no reason
   is grounded, leave it as a named gap. Grill the draft in rounds with a recommendation per question.
   **Done when** every Objective has 3 to 5 agreed Initiatives (carried ones counted) and every field
   is sourced or a named gap put to the user.
5. **Diff against the board.** Put each Initiative and each live row on the quarter in a class:

   | Class | What it is | What happens |
   |---|---|---|
   | **New** | proposed, no row covers it | created on the yes |
   | **Unchanged** | matched, and nothing proposed differs | reported, nothing written |
   | **Changed** | matched, and the proposal differs on a field the row carries | proposed and waits, field by field |
   | **Unsourced** | a live row on the quarter no Objective covers | reported and left alone |

   **Unchanged is a real class and a re-run proves it**: a second pass over the same plan reports
   unchanged rows rather than rewriting them. The title is matched exactly, so a **different title is
   a rename to confirm**, never applied silently. An update never re-keys: the `INI-n` is the row's for
   life. **Done when** every proposed initiative and every live row on the quarter carries a class,
   each matched row named by its `INI-n`.
6. **Write the rows**: title, `Objective` (relation), Key result, `Target`, `Target unit`,
   `Target date`, `Quarter`, `Why`, `Owned by` (a workspace member; one who resolves to nobody is
   reported, never guessed), `Status` (On track for a new row). Never write `Projects` or `Tasks` from
   this side: a project relates itself to the initiative it serves. **Done when** every field is
   written from an agreed answer and each row reads back with its `INI-n`.
7. **Write the page body** (the six sections of the initiative contract), drafted from the Objective,
   the context load, the Strategy map and any source handed over, holding to the level test. A
   **blank** body is written whole on the yes; **any body with something on it** is proposed section by
   section, every fact already there kept in its nearest section, never dropped, and leftover prose
   kept below `Sources` until the user says to remove it. Plan rows with no project become candidate
   stubs for `to-projects`; decisions found in sources but not on Decisions become candidates for
   `capture-decision`. **Done when** the read-back shows all six headings verbatim and in order and
   every Plan row links a `PRJ-n` or is listed as a candidate stub.
8. **Report**: each `INI-n`, its class, what was written, what is still proposed and waiting, the
   unsourced rows, the candidate stubs and decisions, and the next move (`to-projects` on the first
   project in a Plan). **Done when** every initiative and every live row on the quarter appears,
   nothing dropped silently.

### 7.2 `to-projects` (source: "scope a project")

Every fact on the page is **grounded**: it came from a read in this run or from an answer the user
gave. Anything else is an open question, never a plausible default.

1. **Resolve the project.** A `PRJ-n` or link is the project, rewritten in place keeping its ID. A
   loose idea is first matched against every non-archived project on the work, not the wording; no
   match is a new project. A source document (a spec, a plan page, a brief) is read whole, then treated
   as a loose idea. A `TSK-n` is not a project: say so, name its `Project`, and stop. Read its
   `Status`: `Idea` → write the ten sections; `Prioritised`, `In progress` → re-scope only as a
   proposal confirmed before writing, naming the tasks already cut that it touches; `Done`,
   `Archived` → nothing, say so and stop. **Done when** the output names the `PRJ-n` (or "new
   project"), its status and which rule applies, with nothing written.
2. **Load the context and read the surfaces.** The full five-read context load (`context-load.md`);
   this is the run whose choices become the project's `Why`. Then read the surfaces the project
   touches as they are today (the live email flow it replaces, the page or theme section it changes,
   past briefs, the baseline number in the warehouse or Growth Brain). Both read-only. **Done when**
   all five reads are named, empty ones included, the proposal has been checked against every Active
   Decision, and each surface is read or named as unreadable with the reason.
3. **Size the work** against the size test (section 1), naming which signals fired with evidence.
   Fewer than two: one project, go to step 4. Two or more: split.
   - **3a. Place it under an initiative.** Match against the Initiatives read in step 2. Where none
     covers the work and it has a goal of its own, stop and point at `to-initiatives`.
     **Deviation:** no catch-all initiative to file it on.
   - **3b. Propose the split** as one table: Project (named after the outcome), Outcome, Surfaces,
     Depends on, Open questions, Existing project (a match it becomes, keeping its `PRJ-n`). Then the
     recommended sequence with its reason. **Every open question in the source lands on exactly one
     project**, or is named initiative-level with the reason.
   - **3c. Agree the split** one question at a time with a recommendation each: count and boundaries
     first, then sequence.
   - **3d. Agree each project's status and `Due`** as one question, with a recommendation per
     project and each date's derivation (section 4). Recommend `Prioritised` for one the user commits
     to working next that depends on nothing unfinished, `Idea` otherwise. **Deviation:** any status
     the user names is written, with the WIP warning where `Prioritised` would go over the limit
     (ADR-0023); this is no longer a special exception.
   - **3e. File every project as a stub**: the ten sections grounded from the source and context load,
     with facts transcribed, not summarised; `Why` naming the initiative, the source by title and link
     as provenance, each dependency by `PRJ-n`, and the bearing DEC, LRN and INS rows; `Decisions`
     with date and who made each; `Open questions` with owner, date and blocked work. **The source is
     provenance, never the only carrier.** One yes for the set, then write each with steps 5 and 6.
   - **3f. Scope the first project** in the sequence with steps 4 to 6, asking only what its stub
     leaves open. The rest stay stubs.

   **Done when** every agreed project is on the board at its agreed status and `Due`, related to the
   initiative, ten headings read back; every source open question sits on exactly one project or is
   named initiative-level; and the first project is fully scoped.
4. **Interview, one question at a time.** Draft every section silently first; walk the gaps
   depth-first. Each question is one question, carries a recommendation and its reason (citing the
   `DEC-n`, `LRN-n` or `INS-n` behind it), and flags any Active Decision it would breach. An unanswered
   question goes to `Open questions` with an owner, a date and the work it blocks; one that blocks
   nothing is dropped or moved into `Scope`. Agree the project's `Due` as one question once the
   outcome is settled, with its derivation; on an existing project ask only where `Due` is blank,
   past, or later than the initiative's `Target date`. A choice that binds beyond the project is routed
   through `capture-decision` and cited by `DEC-n`. **Done when** every section can be written from a
   read or an answer, the `Due` is agreed or left blank by rule, and every unknown is an open question
   with owner, date and blocked work.
5. **Write the ten sections.** Show the full draft and wait for a yes, then write explicit `heading_2`
   blocks in contract order. On an existing body in another shape, restructure into the ten keeping
   every fact; leave everything below the ten untouched. **Done when** the read-back shows all ten
   headings verbatim and in order and nothing that was on the page is missing.
6. **File the properties.**

   | Field | Existing project | Loose idea (new) | From a split |
   |---|---|---|---|
   | `Initiative` | set if blank | the initiative it serves, never the nearest plausible row; blank and reported where none fits | the initiative from 3a |
   | `Status` | unchanged unless the user asks (WIP check) | `Idea` unless the user asks (WIP check) | as agreed in 3d |
   | `Due` | as agreed in step 4, else unchanged | blank unless the Plan places it and the user agrees | as agreed in 3d |
   | `Owned by`, `Priority` | unchanged | as the user says, else blank | as the user says, else blank |

   **Deviation:** no `Type`, `Sprint` or legacy assignee fields. `to-projects` never cuts tasks
   (`to-tasks` does). **Done when** the project reads back with its `PRJ-n`, `Initiative`, `Status`
   and `Due` as the table says.
7. **Report**: the `PRJ-n` (created or rewritten), its status, `Due` and initiative; every open
   question with owner, date and blocked work; every `DEC-n` logged; the next move (`to-tasks`). Name
   as a risk any `Due` past the initiative's `Target date` and any left blank. After a split, a table in
   sequence order: `PRJ-n`, title, status, `Due`, depends on, open-question count, marking the one
   fully scoped. **Done when** nothing proposed and unwritten and no open question is missing from the
   report.

### 7.3 `to-tasks` (source: "cut a project into tasks")

A task is **slim**: what to do, when it is done, what blocks it. A task that restates the audience,
the offer or the surfaces is the duplication this design removes, and a task that needs a fact the
project does not carry is a gap in the project, not something to fill in here.

1. **Resolve the project and check it can be cut.** A `PRJ-n` or link is the project; a `TSK-n` is
   not (say so, name its `Project`, stop). `Done` or `Archived` → refuse. Any other status → cut.
   **Deviation:** the source refused anything short of `Prioritised`. **Read the project page and only
   the project page** (the `to-tasks` row of `context-load.md`); do not rerun the five reads. If the
   page lacks any of the ten headings verbatim, it is old-layout: name the missing headings, send it
   to `to-projects`, stop. **Done when** the output names the `PRJ-n`, its status, its `Due`, and
   either why it stops or that all ten headings are present.
2. **Draft the cut**, from the project's sections, `Open questions` and `Surfaces and access` above
   all:
   - Each piece of work the `Approach`, `Scope` and `Surfaces and access` call for, that one person or
     one cold run can finish and check, is a task. It names an exact object only where it narrows the
     project's.
   - **`What to do`**: the action plus only a parameter that overrides the project's. A parameter the
     project does not carry is reported as a gap for `to-projects`, and the task is marked blocked on
     it.
   - **`Done when`**: the check for this task alone.
   - **`Blocked by`**: map every open question to the tasks doing the work it blocks, named by its
     wording on the project; every other task `None`. Cut the blocked tasks too. An open question
     mapping to no task, or lacking an owner or date, is reported as a gap.
   - **A task waiting on another task** names it under `Blocked by` (by title while drafting, by
     `TSK-n` once created), only where it truly gates it, inside this project. Never fold a task
     dependency into an open question's wording.
   - **`Runs as`**: Claude where a cold run can build it to draft and leave it at `To review`; Person
     for a sign-off, an approval, offline work, or an account Claude cannot reach. A task with both
     halves is two tasks.
   - **Experiments**: where the project's `Approach` calls for a test, cut it as a Task of `Type`
     Experiment and scope it by section 6 (hypothesis, Test KPI, Lever, ICE, the doc). **Deviation:**
     new in this repo; the source scoped experiments as projects.
   - **`Due`**: schedule every task back from the project's `Due` along the `Blocked by` chain
     (section 4), noting each derivation. To batch a sign-off, read the approver's open `Runs as`
     Person tasks due that week. A project with no `Due`, or a lapsed one, is a gap: propose one from
     the initiative's `Target date` and `Plan`, and write it on the project only on the yes.

   **Match before write.** Match each drafted task against the project's existing non-archived tasks on
   the work:

   | Existing task | What happens |
   |---|---|
   | matches, at `To review` or `Done` | left untouched; listed in `## Tasks` |
   | matches, any other status | updated in place keeping its `TSK-n`: body rewritten to the contract, `Runs as` set, `Due` re-proposed where blank, past or out of line |
   | matches nothing drafted | left untouched and reported; archiving it is a person's call |

   **Done when** every drafted task has its sections, a `Runs as` and a proposed `Due`, every open
   question is mapped or reported, and every existing task has a row in the match table.
3. **Propose, then write.** Show the whole cut, new and updated alike, each with its sections,
   `Runs as`, proposed `Due`, what it was (where it changes), and the `TSK-n` it updates (or "new"),
   plus the gaps. Show every task's date in one table in the order the work runs, and name any sitting
   carrying three or more sign-offs as a risk. A dependency cycle is never proposed. Wait for a yes; the
   yes agrees the dates as well as the cut, and a date the user moves is written as moved. Then write
   each task's properties:

   | Field | Value |
   |---|---|
   | `Type` | Task, or Experiment |
   | `Project` | the project |
   | `Initiative` | blank: set directly only on a Task with no Project |
   | `Runs as` | as drafted |
   | `Status` | new: `Idea` under a project at `Idea`, else `Not started` (Ready), unless the user says otherwise (WIP check on Ready only where it applies); updated: unchanged |
   | `Assigned to` | the project's owner, unless the project names someone else for this task (an approver, an open question's owner) |
   | `Due` | as agreed |
   | `Outcome` | never written by this skill |

   **Deviation:** the source wrote `Initiative` on every task and new tasks at `Prioritised`; here the
   `Initiative` relation is set only on a Task with no Project (`notion-schema.md`), and new tasks
   follow the project's status. Write each body as explicit `heading_2` blocks headed as the task
   contract spells them. **Create first, then link**: create every new task, then write each
   `Blocked by` that names a task with its real `TSK-n`. **Done when** every task reads back with its
   `TSK-n`, `Type`, `Project`, `Runs as`, agreed `Due` and its headings verbatim, and every task under
   a `Blocked by` is a `TSK-n` under this project.
4. **Append `## Tasks` to the project**: an explicit `heading_2`, then one `to_do` block per task in
   the order the work runs, each line **a page mention of the task** (a link, not a bare ID), then
   `Runs as`, its `Due` and, for a blocked task, `blocked by:` and what it waits on (questions by
   wording, tasks as mentions). Tick tasks already at `To review` or `Done`, so a re-cut never unticks
   built work. Place it below the ten sections (and any experiment doc), above any `## Close-out` or
   `## Feedback`. On a re-run, **replace** the section rather than adding a second. Touch nothing else.
   **Done when** `## Tasks` appears exactly once, in place, one working link per task, and the ten
   sections above are unchanged.
5. **Report**: the project and its `Due`, then each task by `TSK-n` (new or updated, `Runs as`,
   `Due`, what blocks it), the existing tasks left untouched and why, every gap for `to-projects`, and
   the next move: `do-task` on the first unblocked Ready task, the owners of the open questions holding
   the rest, and the Person tasks others wait on. **Done when** nothing proposed and unwritten, no
   blocked task and no gap is missing from the report.
