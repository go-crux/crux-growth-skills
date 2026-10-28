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
| Offer: conversion and the ten landing pages; Acquisition: visits | `<client>-channel_reporting` | GA4 sessions by landing page, by day; else Shopify sessions by landing page, by day | GA4: sessions by landing page; else Shopify: sessions by landing page |
| Acquisition: spend, CAC, platform-reported campaigns | `<client>-channel_reporting`, with `meta_performance` and `google_ads_performance` | Google Ads and Meta Ads campaign reports, by day | Google Ads: campaign report; Meta Ads: campaign report |
| CM3 stand-in ("Gross profit less marketing"); Cohorts' CAC | margin from `<client>-orders`, spend from `<client>-channel_reporting` | gross profit from the orders Source, spend from the row above | the orders file and the campaign reports |

Every section with no row (Merchandising, Email and the Target test) has no Source without a
Growth Brain: it reads "No data" with the plain reason that no Source in this run holds it, in
the wording of `references/plan-layout.md`.

**Visits** are the sessions of the Source that holds sessions by landing page, and the Offer and
Acquisition read the same Source. It is GA4 where GA4 holds both years (connector, else export),
else Shopify sessions by landing page (connector, else export), never a mix. **Spend** is Google
Ads plus Meta Ads, each from its connector, else its campaign report, and covers the platforms
read only, the same platforms in both years. A platform whose Source holds one year only is left
out of both, and the Notes name the platforms spend covers.

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

## GA4: connector

Probe it, and read it, through its report tool for last year's and the year before's windows:

- **Rows.** Dimensions date and landing page (the path, so a page's query strings sum
  together); metrics sessions and ecommerce purchases. One run per year, covering 1 September
  to 24 December.
- **Pages.** Take every page of rows, following the reply's offset until it gives none, before
  any sum. A first page alone understates sessions.
- **Property.** Use only a property that is plainly the brand's; with several, ask which.

## GA4: sessions by landing page

1. In GA4, open Explore and create a Free form exploration.
2. Add the dimensions Date and Landing page as rows, and the metrics Sessions and Ecommerce
   purchases as values.
3. Set the date range from 1 September to 24 December of last year.
4. Download as CSV and drop the file into this chat.
5. Repeat for the same dates of the year before.

| Column | Feeds |
|---|---|
| Date | the window a row falls in |
| Landing page (path) | the landing page list |
| Sessions | visits, and conversion's denominator |
| Ecommerce purchases | landing-page orders, as GA4 counts them |

## Shopify: sessions by landing page

Asked for only where GA4 holds no sessions, or holds one year only. Where a Shopify connector is
in the session, read the same columns for the same range through its analytics query tool (the
probe reads one day of sessions through it), taking every page of rows before any sum.

1. In Shopify admin, open Analytics, then Reports, then "Sessions by landing page".
2. Group by day (add the Day dimension if the report does not show it) and set the date range
   from 1 September to 24 December of last year.
3. Export as CSV and drop the file into this chat.
4. Repeat for the same dates of the year before.

| Column | Feeds |
|---|---|
| Day | the window a row falls in |
| Landing page path | the landing page list |
| Sessions | visits, and conversion's denominator |
| Orders (or completed checkouts, as the report labels them), where the report holds it | landing-page orders, as Shopify counts them |

## Google Ads: connector

Probe it, and read it, through its query tool (Google Ads Query Language), once for each year on
1 September to 24 December:

- **Rows.** One row per campaign per day: select `segments.date` and `campaign.name` with
  `metrics.cost_micros` (divide by 1,000,000), `metrics.impressions` and `metrics.clicks`.
- **Status.** Put no filter on campaign status: paused and removed campaigns spent in the
  window too.
- **Pages.** Take every page of rows, following the reply's next-page token until it gives none,
  before any sum.
- **Purchases.** A second query selecting `segments.date`, `campaign.name`,
  `segments.conversion_action_category`, `metrics.conversions` and `metrics.conversions_value`,
  filtered on `segments.conversion_action_category = 'PURCHASE'`; join the two on campaign and
  day. Where the tool cannot filter on the category, purchases are every primary conversion
  action, and the Notes say so.

## Google Ads: campaign report

1. In Google Ads, open Campaigns and set the date range from 1 September to 24 December of last
   year.
2. Segment by Time, then Day, and set the status filter to all campaigns (enabled, paused and
   removed).
3. Add the columns Cost, Impressions, Clicks, Conversions and Conversion value, and keep the
   conversion actions to purchases.
4. Download as CSV and drop the file into this chat.
5. Repeat for the same dates of the year before.

| Column | Feeds |
|---|---|
| Day | the window a row falls in |
| Campaign | the campaign list |
| Cost | spend |
| Impressions (Impr.) | nothing alone: shown with a campaign where the report holds it |
| Clicks | nothing alone: shown with a campaign where the report holds it |
| Conversions | platform-reported purchases |
| Conversion value | platform-reported purchase value |

## Meta Ads: connector

Probe it, and read it, through its insights tool, once for each year on 1 September to
24 December:

- **Rows.** Campaign level with a daily time increment: campaign name, day, amount spent,
  impressions, link clicks, purchases and purchase conversion value.
- **Attribution.** Leave the account's default attribution setting, the same for both years.
- **Pages.** Take every page of rows before any sum.

## Meta Ads: campaign report

1. In Ads Manager, open the Campaigns tab and set the date range from 1 September to
   24 December of last year.
2. Break down by Time, then Day.
3. Add the columns Amount spent, Impressions, Link clicks, Purchases and Purchases conversion
   value.
4. Export as CSV and drop the file into this chat.
5. Repeat for the same dates of the year before.

| Column | Feeds |
|---|---|
| Day | the window a row falls in |
| Campaign name | the campaign list |
| Amount spent | spend |
| Impressions | nothing alone: shown with a campaign where the report holds it |
| Link clicks | nothing alone: shown with a campaign where the report holds it |
| Purchases | platform-reported purchases |
| Purchases conversion value | platform-reported purchase value |

## Reading a connector or an export

- Match column headers loosely: labels vary by report version and language. Read numbers as
  counts or amounts, ignoring thousands separators, in the currency the Source reports.
- **Dates.** Split the rows on the windows' dates from `SKILL.md` step 1. A file that starts after
  1 September of the year before last, or stops before yesterday, is asked for again once, with
  the range it missed. A sessions or campaign report must hold one row per day: a Black Friday
  weekend is four days, so a file grouped by week or month is asked for again once, by day, and
  a day it still lacks reads "No data".
- **One Source per section across every year read.** Last year, the year before it and this
  year's Baseline all come from the same file or connector, with the same columns and filters.
  Where GA4 holds only one of the two years, ask once for the other; if it is still missing, read
  both years from Shopify sessions by landing page, or "No data" where that holds neither. A
  campaign report works the same way, platform by platform.
- **Landing pages and campaigns across years.** Add together the rows that share a landing page
  path (any query string dropped) or a campaign name within a window, leaving any total row out,
  and match a page or campaign across the two years by that path or name. One that has no rows
  in the other year reads "No data" there.
- **Landing-page orders.** The sessions Source's own column: GA4's ecommerce purchases, or
  Shopify's orders by landing page. They are not the orders file's orders and need not sum to
  them; the Notes say which column was read, and the site's conversion uses the orders file's
  orders over every session.
- **Campaign reports.** Purchases and purchase value are the platform's, under its own
  attribution, so the test-order rule does not apply to them. A report that does not say which
  conversion actions it counts is read as given, and the Notes say so. A spend report in a
  currency other than the orders file's is left out of the sum, since no figure is converted
  between Sources, and the Notes say which.
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

A column missing from a sessions or campaign report works the same way: without landing-page
orders, conversion by landing page and each page's orders read "No data" (visits and the site's
conversion read on); without purchases, the platform-reported campaign list reads "No data"
(spend and CAC read on); without spend, that platform has no Source, and the CM3 stand-in and
the Cohorts' CAC read "No data" if no other platform has one.
