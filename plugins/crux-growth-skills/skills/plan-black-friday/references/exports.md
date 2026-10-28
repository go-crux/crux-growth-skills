# Without a Growth Brain

Opened by `SKILL.md` step 1 when a Source is a platform connector or a file the user gives, and
by each section that reads without a Growth Brain. A connector is read through its own reporting
tool for the columns named here. The export steps are for a section no connector reads, and for
nothing else; give the user only the steps for the reports the run still needs.

## Which Source reads which section

Give each section the first Source in `SKILL.md` step 1's order that holds it. A section reads one
Source, with the same report, columns and filters, in both years. The orders spine (headline,
Offer order figures, Repeat customers, Cohorts) reads one Source as a whole.

| Section | Growth Brain | Platform connector | File |
|---|---|---|---|
| Headline | `<client>-orders` | Shopify orders | Shopify: orders |
| Offer: order value, discount depth, discount rate, margin % | `<client>-orders` | Shopify orders | Shopify: orders |
| Repeat customers | `<client>-orders` or `<client>-ltv_retention` | Shopify orders | Shopify: orders |
| Cohorts | `<client>-orders` or `<client>-ltv_retention` | Shopify orders | Shopify: orders |

Every section with no row (Offer conversion and landing pages, Merchandising, Acquisition, Email,
and the Target test) has no Source without a Growth Brain: it reads "No data" with the plain
reason that no Source in this run holds it, in the wording of `references/plan-layout.md`.

## Shopify: orders

One row per order, for every order from 1 September of the year before last to yesterday. That
range covers both years' windows, last year's 180-day cohorts and this year's Baseline.

1. In Shopify admin, open Analytics, then Reports, then create a custom report on sales.
2. Group by order ID and by customer ID, and add the customer type (new or returning), the order
   date and the columns below.
3. Set the date range from 1 September of the year before last to yesterday.
4. Export as CSV and drop the file into this chat.

| Column | Feeds |
|---|---|
| Order ID | one row per order; the order count |
| Customer ID | repeat customers and cohorts, matched across years |
| Order date | the window an order falls in |
| New or returning customer (Shopify's own customer-type column) | new customers and returning customer orders. A customer whose first order predates the file is returning, not new |
| Gross sales | discount depth |
| Discounts | discount depth and discount rate |
| Returns | nothing alone: total sales already takes them off |
| Total sales | revenue, order value |
| Cost (cost of goods sold), where Shopify holds product costs | margin, as total sales less cost |

Where a Shopify connector is in the session, read the same nine columns for the same range
through its orders or analytics query tool, one row per order, taking every page of rows before
any sum.

## Reading a connector or an export

- Match column headers loosely: labels vary by report version and language. Read numbers as
  counts or amounts, ignoring thousands separators, in the currency the Source reports.
- **Dates.** Split the rows on the windows' dates from `SKILL.md` step 1. A file that starts after
  1 September of the year before last, or stops before yesterday, is asked for again once, with
  the range it missed.
- **One Source per section across every year read.** Last year, the year before it and this
  year's Baseline all come from the same file or connector, with the same columns and filters.
- **Test orders.** Shopify analytics reports leave them out; a connector read leaves out orders
  Shopify flags as test. A Source with no test-order flag is read as it stands, and the Notes
  name it in the wording of `references/plan-layout.md`.
- **Cancelled orders** are as the Source records them; the Notes say whether it counts them.
- **Timezone.** A file that names a timezone (in its header, its filename or the report's
  settings) is read in it. Where it names none and a Shopify connector is in the session, read the
  account's timezone from the connector's account details. Where neither names one, the Notes say
  so. Days are not converted between Sources.
- **Currency.** The one the Source reports in. A file that names none leaves the question to the
  one ask.
- A file with more than one row per order ID is summed by order ID.

## When a column is missing

A column missing from the orders file reads "No data" for every figure that needs it, with one
line naming the column and what it feeds: without customer type, new customers, returning
customer orders, Repeat customers and Cohorts; without customer ID, Cohorts and the 90-day reorder; without cost,
every margin cell. The rest of the spine reads on, from that same file. The user is asked for no
second export; the line names the column to include next time.
