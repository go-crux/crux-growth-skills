# Sources: where each figure is read from

A figure is read from the first **Source** that holds it: a Growth Brain, then the ad account and
Shopify connectors, then CSV exports the user gives. This file sets out the Growth Brain's half;
**Connectors and exports** below holds the rest. The user sees "your orders", never a mart name:
`references/deck-layout.md` fixes the plain names.

## The Growth Brain, by contract

A Growth Brain is a connector named `<Client> - Growth Brain` that offers `list_tables`,
`list_metrics`, `search_examples` and `run_sql`. The brain ships the tools and the data; this skill
names the tools and the marts and reads the columns from the brain on every run, because the brain
is the source of truth and a copy here would go stale.

1. **`list_tables` with no arguments** once, for the roster. `<client>` is the prefix its tables
   carry.
2. **`list_metrics`** once, for the brain's own definitions.
3. **`search_examples`** once, and keep what it returns for the queries.
4. **`list_tables` naming one mart** for each mart a step needs, one mart per call (a call naming
   two can overflow the reply), and only the marts needed. Compose every query from the columns it
   returns.
5. **`run_sql`** for every figure.

Several Growth Brains in the session: the intake settles which one (`references/intake.md`), and
the Notes name it.

## The marts, by module

| Module | Mart | What the slides read from it |
|---|---|---|
| Orders | `<client>-orders` | Trading: revenue, orders, new and returning orders, customers (for the customer base), market, the margin rungs. Acquisition and Retention & LTV: each customer's first order and its date, channel, category and type, subscription flag, revenue by order date. Order value & product: AOV by customer type, order category, discount, discount code |
| Channel reporting | `<client>-channel_reporting` | marketing spend; visits; new customers by channel and by campaign; impressions and clicks where it carries them |
| Ad platform performance | `<client>-meta_performance`, `<client>-google_ads_performance` | impressions and clicks by campaign where channel reporting lacks them; the platform's own mart, only for a platform the roster lists |
| LTV retention | `<client>-ltv_retention` | cohort sizes, retention by month since first order and cumulative revenue per customer, where `list_tables` shows it carries them |
| Order items | `<client>-order_items` | units and revenue by product and variant, for the line-item breakdown; a product category per line, for the order's category only where the orders mart holds none |

The roster decides which exist, and each step names only the marts its slides need.
**A mart missing from the roster** makes every slide that reads it a Brain slot, and the Notes name
what could not be built (`references/deck-layout.md`). One client's narrower warehouse narrows the
deck and never breaks the run.

### Acquisition and Retention & LTV

One rule per figure. The columns come from `list_tables` for the mart named, one mart per call;
only the reasons for a choice are kept here.

| Figure | Read from | Rule |
|---|---|---|
| Visits (traffic) | `<client>-channel_reporting` | Sessions, because users cannot be summed across rows. The orders mart holds no visits |
| New orders | `<client>-orders` | A new order is a customer's first ever order, so new orders equal new customers. One figure for the whole deck: the KPI table, the blended slide, the Channel mix Total row and paid vs organic all read it, so no two slides disagree on the month's new orders |
| New-customer conversion | both marts | New orders from the orders mart ÷ visits from channel reporting, with the Notes saying so. Where `list_metrics` defines a new-customer conversion, use that |
| Spend, CAC | channel reporting | Spend is read there, never from the orders mart. CAC is spend ÷ new orders, blended; where `list_metrics` defines CAC, use that definition and state it in the Notes |
| New orders by channel | `<client>-orders` where `list_tables` shows a channel column on it, else channel reporting | The orders mart first, because the channel rows then add to the month's new orders by construction. Orders the mart leaves without a channel are the Unknown row. From channel reporting, the Unknown row is the Total row's new orders less the channels' sum; where that is below zero it reads 0 and the Notes carry the Channel total caveat |
| Paid or organic | the channel grouping `list_tables` shows in channel reporting | A channel is paid where the grouping marks it paid, else where it carries spend in the Current period. State the paid channels in the Notes |
| Campaigns | channel reporting, where `list_tables` shows a campaign column | New orders by campaign are the Source's own attributed new orders, never a platform's reported purchases (those are platform-reported and not comparable with CAC). Platform here is the platform column the mart carries. Impressions and clicks from channel reporting, else from the platform's mart joined on a campaign identifier both share; with no shared identifier they read "No data" |
| Cohorts, retention, cumulative revenue per customer | `<client>-ltv_retention` where it carries cohort size, retention and cumulative revenue; else `<client>-orders` | Cohort is the customer's first-order calendar month. Compute from orders with the cohort month and months since it. Where both are available, use the cohort mart and tie its Current period cohort size to New orders |
| 12-month LTV by channel, category or type | the cohort mart where it carries the grouping, else `<client>-orders` | The LTV window of `references/deck-layout.md`. Group by the first order's channel, category and type; where the mart has no such column, that slide is a Brain slot and the Notes name it |
| Subscription share | `<client>-orders` | The orders' own subscription flag. No flag, or no subscription order in the Current period, drops the slide (conditional). No orders mart makes it a Brain slot |
| Line items | `<client>-order_items` | Units and revenue by product and variant for the Current period and its Comparison periods |

**Definitions.** The brain's `list_metrics` definitions win for CAC, LTV, retention and any other
measure above, and the Notes state them. Where it holds none, the glossary's hold: CAC is all
connected ad spend ÷ new customers, LTV is cumulative revenue per customer since the first order,
and retention is the share of a cohort that ordered in a month. Revenue for LTV, line items and
the cohort slides is on the basis of the KPI table.

**Attribution.** The channel of a customer or a new order is the Source's own first-order
attribution. Name it in the Notes in plain words, and leave an order with no channel in the Unknown
row and the Unknown bar, never spread across the channels.

### Order value & product

One rule per figure, on the same terms as above: columns from `list_tables` for the mart named, one
mart per call, only the reasons kept.

| Figure | Read from | Rule |
|---|---|---|
| AOV, blended, new, returning | `<client>-orders` | Revenue ÷ orders, with new and returning from the orders' customer-type flag. The basis is that of the KPI table, so the blended AOV equals the KPI table's and no two slides disagree. Where `list_metrics` defines AOV, its definition wins and the Notes state it |
| Order category | `<client>-orders` where `list_tables` shows a category column on it, else `<client>-order_items` | A category is read on the order so each order sits in one category and the rows add to the month's totals. From the order items, the category of the order's highest-revenue line. A product's category is never counted per line, since an order with two categories would count twice. Neither mart holds a category: the slide is a Brain slot and the Notes name it |
| Category sales and the 24-month mix | `<client>-orders` | Revenue by category on the KPI table's basis, each month classified by the Current period's categories, so the monthly series add to revenue and compare like for like |
| Discounted orders, discount given, value before discount | `<client>-orders` where `list_tables` shows a discount column on it | A discounted order is one whose discount is above zero. Value before discount is the mart's own pre-discount column where it has one, else the order's revenue plus its discount, both on the same VAT basis. No discount column: `aov-discount` is a Brain slot and the Notes name it |
| Discount rate, discount depth | `<client>-orders` | The glossary's definitions, over the figures above. Where `list_metrics` defines either, its definition wins and the Notes state it |
| Discount codes | `<client>-orders` where `list_tables` shows a discount code column on it | The order's own code, trimmed and upper-cased so one code is one row. No order in the Current period carries a code: the slide is dropped (conditional). Discounts present but no code column: a Brain slot, and the Notes name it |

## Definitions and basis

**The brain's `list_metrics` definitions win.** Where it defines revenue, new customer, active
customer, lapsed customer, CAC or a margin rung, use that definition and state it in the Notes.
Where it does not, the glossary's definitions hold and the Notes state those.

- **Revenue leads.** Revenue is the brain's own revenue measure, read from `<client>-orders` by the
  order's date, ex VAT where the mart carries it both ways, and named with that basis in the KPI
  table and the Notes.
- **Margin adds rows, never replaces them.** Add the CM3 rows when the brain holds CM3, else the
  highest margin rung it holds, labelled as the brain names it. A brain with no margin rung adds no
  margin row.
- **Every order counts.** Revenue, orders, new and returning orders, customers and every other
  figure read every order the brain counts (test orders and cancelled orders as their bullet below
  sets), so the deck matches the brain and the brand's dashboards for the same days. An order not
  fully costed is never left out of a count or an amount, the margin rows included. The margin %
  row is the orders mart's own published margin-rate metric for the rung, quoted as the brain
  defines it; where the mart publishes none for the rung, or its revenue is on another basis than
  the KPI table's, take margin ÷ revenue over the fully costed orders on the KPI table's basis
  instead. The margin money row is that margin % × the KPI table's revenue, over all orders. Where
  `<client>-orders` flags orders that are not fully costed, give their number and share of
  revenue in the Notes.
- **Test orders** are left out wherever a mart flags them. **Cancelled orders** follow the mart
  (most exclude them upstream); the Notes say whether its descriptions include them, exclude them
  or say nothing.
- **Marketing spend** is read from `<client>-channel_reporting`, never from the orders mart.
- **Customer type.** A new order is the customer's first ever order and a returning order is any
  later one, as the orders mart flags it. Each month's new and returning revenue add to that
  month's revenue.
- **Market** is the order's shipping country. A mart with no such column counts as one market.
- **Budget.** A budget is used only when a mart or metric in the roster holds one for the month.
  Without one, the budget columns are left out entirely.

**Timezone and currency**, settled once and reused. Timezone: the brain's instructions where they
name one, else the timezone the date descriptions of `<client>-orders` name. Where they say only
that dates are the store's own timezone, read the date columns as they are with no conversion,
compute relative periods from `CURRENT_DATE()` and say so in the Notes. Else UTC, said in the
Notes. Currency: the brain's instructions where they name it, else the first mart that names it,
`<client>-orders` first. Where none states one, ask which, and say so in the Notes (an Unattended
run asks nothing, and `references/intake.md` sets out its wording).

## The periods

Resolve the Current period and its Comparison periods once, from the month the intake settles, and put
them in the `periods` CTE below, ahead of every query. The Current period is the last complete calendar
month in the brand's timezone unless the user names another.

```sql
WITH base AS (
  SELECT DATE_TRUNC(DATE_SUB(CURRENT_DATE('<timezone>'), INTERVAL 1 MONTH), MONTH) AS current_start
  -- a month the user names replaces the line above with that month's first day, DATE 'YYYY-MM-01'
),
periods AS (
  SELECT
    current_start,
    LAST_DAY(current_start) AS current_end,
    DATE_SUB(current_start, INTERVAL 1 MONTH) AS last_start,
    LAST_DAY(DATE_SUB(current_start, INTERVAL 1 MONTH)) AS last_end,
    DATE_SUB(current_start, INTERVAL 12 MONTH) AS ly_start,
    LAST_DAY(DATE_SUB(current_start, INTERVAL 12 MONTH)) AS ly_end,
    DATE_SUB(current_start, INTERVAL 23 MONTH) AS trend_start
  FROM base
)
```

`last_*` is the month before (MoM), `ly_*` is the same month a year earlier (YoY), and the trend
charts run from `trend_start` to `current_end`. Every query takes its dates from `periods`. Where
the history starts after `trend_start`, the trend runs from the first month it holds, and the Notes
say when that is.

## Connectors and exports

For a run whose Source is the ad account and Shopify connectors or CSV exports (no Growth Brain
chosen at the intake). A deck never mixes a Growth Brain's figures with a connector's, since
slides then stop tying to each other: a run with a brain reads the brain alone, and a run without
one reads each figure below from the first Source that holds it. Everything below is restated here,
because this skill reads nothing outside its own folder.

### Source order per figure

For each figure, the first of these that holds it:

1. **A connector in the session** (Shopify, Google Ads, Meta Ads), read through its own reporting
   tool for the columns named below.
2. **A CSV export the user gives**, or one already in the conversation.

A figure no connector reads and no file holds reads "No data", and a slide that cannot be built
from what is held is a Brain slot (`references/deck-layout.md`, Slides without a Growth Brain). A
figure keeps one Source across the Current period, its Comparison periods and the trend series, so
the periods compare like for like.

**Probe only what could be a Source.** A connector that lists an account can still refuse every
read, so make one small read for each connector the session offers, and for no platform it does
not: Shopify's orders on the Current period's first day, an ad platform's spend on that day, each
through the tool the Read step will use (Google Ads through its query tool). An error or a refusal
is a refusal; a read that returns zero is not.

- **An account that cannot be told to be the brand's** (several accounts listed, none named in
  the message, none the only one) is not read. An attended run asks whose it is, and probes it
  if the answer is the brand's own; an Unattended run skips it.
- **A connector that refuses, or an account skipped**, is named to the user with what it refused
  (an Unattended run names it in the Notes, in the wording of the Caveats table), and is a Source
  for no figure. An export can then fill its figures.
- **An attended run with no connector for a figure the deck reads** asks which ad platforms the
  brand spends on, and gives the user the steps below for the reports those figures need, once,
  then waits. An Unattended run asks for no file: what the session holds is read and the rest is
  "No data" or a Brain slot.

### What each figure reads

Customer-level rows are Shopify **order rows**: one row per order with the columns of the Orders
export below, from a connector or the export. **Reports** are Shopify's sales over time and
sessions over time, a coarser Source that fills only the first three rows.

| Figure | Reads | Slides |
|---|---|---|
| Orders, revenue, average order value | order rows; else the sales over time report | `trading-kpi` |
| New and returning orders and revenue | order rows by customer ID; else sales over time by customer type | `trading-kpi`, `trading-revenue`, `aov-trend` |
| Visits | the sessions over time report, summed by month | `acq-blended` |
| Marketing spend | every connected ad platform's spend by month, added together | `trading-kpi`, `acq-blended`, `acq-channels` |
| Customers: new, active, reactivated, lapsed; cohorts; LTV | order rows with customer IDs and history | `trading-customers`, `ret-cohort`, `ret-ltv`, `acq-ltv-channel` |
| New orders by channel and campaign | order rows with UTM or referrer, and the ad platforms' campaign reports | `acq-channels`, `acq-paid-organic`, `acq-campaigns`, `acq-ltv-channel` |
| Market, category, discount, code, subscription | order rows | `trading-markets`, `aov-product`, `aov-discount`, `aov-codes`, `ret-subscriptions` |

No Source here holds a budget or a margin: there are no budget columns and no margin rows.

**Revenue** is Shopify net sales: after discounts and returns, before shipping and taxes where
the Source separates them. From order rows it is the order's Subtotal less its Refunded Amount,
booked on the order date; from sales over time it is Net sales, booked on the refund date. One
basis serves the whole deck, the order rows' where they exist. The KPI table's label and the
Notes name it, and the Returns caveat takes the matching word.

### Definitions without a Growth Brain

The glossary fixes the five measures, and the Notes state them as written there: **New customer**,
**CAC**, **Active customer**, **Lapsed customer** and **LTV**, with the **Unknown row**. Applied to
Shopify order rows:

- **First order.** A customer's first order is their earliest order for that customer ID in the
  Source. The earliest order held is the history's start. A customer first seen in the history's
  first 12 months may have ordered earlier, so new customers, the customer base, cohorts and LTV
  read "No data" for those 12 months, and the Notes' History line says when the history starts.
  Ask the user for every order from the store's first, or at least the 36 months ending with the
  Current period, which leaves the 24-month series and the LTV window whole.
- **New orders** equal new customers: the orders that are their customer's first. An order with no
  customer ID is its own new customer, and the Notes carry the Customer IDs caveat with the share.
- **Active customer** at a month's end: ordered in the 12 months ending then. **Reactivated** and
  the other customer-base terms follow `references/deck-layout.md`.
- **Lapsed customer** in a month: the 12 months since their last order ended in that month.
- **CAC** is all connected ad spend ÷ new customers (the New orders above), blended, in every period. With no ad spend read,
  CAC reads "No data".
- **Cancelled orders** (a cancelled-at date) are left out of every count.
- **Test orders** are left out where the connector flags them. An export carries no such flag, and
  the Notes carry the Test orders line for exports.

**Cohorts.** Build the cohort retention table and cohort LTV on the rules of
`references/deck-layout.md` (cohort, retention %, rolling average, cumulative revenue per customer),
from order rows with customer IDs: a cohort is the customers whose first order fell in one calendar
month; retention % at month *n* is the share of the cohort that ordered in the *n*th calendar month
after it; cumulative revenue per customer sums the cohort's revenue to month *n* over its size. The
Current period's cohort size equals New orders on `trading-kpi`. Order rows without customer IDs, or
without enough history, make `ret-cohort`, `ret-ltv`, `trading-customers` and `acq-ltv-channel`
Brain slots.

### Channel mix

A **channel** is placed from the UTM and referrer data on the Shopify orders (the UTM source,
medium and campaign columns, else the landing site and referring site they come from), taking the
first that places the order:

| Channel | An order is placed here when |
|---|---|
| Google Ads | the UTM source is google and the medium is paid (cpc, ppc or paid) |
| Meta Ads | the UTM source is facebook, instagram, fb, ig or meta and the medium is paid (paid, cpc, paid social) |
| Email and SMS | the medium is email or sms |
| Organic search | no paid UTM, and the referrer is a search engine or the medium is organic |
| Organic social | no paid UTM, and the referrer or source is a social network |
| Referral | any other referrer site |
| Another UTM source | any other UTM source, named as the source, paid when its medium is paid |
| **Unknown row** | no UTM and no referrer, or none of the above |

An order that carries neither UTM nor referrer is Unknown, never Direct and never spread across the
channels. A connected ad platform other than Google Ads or Meta Ads is its own row by the same
rule, named as the platform.

- **New orders by channel** are the new orders (first orders) placed on each channel.
- **Spend by channel** is the connected platform's spend on its own row (Google Ads, Meta Ads, or the
  platform named). A channel with no ad platform has no spend, so its spend and CAC read "No data".
  A connected platform with spend always has a row, even with no placed new orders, so spend adds
  up; its CAC then reads "No data".
- **Channel CAC** = that channel's spend ÷ the new orders Shopify places on it. The Total row's
  spend is all connected ad spend and its CAC the blended CAC.
- **Platform-reported conversions never share that column.** An ad platform's own purchases and
  conversion value are not read anywhere in this deck: they follow the platform's attribution, so
  they are not comparable with a Shopify-placed new order.
- **Paid or organic.** A channel is paid when it is a connected ad platform's row or its orders'
  medium is paid; every other placed channel is organic, and the Unknown row stays its own group.
  State the paid channels in the Notes.
- **Campaigns.** A campaign's new orders are the Shopify new orders whose UTM campaign equals the
  campaign's name or ID in the platform's report (trimmed, ignoring case). Only campaigns with at
  least one placed new order are ranked; the "All `<platform>` campaigns" row carries the platform's
  spend, impressions and clicks and its channel row's new orders.
- **LTV by channel** groups customers by the channel of their first order, on the LTV window.

### Timezone, currency and periods

Timezone: the one the Source reports in (the Shopify store's), said in the Notes; where it states
none, UTC, said in the Notes. Currency: the one the Shopify Source states, else the ad platform's;
an ad platform that reports in another currency than the orders is not added to marketing spend and
is named in the Notes. Where none states one, an attended run asks which and an Unattended run shows
amounts with no symbol, and the Notes say so. Work out the dates by the rules of The periods above
(the Current period, last month, the same month last year and the 24-month trend) and read every
connector and file on them.

### The reports to export

Give the user only the steps for the files the run needs and does not already hold, and name what
each file feeds. Match column headers loosely: labels vary by report version and language.

**Shopify: Orders export.**

1. In Shopify admin, open Orders, then Export.
2. Choose all orders in the date range (every order up to the end of the Current period, or the 36
   months ending with it), as a plain CSV file, and drop the file into this chat.

Shopify exports one row per line item, with order-level columns filled on an order's first row:
read each order's totals once.

| Column | Feeds |
|---|---|
| Name (order number) | one row per order |
| Created at | the order's date |
| Cancelled at | cancelled orders left out |
| Customer ID | new, active, lapsed customers, cohorts, LTV |
| Subtotal, Refunded Amount | revenue |
| Discount Code, Discount Amount | discounted orders, depth, codes |
| Shipping Country | markets |
| UTM source, UTM medium, UTM campaign (or Landing site and Referring site) | channel placement |
| Tags (or a subscription column) | an order is a subscription order when it names a subscription |
| Lineitem name, Lineitem sku | the order's category, with the Products export |
| Currency | currency |

**Shopify: Products export** (for the category): Products, Export, CSV, with Title, Type, Product
Category and Variant SKU. A line's category is its product's Type, else its Product Category,
joined on the SKU, else the product title the line's name begins with.

**Shopify: sales over time and sessions over time** (when no order rows are held, and for visits):
in Analytics, Reports, open "Sales over time", set the range to the 24 months ending with the
Current period, group by month, add customer type (new or returning) and export as CSV. Open the
sessions over time report for the same range and grouping and export it the same way.

| Report | Column | Feeds |
|---|---|---|
| Sales over time | Month, Customer type, Orders, Gross sales, Discounts, Net sales | orders, revenue, new and returning |
| Sessions over time | Month, Sessions | visits |

**Google Ads: campaign report.** Open Campaigns, set the range to the 24 months ending with the
Current period, segment by month (Segment, Time, Month), set the status filter to all campaigns
(enabled, paused and removed), add Campaign ID where offered, and download as CSV.

| Column | Feeds |
|---|---|
| Campaign (and Campaign ID), Month | the campaign level, the month |
| Cost | spend |
| Impressions (Impr.), Clicks | impressions, clicks |

**Meta Ads: campaign report.** In Ads Manager, open the Campaigns tab, set the range to the 24
months ending with the Current period, break down by time (Month), add Campaign ID where offered
and export as CSV.

| Column | Feeds |
|---|---|
| Campaign name (and Campaign ID), Month | the campaign level, the month |
| Amount spent | spend |
| Impressions, Link clicks | impressions, clicks |

**Google Ads connector.** The summary and performance tools take relative ranges and show enabled
campaigns only, so read through its query tool (Google Ads Query Language): filter on
`segments.date` between the first day of the trend and the Current period's last day, segment by
`segments.month`, put no filter on campaign status, and take every page of rows (following the
next-page token until none) before any sum. Select `campaign.name`, `campaign.id`,
`metrics.cost_micros` (divide by 1,000,000), `metrics.impressions` and `metrics.clicks`, with no
conversion segment.

### Reading a connector or an export

- Read numbers as counts or amounts, ignoring thousands separators, in the currency the Source
  reports.
- A file with a date column holds the periods the deck reads: split its rows on the dates. A file
  grouped by month is accepted where each period is a whole month; a file with no date column is
  one period and its range is confirmed against the dates. Ask once for the re-export when the
  dates do not match.
- Add together rows that share a segment, leaving any total row out of the sums, and where a file
  has a total row check that the segments sum to it.
- Read ad platform files as given: platform conversion columns are left unread, and a figure the
  file lacks reads "No data".

### When a figure cannot be read

A missing column, a report the user cannot export or a figure with no Source reads "No data", or
its slide is a Brain slot (`references/deck-layout.md`). Name what is missing to the user with what
it feeds ("Cohorts need a customer ID on your orders"), and ask for the re-export once; an
Unattended run asks for none. The Appendix is a Brain slot on every run without a Growth Brain,
whatever the connectors and files hold.
