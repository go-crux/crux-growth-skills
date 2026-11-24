---
name: to-initiatives
description: Break the quarter's Objectives into Initiatives in the team's growth system. Use when the user asks to break the quarter's Objectives into Initiatives, set Key results and targets, or plan the workstreams for a quarter. Use when the user asks to carry, close or drop last quarter's Initiatives, or to re-run the quarter's plan and see what changed. Not for agreeing the Objectives, which is /to-objectives, or for scoping a Project, which is /to-projects. Needs the growth system in Notion; a Growth Brain is optional.
---

# Break the quarter's Objectives into Initiatives

Leave the team with 3 to 5 Initiatives for each of the quarter's Objectives, each a row on Initiatives with
a Key result, a Target, an owner and a page body its Projects inherit. Last quarter's Initiatives are
carried, closed or dropped first, and a second run over the same plan reports every row Unchanged. The
user sees only the chat and their Notion, never this skill or its references: say what was found and what
will be written in plain words, and never name a file, a key or a tool.

This skill runs the `to-initiatives` row of the Who runs what table in `references/context-load.md`: all
five reads. It runs without a Growth Brain (ADR-0001). The terms Objective, Initiative, Key result,
Growth model, Strategy map, Project, Carry, Decision, Context load and Settings page are those of
`references/growth-system-glossary.md`; the quarter, the quarter's Objectives, Carried Objective, Carry
review, Dropped Initiative, Live row, Weakest step, Candidate Initiative, Level test, Named gap, Class,
Rename, Round and Frontier are those of `references/glossary.md`. Use them as written.
`references/notion-schema.md` is the one home of every property and of "Finding the system";
`references/initiatives-layout.md` fixes how step 6 writes a row; `references/initiative-contract.md`
fixes the page body. Every Notion action here is a capability (search, fetch a page, query with a filter,
create a page, update a page, insert page content): use whichever tool in the session does it, and read
every database by a filter, never through a saved view.

## 1. Find the system and load the context

Serves the principles Stay agile and Balance art and science: every run starts from the system as it is
now, and the user can judge the context behind the draft.

Check that the session can search Notion. Without it, stop and say, in plain words, that this runs on the
team's own Notion: add the Notion connector in the app's connector settings, give it access to the
workspace, then ask again. Then run "Finding the system" in `references/notion-schema.md`. Stop with its
message where it stops: no system, or a `schema_version` below 2, or a setup in progress, each sending the
user to `/setup-growth-system`. Make no other Notion call before it has passed.

Settle the quarter from the user's request, written `2027 Q1`. With none named, propose the quarter the
newest Active Objective holds, worded so "yes" accepts it, and wait for the answer. Query Objectives with
`Status` Active whose `Quarter` holds it; those are the quarter's Objectives. Where none exist, stop and
say that `/to-objectives` agrees them first.

Run the context load in `references/context-load.md`, all five reads. The subject is the quarter's
Objectives: pass 2 of reads 2 to 4 opens the rows on any lever or channel their titles and `Why` name.
Read 5 is Initiatives with `Status` not Done: pass 1 asks for the title, `ID`, `Status`, `Quarter` and
`Objective`; pass 2 opens each one that is under one of the quarter's Objectives, and its `Key result`,
`Target`, `Target unit`, `Target date`, `Why` and `Owned by` are the before state for step 5. Initiatives
on other quarters are history: count them and open none in full. Name what each read showed, empty reads
included, as obligation 1 says.

**Done when** the message names all five reads with their counts and what was opened, and states the
quarter (agreed, where it was proposed), or the skill has stopped with its message.

## 2. Read the plan

Serves the principle Seek impact: Initiatives are picked from the steps that are weakest, so the plan is
read first.

Open each of the quarter's Objectives in full: its `Why`, its owner and its page body. Open the quarter's
`## <quarter>` section of the Strategy map page (`strategy_map_page`): the Growth model snapshot, the
Weakest steps and each Objective's Candidate Initiatives. Where the section is missing, take the Weakest
steps from each Objective's `Weak steps` heading and say so. Open further Learnings, Insights and Issues
that are on a Weakest step. Any plan document the user hands over, a page link or pasted text, is
supporting evidence: digest it into notes that cite their source, and treat it as a reason for a draft,
never as a draft already agreed. Count Objectives on other quarters; read none.

**Done when** the message names the quarter, each of its Objectives by `OBJ-n` and title, the Strategy map
section read (or the fallback said), and each Weakest step.

## 3. Carry review

Serves the principle Stay agile: a quarter's plan changes in the open, on one row with its history.

Skip this step when no Initiative needs it, and say so. It applies to every Initiative at a `Status` other
than Done whose `Quarter` does not hold the quarter and which sits under either a Carried Objective or an
Objective that is no longer Active. Show each with its `Status`, `Key result` and `Target`, and propose,
one recommendation each, worded so "yes" accepts it:

- **Carry**: add the quarter to `Quarter`, keeping its earlier quarters, and keep its `Target date`
  unless the user moves it. Recommend it where it is On track and its Weakest step is still weak. An
  Initiative under an Objective that is no longer Active is Carried only after the user names the
  Objective in this quarter's plan that now serves it, and its `Objective` is then changed to that one.
- **Done**: set `Status` to Done. Recommend it where the Key result was met.
- **Dropped**: a Dropped Initiative, per `references/glossary.md`. Ask for the reason where the user has
  not given one.

Wait for the user's answer. A Carried Initiative counts toward its Objective's 3 to 5 in step 4. Nothing
is written yet: the answers are held for step 6.

**Done when** every Initiative this step applies to carries the user's Carry, Done or Dropped, or the
step was skipped with the reason said.

## 4. Propose the Initiatives

Serves the principle Seek impact: a few workstreams, each aimed at a step where effort pays most.

Count each Objective's Initiatives first: its live rows from step 1 and the Carried ones from step 3.
Those stand as they are and count toward its 3 to 5. Draft new Initiatives only for the shortfall below 3,
and offer a fourth or fifth where a Weakest step or a Candidate Initiative is not yet served. An Objective
with 3 to 5 already gets no new draft.

Each draft is one workstream with one owner and one outcome. Two owners, or two outcomes judged
separately, is two Initiatives; a goal stated only as a step towards another is part of that Initiative;
a standing commitment with no outcome to move is not an Initiative (it is standing Tasks). Draft from each
Objective's Weakest steps and its Candidate Initiatives, one Weakest step to at least one Initiative, and
fill each field as `references/initiatives-layout.md` sets it: `Initiative`, `Objective`, `Key result`,
`Target`, `Target unit`, `Target date`, `Quarter`, `Why`, `Owned by` and `Status` On track. A baseline for
the Key result comes from the Growth model snapshot or the Objective's evidence, cited. A field with no
source is a Named gap, put to the user in the grill, never filled in.

Grill the draft in Rounds. Each Round is numbered questions, each with a recommendation worded so "yes"
accepts it ("just write it" accepts every remaining one), then the skill waits. Cover, in order of what is
open: the Named gaps, each Key result's Target and date, each owner, whether an Initiative should be split
or merged, and the number per Objective. Run the second obligation of `references/context-load.md`
against every Active Decision and put any breach to the user in its Round before going on. Fold the
answers in and repeat until the Frontier is empty. The user may change or close an existing live row in
the same Rounds; closing is Done or Dropped as in step 3.

**Done when** every Objective has 3 to 5 agreed Initiatives (live and Carried rows counted), every field
is sourced or a Named gap the user has answered, every Active Decision has been checked, and the Frontier
is empty.

## 5. Match before write

Serves the principle Stay agile: the plan changes in the open, so a re-run reads what is there before it
writes.

Put each agreed Initiative, and each live row on the quarter, in a Class. A title is the join key, matched
exactly:

| Class | What it is | What happens |
|---|---|---|
| **New** | an agreed Initiative with no live row of the same title | created on the user's yes |
| **Unchanged** | matched, and no field differs | reported, nothing written |
| **Changed** | matched, and a field differs | a blank field is filled on the yes; a field the row carries waits, shown as what it says now and what it would say |
| **Unsourced** | a live row on the quarter that none of the quarter's Objectives covers: its `Objective` is blank, or is not one of them | reported and left alone, never archived |

An agreed Initiative with no row of its title that covers the same work as a live row (the same
Objective and the same Key result or Weakest step) is a Rename: show the old and new title and ask. On
the user's yes it is a Changed row with `Initiative` among its fields; otherwise it is New. A different
title is never applied silently. An update never re-keys: the `INI-n` is the row's for life. `Status` is
not compared: an existing row's `Status` is never changed here.

Show every Initiative with its Class and `INI-n` (New ones have none yet), each Changed field before and
after, the Unsourced rows, and the Carry review answers from step 3 still to write. Ask for one yes for
the New rows, the blank fields and the Carry review answers, and for the user's answer on each Changed
field that waits. Nothing is written until they answer.

**Done when** every agreed Initiative and every live row on the quarter carries a Class, each matched row
is named by its `INI-n`, and the user has answered the proposal in words ("yes", "write it").

## 6. Write the rows and the bodies

Serves the principle Maximise learning: the plan goes on the row and the page, so every later context load
and every Project reads it.

Write on the answers, in this order, as `references/initiatives-layout.md` fixes:

1. **The step 3 updates**: Carry adds the quarter to `Quarter` (and sets a new `Target date` or `Objective`
   only where the user said); Done sets `Status`; Dropped sets `Status` to Done and adds the `Why` line.
2. **New rows**: every field from the agreed answers, `Status` On track. `Owned by` is a workspace member;
   one who matches nobody is reported and left blank, never guessed. Reuse an existing `Quarter` option
   before adding one.
3. **Changed rows**: the blank fields, and each changed field the user confirmed. A field the user left
   waiting is not written.
4. **Each Initiative's page body**, to `references/initiative-contract.md`: all six sections as explicit
   `heading_2` blocks, because a markdown write drops headings, drafted from the Objective, the context
   load, the Strategy map section and any source handed over, holding to the Level test. A blank body is
   written whole on the yes. A body with anything on it is proposed section by section and changes on the
   user's confirmation only, every fact already there kept in its nearest section. An Unchanged row whose
   body already holds all six headings is not redrafted.

Where a property to be written is not in the schema, report it and write nothing partial on that row. Never
write the `Projects` or `Tasks` relations: a Project relates itself to the Initiative it serves. Read every
row and body back. Check each property against the agreed answers and each body for its six headings,
verbatim and in order. Where a write failed or a read-back differs, say which and correct it, then read
back again.

**Done when** every row reads back with its `INI-n` and every field as agreed, every written body shows all
six headings verbatim and in order, and each field or section left waiting is named.

## 7. Report

Tell the user, in the chat, for each Initiative: its `INI-n`, link and Class, what was written, and what is
still proposed and waiting. Add the Initiatives carried, done or dropped; the Unsourced rows, left alone;
any owner who matched nobody; the Named gaps still open; each Plan row marked `Not filed`, as a candidate
stub Project for `/to-projects`; and each Decision found in a source or the grill that is not yet on
Decisions, as a candidate to log. Then point at `/to-projects` as the next step, on the first Project in a
Plan.

**Done when** every Initiative and every live row on the quarter appears with its Class, nothing is
dropped silently, and the message names `/to-projects`.
