---
name: diagnose-performance
description: Diagnose why a KPI moved between two periods. Use when someone asks why a KPI moved ("why did revenue drop last month", "what's driving CAC up"), to diagnose performance for a period, or to compare two periods and say what changed. Best on the brand's own Growth Brain; also works without one.
---

# Performance diagnosis

Produce the Performance diagnosis from the brand's own data: why the Success KPI moved between
the Current period and the Comparison period, as one HTML page with the seven headings
`references/diagnosis-layout.md` fixes. Run the nine steps in order. The user sees only the chat
and the page, never this skill or its references: say what the data showed, in plain words with
its figure, and never cite a file, a rule, a threshold or a cut-off. Every line the page needs has
its approved plain wording in `references/diagnosis-layout.md`; use it as written. The terms
Success KPI, Current period, Comparison period, Lever, Lever tree, Source, Contribution, Main
driver, Also large, Offset, Drill-down, Cause, Recommendation, Check-first, Brain line and
Performance diagnosis are those of `references/glossary.md`; use them as written.

## Unattended run

A run is unattended only on an explicit signal: the message says not to ask ("don't ask me
anything", "run it without questions"), or the run is a scheduled task or routine. A message that
names the Success KPI, both periods and the data is not on its own that signal: a person who
writes it is attended and follows step 2. An unattended run asks the user nothing, at any step,
and follows these five rules:

- Skip Intake's round and the Lever tree's confirmation, and still resolve the periods as step 2
  sets out; the tree is shown on the page only.
- With several Growth Brains, take the one the message names. If it names none, stop with one
  line in the chat naming the brains found, run no query and write no page; the first the
  session lists is never taken. With one, say in the Notes which it read.
- Ask for no export: a lever the named Source cannot read reads "No data".
- Set every Cause to "Not confirmed" and make every action check-first.
- Where step 3 stops with one line, stop with that line and write no page.

**Done when** no question was asked, every Cause reads "Not confirmed", every action is
check-first, and the page holds all seven headings (or the run stopped with its one line, for
several Growth Brains none named or at step 3).

## 1. Connect

Take the data from the first of these Sources that holds each lever:

1. **A Growth Brain**: a connector named `<Client> - Growth Brain` that offers `list_tables`,
   `list_metrics`, `search_examples` and `run_sql`. With several, ask which one (an unattended run
   follows the rule above). Call `list_tables` once with no arguments for the roster (`<client>` is
   the prefix it carries), then `search_examples` once, and keep what it returns for the queries in
   steps 4 and 6.
2. **Platform connectors** in the session: Shopify, GA4, Google Ads, Meta Ads.
3. **Files the user gives**: CSV exports or pasted figures.

Without a Growth Brain the diagnosis still runs, read from the connectors and files, and the
Brain line (`references/diagnosis-layout.md`) is said once on the page and once in the chat (a run
that stops at step 3 says it in the chat only).

**Probe only what could be a Source.** A connector that lists an account can still refuse every
performance read, so make one small read for each connector the run could use, and for no other,
before any Source is offered. The likely tree is the one for the Success KPI the first message
names, else the one step 2 recommends (`references/lever-trees.md`).

- **A Growth Brain whose roster holds the marts that tree reads** (One mart per tree, in
  `references/lever-trees.md`) leaves nothing for a connector to add: probe no connector, and
  offer none as a Source.
- **Otherwise probe a connector** only for a platform that a lever the Growth Brain does not hold
  needs (Shopify, GA4, Google Ads, Meta Ads), and only an account that is plainly the brand's
  own: named in the message, or the only account the connector lists. A listing that fails to
  load leaves no account known: the connector is not probed, and is named as a refusal below.
- **An account that cannot be told to be the brand's** is offered as a Source for no lever and
  is probed only after the ownership answer is in. An attended run asks whose it is in the intake
  round; on the answer that it is the brand's own, it makes the probe read below then, and
  reports a refusal in the tree confirmation message (step 3), since intake has passed; on any
  other answer it never reads the account. An unattended run names it in the Notes and skips it.

Make the probe read on the Comparison period as the first message names it, else as step 2
recommends it (the period before the last complete one; the final dates are set in step 2, and
the probe needs only a day inside it; an account probed after intake takes the Comparison period
as the round settled it): one figure for that period's first day, through
the tool step 4 will read it with (Shopify orders, GA4 sessions, Google Ads or Meta Ads cost; for
Google Ads its query tool, as `references/exports.md` sets out). An error or a refusal is a
refusal; a read that returns zero is not. A connector that refuses is named to the user, with
what it refused, in the intake message (an unattended run names it in the Notes), and is offered
as a Source for no lever. The Notes carry it in the wording of `references/diagnosis-layout.md`
for a refusal before any lever was assigned a Source.

Then settle two facts once, for every later step to reuse:

- **Timezone**: one **period timezone**, which settles today's date for relative periods (step 2),
  and the timezone each Source is read in, the same in both periods.
  - The period timezone is the Growth Brain's instructions where they name one; else the timezone
    the date descriptions of `<client>-orders` name (`list_tables` naming that mart). Where they
    say only that dates are the store's own timezone, it is the store's own with no name, and the
    date columns are read as they are with no conversion. Else UTC. Without a Growth Brain, it is
    the timezone of the Source that holds the Success KPI's total, or not known where that Source
    names none.
  - A mart is read in the timezone its own date descriptions name, else in the period timezone.
    An export is read in the timezone it names; where it names none, in the account timezone of
    the connector for that platform when one is in the session (`references/exports.md`); else
    none is known.
  - Dates are not converted between Sources. The Notes give the one timezone where every Source
    reads in it, and each Source's where they differ, in the wording of
    `references/diagnosis-layout.md`.
- **Currency**: the Growth Brain's instructions where they name it; else the first mart that
  names it, `<client>-orders` first (`list_tables`, one mart per call). Without a Growth Brain,
  the currency the files or connector report in. Where none states one, an attended run asks
  which in the intake message; an unattended run shows amounts with no symbol. Either way the
  Notes say so.

**Done when** the Sources in this session are named to the user in the intake message (an
unattended run has none, and names them in the Notes): the one Growth Brain chosen with its roster
in hand and `search_examples` called once, or none; the connectors the run could use, each with
one probe read (an account that needs the ownership answer is probed after step 2's round), and
any that refused, whose listing did not load or that could not be told to be the brand's named to
the user (an attended run asks about the latter in the intake round) and offered as no Source;
and the files the conversation already holds. The period timezone (named, the store's own, or not
known) and the currency are set.

## 2. Intake

An unattended run skips the round below. An attended run builds it on what the first message
already says: a question the message answers, in a name relative to today as much as in dates, is
stated as settled, with what was understood, and not asked. When the message answers all four
(the Success KPI, both periods and where the data comes from) and step 1 left no account whose
ownership is to be asked, nothing is left to ask: the round is skipped, the intake message states
the four as understood, and step 3 still confirms the tree and step 7 still asks the Cause round. Ask each open question with a recommendation, then wait
for the answer:

1. **Success KPI**: what figure are you judging performance on? Recommend the KPI the first
   message names; else CM3 with a Growth Brain whose orders carry margin; else net sales (or
   revenue), because CM3 needs margin and only a Source carrying cost of goods gives it.
2. **Current period**: which period is being diagnosed? Recommend the last complete period of the
   kind the first message names (a quarter, a week, a year); else the last complete calendar month.
3. **Comparison period**: what is it read against? Recommend the same period last year where the
   first message says so; else the period before the Current period, of the same kind.
4. **Data**: recommend the connected Growth Brain, reading the marts the roster holds for the
   levers the diagnosis needs; then the connectors in the session, then the files already in the
   conversation; for a lever none of these holds, the reports the user can export. Where step 1
   found a connector account that could not be told to be the brand's, ask whose it is, and
   probe it only on the answer, as step 1 sets out.

"Yes" accepts every recommendation, and "just write it" does the same. An answer replaces that
question's recommendation. A period is any span: a calendar month, a calendar quarter, a calendar
year, or a week, which is a complete Monday to Sunday week.

**Periods.** Resolve both periods once, as calendar dates that each Source reads in its own
timezone (step 1). A period the user names ("Q3 2025", "1 to 7 March") is typed as dates, here
and nowhere else. A recommended period and a name relative to today are computed from today's
date in the period timezone, `CURRENT_DATE('<timezone>')`, because a bare `CURRENT_DATE()` is
UTC's day. Where step 1 found no name for it (the store's own, or not known), today is the
user's own date as the session reports it, written into the dates. "Last month", "last quarter" and "same quarter last year"
are named periods.
"This month", "this quarter" or "this year" while it is still running resolves to the last
complete period of that kind: an attended run says so in the tree confirmation, with the dates,
and an unattended run in the Notes. With a Growth Brain, put the start and end dates in one
`periods` CTE (`period`, `start_date`, `end_date`) ahead of every query. Without a Growth Brain,
write the four dates once, from today's date, and read every connector and file on them. When the
periods differ in length, say so in the Notes.

**Done when** the Success KPI, both periods as start and end dates, and where the data comes from
are set, whether by the user's answers, a complete first message or an unattended run's first
message, and every account whose ownership was asked is probed or left unread on the answer.

## 3. Lever tree and Sources

Open `references/lever-trees.md`. Take the Success KPI's tree from the catalogue, or derive one
to the same rule. Then:

- **Name each lever's Source**: the first in step 1's order that holds it, one Source for both
  periods. Without a Growth Brain, open `references/exports.md` for which Source reads which lever.
- **Drop what no Source can read**: that lever stays on the tree and reads "No data". The page
  is still written, with those levers as "No data" and a "Not split" row, however many are
  dropped.
- **Stop only** when the Success KPI itself cannot be read in both periods (no Source holds its
  total, whatever the levers hold), or when no lever can be read. Say in one line, in the chat
  only, which Source is missing, in the wording of `references/diagnosis-layout.md` (with the Brain
  line, on a run without a Growth Brain). A stopped run writes no page.
- **Read the columns first**: with a Growth Brain, call `list_tables` naming each mart the tree
  needs that step 1 has not read, one mart per call (discovery, no query), so each lever's "how it
  is measured" comes from the columns and each mart's timezone from its date descriptions.
- **Confirm the tree**: open with the lead-in in `references/diagnosis-layout.md`, as given. Then
  show each lever with its kind (volume or efficiency), how it is measured and its Source, and how
  the levers rebuild the Success KPI. Say in one line any period resolved
  from "this month" or the like, with its dates, and any refusal of the probe made after intake
  (a probe that read fine adds nothing). Ask whether to run it. Run no query until the
  user says yes; an answer that changes a lever goes back through the tree rule.
- **Collect the exports**: for each lever whose Source is an export the conversation does not yet
  hold, give the user the steps for that report from `references/exports.md` and wait for the
  files. Ask for no export for a lever no Source can read.

An unattended run asks nothing and goes straight to Read.

**Done when** the columns of each mart the tree needs were read before the user was asked to
confirm (an unattended run reads them in step 4); the tree confirmation opened with the layout's
lead-in, as given (an unattended run gives none); the user has confirmed (an unattended run: the
skill has derived) a Lever tree of 3 to 5 levers (fewer only where `references/lever-trees.md` allows) with at least one volume and one efficiency,
whose arithmetic rebuilds the Success KPI exactly; every lever has one named Source across both
periods, or "No data" with its line; every export asked for is in hand or its lever reads "No
data"; and the run either goes on (the Success KPI and at least one lever can be read) or has
stopped with its one line and no page.

## 4. Read

**Basis.** Apply to every query, and put each caveat named here in the Notes.

- **One mart per tree for counts.** Read a tree's visits, orders and customers from the one mart
  `references/lever-trees.md` names for it, so conversion is never orders from one mart over
  visits from another. The revenue tree and MER / ROAS read visits, orders and revenue all from
  `<client>-channel_reporting`.
- **Revenue** is total sales, named with its basis on the page. Take it ex VAT where the mart
  carries total sales both ex and inc VAT, the basis of the margin rung and of spend. In
  `<client>-channel_reporting` it books each return on its refund date, the windowed figure the
  brain's descriptions point to. The orders mart's total sales books returns on the order date
  and is right only over all time, so the Revenue tree never takes revenue from it; the CM3 and
  Returning revenue trees read it order-dated, as the pair of margin or of the returning orders
  (next bullet). Without a Growth Brain, take net sales (gross sales less discounts and returns)
  and name that.
- **Margin** comes from `<client>-orders` on the deepest rung it carries per order (CM2, else
  CM1), order-dated. Label CM3 as such only when that rung is CM2 and its fulfilment or payment
  costs are non-zero on some orders in the period; otherwise label the figure "CM1 less
  marketing". Take spend from `<client>-channel_reporting` and read no margin from it. Say in one
  line why the page's CM3 can differ from one the brain or a dashboard publishes: refunds are
  dated differently and other cost lines may be in or out. Without a Growth Brain, take margin
  only from a Source carrying cost of goods; otherwise the margin % lever reads "No data".
- **Uncosted orders.** Where the orders mart flags orders that are not fully costed, filter
  margin, the revenue beside it and the order counts (new customers, returning orders) on the
  same rows, as the mart's own margin-rate metric does, so orders × order value × margin % still
  equals order margin. A customer is new or returning by their orders over all rows; only the
  count takes the filter. Margin % divides by revenue on those filtered, order-dated rows. Give
  the uncosted share of revenue in the Notes, and that margin % may differ from the brain's
  published rate.
- **Returns still arriving.** Where revenue is order-dated after the returns so far, say the
  latest period's returns are still coming in.
- **Test orders.** Leave out test orders wherever a mart or Source flags them. Where a lever
  reads an order count from a mart with no test flag, check that count against the flagged
  `<client>-orders` for the same days and give the result in the Notes.
- **Cancelled orders.** Follow the mart (most exclude them upstream) and say in the Notes
  whether its descriptions say it includes them, excludes them or say nothing.
- **Modelled or adjustment rows.** Where a mart marks modelled re-attribution or adjustment
  rows, keep them in totals so segments add up, give their coverage in the Notes (zero
  included), and expect them in "Other" below channel.
- **A change of source.** Where the brain's descriptions name a change of source for visits or
  channel attribution (for example the GA4 raw event stream replacing an earlier feed) and its
  date falls inside either period or between them, read both periods as the brain gives them and
  carry the change into the Notes, and into the Drivers block of a Main driver whose change
  straddles it.
- Express every change as a relative percentage, computed as `references/contribution.md` sets
  out under Rounding.

**Without a Growth Brain**, read each lever from its Source as `references/exports.md` sets out,
on the four dates, then rebuild the Success KPI and compare it as below.

**A refused read.** A read that fails in this step, after the probe passed or after the tree was
confirmed, sends its lever to the next Source in step 1's order that holds it, on every run, and
that Source is read for both periods again. A Source that has refused is read for no lever
again in this run. Where the next Source is an export, give the steps for it from
`references/exports.md` and ask for it once, then wait (an unattended run asks for none). A
lever with no Source left reads "No data", and step 3's stop rule applies to what remains. Tell
the user in one line which lever moved to which Source (an unattended run: the Notes).

**Query.** For each mart the confirmed tree needs that is not yet read, call `list_tables` naming
that one mart, one mart per call: a call naming two can overflow the reply. Compose every query
from the columns the calls return, and join to the `periods` CTE for dates. Alias every column by
more than case: BigQuery reads `n0` and `N0` as one name and the query fails (`comparison_numerator`,
`current_orders`). Read each lever's value in both periods in `run_sql`, then rebuild the Success
KPI from the levers as `references/lever-trees.md`
writes it and compare with the Success KPI read in its own query, from the mart's total for the
period (for the revenue tree, channel reporting's total sales; for CM3, the independent read
`references/lever-trees.md` sets out) and not from the lever queries' rows. A lever whose mart is
absent, or that is zero or missing in either period, reads "No data".

**Done when** every lever has a value in the Current period and the Comparison period, or "No
data" with its reason, and none was read from a Source that refused; the rebuilt Success KPI is
within 0.01% of the Success KPI read in its own query, in both periods (for a tree with a lever
reading "No data", the gap is the "Not split" row; for CM3 with no independent read, the check is
arithmetic only and the Notes say so); every tree count comes from its one mart;
test orders are out of every query the Source flags them in; and every query took its dates from
`periods` (without a Growth Brain, every read took the four dates).

## 5. Split

Open `references/contribution.md` and compute every Contribution in `run_sql` (without a Growth
Brain, in code, else by hand) from the two periods' lever values. Then name the roles, which are
stated here and nowhere else. "In the direction of the change" means the sign of the lever's
Contribution, not of the lever's own change: spend that rose lowers CM3, so it runs with a fall.

- **Main driver**: the lever with the largest Contribution in the direction of the change. A
  second lever with at least half that Contribution is a Main driver too. Name at most two.
- **Also large**: any other lever in the direction of the change with at least half the
  largest Contribution. It is named with its figure in the Levers table and gets one action line
  under Recommendations (step 8); it is not drilled.
- **Offset**: a lever whose Contribution runs against the change is named with its figure and
  never drilled. An Offset whose Contribution is larger in size than the largest Main driver's
  (a KPI that barely moved because a large rise and a large fall cancelled) also gets one action
  line under Recommendations (step 8); with no Main driver, the one lever with the largest
  Contribution in size gets that line instead. Every other Offset gets no action line.
- **No role**: a lever in the direction of the change under half the largest Contribution, a
  lever that reads "No data", and the "Not split" row. It is listed in the Levers table without a line, except a cost pair
  that takes no role (below).
- **A cost pair.** Spend paired with the volume it buys is ranked as one lever when their
  Contributions run against each other: spend and visits as **cost per visit** (CAC, MER / ROAS),
  spend and impressions as **CPM** (Platform ROAS). Rank the pair's combined Contribution against
  the other levers and give the pair one role together, the same on both rows. A spend cut that
  visits cancel is then not drilled as the Main driver. A pair that is a Main driver is drilled
  as the ratio of spend to its volume. A pair that takes no role gets one line under the Levers
  table saying why spend's own large Contribution does not drive the change.

A Success KPI that did not change has no Main driver; say so and name the levers that offset. So
has one whose readable levers all run against the change.

**Done when** the Contributions add exactly to the Success KPI's change (with a "Not split" row
where a lever read "No data"), and every lever carries a role or none.

## 6. Drill down

Open `references/drill-down.md`. Take every Main driver (at most two) through this step; from
here on each is a drilled Main driver, including one with zero levels. Take it down its lever's
path, one level at a time, by the descent rule. Read each level in `run_sql` from the lever's own
Source and the Basis rule above, with dates from `periods`, except an order-mix level, which
`references/drill-down.md` reads from the orders mart and apportions to the lever's Contribution
(the tree's levers and the Success KPI still come from one mart). Call `list_tables` for one mart
at a time when a level needs columns not yet read. Without a Growth Brain, where no connector
reads the level below campaign, ask once per Main driver for the ad group or ad set report
`references/exports.md` sets out, when its Drill-down reaches that level (an unattended run asks
for none). A level no Source the run holds carries a dimension for is not read: the Drill-down stops above it, with one line saying so. A Main driver
for which no Source the run holds carries the path's first dimension has zero levels: its
Drivers block says it could not be sliced further and why, and it goes on to steps 7 and 8 like
any other. Each level is a table ranked by Contribution with the volume beside it, and the
Drill-down ends with one line saying where it stopped and why, in the approved wording for that
reason (`references/diagnosis-layout.md`).

**Done when** every Main driver has a Drill-down of 0 to 3 levels that follows the path for its
lever and stops by the descent rule or at its Source's last dimension, and a driver with zero
levels has its line saying why; each level's rows, with an "Other (smaller <dimension>)" row for the
segments under the volume floor, add exactly to the change they split; and an Offset or Also
large lever has not been drilled.

## 7. Cause

For each drilled Main driver, a zero-level one included, give its evidence in a sentence with its
figures (for a zero-level driver, its two period values and Contribution) and ask one question
offering two or three likely causes, as `references/drill-down.md` lists them. Put the questions
to the user in one numbered round and wait for the answers. "Don't know" sets that driver's Cause
to "Not confirmed". An unattended run sets every Cause to "Not confirmed" and asks nothing.

**Done when** every drilled Main driver has a Cause, in the user's words, or "Not confirmed".

## 8. Recommend

Write 1 to 3 recommendations for each drilled Main driver, a zero-level one included, from
`references/drill-down.md`, ranked by the KPI at stake. On a rise, phrase every action for a
rise, as `references/drill-down.md` sets out. Each carries a hypothesis ("if we X, the
KPI moves because Y"), the action, the metric to watch, and how to validate it: test, watch next
period or ship. Under a Cause of "Not confirmed" every action is check-first. Each Also large
lever, and each Offset step 5 gives an action line, gets its one check-first action line, written
here and nowhere else.

**Done when** every drilled Main driver has 1 to 3 recommendations, each with hypothesis, action,
metric to watch and test, watch or ship; every action under a "Not confirmed" Cause is
check-first; and every Also large lever and every Offset step 5 gives an action line has that line.

## 9. Write

Open `references/diagnosis-layout.md` and write `performance-diagnosis-<kpi>-<period>.html` in
the working folder: `<kpi>` is the Success KPI in lower case with hyphens, and `<period>` is the
Current period as `YYYY-MM` for a calendar month, else `<start>_<end>` as `YYYY-MM-DD`.

Tell the user in four lines the change (the Success KPI in both periods and the relative
change), the Main driver(s) with their Contributions (an Offset may be named in the same line),
the Cause, and the top recommendation, which is the Summary's top action, then the page's path.
Without a Growth Brain, add the Brain line after the four lines and before the path.

**Done when** the page holds all seven headings in order, every heading carries its content or
its reason, the Levers table sums to the change, the waterfall ties from the Comparison period's
Success KPI to the Current period's, the user has the four lines and the page's path, and a run
without a Growth Brain carries the Brain line once on the page and once in the chat.
