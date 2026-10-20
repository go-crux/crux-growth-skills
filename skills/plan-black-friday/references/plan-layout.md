# Black Friday plan: page layout

The Black Friday plan is one self-contained HTML file, `black-friday-plan.html`, written to the
working folder. Inline CSS and a few lines of inline script switch the tabs; the page makes no
network request. Crux house style: British English, no em dashes, outcome before mechanism,
relative percentage changes (2.0% to 1.8% is "−10%").

Every heading below is always present. A heading with nothing under it reads "Not agreed yet".

## Tab 1: Last year

1. **Headline**: one sentence stating the outcome, for example that last year's Black Friday
   weekend brought more (or fewer) contribution margin per day than the year before it, and which
   term moved it.
2. **Growth equation**: a table, one row per term in this order: new customers per day, order
   frequency, order value, contribution margin per day. Columns, in this order: the year
   before's Black Friday weekend, that year against its Baseline, last year's Black Friday
   weekend, last year against its Baseline, last year against the year before. Head each column
   with its calendar year from `references/windows.sql`. Name the margin rung (CM3, CM2 or CM1) and the revenue measure
   in the row labels.
3. **Offer**: a window table, then the landing-page list.
4. **Merchandising**: a window table, then the five-product list.
5. **Marketing**: two sub-headings, **Acquisition** and **Retention**, each a window table
   followed by its ranked campaign lists (and the three best landing pages under Acquisition).
6. **Opportunities**: the 3 to 5 that fire, each with its evidence figure, this year's action
   and the metric to watch on the day, then at most one "Judgement call" in its own row.
7. **Target test**: one block per month (November, December to the 24th) with a **Target test
   table**, then **Pillar gap** and **Scenarios** sub-headings. A sub-heading with no
   Stretch or Unrealistic target under it reads "Not needed: every target is Achievable".
   - The Target test table has one row per figure in this order: revenue (name the budget rung),
     orders, new orders, spend, implied CAC. Columns, in this order: Source ("Budget sheet",
     "Founder's target" or "Proposed: last year's Lift on this year's Baseline"), this year's
     plan, this year's Baseline per day, this year's Lift, last year's Lift, the year before's
     Lift, verdict, revised figure. Head the Lift columns with their calendar years from
     `references/windows.sql`. A Lift is shown as a ratio over Baseline (1.4 reads "×1.4").
     Spend carries no verdict. Revised figure is filled for Unrealistic targets only and reads
     "n/a" elsewhere.
   - The Pillar gap table has one row per pillar (new customers, order frequency, order value)
     and the columns last-year level, plan-implied figure, required relative change.
   - Each Scenario is one row: the move, its size, its cost or ask, and its effect on the other
     targets.
8. **Footnote**: one block holding every method caveat, and no caveat anywhere else on the page.

A **window table** has one row per figure per window (Baseline, Lead-in, Black Friday weekend,
Festive) and these columns in this order: the year before last year, its Lift over Baseline, last year, its
Lift over Baseline, last year against the year before. Head each with its calendar year from
`references/windows.sql`. The Baseline row's Lift cells read "n/a". A section whose mart is
missing from the roster keeps its heading and one line saying which mart is missing. A ranked
list shows last year's Black Friday weekend with the year before alongside, and a platform-reported list is
labelled as such.

## Tab 2: Plan

Heading: **Plan**. Under it, "Not agreed yet".
