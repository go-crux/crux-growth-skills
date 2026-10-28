# Black Friday plan: page layout

The Black Friday plan is one self-contained HTML file, `black-friday-plan.html`, written to the
working folder. It holds six pages, one shown at a time, with a page bar at the top to move
between them. Inline CSS and a few lines of inline script switch the pages and build the CSV;
the page makes no network request. Crux house style: British English, no em dashes, outcome
before mechanism, relative percentage changes (2.0% to 1.8% is "−10%"). Money carries the
currency the Source's figures are in, with its own symbol, never an assumed one.

The reader may arrive cold, with no idea how the plan was made. Speak of the plan figures as
"your budget", never "the sheet" or a table name. Every heading below is always present. On
pages 1 to 5 a section without figures carries one line saying why. On page 6 a heading with
nothing agreed reads "Not agreed". Every cell holds a figure, "No data" (the tables hold
nothing for it) or the words this file gives for it; never a bare "n/a".

Every page opens with a **Summary**, before any table: two to four sentences of plain prose
saying what the page looked at and its key takeaways, each with its figure (for example that
last year's weekend email sends were down a fifth while email revenue held). Write it from the
page's own figures, never a caveat (those go in Notes) and never the method on page 1's "How we
read it". Until the grill ends, the Plan page's Summary says the plan is agreed with you in the
chat and fills in here once it is.

## Page 1: Overview

1. **Summary**, then **How we read it**: four to six short lines, before any figure, for a reader who has seen
   none of the method:
   - the four windows with their dates in both years compared (from `references/windows.sql`, or the dates step 1 wrote out
     on a run without a Growth Brain),
     and that Baseline is normal September and October trading;
   - that last year is compared with the year before, never with this autumn, because tracking
     changed this year (without a Growth Brain, because this autumn's windows are not yet
     complete);
   - that each window is read as its Lift over its own year's Baseline, per day, so a four-day
     weekend sits fairly against two months; and that the last column of each table is the
     year-on-year change;
   - that this year's targets come from your budget, and are tested against what the last two
     years' Black Fridays actually did (without a Growth Brain, the "Your targets were not
     tested" line of **Without a Growth Brain** instead, where no Source holds the orders);
   - the revenue measure and the margin rung, named (without a Growth Brain, total sales and the
     margin wording of **Without a Growth Brain**).
2. **Headline**: one sentence stating the outcome, for example that last year's Black Friday
   weekend brought more (or fewer) contribution margin per day than the year before it, and which
   term moved it.
3. **Growth equation**: a table, one row per term in this order: new customers per day,
   returning customer orders per day, order value, CM3 (or "CM1 less marketing") per day.
   Columns, in this order: the year before's Black Friday weekend, that year against its
   Baseline, last year's Black Friday weekend, last year against its Baseline, last year
   against the year before. Head each column with its calendar year. Name the margin rung and
   the revenue measure in the row labels.
4. **Opportunities**: the 3 to 5 found, numbered 1, 2, 3 on the page, each with a short plain
   title, its evidence figure, this year's action, the metric to watch on the day and the page
   its evidence sits on, then at most one
   "Judgement call" in its own row.
5. **Notes**: the footnote, one block holding every method caveat, and no caveat on any other page.
   On a run without a Growth Brain, the Brain line is the last line of the Notes.

## Page 2: Offer

1. **Offer**: a window table (conversion, discount depth, discount rate, order value, margin %),
   then the landing-page list.
2. **Products**: the Merchandising read, a window table, then the five-product list.

## Page 3: Marketing

**Acquisition**: a window table, the ranked campaign list, the three best landing pages, and
any platform-reported lists. Without a Growth Brain the window table is visits, new customers,
spend and CAC, and the one campaign list is platform-reported: the five campaigns with the most
purchases in last year's Black Friday weekend, each with its platform, cost per purchase,
purchase value where reported, impressions, clicks and the year before, and no Lift.

## Page 4: Retention

1. **Email**: a window table, the ranked campaign list, then the **send cadence** table: one
   row per day of Black Friday weekend (Friday to Monday), with the campaigns sent that day in
   the year before and last year, and the benchmark from `references/opportunities.md`.
2. **Repeat customers**: a window table with returning customers' share of orders and the
   90-day reorder of each window's new customers, in both years.
3. **Cohorts**: one table, a row per cohort (Black Friday weekend and Baseline new customers, the
   year before and last year), with columns for repeat share, orders per customer and margin per
   customer at 30, 90 and 180 days, then the share who had bought only once by 180 days and the
   cohort's CAC. A horizon a cohort has not yet reached reads "Too recent".
   Under it one sentence: whether last year's weekend customers were worth more or less than its
   Baseline customers by 180 days, and by how much.

## Page 5: Targets

One block per month (November, December) with a **Target test table**, then **Lever gap** and
**Scenarios** sub-headings. A sub-heading with no Stretch or Unrealistic target under it reads
"Not needed: every target is Achievable".

- The Target test table has one row per figure in this order: revenue (name the budget rung;
  without a Growth Brain, the basis the budget counts),
  orders, new orders, spend, implied CAC. Columns, in this order: Source ("Your budget",
  "Team's target" or "Proposed: last year's Lift on this year's Baseline"), this year's target,
  this year's Baseline per day, this year's Lift, last year's Lift, the year before's Lift,
  verdict, revised figure. Head the Lift columns with their calendar years. A Lift on a count
  is shown as a ratio over Baseline (1.4 reads "×1.4"); on a ratio such as conversion or CAC
  it is the relative change ("−10%"). Spend's verdict cell reads "Input to CAC". The revised
  figure is filled for Unrealistic targets only and reads "Not needed" elsewhere.
- The Lever gap table has one row per lever (new customers, returning customer orders,
  order value) and the columns last-year level, plan-implied figure, required relative change.
- Each Scenario is one row: the move, its size, its cost or ask, and its effect on the other
  targets.

## Page 6: Plan for this year

Heading: **Plan for** this year's calendar year. Under it, seven headings in this order.

1. **Agreed targets**: one table per month (November, December), one row per figure
   in this order: revenue (name the budget rung; without a Growth Brain, the basis the budget
   counts), orders, new orders, spend, implied CAC (agreed spend over agreed new orders).
   Columns, in this order: agreed target, source ("Your
   budget", "Revised", "Team's target" or "Proposed: last year's Lift on this year's
   Baseline"), Lift over Baseline, verdict. Spend and implied CAC take their Lift from the Target
   test, and spend's verdict cell reads "Input to CAC".
2. **Chosen Scenario**: for each month with a Stretch or Unrealistic target, one row per Scenario
   chosen, a blend as one row per part with its share of the gap. Columns: the move, its size,
   its cost or ask, its effect on the other targets. A month whose targets are all Achievable
   reads "Not needed: every target is Achievable".
3. **Daily phasing**: a caption naming the revenue rung (without a Growth Brain, the basis the
   budget counts) and the year whose daily shape was used,
   then one table with a row per date, the months one after the other, and a total row under
   each month. Columns, in this order: `date`, `days_from_black_friday`, `revenue`, `orders`,
   `new_orders`, `spend`; a measure with no last-year shape reads "No data" in its column.
   Black Friday this year is the row with `days_from_black_friday` 0, on its own date, and is
   marked. Under the table a **Download CSV** button, and one line saying
   the file holds these daily targets, ready to open in a spreadsheet or load into your budget.
4. **Actions**: one sub-heading per grill round (Offer, Merchandising, Marketing, Targets),
   each a table of action and date. A section with none agreed reads "Not agreed".
5. **Opportunities**: the opportunities adopted in the grill, each with its evidence figure, this
   year's action and the metric to watch on the day.
6. **Risks**: three rows in this order, **Stock**, **Discount stacking** and **Margin floor**,
   each with the limit agreed (units to secure; the discounts that may combine; the margin %
   on the named rung, or the gross profit % as Shopify records it) or "Not agreed". Where margin
   has no data, the third row is headed **Discount ceiling** and holds the deepest average
   discount agreed, as a % of pre-discount value.
7. **Watch list**: 3 to 5 rows, each a number to watch on the day, what it should read, and last
   year's figure for the same day from Black Friday.

## Without a Growth Brain

A run without a Growth Brain keeps every heading. A section no Source holds keeps its heading and
reads "No data" with its plain reason; the page never says "coming soon". The wording is fixed,
and also names the Source of a section a Growth Brain run took from a connector or file because
its roster lacked the mart; such a run carries no Brain line:

| Case | Wording |
|---|---|
| Orders, from a file | Orders come from your Shopify orders export. |
| Orders, from a connector | Orders come from your Shopify account. |
| A section no Source holds | <Section> has no data in this run: no source here holds <what it needs, in plain words, such as your visits by landing page, your sales by product or your email campaigns>. |
| Targets, with no orders Source | Your targets were not tested: no source here holds your orders. |
| Target revenue, a budget basis | Your budget counts <total sales, net or gross> revenue, and revenue in the Target test is read on that basis from <Source in plain words> in every year. |
| Target revenue, a basis the Source lacks | Your budget counts <net or gross> revenue, but <Source in plain words> does not hold that measure, so revenue in the Target test is total sales and its Lifts are not like for like with your budget. |
| Target spend | Target test spend covers <platforms> only, the same in every year, and this year's Baseline runs to yesterday. |
| Revenue | Revenue is total sales, by order date, as <Source in plain words> records it. |
| Margin, with cost | Gross profit, as Shopify records it. |
| The CM3 row, with cost and spend | Gross profit less marketing, where marketing is the spend of <platforms>. |
| The CM3 row, with cost and no spend Source | Gross profit less marketing has no data: no source here holds your ad spend. |
| Margin, with no cost | Margin has no data: <Source in plain words> carries no product costs. |
| Timezone, a Source names one | Days follow the timezone <Source in plain words> reports in, <timezone>. |
| Timezone, no Source names one | <Source in plain words> does not say which timezone it reports in, so days may be cut differently from your store's. |
| Timezone, Sources differ | Days are read in <timezone> for <Source in plain words> and in <timezone> for <Source in plain words>, the same in both years. |
| Test orders, a Source with no flag | <Source in plain words> carries no test-order flag, so any test orders are counted. |
| Cancelled orders | Cancelled orders are <left out or counted>, as <Source in plain words> records them. |
| A currency no Source states, confirmed by the user | <Source in plain words> does not say which currency it reports in; amounts are in <currency>, as you confirmed. |
| Visits, conversion and landing pages | Visits are sessions from <GA4 or Shopify>, by landing page, the same in both years. |
| Landing-page orders | Orders by landing page are <the ecommerce purchases GA4 counts, or the orders Shopify counts by landing page, whichever the sessions Source is>, so they can differ from your store's order count; the site's conversion uses your store's orders. |
| Products | Products come from your Shopify <sales by product export or account>, by order date, and a product is matched across years by its title. |
| Email | Email figures come from your <Klaviyo account or Klaviyo campaign export>, by send date; email revenue is as Klaviyo attributes it to each campaign, under its own attribution, so it overlaps your store's revenue and is not added to it. |
| Marketing spend | Marketing spend covers <platforms> only, the same in every year. |
| Platform-reported campaigns | Campaign purchases and values are as <platforms> report them, under their own attribution, and are shown without a Lift. |
| A connector refused a read | <Source in plain words> refused a read, so nothing was taken from it. |

Where no Source holds the orders, page 5 keeps its month blocks: every cell of the Target test
table reads "No data", and the Lever gap and Scenarios sub-headings read "No data: your targets
were not tested". Otherwise the Target test, Lever gap and Scenarios read as on a run with a
Growth Brain, with "Your budget" for the Source of a figure the user gave.

**The Brain line.** Said once, as the last line of the Overview's notes, and once in the chat, on a
run without a Growth Brain; never on a run with one. Its words are fixed: "A Growth Brain adds
margin after every cost (CM3), one source for every figure, and your budget, Klaviyo and cohort
reads with no exports. Get one at gocrux.io/contact."

## The window table

One row per figure per window (Baseline, Lead-in, Black Friday weekend, Festive), and these
columns in this order: the year before last year, its Lift over Baseline, last year, its Lift
over Baseline, last year against the year before. Head each with its calendar year from
`references/windows.sql` (step 1's written-out dates without a Growth Brain). The Baseline row's Lift cells read "Baseline", since every Lift is
measured against it. A section no Source holds keeps its heading and one line saying why; on a run
with a Growth Brain, where its mart is missing from the roster, the line names the mart. A
ranked list shows last year's Black Friday weekend with the
year before alongside, and a platform-reported list is labelled as such.

## The CSV

The page builds the file in the browser from the Daily phasing table's date rows, with no
network request, and offers it as `black-friday-daily-phasing.csv`.

- Columns, in this order: `date, days_from_black_friday, revenue, orders, new_orders, spend`.
- One header row, then one row per date. The total rows are not in the file.
- `date` is `YYYY-MM-DD`; `days_from_black_friday` is a whole number, negative before Black
  Friday; `orders` and `new_orders` are whole numbers; `revenue` and `spend` carry the
  currency's minor unit (two decimals for pounds, none for a currency without one).
  No currency symbol and no thousands separator.
- A month without an agreed target contributes no rows.
- A measure with no last-year shape leaves its field empty on every row.
