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

Several Growth Brains in the session: ask which one, with a recommendation (the one the user
named, else the first the session lists), and wait. An unattended run stops with one line naming
the brains found when the message names none.

## The marts, by module

| Module | Mart | What the Trading slides read from it |
|---|---|---|
| Orders | `<client>-orders` | revenue, orders, new and returning orders, customers (for the customer base), market, the margin rungs |
| Channel reporting | `<client>-channel_reporting` | marketing spend |

The other Sections name the marts they read in their own steps, and the roster decides which exist.
**A mart missing from the roster** makes every slide that reads it a Brain slot, and the Notes name
what could not be built (`references/deck-layout.md`). One client's narrower warehouse narrows the
deck and never breaks the run.

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
`<client>-orders` first. Where none states one, ask which, and say so in the Notes.

## The periods

Resolve the Current period and its Comparison periods once, from the month step 2 settles, and put
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
