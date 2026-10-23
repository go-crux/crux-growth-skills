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
Comparison period, Lever, Lever tree, Contribution, Main driver, Offset, Drill-down, Cause and
Performance diagnosis are those of `references/glossary.md`; use them as written.

## Unattended run

A first message that names the Success KPI, both periods and the source (a Claude routine) runs
unattended. Ask the user nothing, at any step, and follow these four rules:

- Skip Intake and the Lever tree's confirmation; the tree is shown on the page only.
- With several Growth Brains, take the one the message names, else the first the session lists,
  and say which in the Notes.
- Set every Cause to "Not confirmed" and make every action check-first.
- Where a step stops with one line (no Growth Brain, fewer than three levers can be read), stop
  with that line.

**Done when** no question was asked, every Cause reads "Not confirmed", every action is
check-first, and the page holds all seven headings.

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

A first message that names the Success KPI, both periods and the source skips this step (an
unattended run). Otherwise ask one numbered round, each question with a recommendation, then wait for the answer:

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

**Done when** the Success KPI, both periods as start and end dates, and the source are set,
whether by the user's answers or by an unattended run's first message.

## 3. Lever tree

Open `references/lever-trees.md`. Take the Success KPI's tree from the catalogue, or derive one
to the same rule. A lever whose mart the roster lacks stays on the tree and reads "No data"; if
fewer than three levers can be read, say in one line which mart is missing and stop. Show the user the Lever tree: each lever with its kind (volume or efficiency), how it is
measured and the mart it is read from, and how the levers rebuild the Success KPI. Ask whether
to run it. Run no query until the user says yes; an answer that changes a lever goes back through
the tree rule. An unattended run asks nothing and goes straight to Read.

**Done when** the user has confirmed (an unattended run: the skill has derived) a Lever tree of
3 to 5 levers with at least one volume and one efficiency, whose arithmetic rebuilds the Success KPI exactly.

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
  largest Contribution is named with its figure and a one-line action (step 8), and is not
  drilled.
- **Offset**: a lever whose Contribution runs against the change is named with its figure and
  never drilled.

A Success KPI that did not change has no Main driver; say so and name the levers that offset.

**Done when** the Contributions add exactly to the Success KPI's change (with a "Not split" row
where a lever read "No data"), and every lever carries a role or none.

## 6. Drill down

Open `references/drill-down.md`. Take each Main driver (at most two) down its lever's path, one
level at a time, by the descent rule. Read each level in `run_sql` from the lever's own source
and the Basis rule above, with dates from `periods`; call `list_tables` for one mart at a time
when a level needs columns not yet read. Each level is a table ranked by Contribution with the
volume beside it, and the Drill-down ends with one line saying where it stopped and why.

**Done when** every Main driver has a Drill-down of at most three levels that follows the path
for its lever and stops by the descent rule; each level's rows, with an "Other" row for the
segments under the volume floor, add exactly to the change they split; and an Offset or
over-threshold lever has not been drilled.

## 7. Cause

For each drilled Main driver, give its evidence in a sentence with its figures and ask one
question offering two or three likely causes, as `references/drill-down.md` lists them. Put the
questions to the user in one numbered round and wait for the answers. "Don't know" sets that
driver's Cause to "Not confirmed". An unattended run sets every Cause to "Not confirmed" and
asks nothing.

**Done when** every drilled Main driver has a Cause, in the user's words, or "Not confirmed".

## 8. Recommend

Write 1 to 3 recommendations for each drilled Main driver from `references/drill-down.md`,
ranked by the KPI at stake. Each carries a hypothesis ("if we X, the KPI moves because Y"), the
action, the metric to watch, and how to validate it: test, watch next period or ship. Under a
Cause of "Not confirmed" every action is check-first. Each lever over the threshold gets its one
check-first action line.

**Done when** every drilled Main driver has 1 to 3 recommendations, each with hypothesis, action,
metric to watch and test, watch or ship; every action under a "Not confirmed" Cause is
check-first; and every lever over the threshold has its action line.

## 9. Write

Open `references/diagnosis-layout.md` and write `performance-diagnosis-<kpi>-<period>.html` in
the working folder: `<kpi>` is the Success KPI in lower case with hyphens, and `<period>` is the
Current period as `YYYY-MM` for a calendar month, else `<start>_<end>` as `YYYY-MM-DD`.

Tell the user in four lines the change (the Success KPI in both periods and the relative
change), the Main driver with its Contribution, the Cause, and the top recommendation, then the
page's path.

**Done when** the page holds all seven headings in order, every heading carries its content or
its reason, the Levers table sums to the change, the waterfall ties from the Comparison period's
Success KPI to the Current period's, and the user has the four lines and the page's path.
