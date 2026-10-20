# Black Friday plan: page layout

The Black Friday plan is one self-contained HTML file, `black-friday-plan.html`, written to the
working folder. Inline CSS and a few lines of inline script switch the tabs and build the CSV; the page makes no
network request. Crux house style: British English, no em dashes, outcome before mechanism,
relative percentage changes (2.0% to 1.8% is "−10%").

Every heading below is always present. In the Last year tab a section without figures carries
one line saying why. In the Plan tab a heading with nothing agreed reads "Not agreed".

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

Heading: **Plan**. Under it, seven headings in this order.

1. **Agreed targets**: one table per month (November, December to the 24th), one row per figure
   in this order: revenue (name the budget rung), orders, new orders, spend, implied CAC
   (agreed spend over agreed new orders). Columns, in this order: agreed target, source ("Budget
   sheet", "Revised", "Founder's target" or "Proposed: last year's Lift on this year's
   Baseline"), Lift over Baseline, verdict. Spend and implied CAC take their Lift from the Target
   test, and spend carries no verdict.
2. **Chosen Scenario**: for each month with a Stretch or Unrealistic target, one row per Scenario
   chosen, a blend as one row per part with its share of the gap. Columns: the move, its size,
   its cost or ask, its effect on the other targets. A month whose targets are all Achievable
   reads "Not needed: every target is Achievable".
3. **Daily phasing**: a caption naming the revenue rung and the year whose daily shape was used,
   then one table with a row per date, the months one after the other, and a total row under
   each month. Columns, in this order: `date`, `days_from_black_friday`, `revenue`, `orders`,
   `new_orders`, `spend`. Black Friday this year is the row with `days_from_black_friday` 0, on
   its own date, and is marked. Under the table a **Download CSV** button, and one line saying
   that loading the Daily phasing into the budget sheet is a hand-off: send the CSV to the
   Crux contact.
4. **Actions**: one sub-heading per section (Offer, Merchandising, Marketing, Targets), each a
   table of action, owner and date. A section with none agreed reads "Not agreed".
5. **Opportunities**: the opportunities the founder adopted, each with its evidence figure, this
   year's action and the metric to watch on the day.
6. **Risks**: three rows in this order, **Stock**, **Discount stacking** and **Margin floor**,
   each with the limit agreed (units to secure; the discounts that may combine; the margin %
   on the named rung) or "Not agreed".
7. **Watch list**: 3 to 5 rows, each a number to watch on the day, what it should read, and last
   year's figure for the same day from Black Friday.

## The CSV

The page builds the file in the browser from the Daily phasing table's date rows, with no
network request, and offers it as `black-friday-daily-phasing.csv`.

- Columns, in this order: `date, days_from_black_friday, revenue, orders, new_orders, spend`.
- One header row, then one row per date. The total rows are not in the file.
- `date` is `YYYY-MM-DD`; `days_from_black_friday` is a whole number, negative before Black
  Friday; `orders` and `new_orders` are whole numbers; `revenue` and `spend` carry two decimals.
  No currency symbol and no thousands separator.
- A month without an agreed target contributes no rows.
