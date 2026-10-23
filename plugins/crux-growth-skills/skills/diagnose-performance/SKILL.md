---
name: diagnose-performance
description: Diagnose why a KPI moved between two periods. Use when someone asks why a KPI moved ("why did revenue drop last month", "what's driving CAC up"), to diagnose performance for a period, or to compare two periods and say what changed. Best on the brand's own Growth Brain; also works without one.
---

# Performance diagnosis

Produce the Performance diagnosis from the brand's own data: why the Success KPI moved between
the Current period and the Comparison period, as one HTML page with the seven headings
`references/diagnosis-layout.md` fixes. Run the nine steps in order. The user sees only the chat
and the page, never this skill or its references: say what the data showed, in plain words with
its figure, and never cite a file, a rule or a threshold. The terms Success KPI, Current period,
Comparison period, Lever, Lever tree, Source, Contribution, Main driver, Offset, Drill-down, Cause,
Recommendation, Check-first, Brain line and Performance diagnosis are those of
`references/glossary.md`; use them as written.

## Unattended run

A first message that names the Success KPI, both periods and where the data comes from (a Growth
Brain, connector or files) runs unattended, as a Claude routine does. Ask the user nothing, at any step,
and follow these five rules:

- Skip Intake's round and the Lever tree's confirmation, and still resolve the periods as step 2
  sets out; the tree is shown on the page only.
- With several Growth Brains, take the one the message names, else the first the session lists,
  and say which in the Notes.
- Ask for no export: a lever the named Source cannot read reads "No data".
- Set every Cause to "Not confirmed" and make every action check-first.
- Where step 3 stops with one line, stop with that line and write no page.

**Done when** no question was asked, every Cause reads "Not confirmed", every action is
check-first, and the page holds all seven headings (or step 3 stopped with its one line).

## 1. Connect

Take the data from the first of these Sources that holds each lever:

1. **A Growth Brain**: a connector named `<Client> - Growth Brain` that offers `list_tables`,
   `list_metrics`, `search_examples` and `run_sql`. With several, ask which one. Call
   `list_tables` once with no arguments for the roster (`<client>` is the prefix it carries), then
   `search_examples` once, and keep what it returns for the queries in steps 4 and 6.
2. **Platform connectors** in the session: Shopify, GA4, Google Ads, Meta Ads.
3. **Files the user gives**: CSV exports or pasted figures.

Without a Growth Brain the diagnosis still runs, read from the connectors and files, and the
Brain line (`references/diagnosis-layout.md`) is said once on the page and once in the chat (a run
that stops at step 3 says it in the chat only).

Then settle two facts once, for every later step to reuse:

- **Timezone**: the Growth Brain's instructions where they name one; else the timezone the date
  descriptions of `<client>-orders` name (`list_tables` naming that mart); else UTC, said in the
  Notes. Without a Growth Brain, the timezone the Source reports in, said in the Notes.
- **Currency**: the Growth Brain's instructions where they name it; else the first mart that
  names it, `<client>-orders` first (`list_tables`, one mart per call). Without a Growth Brain,
  the currency the files or connector report in.

**Done when** the Sources in this session are named to the user in the intake message (an
unattended run has none, and names them in the Notes): the one Growth Brain chosen with its roster
in hand and `search_examples` called once, or none; the connectors found; and the files the
conversation already holds. The timezone and the currency are set.

## 2. Intake

A first message that names the Success KPI, both periods and where the data comes from (a Growth
Brain, connector or files) skips the round below (an unattended run). Otherwise build the round on what
the first message already says. A question it answers is stated in the round as settled, with what
was understood, and not asked. Ask each open question with a recommendation, then wait for the
answer:

1. **Success KPI**: what figure are you judging performance on? Recommend the KPI the first
   message names; else CM3 with a Growth Brain whose orders carry margin; else net sales (or
   revenue), because CM3 needs margin and only a Source carrying cost of goods gives it.
2. **Current period**: which period is being diagnosed? Recommend the last complete period of the
   kind the first message names (a quarter, a week, a year); else the last complete calendar month.
3. **Comparison period**: what is it read against? Recommend the same period last year where the
   first message says so; else the period before the Current period, of the same kind.
4. **Data**: recommend the connected Growth Brain, reading the marts the roster holds for the
   levers the diagnosis needs; then the connectors in the session, then the files already in the
   conversation; for a lever none of these holds, the reports the user can export.

"Yes" accepts every recommendation, and "just run it" does the same. An answer replaces that
question's recommendation. A period is any span: a calendar month, a calendar quarter, a calendar
year, or a week, which is a complete Monday to Sunday week.

**Periods.** Resolve both periods once, in step 1's timezone. A period the user names ("Q3 2025",
"1 to 7 March") is typed as dates, here and nowhere else. A recommended period and a name
relative to today ("last quarter") are computed from `CURRENT_DATE('<timezone>')`. With a Growth
Brain, put the start and end dates in one `periods` CTE (`period`, `start_date`, `end_date`) ahead
of every query. Without a Growth Brain, write the four dates once, from today's date, and read
every connector and file on them. When the periods differ in length, say so in the Notes.

**Done when** the Success KPI, both periods as start and end dates, and where the data comes from are set,
whether by the user's answers or by an unattended run's first message.

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
  only, which Source is missing (with the Brain line, on a run without a Growth Brain). A stopped
  run writes no page.
- **Read the columns first**: with a Growth Brain, call `list_tables` naming each mart the tree
  needs that step 1 has not read, one mart per call (discovery, no query), so each lever's "how it
  is measured" comes from the columns.
- **Confirm the tree**: show each lever with its kind (volume or efficiency), how it is measured
  and its Source, and how the levers rebuild the Success KPI. Ask whether to run it. Run no query
  until the user says yes; an answer that changes a lever goes back through the tree rule.
- **Collect the exports**: for each lever whose Source is an export the conversation does not yet
  hold, give the user the steps for that report from `references/exports.md` and wait for the
  files. Ask for no export for a lever no Source can read.

An unattended run asks nothing and goes straight to Read.

**Done when** the columns of each mart the tree needs were read before the user was asked to
confirm (an unattended run reads them in step 4); the user has confirmed (an unattended run: the
skill has derived) a Lever tree of 3 to 5 levers with at least one volume and one efficiency,
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
  margin and the revenue beside it on the same rows, as the mart's own margin-rate metric does,
  and give the uncosted share of revenue in the Notes.
- **Returns still arriving.** Where revenue is order-dated after the returns so far, say the
  latest period's returns are still coming in.
- **Test orders.** Leave out test orders wherever a mart or Source flags them. Where a lever
  reads an order count from a mart with no test flag, check that count against the flagged
  `<client>-orders` for the same days and give the result in the Notes.
- **Cancelled orders.** Follow the mart (most exclude them upstream) and say so in the Notes
  where its descriptions say it includes or excludes them.
- **Modelled or adjustment rows.** Where a mart marks modelled re-attribution or adjustment
  rows, keep them in totals so segments add up, give their coverage in the Notes, and expect
  them in "Other" below channel.
- **A change of source.** Where the brain's descriptions name a change of source for visits or
  channel attribution (for example the GA4 raw event stream replacing an earlier feed) and its
  date falls inside either period or between them, read both periods as the brain gives them and
  carry the change into the Notes.
- Express every change as a relative percentage.

**Without a Growth Brain**, read each lever from its Source as `references/exports.md` sets out,
on the four dates, then rebuild the Success KPI and compare it as below.

**Query.** For each mart the confirmed tree needs that is not yet read, call `list_tables` naming
that one mart, one mart per call: a call naming two can overflow the reply. Compose every query
from the columns the calls return, and join to the `periods` CTE for dates. Read each lever's value in both
periods in `run_sql`, then rebuild the Success KPI from the levers as `references/lever-trees.md`
writes it and compare with the Success KPI read in its own query, from the mart's total for the
period (for the revenue tree, channel reporting's total sales) and not from the lever queries'
rows. A lever whose mart is absent, or that is zero or missing in either period, reads "No data".

**Done when** every lever has a value in the Current period and the Comparison period, or "No
data" with its reason; the rebuilt Success KPI is within 0.01% of the Success KPI read in its own
query, in both periods (for a tree with a lever reading "No data", the gap is the "Not split"
row); every tree count comes from its one mart; test orders are out of every
query the Source flags them in; and every query took its dates from `periods` (without a Growth
Brain, every read took the four dates).

## 5. Split

Open `references/contribution.md` and compute every Contribution in `run_sql` (without a Growth
Brain, in code, else by hand) from the two periods' lever values. Then name the roles, which are
stated here and nowhere else. "In the direction of the change" means the sign of the lever's
Contribution, not of the lever's own change: spend that rose lowers CM3, so it runs with a fall.

- **Main driver**: the lever with the largest Contribution in the direction of the change. A
  second lever with at least half that Contribution is a Main driver too. Name at most two.
- **Over the threshold**: any other lever in the direction of the change with at least half the
  largest Contribution. It is named with its figure in the Levers table and gets one action line
  under Recommendations (step 8); it is not drilled.
- **Offset**: a lever whose Contribution runs against the change is named with its figure and
  never drilled.
- **No role**: a lever in the direction of the change under half the largest Contribution, and a
  lever that reads "No data". It is listed in the Levers table without a line.
- **Cost per visit.** In a tree holding spend and visits (CAC, MER / ROAS), when their
  Contributions run against each other, rank their combined Contribution as one lever, cost per
  visit, and give the pair one role together. A spend cut that visits cancel is then not drilled
  as the Main driver. A cost per visit that is a Main driver is drilled as the ratio of spend to
  visits.

A Success KPI that did not change has no Main driver; say so and name the levers that offset. So
has one whose readable levers all run against the change.

**Done when** the Contributions add exactly to the Success KPI's change (with a "Not split" row
where a lever read "No data"), and every lever carries a role or none.

## 6. Drill down

Open `references/drill-down.md`. Take every Main driver (at most two) through this step; from
here on each is a drilled Main driver, including one with zero levels. Take it down its lever's
path, one level at a time, by the descent rule. Read each level in `run_sql` from the lever's own
Source and the Basis rule above, with dates from `periods`; call `list_tables` for one mart at a
time when a level needs columns not yet read. A level the Source holds no dimension for is not
read: the Drill-down stops above it, with one line saying so. A Main driver whose Source holds no
dimension for the path's first level has zero levels: its Drivers block says it could not be
sliced further and why, and it goes on to steps 7 and 8 like any other. Each level is a table
ranked by Contribution with the volume beside it, and the Drill-down ends with one line saying
where it stopped and why.

**Done when** every Main driver has a Drill-down of 0 to 3 levels that follows the path for its
lever and stops by the descent rule or at its Source's last dimension, and a driver with zero
levels has its line saying why; each level's rows, with an "Other" row for the segments under the
volume floor, add exactly to the change they split; and an Offset or over-threshold lever has not
been drilled.

## 7. Cause

For each drilled Main driver, a zero-level one included, give its evidence in a sentence with its
figures (for a zero-level driver, its two period values and Contribution) and ask one question
offering two or three likely causes, as `references/drill-down.md` lists them. Put the questions
to the user in one numbered round and wait for the answers. "Don't know" sets that driver's Cause
to "Not confirmed". An unattended run sets every Cause to "Not confirmed" and asks nothing.

**Done when** every drilled Main driver has a Cause, in the user's words, or "Not confirmed".

## 8. Recommend

Write 1 to 3 recommendations for each drilled Main driver, a zero-level one included, from
`references/drill-down.md`, ranked by the KPI at stake. Each carries a hypothesis ("if we X, the
KPI moves because Y"), the action, the metric to watch, and how to validate it: test, watch next
period or ship. Under a Cause of "Not confirmed" every action is check-first. Each lever over the
threshold gets its one check-first action line, written here and nowhere else.

**Done when** every drilled Main driver has 1 to 3 recommendations, each with hypothesis, action,
metric to watch and test, watch or ship; every action under a "Not confirmed" Cause is
check-first; and every lever over the threshold has its action line.

## 9. Write

Open `references/diagnosis-layout.md` and write `performance-diagnosis-<kpi>-<period>.html` in
the working folder: `<kpi>` is the Success KPI in lower case with hyphens, and `<period>` is the
Current period as `YYYY-MM` for a calendar month, else `<start>_<end>` as `YYYY-MM-DD`.

Tell the user in four lines the change (the Success KPI in both periods and the relative
change), the Main driver(s) with their Contributions (an Offset may be named in the same line),
the Cause, and the top recommendation, which is the Summary's top action, then the page's path. Without a Growth Brain, add the Brain line after the four lines and before the path.

**Done when** the page holds all seven headings in order, every heading carries its content or
its reason, the Levers table sums to the change, the waterfall ties from the Comparison period's
Success KPI to the Current period's, the user has the four lines and the page's path, and a run
without a Growth Brain carries the Brain line once on the page and once in the chat.
