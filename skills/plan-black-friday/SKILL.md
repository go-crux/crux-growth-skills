---
name: plan-black-friday
description: Black Friday planning on the founder's own Growth Brain. Use when the founder asks to plan Black Friday or the festive peak, to check their November targets, or how last year's Black Friday performed.
---

# Black Friday plan

Produce the Black Friday plan from the founder's own data: one page with two tabs, Last year
and Plan. Run the five steps in order. The terms Baseline, Lead-in, Black Friday weekend,
Festive, Lift, Target test, Pillar gap, Scenario, Daily phasing and Black Friday plan are those
of `GLOSSARY.md`; use them as written.

## 1. Read

**Connect.** Look for a connector named `<Client> - Growth Brain` that offers `list_tables`,
`list_metrics`, `search_examples` and `run_sql`. With none, tell the founder in one line that
Black Friday planning needs their Crux Growth Brain connected in this session and to ask their
Crux contact to set it up, then stop: run no query and call no other tool. With several, ask
which one.

**Discover.** Call `list_tables` once with no arguments for the roster. Call it again naming
only `<client>-orders` and `<client>-channel_reporting` (`<client>` is the prefix the roster
carries). If either is missing from the roster, tell the founder in one line which one and stop.
Each section below opens with its own `list_tables` call naming only the marts that section
reads. Compose every query from the columns the calls return. A mart absent from the roster
drops its part of the page, with one line saying so. `product_funnel`, `meta_performance` and
`google_ads_performance` are optional: name each in a `list_tables` call only when the roster
lists it.

**Windows.** Open `references/windows.sql`. Put its CTEs ahead of every query and join to them
for dates, so Baseline, Lead-in, Black Friday weekend and Festive are computed in one place.
Type no date by hand, and keep the years to last year and the year before it.

**Basis.** Apply to the headline and to every section.

- Compare last year with the year before it, and with nothing from this autumn: visits and
  channel attribution changed source this year.
- Put counts (new customers, orders, units, revenue, margin, spend) per day, so a four-day
  window sits against a two-month Baseline. A window's Lift is its per-day figure over the same
  year's Baseline per-day figure; for a ratio (conversion, order value, margin %, CAC), the
  Lift is the relative change in the ratio.
- Take margin from the deepest rung the brain publishes (CM3, else CM2, else CM1), from
  whichever table carries it. The rung differs per client, so name it on the page.
- Take revenue from the orders table's main sales measure and name it on the page.
- Express every change as a relative percentage.
- A window with no rows reads "No data" in its cell.

**Headline.** For Black Friday weekend of last year and of the year before it, read the
growth equation: new customers, order frequency, order value and contribution margin. Read each
against that year's Baseline. Order frequency is orders per ordering customer in the window;
order value is revenue over orders.

**Offer.** Read conversion, discount, order value, margin % and reorder, for Baseline, Lead-in,
Black Friday weekend and Festive in both years.

- Conversion is orders over visits from `<client>-channel_reporting`, overall and by landing
  page. `ecommerce_funnel` starts 2026-09-09 and holds no earlier visits, so last year's
  conversion comes from `channel_reporting`.
- Discount depth is the average discount as a share of pre-discount value on discounted
  orders; discount rate is the share of orders discounted. Order value and margin % are from
  `<client>-orders`.
- 90-day reorder is the share of a window's new customers who place a second order within 90
  days of their first. Read it for Black Friday weekend new customers and for Baseline new
  customers, from `<client>-orders` with `<client>-customers`, or from `<client>-ltv_retention`
  where that carries the cohort directly. Name in `list_tables` only the one you use. Ninety
  days is the longest horizon both years share, because last year's cohort is under a year old.
- List the ten landing pages with the most weekend visits, each with orders, conversion and
  last year's conversion alongside, and the site's conversion above them.

**Merchandising.** Call `list_tables` for `<client>-order_items`, and for `<client>-product_funnel`
if the roster lists it. Show units, revenue and margin per day by window, then rank the five
products with the most revenue in Black Friday weekend of last year. Each product row carries
units, revenue, margin, share of the weekend's margin, average discount, efficiency, and the
year before it for the same product. Efficiency is margin per unit sold and, from
`product_funnel`, the product's view-to-purchase rate. A figure the tables lack reads "No data".

**Marketing.** Two parts, each with its own window table.

- *Acquisition*: visits, new customers, spend and CAC (spend over new customers) per day by
  window, from `<client>-channel_reporting`. Rank the five campaigns with the most new
  customers in Black Friday weekend of last year, each with CAC and the year before it, and
  name the three landing pages with the most orders from the Offer list. Where the roster lists
  `meta_performance` or `google_ads_performance`, add that platform's five best campaigns on its
  own return measure, labelled platform-reported and shown without a Lift.
- *Retention*: call `list_tables` for `<client>-klaviyo_campaign_summary`. Show campaign
  revenue and sends per day by window, then rank the five campaigns with the most revenue in
  Black Friday weekend and Festive of last year, each with the average revenue of the other
  campaigns in its window beside it.

**Opportunities.** Open `references/opportunities.md` once the three sections are read. Test
each pattern's trigger against the figures just read, and name the 3 to 5 that fire, largest
at stake first. With more than five firing, keep the five with the most contribution margin or
revenue at stake; with fewer than three, name those that fired and say how many did. Add at
most one judgement call of your own that no pattern covers, marked "Judgement call". Each
opportunity carries its evidence figure, this year's action and the metric to watch on the day.

**Done when** the headline, Offer, Merchandising and Marketing each show last year, the year
before it and each window's Lift over Baseline, or a one-line reason it is absent; the margin
rung and the revenue measure are named; every query took its dates from `references/windows.sql`;
the run has queried only the marts named in this step, with `product_funnel`, `meta_performance`
and `google_ads_performance` only where the roster lists them; and the 3 to 5 opportunities
each carry evidence, action and metric (or the count that fired is stated).

## 2. Target test

Not in this version of the skill. Carry on to step 5.

**Done when** step 5 has started.

## 3. Pillar gap

Not in this version of the skill. Carry on to step 5.

**Done when** step 5 has started.

## 4. Grill

Not in this version of the skill. Carry on to step 5.

**Done when** step 5 has started.

## 5. Plan

Write the Black Friday plan as `black-friday-plan.html` in the working folder. Open
`references/plan-layout.md` for the tabs and headings. Last year holds what step 1 produced;
Plan holds its heading and "Not agreed yet".

Tell the founder where the page is, give the headline in one sentence, and say in one line that
the Target test, Pillar gap and Grill are not in this version yet.

**Done when** the page has both tabs with every heading in `references/plan-layout.md`, every
table has a cell for each row and column (or "No data"), each section without figures carries
its one-line reason, and the founder has the page's path.
