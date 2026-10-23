---
name: diagnose-performance
description: Diagnose why a KPI moved between two periods. Use when someone asks why a KPI moved ("why did revenue drop last month", "what's driving CAC up"), to diagnose performance for a period, or to compare two periods and say what changed. Best on the brand's own Growth Brain; also works without one.
---

# Performance diagnosis

Produce the Performance diagnosis from the brand's own data: why the Success KPI moved between
the Current period and the Comparison period, as one HTML page with the seven headings
`references/diagnosis-layout.md` fixes. Run the six steps in order. The user sees only the chat
and the page, never this skill or its references: say what the data showed, in plain words with
its figure, and never cite a file, a rule or a threshold. The terms Success KPI, Current period,
Comparison period, Lever, Lever tree, Contribution, Main driver, Offset, Drill-down, Cause and
Performance diagnosis are those of `references/glossary.md`; use them as written.

## 1. Connect

Look for a connector named `<Client> - Growth Brain` that offers `list_tables`, `list_metrics`,
`search_examples` and `run_sql`. With several, ask which one. With none, tell the user in one
line that this diagnosis reads their own data through a Crux Growth Brain, which isn't connected
in this session: if they have one, connect it and ask again; if not, they can get one at
gocrux.io/contact. Then stop: run no query and call no other tool.

Call `list_tables` once with no arguments for the roster (`<client>` is the prefix it carries).
Take the store's timezone from the brain's own instructions where they name one.

**Done when** one Growth Brain is chosen and the roster is in hand, or the run has stopped with
that one line.

## 2. Intake

A first message that names the Success KPI, both periods and the source skips this step.
Otherwise ask one numbered round, each question with a recommendation, then wait for the answer:

1. **Success KPI**: what figure are you judging performance on? Recommend CM3.
2. **Current period**: which period is being diagnosed? Recommend the last complete calendar
   month.
3. **Comparison period**: what is it read against? Recommend the period before it, of the same
   kind.
4. **Data**: recommend the connected Growth Brain, reading the marts the roster holds for the
   levers the diagnosis needs.

"Yes" accepts every recommendation, and "just run it" does the same. An answer replaces that
question's recommendation. A period is any span: a month, a quarter, a year, or a week, which is
a complete Monday to Sunday week. Resolve both periods to a start and an end date in the store's
timezone and put them in one `periods` CTE (`period`, `start_date`, `end_date`) ahead of every
query. For the recommended periods compute the dates from `CURRENT_DATE('<timezone>')`; type no
other date by hand. When the periods differ in length, say so in the Notes.

**Done when** the Success KPI, both periods as start and end dates, and the source are set.

## 3. Lever tree

Open `references/lever-trees.md`. Take the Success KPI's tree from the catalogue, or derive one
to the same rule. A lever whose mart the roster lacks stays on the tree and reads "No data"; if
fewer than three levers can be read, say in one line which mart is missing and stop. Show the user the Lever tree: each lever with its kind (volume or efficiency), how it is
measured and the mart it is read from, and how the levers rebuild the Success KPI. Ask whether
to run it. Run no query until the user says yes; an answer that changes a lever goes back through
the tree rule.

**Done when** the user has confirmed a Lever tree of 3 to 5 levers with at least one volume and
one efficiency, whose arithmetic rebuilds the Success KPI exactly.

## 4. Read

**Basis.** Apply to every query.

- Leave out test orders wherever a mart flags them.
- Take revenue from the orders table's total sales measure (the one its own descriptions call
  total sales, after discounts and returns) and name it on the page.
- Take margin from `<client>-orders` on the deepest rung it carries per order (CM2, else CM1).
  Label CM3 as such only when that rung is CM2 and its fulfilment or payment costs are non-zero
  on some orders in the period; otherwise label the figure "CM1 less marketing". Take spend from
  `<client>-channel_reporting`, and read no margin from it: it books refunds on the refund date.
- Where the brain's descriptions name a change of source for visits or channel attribution (for
  example the GA4 raw event stream replacing an earlier feed) and one period sits on each side
  of it, read both periods as the brain gives them and carry the change into the Notes.
- Express every change as a relative percentage.

**Query.** For each mart the confirmed tree needs, call `list_tables` naming that one mart, one
mart per call: a call naming two can overflow the reply. Compose every query from the columns
the calls return, and join to the `periods` CTE for dates. Read each lever's value in both
periods in `run_sql`, then rebuild the Success KPI from the levers as `references/lever-trees.md`
writes it and compare with the Success KPI read directly. A lever whose mart is absent, or that
is zero or missing in either period, reads "No data".

**Done when** every lever has a value in the Current period and the Comparison period, or "No
data" with its reason; the rebuilt Success KPI is within 0.01% of the Success KPI read directly,
in both periods; test orders are out of every query; and every query took its dates from
`periods`.

## 5. Split

Open `references/contribution.md` and compute every Contribution in `run_sql` from the two
periods' lever values. Then name the roles:

- **Main driver**: the lever with the largest Contribution in the direction of the change. A
  second lever with at least half that Contribution is a Main driver too. Name at most two.
- **Over the threshold**: a third lever, in the direction of the change, with at least half the
  largest Contribution is named
  with its figure and a one-line action, and is not drilled.
- **Offset**: a lever whose Contribution runs against the change is named with its figure and
  never drilled.

A Success KPI that did not change has no Main driver; say so and name the levers that offset.

**Done when** the Contributions add exactly to the Success KPI's change (with a "Not split" row
where a lever read "No data"), and every lever carries a role or none.

## 6. Write

Open `references/diagnosis-layout.md` and write `performance-diagnosis-<kpi>-<period>.html` in
the working folder: `<kpi>` is the Success KPI in lower case with hyphens, and `<period>` is the
Current period as `YYYY-MM` for a calendar month, else `<start>_<end>` as `YYYY-MM-DD`.

Tell the user in a few short lines the change (the Success KPI in both periods and the relative
change), the Main driver(s) with their Contributions, and the page's path.

**Done when** the page holds all seven headings in order, every heading carries its content or
its reason, the Levers table sums to the change, the waterfall ties from the Comparison period's
Success KPI to the Current period's, and the user has the page's path.
