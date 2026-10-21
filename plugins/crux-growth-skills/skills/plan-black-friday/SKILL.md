---
name: plan-black-friday
description: Black Friday planning on the brand's own Growth Brain. Use when someone asks to plan Black Friday or the festive peak, to check their November targets, or how last year's Black Friday performed.
---

# Black Friday plan

Produce the Black Friday plan from the brand's own data: one page with six pages (Overview,
Offer, Marketing, Retention, Targets and Plan) as `references/plan-layout.md` fixes them. Run
the five steps in order. The user may know nothing of how it works: call the plan figures "your
budget", in chat and on the page, never "the sheet" or a table name. The user sees only the chat
and the page, never this skill or its references: say what the data showed, in plain words with
its figure, and never cite a catalogue number, a trigger, a threshold, a file or a rule, or say
that something "fired". The terms Baseline, Lead-in, Black Friday weekend,
Festive, Lift, Last-year level, Target test, Pillar gap, Scenario, Daily phasing and Black Friday
plan are those of `references/glossary.md`; use them as written.

## 1. Read

**Connect.** Look for a connector named `<Client> - Growth Brain` that offers `list_tables`,
`list_metrics`, `search_examples` and `run_sql`. With none, tell the user in one line that
Black Friday planning needs their Crux Growth Brain connected in this session and to ask their
Crux contact to set it up, then stop: run no query and call no other tool. With several, ask
which one.

**Discover.** Call `list_tables` once with no arguments for the roster. Call it again naming
only `<client>-orders` and `<client>-channel_reporting` (`<client>` is the prefix the roster
carries), one table per call: a call naming two marts can overflow the reply. If either is
missing from the roster, tell the user in one line which one and stop.
Each section below opens with its own `list_tables` calls, one per mart that section reads. Compose every query from the columns the calls return. A mart absent from the roster
drops its part of the page, with one line saying so. `meta_performance` and
`google_ads_performance` are optional: name each in a `list_tables` call only when the roster
lists it.

**Windows.** Open `references/windows.sql`. Put its CTEs ahead of every query and join to them
for dates, so Baseline, Lead-in, Black Friday weekend and Festive are computed in one place.
Type no date by hand, and keep the years to last year and the year before it. Where the
brain's own instructions name the store's timezone, write every `CURRENT_DATE()` in those CTEs
as `CURRENT_DATE('<timezone>')`, so yesterday and this year are the store's own.

**Basis.** Apply to the headline and to every section.

- Compare last year with the year before it, and with nothing from this autumn: visits and
  channel attribution changed source this year. The one exception is this year's Baseline in
  step 2, which reads only revenue, orders, new orders and spend.
- Put counts (new customers, orders, units, revenue, margin, spend) per day, so a four-day
  window sits against a two-month Baseline. A window's Lift is its per-day figure over the same
  year's Baseline per-day figure; for a ratio (conversion, order value, margin %, CAC), the
  Lift is the relative change in the ratio.
- Take margin by order date, from `<client>-orders`: the deepest rung it carries per order
  (CM2, else CM1). For the headline and every window table, also show CM3 = that order margin
  less the window's marketing spend from `<client>-channel_reporting`; label it CM3 only when
  the order rung is CM2 and its fulfilment or payment costs are non-zero on some orders in the
  window, else "CM1 less marketing" (a CM2 whose extra costs all read zero or null is CM1).
  Where the orders mart carries a column flagging fully costed orders, take a window's margin as
  the margin rate on its fully costed orders times the window's revenue, and footnote the
  costed share of revenue where it is under 90%. Product rows take the deepest rung
  `<client>-order_items` carries. Read no margin from `<client>-channel_reporting`: it books
  refunds on the refund date, so a weekend's margin there carries other weeks' returns. Name the
  rung beside every margin figure.
- Take revenue from the orders table's total sales measure (the one its own descriptions call
  total sales, after discounts and returns) and name it on the page.
- Leave out test orders in every query, wherever a mart flags them.
- Express every change as a relative percentage.
- A window with no rows reads "No data" in its cell.

**Headline.** For Black Friday weekend of last year and of the year before it, read the
growth equation: new customers, returning customer orders, order value and CM3 (or "CM1 less
marketing"). Read each against that year's Baseline. Returning customer orders are orders less
new orders: few customers order twice inside one window, so repeat buying shows as returning
orders, not as orders per customer. Order value is revenue over orders.

**Offer.** Read conversion, discount depth, discount rate, order value and margin %, for
Baseline, Lead-in, Black Friday weekend and Festive in both years.

- Conversion is orders over visits from `<client>-channel_reporting`, overall and by landing
  page. `ecommerce_funnel` starts with the GA4 raw event stream and holds no visits for last
  year, so last year's conversion comes from `channel_reporting`.

- Discount depth is the average discount as a share of pre-discount value on discounted
  orders; discount rate is the share of orders discounted. Order value and margin % are from
  `<client>-orders`.

- List the ten landing pages with the most weekend visits, each with orders, conversion and
  last year's conversion alongside, and the site's conversion above them.

**Merchandising.** Call `list_tables` for `<client>-order_items`: every product figure comes from
it. Show units, revenue and margin per day by window, then rank the five
products with the most revenue in Black Friday weekend of last year. Each product row carries
units, revenue, margin, margin %, share of the weekend's margin, average discount and margin
per unit, and the year before it for the same product. A figure the table lacks reads "No data".

**Marketing.** Three parts, each with its own window table.

- *Acquisition*: visits, new customers, spend and CAC (spend over new customers) per day by
  window, from `<client>-channel_reporting`. Rank the five paid campaigns (spend above
  zero) with the most new customers in Black Friday weekend of last year, each with CAC and the year before it, and
  name the three landing pages with the most orders from the Offer list. Where the roster lists
  `meta_performance` or `google_ads_performance`, add that platform's five best campaigns on its
  own return measure (reported conversion value; a platform with none ranks on reported
  purchases, shown with cost per purchase), labelled platform-reported and shown without a Lift.
- *Retention*: call `list_tables` for `<client>-klaviyo_campaign_summary`. Show campaign
  revenue and sends per day by window, placing each campaign in the window of its send date,
  then rank the five campaigns with the most revenue in Black Friday weekend and Festive of
  last year, each with the average revenue of the other campaigns in its window beside it.
  Count the campaigns sent on each day of Black Friday weekend, in both years, for the send
  cadence table.
- *Repeat customers*: for every window in both years, read returning customers' share of
  orders (orders from customers with an earlier order, from `<client>-orders`) and the 90-day
  reorder of the window's new customers (the share who place a second order within 90 days of
  their first), from `<client>-orders`, or from `<client>-ltv_retention` where that carries the
  cohort directly.
- *Cohorts*: Black Friday brings many customers who buy once and never again, so test whether
  last year's weekend customers were worth having. Take the new customers of Black Friday weekend
  and of Baseline, in both years, as four cohorts. For each, at 30, 90 and 180 days from each
  customer's first order: the share who ordered again, orders per customer, and cumulative
  margin per customer on the order rung (first order included). Beside the 180-day margin put the
  cohort window's CAC, and the share who have bought only once. Read from `<client>-ltv_retention`
  where it carries these cohorts, else from `<client>-orders`. 180 days is the longest horizon
  every cohort has completed; a horizon a cohort has not reached reads "Too recent".

**Opportunities.** Open `references/opportunities.md` once the sections are read. Test
each pattern's trigger against the figures just read, and name the 3 to 5 that fire, largest
at stake first. With more than five firing, keep the five with the most contribution margin or
revenue at stake; with fewer than three, list only those found. Add at
most one judgement call of your own that no pattern covers, marked "Judgement call". Each
opportunity carries a short plain title of what was found (for example "Weekend customers rarely
come back"), its evidence figure, this year's action and the metric to watch on the day. Number
the opportunities 1, 2, 3 in the order the page lists them; that page number and title are the
only way the chat refers to one. Say nothing of patterns that did not hold.

**Done when** the headline, Offer, Merchandising, Acquisition, Retention, Repeat customers and Cohorts each show last year, the year
before it and each window's Lift over Baseline, or a one-line reason it is absent; the margin
rung and the revenue measure are named; the headline and every window table carry the CM3
(or "CM1 less marketing") row, labelled by the Basis rule; every query took its dates from
`references/windows.sql`, in the store's timezone where the brain names one, and left out
flagged test orders; a costed share of revenue under 90% is footnoted; the run has queried
only the marts named in this step, with `meta_performance` and `google_ads_performance` only
where the roster lists them; and the 3 to 5 opportunities
each carry evidence, action and metric (fewer only when fewer were found).

## 2. Target test

**Read the plan.** Call `list_tables` naming only `<client>-daily_budget_versus_actuals`. Take
the rows keyed `channel = 'all'` and `country_code = 'all'` (the other rows split the same plan
and would count it twice). Sum the plan by `month_start` for November and December of this year, each in full. Take four
plan columns: revenue, total orders, new orders and spend.

- **The revenue rung is the client's own, on your budget's own basis.** Read whichever
  `daily_budget_*sales*` column `list_tables` returns. Where the rung takes returns off (net or
  total sales), your budget's actuals book them on the refund date, so read every year's revenue
  for this step on the same rung from `<client>-channel_reporting`, which books them the same
  way; only where it lacks the rung, read `<client>-orders` and say so in the footnote. Where the
  rung takes returns off, the footnote also says that the read pages' revenue is order-dated
  and the Target test's refund-dated, so their Lifts can differ; a gross rung takes no returns
  off and needs no such line. Name the rung on the page. If neither mart carries it, say so in
  one line and test orders, new orders and CAC only.
- With no plan for a month, open `references/no-plan.md`.

**Read the actuals.** One query per source, joined to `target_months` and `baseline_actual` in
`references/windows.sql`, returning for each of the three years: Baseline, November and
December as sums and day counts. Take revenue and spend from
`<client>-channel_reporting` (revenue as the rung bullet above says) and orders and new orders
from `<client>-orders`, the same sources in all three years. This year's Baseline runs to yesterday (`baseline_actual`) and the footnote says so. The
mart's recorded side holds 12 months, so the plan is the only thing read from it.

**Test each target.** The targets are revenue, orders, new orders and implied CAC (spend over
new orders). Spend is the input to CAC and carries no verdict, but takes a Lift. For each
target and month:

1. **This year's Lift** = the plan per day over this year's Baseline per day. Per day means the
   total over the days in the period, so months of different length compare.
   For CAC, the Lift is plan CAC over Baseline CAC.
2. **Last year's Lift** and **the year before's Lift** = that year's November (or December) per
   day over that year's Baseline per day, on the same rung and sources.
3. **Verdict**, judged against last year's Lift: **Achievable** at or under it, **Stretch** up to
   1.5 times it, **Unrealistic** above 1.5 times it. Lower CAC is the harder plan, so for CAC
   read the band the other way: Achievable at or over last year's CAC Lift, Stretch down to
   last year's CAC Lift divided by 1.5, Unrealistic below that. Judge the verdict on unrounded
   figures, so rounding a target for display or phasing never moves its band. Where last year's Lift is
   "No data", use the year before's Lift in its place throughout this step and say so.
4. **Last-year level** = this year's Baseline per day × last year's Lift × the days in the
   period (for CAC, Baseline CAC × last year's CAC Lift). Work it out for spend too. For an
   Unrealistic target the last-year level is the revised figure; show it beside the plan.

**Done when** every target carries a verdict, its Lift and last year's Lift; each Unrealistic
target carries its revised figure; the revenue rung is named; and the plan months sum the
`all`/`all` rows (or each unplanned target reads "Proposed").

## 3. Pillar gap

Skip a month in which every target is Achievable and say so in one line. For each month with a
Stretch or Unrealistic target, build the Pillar gap table from the growth equation. Each row is
read against the last-year level (step 2), and each reads off one target:

| Pillar | Figure | Target it reads |
|---|---|---|
| New customers | new orders | new orders |
| Returning customer orders | returning orders (orders less new orders) | orders |
| Order value | revenue over orders | revenue |

Columns: the last-year level, the figure the plan implies, and the relative change required.
When implied CAC is the only target not Achievable, the New customers row reads differently:
its last-year level is the new orders plan spend buys at the last-year level CAC (plan spend over
that CAC), set against plan new orders.
Then open `references/scenarios.md` and write 2 or 3 Scenarios for the month, each closing the
gap through one pillar with the other two held at the last-year level.

**Done when** each Stretch or Unrealistic target shows its gap per pillar and 2 or 3
single-pillar Scenarios.

## 4. Grill

**Start.** Open `references/plan-layout.md` and write `black-friday-plan.html` in the working
folder: pages 1 to 5 as steps 1 to 3 produced them, and every Plan heading reading "Not
agreed". Then open the chat with what was done, before any question, in a few short lines:
the windows and their dates in the two years read, that each is read as its Lift over its own
Baseline and year on year, the headline in one sentence, where this year's targets came from
(your budget) and each month's verdicts. Say where the page is and which page holds what, that
four rounds follow, one per section, ending on the Plan page, and that they can answer "just
write it" at any point.

**Rounds.** Run four numbered rounds in this order. Open each with its number and section. Each
question states the finding or opportunity it comes from with its figure, the decision, and a
recommendation. Ask the next round only after the user has answered the one before.

- "Yes" accepts every recommendation in the round. An answer to a question replaces that
  question's recommendation. "Skip" leaves it Not agreed.
- "Just write it" accepts every recommendation in this round and the rounds still to come, with
  each action's date set to the recommendation below, then goes straight to step 5.
- Close each round by asking a date for each action agreed in it. Recommend a date before the
  first day of the window the action lands in (from `references/windows.sql`), or tomorrow once
  that day has passed.
- A target figure the user changes goes back through step 2's Lift and verdict rules, and
  through step 3 if it then reads Stretch or Unrealistic.

| Round | Questions | Feeds |
|---|---|---|
| 1. Offer | One per listed opportunity from catalogue patterns 1, 2, 8 and 10, asked by its page number and title: adopt its action? Recommend yes. Then discount stacking: which discounts may combine over Black Friday weekend? Recommend none that takes the order past last year's weekend discount depth. | Opportunities, Actions, Risks (discount stacking) |
| 2. Merchandising | One per listed opportunity from catalogue patterns 3 and 4, asked by its page number and title: adopt its action? Recommend yes. Then stock: what units to secure for last year's five weekend products? Recommend last year's weekend units for each, scaled by the November plan revenue over its last-year level, and never below last year's. | Opportunities, Actions, Risks (stock) |
| 3. Marketing | One per listed opportunity from catalogue patterns 5, 6, 7 and 9, asked by its page number and title: adopt its action? Recommend yes. Then repeats: which best acquisition campaign and best retention campaign run again? Recommend the top-ranked paid acquisition campaign, and the top-ranked retention campaign of Black Friday weekend. | Opportunities, Actions |
| 4. Targets | Open on each month's Target test verdicts and Scenarios. First, for each target reading "Proposed" (`references/no-plan.md`), ask the user's own figure, recommending the proposed one; a figure they give becomes "Team's target" and goes back through step 2, and through step 3 if it then reads Stretch or Unrealistic. Then (a) the agreed targets: recommend the plan figure for Achievable and Stretch, and the revised figure for Unrealistic. (b) The Scenario, or blend, for each month with a Stretch or Unrealistic target: recommend the one with the smallest required relative change in the Pillar gap table (the higher extra spend when the Scenarios are the two new-customer variants). (c) The margin floor: recommend last year's Black Friday weekend order margin % on the order rung (CM2 or CM1), since CM3 is a window figure and no single order carries it. (d) The watch list of 3 to 5 numbers: recommend the metric to watch of each adopted opportunity, then revenue against the day's Daily phasing, up to five. | Agreed targets, Chosen Scenario, Daily phasing (step 5 derives it from the agreed targets), Actions, Risks (margin floor), Watch list |

A Judgement call joins the round of its section. Keep the agreed list: what is agreed under
each of the seven Plan headings.

**Done when** all four rounds are answered or accepted by "just write it", and every Plan heading
is agreed or marked Not agreed.

## 5. Plan

**Daily phasing.** For each month with agreed targets, compute the Daily phasing in `run_sql`,
with the agreed targets as literals and the dates from `phasing_days` in
`references/windows.sql`.

- Take last year's daily revenue (the budget rung) and spend from `<client>-channel_reporting`
  and orders and new orders from `<client>-orders`, the sources step 2 used, on each day's
  `shape_date`.
- A day's figure = the agreed month target × its `shape_date` figure over the sum of the month's
  `shape_date` figures, one share per measure.
- Round the month target to a whole number (orders, new orders) or to the currency's minor unit
  (revenue, spend), then round the days the same way by largest remainder, so the days sum exactly to the target.
- Return `date`, `days_from_black_friday`, revenue, orders, new orders and spend for every day,
  with each measure's monthly sum beside its agreed target.
- A month whose `shape_date` figures sum to nothing for a measure, or with no agreed targets,
  keeps its Daily phasing as "Not agreed" with one line of reason.

**Write.** Rewrite `black-friday-plan.html` with the Plan page filled from the agreed list and
the phasing, headings and CSV as `references/plan-layout.md` fixes them. Implied CAC is the
agreed spend over the agreed new orders.

Tell the user where the page is, give the agreed plan in one sentence, and name the CSV
button. Loading the Daily phasing into their budget is a hand-off: the page says to send
the CSV to their Crux contact.

**Done when** the page has all six pages with every heading in `references/plan-layout.md`; every
table has a cell for each row and column (or "No data"); each section without figures carries
its one-line reason; each Plan heading with nothing agreed reads "Not agreed"; no cell reads a bare "n/a"; the Daily
phasing days sum exactly to each agreed month, and Black Friday this year sits on its own date;
the CSV rows match the table; and the user has the page's path.
