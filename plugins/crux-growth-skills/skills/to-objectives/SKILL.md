---
name: to-objectives
description: Agree the quarter's Objectives in the team's growth system. Use when the user asks to set, plan or agree the quarter's Objectives or growth direction, or to decide what to focus on next quarter. Use when the user asks to carry, close or drop last quarter's Objectives. Not for breaking an Objective into Initiatives, which is /to-initiatives. Needs the growth system in Notion; a Growth Brain is optional.
---

# Agree the quarter's Objectives

Leave the team with 1 to 3 Objectives for the quarter, each a row on Objectives grounded in the Growth
model's Weakest steps and in the team's Learnings, Insights and Issues, and the quarter's section on
the Strategy map page. Last quarter's Objectives are carried, closed or dropped first. The user sees
only the chat and their Notion, never this skill or its references: say what was found and what will
be written in plain words, and never name a file, a key or a tool.

This skill runs the `to-objectives` row of the Who runs what table in `references/context-load.md`:
all five reads, with read 5 replaced by last quarter's Objectives and their Initiatives. It runs
without a Growth Brain (ADR-0001). The terms Objective, Growth model, Strategy map, Key result,
Initiative, Carry, Context load and Settings page are those of `references/growth-system-glossary.md`;
the quarter, Last quarter's Objectives, Cold start, Rate, Comparison, Estimated, Weakest step,
Altitude test, Candidate Initiative, Round, Frontier and Brain line are those of
`references/glossary.md`. Use them as written. `references/notion-schema.md` is the one home of every
property and of "Finding the system"; `references/objectives-layout.md` fixes what step 8 writes;
`references/growth-model.md` is step 5's method. Every Notion action here is a capability (search,
fetch a page, query with a filter, create a page, update a page, insert page content): use whichever
tool in the session does it, and read every database by a filter, never through a saved view.

## 1. Find the system

Serves the principle Stay agile: every run starts from the system as it is now.

Check that the session can search Notion. Without it, stop and say, in plain words, that this runs on
the team's own Notion: add the Notion connector in the app's connector settings, give it access to the
workspace, then ask again. Then run "Finding the system" in `references/notion-schema.md`. Stop with
its message where it stops: no system, or a `schema_version` below 2, or a setup in progress, each
sending the user to `/setup-growth-system`. Make no other Notion call before it has passed.

**Done when** the lookup has returned the Settings page's values, or the skill has stopped with its
message and made no other Notion call.

## 2. Load the context

Serves the principles Balance art and science and Maximise learning: the user can judge the context
behind the draft, and the draft starts from what the team already learned.

Run the context load in `references/context-load.md`, all five reads, with read 5 replaced as the
`to-objectives` row says: query Objectives with `Status` Active, then each one's Initiatives by its
`Initiatives` relation (pass 1: title, `ID`, `Status`; pass 2 opens each Initiative's `Key result` and
`Target`). Every lever and channel is in play before the Weakest steps are known, so pass 2 of reads 2
to 4 opens the rows that are on any lever; when step 5 names the Weakest steps, open any further row
on them. Name what each read showed, empty reads included, as obligation 1 says.

Settle the quarter in the same message. Take it from the user's request; with none named, propose the
one the glossary gives and word the question so "yes" accepts it, and wait for the answer. Write it as
`2027 Q1`.

**Done when** the message names all five reads with their counts and what was opened, and states the
quarter (agreed, where it was proposed).

## 3. Close last quarter first

Serves the principle Stay agile: a quarter's plan changes in the open, on one row with its history.

Skip this step when no Active Objective lacks the quarter in `Quarter`, and say so. Otherwise show
each of Last quarter's Objectives with its `Quarter`, its `Why` and its Initiatives' `Status`, `Key
result` and `Target`, and propose, one recommendation each, worded so "yes" accepts it:

- **Carry**: add the quarter to `Quarter`, keeping its earlier quarters. Recommend it where its
  Initiatives are still on track or its Weakest step is still weak.
- **Done**: set `Status` to Done. Recommend it where its Initiatives are done and its step recovered.
- **Dropped**: set `Status` to Dropped and add the line the layout gives to `Why`. Ask for the reason
  where the user has not given one.

Wait for the user's answer. Carried Objectives, and Active Objectives that already hold the quarter,
count toward the 1 to 3: where they already number three, no new Objective is drafted, and where they
number more than three, ask which to close. Initiatives under a closed Objective are left as they
are; `/to-initiatives` reviews them. Nothing is written yet: the answers are held for step 8.

**Done when** each of Last quarter's Objectives carries the user's Carry, Done or Dropped, and the
number of Objectives still to draft (3 minus those carried or already on the quarter) is stated.

## 4. Cold start

Serves the principle Maximise learning: a first plan starts from everything the team already knows.

Skip this step unless Learnings, Insights and Last quarter's Objectives all came back empty in step 2.
Then ask once, in one message, for any context there is: reviews, survey results, customer research,
last plan, known problems, with a page link or a pasted text for each. Say that "nothing" is a fine
answer. Digest what comes back into notes that cite their source, and wait for no second ask: where
it is "nothing", the run goes on and the Objectives rest on the Growth model alone, which step 7
says.

**Done when** the user has been asked once and answered, and what they supplied is digested into
sourced notes, or the step was skipped.

## 5. Build the Growth model

Serves the principle Seek impact: the Weakest steps are where effort pays most.

Follow `references/growth-model.md`: the ecommerce default (sessions, first orders, returning customer
orders, with order value beside it) with its rates computed from the Growth Brain for
the last 90 days against the 90 before where the session has one, otherwise the team's own steps and
rates with any missing rate marked Estimated and the Brain line said once. Show the Growth model as a
table (step, rate, now, Comparison) and name the Weakest steps, at most three, each with its reason.
Ask the user to confirm the chain and the Weakest steps, with a recommendation worded so "yes"
accepts it.

**Done when** every step of the chain shows a rate, a Comparison or the words "No data" or
"estimated", the Weakest steps are named and the user has confirmed or changed them.

## 6. Draft

Serves the principle Seek impact: the few directions worth a quarter, chosen on evidence.

Draft the Objectives still to be drafted (step 3's number), at least one where none are carried. Each
has the phrase for its `Objective`, the Weakest step it answers, the `Why`, a proposed owner, and the
evidence it rests on: each `LRN-n`, `INS-n` and `ISS-n` cited by `ID` and title, or the team-supplied
context from step 4. Where the evidence for a draft is thin, say so on it and do not invent a citation.

Apply the Altitude test to each draft. A direction such as "focus on retention" or "improve order
value" passes where 3 to 5 Initiatives on different steps could serve it. A draft one metric would
settle fails: propose it as a Candidate Initiative under the Objective it would serve instead.

**Done when** every draft passes the Altitude test, names its Weakest step and cites its evidence, and
the carried and drafted Objectives together number 1 to 3.

## 7. Grill

Serves the principle Stay agile: a Decision is flagged, never worked around.

Grill the draft in Rounds. Each Round is numbered questions, each with a recommendation worded so
"yes" accepts it ("just write it" accepts every remaining one), then the skill waits. Cover, in order
of what is open: the direction and wording of each Objective, the owner, whether the number of
Objectives is right for the team's capacity, the Weakest step each answers, and each Candidate
Initiative. Run the second obligation of `references/context-load.md` against every Active Decision
and put any breach to the user in its Round before going on. Fold the answers into the draft and
repeat until the Frontier is empty.

Close with a summary: the quarter; each Objective with owner, `Why`, evidence and Candidate
Initiatives; each carried, closed or dropped row with its change; the Growth model table; and, for a
Cold start with nothing supplied, that the Objectives rest on the Growth model alone. Say that nothing
is written until the user confirms, and write nothing until they do.

**Done when** the Frontier is empty, every Active Decision has been checked, and the user has
confirmed the summary in words ("yes", "write it").

## 8. Write

Serves the principle Maximise learning: the evidence goes on the row, so every later context load reads it.

Write on the confirmation, in this order, laid out as `references/objectives-layout.md` fixes:

1. **The updates agreed in step 3**: for each carried Objective add the quarter to `Quarter`; for each
   Done or Dropped one set `Status` (and the `Why` line for Dropped).
2. **New Objectives rows**: `Quarter`, `Status` Active, `Owned by`, `Why`, then the body as explicit
   `heading_2` blocks, because a markdown write drops headings.
3. **The Strategy map section**: insert the quarter's `## <quarter>` section at the top of the Strategy
   map page, above the newest existing section and touching no older block. Where the session cannot
   insert at a position, add it at the foot and say so in step 9. The page ID is `strategy_map_page`.

Read every row and the Strategy map page back. Check each property against the confirmed summary, each
body for its four headings in order, and the Strategy map for the new section's heading, table and
links with every older section unchanged. Where a write failed or a read-back differs, say which and
correct it, then read back again.

**Done when** every row reads back with its `OBJ-n`, `Quarter`, `Status`, `Owned by` and `Why`
as confirmed, every new body shows its four headings verbatim, and the Strategy map shows the new
section with every older block as it was.

## 9. Report

Tell the user, in the chat: each Objective with its `OBJ-n`, owner and link; each carried, done or
dropped row; the Strategy map section's link; the Weakest steps; any Candidate Initiatives; any owner
who matched nobody; any section placed at the foot; and the Initiatives left under closed Objectives.
Then point at `/to-initiatives` as the next step, which breaks each Objective into 3 to 5 Initiatives.

**Done when** the message carries every item above that applies and names `/to-initiatives`.
