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
Compose every query from the columns that second call returns.

**Windows.** Open `references/windows.sql`. Put its CTEs ahead of every query and join to them
for dates, so Baseline, Lead-in, Black Friday weekend and Festive are computed in one place.

**Headline.** For Black Friday weekend of last year and of the year before it, read the
growth equation: new customers, order frequency, order value and contribution margin. Read each
against that year's Baseline.

- Compare last year with the year before it, and with nothing from this autumn: visits and
  channel attribution changed source this year.
- Put counts (new customers, contribution margin) per day, so a four-day window sits against a
  two-month Baseline. Order frequency is orders per ordering customer in the window; order
  value is revenue over orders.
- Take margin from the deepest rung the brain publishes (CM3, else CM2, else CM1), from
  whichever of the two tables carries it. The rung differs per client, so name it on the page.
- Take revenue from the orders table's main sales measure and name it on the page.
- Express every change as a relative percentage.
- A window with no rows reads "No data" in its cell.

**Done when** all four terms carry a figure for both years and each year's Baseline (or "No
data"), the margin rung and the revenue measure are named, and the run has queried only
`<client>-orders` and `<client>-channel_reporting`.

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

**Done when** the page has both tabs with every heading in `references/plan-layout.md`, the
Growth equation table has a cell for each term and column, and the founder has the page's path.
