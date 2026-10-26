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
- **Uncosted orders.** Where `<client>-orders` flags orders that are not fully costed, filter
  margin and the revenue beside it on the same rows, and give the uncosted share of revenue in the
  Notes: otherwise margin looks better than it is.
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

A run without a Growth Brain builds the deck with every slide a Brain slot, closes the Notes with
the Brain line, and says so in the chat.
