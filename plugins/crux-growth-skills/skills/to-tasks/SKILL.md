---
name: to-tasks
description: Cut a Project into Tasks and Experiments in the team's growth system. Use when the user asks to cut a Project into Tasks, break a Project down, plan or schedule the work of a Project, or turn a scoped Project into a board of work. Use when the user asks to scope an Experiment, write its hypothesis or score it on ICE. Use when the user asks to re-cut a Project after its scope changed. Not for scoping the Project itself, which is /to-projects. Needs the growth system in Notion; a Growth Brain is optional.
---

# Cut a Project into Tasks

Leave the team with every piece of a scoped Project's work as a slim Task, or a fully scoped Experiment, on
Tasks: each with what to do, when it is done, what blocks it, who runs it and a `Due` scheduled back from the
Project's, and a `## Tasks` checklist on the Project page that lists them in the order the work runs. A second
run over an unchanged Project writes nothing new. The user sees only the chat and their Notion, never this
skill or its references: say what was found and what will be written in plain words, and never name a file, a
key or a tool.

This skill runs the `to-tasks` row of the Who runs what table in `references/context-load.md`: the Project
only. It reads no other page except where a step names one. It runs without a Growth Brain (ADR-0001). The
terms Project, Task, Experiment, Initiative, Ready, WIP limit, Decision, Learning, Context load and Settings
page are those of `references/growth-system-glossary.md`; Cut, Drafted Task, Matched Task, Unmatched Task,
Gap, Blocker, Run order, Verdict date, Sitting and Question are those of `references/glossary.md`. Use them as
written. `references/notion-schema.md` is the one home of every property and of "Finding the system";
`references/project-contract.md` fixes the ten sections, the Task contract, the lifecycle and the Dates
rules; `references/wip-limits.md` is the check before a Task moves into a counted state;
`references/experiment-scoping.md` fixes an Experiment; `references/tasks-layout.md` fixes what steps 4 to 7
write and show. Every Notion action here is a capability (search, fetch a page, query with a filter, create a
page, update a page, insert page content): use whichever tool in the session does it, and read every database
by a filter, never through a saved view.

A Task is slim: what to do, when it is done, what blocks it. A Task that restates the audience, the offer or
the Surfaces duplicates the Project. A Task that needs a fact the Project does not carry exposes a Gap in the
Project, and the fix is made in `/to-projects`, never invented here.

## 1. Find the system and resolve the Project

Serves the principle Stay agile: every run starts from the system as it is now, and a re-cut changes only
what the Project's scope changed.

Check that the session can search Notion. Without it, stop and say, in plain words, that this runs on the
team's own Notion: add the Notion connector in the app's connector settings, give it access to the workspace,
then ask again. Then run "Finding the system" in `references/notion-schema.md`. Stop with its message where
it stops: no system, or a `schema_version` below 2, or a setup in progress, each sending the user to
`/setup-growth-system`. Make no other Notion call before it has passed.

Resolve what the user handed over:

- **A Project `ID` or a link**: that Project.
- **A Task `ID` or link**: a Task is not a Project. Say so, name the Project the Task hangs from, and stop.
- **A Project named in words**: query Projects with `Status` not Archived and match the words against titles.
  One match is that Project, and the user confirms it; several, or none, and the user chooses or sends
  `/to-projects`.

Read the Project page, and only that page. Read its `Status`, `Due`, `Owned by` and `Initiative`, and check
its body for the ten headings of `references/project-contract.md`, verbatim:

- `Done` or `Archived`: say so and stop. Nothing is written.
- Any heading missing: name each missing heading, say the Project is on the old layout and goes to
  `/to-projects` first, and stop. Nothing is written.
- Otherwise: cut, at any other `Status` (`Idea`, `Prioritised` or `In progress`).

**Done when** the message names the Project by `ID`, its `Status`, its `Due` (or says it is blank), and
either why the run stops (with the missing headings named) or that all ten headings are present. Nothing has
been written.

## 2. Draft the Cut

Serves the principles Stay agile and Seek impact: the work is cut to what one person or one cold run can
finish and check, and the Experiments are scoped before they are scored.

Draft every Task silently from the Project's sections first, `Approach`, `Scope`, `Surfaces and access` and
`Open questions` above all, and ask only about what the Project leaves open. Facts are this skill's to find in
the Project; only decisions go to the user.

1. **One Task per piece of work** the `Approach`, `Scope` and `Surfaces and access` call for that one person
   or one cold run can finish and check. A title is an action. It names an exact object only where that
   narrows the Project's.
2. **`What to do`** holds the action and only a parameter that overrides the Project's. Where the Project
   does not carry a parameter the Task needs, record a Gap for `/to-projects` and mark the Task blocked on it.
3. **`Done when`** is the check for this Task alone.
4. **`Blocked by`**, one entry per line, or `None`:
   - Map every Open question on the Project to the Tasks doing the work it blocks, each by the question's
     wording on the Project. Cut the blocked Tasks too. An Open question that maps to no Task, or lacks an
     owner or a date, is a Gap.
   - A Task that cannot start until another Task under this Project has finished names it, by its title while
     drafting. Name only a Task that truly gates it, never every Task above it, and never a Task in another
     Project. Never fold a Task dependency into an Open question's wording.
5. **`Runs as`**: Claude where a cold run can build it to draft and leave it at `To review`; Person for a
   sign-off, an approval, offline work or an account Claude cannot reach. A piece of work with both halves
   is two Tasks, the Person one blocked by the Claude one or the other way round.
6. **Experiments**: where the `Approach` calls for a test, cut it as a Task of `Type` Experiment and scope it
   by `references/experiment-scoping.md`: settle the variants, the primary KPI and the baseline from the
   Project, and ask the user a Question, one at a time with a recommendation, for only what the Project
   leaves open. Score `Impact`, `Confidence` and `Ease`, with Confidence taken from the Learnings the
   Project's `Why` cites. Write the hypothesis, `Test KPI`, `Lever` and the experiment doc, and check its
   claims. An Experiment's body is the experiment doc, then `Done when` and `Blocked by`. A Question the user
   leaves unanswered becomes a flagged unknown in the doc, never a filled one.
7. **`Due`**: schedule every Task back from the Project's `Due` along the `Blocked by` chain by the Dates
   rules in `references/project-contract.md`, noting each derivation: a Task is due before every Task that
   names it, and on or before the Project's `Due`; an Experiment's `Due` is its Verdict date; a post-launch
   read is due on the read's date; no `Due` is in the past or on a weekend; a Person sign-off is due at
   least a working day after the work it approves. To share a Sitting, query the approver's open Person
   Tasks on Tasks (`Runs as` Person, their `Assigned to`, `Status` not Done or Archived, `Due` in that
   week) and put the sign-off on the same date where the lead time and the Project's `Due` allow.
   Where the Project's `Due` is blank or lapsed, that is a Gap: open the Project's Initiative, propose a
   `Due` from its `Target date` and `Plan`, and write it on the Project, and only its `Due`, on the user's
   yes. Where the Cut cannot fit before the Project's `Due`, say so, propose the realistic date and name it
   as a risk. Where a new `Due` overtakes the KPI date in `Outcome`, name that as a Gap for `/to-projects`.

**Done when** every Drafted Task has its sections, a `Runs as` and a proposed `Due`, every Experiment is
scoped to the done-when of `references/experiment-scoping.md`, every Open question on the Project is mapped
or reported, and every Gap is listed with the work it affects.

## 3. Match before write

Serves the principle Stay agile: a re-cut updates the board in place and never files a duplicate.

Query the Tasks whose `Project` is this one and whose `Status` is not Archived, and
match each Drafted Task against them on the work, not the wording:

| Existing Task | What happens |
|---|---|
| matches a Drafted Task, at `To review` or `Done` | left untouched, and listed in `## Tasks` |
| matches a Drafted Task, any other `Status` | updated in place, keeping its `ID`: body rewritten to the contract, `Runs as` set, `Due` re-proposed where blank, past or out of line |
| matches nothing drafted | an Unmatched Task: left as it is and reported; archiving it is the user's call |

**Done when** every existing Task under the Project has a row in the match table, every Drafted Task is marked
new or matched to one `ID`, and no two Drafted Tasks match the same existing Task.

## 4. Propose the Cut and the dates

Serves the principles Balance art and science and Stay agile: the user sees every Task, every date and every
gap before anything changes.

Put the Cut in Run order and trace every `Blocked by` chain. A dependency cycle (A waits on B and B on A) is
never proposed: break it by merging the two Tasks or by dropping the Blocker that does not truly gate, and say
which. Then show the whole Cut as the one table in `references/tasks-layout.md`, in Run order, new and updated alike, with
each date's derivation, then the Unmatched Tasks, the Gaps and the risks. Show each Experiment's hypothesis,
score and Verdict date under the table. Name any Sitting carrying three or more sign-offs as a risk. State
the `Status` each new Task will take: `Idea` under a Project at `Idea`, otherwise `Not started` (Ready).

Run the check in `references/wip-limits.md` before proposing a `Status`: Ready counts toward neither limit,
so a Cut at Ready passes with nothing to say. Where the user asks for any Task to start at `In progress`,
count that person's In progress Tasks, together with every such Task in this Cut, and where the move would
pass the limit, say so in this same message with the count and the cards already there.

Wait for the user's yes. The yes agrees the Cut, the dates and any move past a limit, and a date the user
moves is written as moved. "Just write it" accepts all of it as proposed.

**Done when** the Run order has no cycle, every Task named under a `Blocked by` is another Task under this
Project or an Open question on it, every Task of the Cut and every date has been shown, and the user's answer is recorded: written
as proposed, written as changed, or not written.

## 5. Write the Tasks

Serves the principle Stay agile: one write makes the board and the Project agree.

Write on the yes, in this order:

1. **Create every new Task first**, with the properties in `references/tasks-layout.md`: `Type`, `Project`,
   `Runs as`, `Assigned to`, `Due` and `Status`, and for an Experiment its experiment properties. Leave
   `Initiative` blank, because it is set only on a Task with no Project, and never write `Outcome`. Where a
   property to be written is not in the schema, report it and write nothing partial.
2. **Write each body** as explicit `heading_2` blocks, because a markdown write drops headings, headed as the
   Task contract spells them, with paragraph and list blocks beneath. An Experiment's `###` lines are
   `heading_3` blocks.
3. **Then write every `Blocked by` that names a Task**, with the real `ID` read back from the Task it names,
   and update each Matched Task in place the same way.

Where the user agreed a new `Due` for the Project, write that one property on the Project. Read every Task
written back.

**Done when** every Task reads back with its `ID`, `Type`, `Project`, `Runs as`, agreed `Due` and its
headings verbatim; every entry under a `Blocked by` that names a Task is the `ID` of a Task under this
Project; and every Task left untouched is as it was.

## 6. Write the `## Tasks` checklist

Serves the principle Stay agile: the Project page shows the work in the order it runs.

Append `## Tasks` to the Project page, or replace it where one is already there, as
`references/tasks-layout.md` sets out: an explicit `heading_2`, then one `to_do` block per Task, in Run
order, each a page mention of the Task with its `Runs as`, `Due` and what blocks it, ticked at `To review`
or `Done`. Place it below the ten sections and anything left below them, above any `## Close-out` or
`## Feedback`. Touch nothing else on the page. Read the page back.

**Done when** `## Tasks` appears exactly once and in place, with one working link per Task of the Cut and per
Unmatched Task, and the ten sections above it are unchanged.

## 7. Report

Serves the principle Maximise learning: what was cut and what is still open is on the board and in the chat.

Tell the user, in the chat, as `references/tasks-layout.md` sets out: the Project, then each Task by `ID`
(created, updated or untouched, `Runs as`, `Due`, what blocks it), the Unmatched Tasks and why they were left,
every Gap for `/to-projects`, the Open questions holding Tasks with their owners and dates, the Person Tasks
that others wait on, every risk and anything proposed and still waiting. Then the next move: `/do-task` on the
first Task that is unblocked and Ready. `/do-task` is coming: until it is installed, that Task is the one to
start by hand.

**Done when** nothing proposed and unwritten, no blocked Task and no Gap is missing from the message, and it
names the next move.
