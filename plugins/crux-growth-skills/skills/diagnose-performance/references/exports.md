# Without a Growth Brain

Opened by `SKILL.md` steps 1, 3, 4 and 6 when a Source is a platform connector or a file the
user gives. A connector is read through its own reporting tool for the columns named here. The
export steps are for a lever no connected Source reads, and for nothing else; give the user only
the steps for the reports the confirmed Lever tree needs.

## Which Source reads which lever

Give each lever the first Source in `SKILL.md` step 1's order that holds it. A lever reads one
Source, with the same report, columns and filters, in both periods.

| Lever | Source and columns | Finest dimension held |
|---|---|---|
| visits | GA4 sessions by default channel group (Sessions); else Shopify sessions by landing page (Sessions, summed over every row) | channel (GA4); none for Shopify (see below) |
| new visitor share | GA4 sessions by default channel group (New users, over Sessions; a new user is counted once, on the first session, so New users sum across channel rows) | channel |
| orders, new customers, returning orders | Shopify sales over time (Orders, by customer type) | none |
| revenue, order value | Shopify sales over time (Orders, Net sales) | none |
| conversion | Shopify orders over the visits lever's sessions | none |
| new-customer conversion | Shopify new customers over the visits lever's sessions (CAC tree), or over the new visitor share lever's New users (New customers tree) | none |
| spend (platform) | the Google Ads or Meta Ads campaign report (spend) | ad group or ad set with that report; ad through a connector only |
| spend (marketing, for CAC and MER / ROAS) | the sum of the platform reports read | ad group or ad set with that report |
| impressions, click-through, platform conversion, platform order value | the platform's campaign report (Impressions, Clicks, Purchases, and their value, named per platform in the tables below) | ad group or ad set with that report; ad through a connector only |
| margin % | a Source carrying cost of goods, which none above does | none |
| active customers, repeat rate | a Source carrying distinct customers over time, which none above does | none |
| any lever | figures the user pastes or exports for both periods | what the figures hold |

The rest of the Lever tree's levers follow from these: each lever's counts come from the Source
named for it, and a ratio lever uses the same count as the volume lever beside it (the
conversion lever's sessions are the visits lever's sessions). The Levers table and The change name
each lever's Source in the plain words `references/diagnosis-layout.md` lists.

**Shopify sessions by landing page** gives the visits total and no channel. Do not descend into
its landing pages: a page's sessions move with the traffic sent to it, so with no channel level the
visits lever has zero levels where it is a Main driver (it still gets its Cause and
Recommendations), and the Notes name the channel dimension that would let it go further.

**Order value** has no level to drill without order rows. Open its Drivers block with the
discount read from Shopify sales over time: Discounts over Gross sales in both periods, in one
sentence.

**Marketing spend** covers the platforms read only, the same platforms in both periods. Say in the
Notes which they are.

## Shopify: sales over time

1. In Shopify admin, open Analytics, then Reports, then "Sales over time".
2. Set the date range to the Current period's dates, group by day, and add the breakdown by
   customer type (new or returning); where Shopify offers it only as its own report, use "New vs
   returning customer sales" for the same dates.
3. Export as CSV and drop the file into this chat.
4. Repeat for the Comparison period's dates.

| Column | Feeds |
|---|---|
| Orders | orders, order value, conversion |
| Customer type (new, returning) with its Orders | new customers, returning orders |
| Gross sales | the discount read |
| Discounts | the discount read |
| Net sales | revenue, order value |

Net sales is gross sales less discounts and returns. It is the revenue measure for a run without
a brain: name it on the page.

## Shopify: sessions by landing page

1. In Shopify admin, open Analytics, then Reports, then "Sessions by landing page".
2. Set the date range to the Current period's dates.
3. Export as CSV and drop the file into this chat.
4. Repeat for the Comparison period's dates.

| Column | Feeds |
|---|---|
| Landing page path (or URL) | nothing: the rows are summed |
| Sessions | visits, and the sessions every ratio lever divides by |

## GA4: sessions by default channel group

1. In GA4, open Reports, then Acquisition, then "Traffic acquisition".
2. Set the date range to the Current period's dates and keep "Session default channel group" as the
   dimension.
3. Share the report, download it as CSV and drop the file into this chat.
4. Repeat for the Comparison period's dates.

| Column | Feeds |
|---|---|
| Session default channel group | the channel level |
| Sessions | visits |
| New users | new visitor share |

## Google Ads: connector

The connector's summary and performance tools take relative date ranges ("last 30 days") and show
enabled campaigns by default, so they cannot read a named period. Read through its query tool
(Google Ads Query Language) instead:

- **Dates.** Filter on `segments.date BETWEEN '<start>' AND '<end>'` with a period's own dates,
  and run it once for each period, on the four dates.
- **Status.** Put no filter on campaign status: paused and removed campaigns spent in the
  period too, and the spend lever is every campaign.
- **Pages.** Take every page of rows, following the reply's next-page token until it gives none,
  before any sum. A first page alone understates spend.
- **Spend, impressions, clicks.** One query selecting `campaign.name` with `metrics.cost_micros`
  (divide by 1,000,000), `metrics.impressions` and `metrics.clicks`, and no conversion segment.
- **Purchases.** A second query selecting `campaign.name`, `segments.conversion_action_category`,
  `metrics.conversions` and `metrics.conversions_value`, filtered on
  `segments.conversion_action_category = 'PURCHASE'`; join the two on campaign. Where the tool
  cannot filter on the category, conversions are every primary conversion action: say so in the
  Notes in the layout's wording.

## Google Ads: campaign report

1. In Google Ads, open Campaigns and set the date range to the Current period's dates.
2. Set the status filter to all campaigns (enabled, paused and removed).
3. Add the columns Cost, Impressions, Clicks, Conversions and Conversion value, and keep the
   conversion actions to purchases.
4. Download as CSV and drop the file into this chat.
5. Repeat for the Comparison period's dates.

| Column | Feeds |
|---|---|
| Campaign | the campaign level |
| Cost | spend |
| Impressions (Impr.) | impressions |
| Clicks | click-through |
| Conversions | platform conversion (purchases) |
| Conversion value | platform order value |

## Meta Ads: campaign report

1. In Ads Manager, open the Campaigns tab and set the date range to the Current period's dates.
2. Add the columns Amount spent, Impressions, Link clicks, Purchases and Purchases conversion
   value.
3. Export as CSV and drop the file into this chat.
4. Repeat for the Comparison period's dates.

| Column | Feeds |
|---|---|
| Campaign name | the campaign level |
| Amount spent | spend |
| Impressions | impressions |
| Link clicks | click-through |
| Purchases | platform conversion |
| Purchases conversion value | platform order value |

## Google Ads and Meta Ads: ad group or ad set report

Asked for only in `SKILL.md` step 6, when a Drill-down reaches the level below campaign for the
one campaign it descended into, and only where no connector reads that level.

1. **Google Ads**: open Ad groups, filter to the campaign the Drill-down descended into, and set
   the status filter to all ad groups. **Meta Ads**: in Ads Manager, select that campaign and open
   the Ad sets tab.
2. Set the date range to the Current period's dates and add the same columns as that platform's
   campaign report above.
3. Download or export as CSV and drop the file into this chat.
4. Repeat for the Comparison period's dates.

| Column | Feeds |
|---|---|
| Ad group (Google Ads) or Ad set name (Meta Ads) | the ad group or ad set level |
| the campaign report's other columns | the same levers as there |

## Reading a connector or an export

- Match column headers loosely: labels vary by report version and language. Read numbers as
  counts or amounts, ignoring thousands separators, in the currency the Source reports.
- **Dates in a file.** A file with a date column (by day, week or month) holds both periods, or
  one: split its rows on the periods' dates. A file grouped by month is accepted where each
  period is whole calendar months (add the months a period holds); for a week or any other
  period that is not whole months, ask once for the file grouped by day. A file whose date
  column holds one period is that one period: confirm it against the period's dates. A file with
  no date column is one period: confirm which from its date range. Ask once for the re-export
  when the dates do not match.
- Add together the rows that share a segment, leaving any total row out of the sums. Where the
  file has a total row, check that the segments sum to it; where it has none, make no such check.
- A connector is read for the same columns, on the four dates, for every campaign whatever its
  status and with every page of rows, and the same Source is read for both periods.
- Leave out test orders wherever the Source flags them. An export with no test-order flag is read
  as it stands, and on a store-order count the Notes say so in the layout's wording (never on a
  Platform ROAS page, whose purchases are the platform's).
- A platform export that does not say which conversion actions it counts is read as given, and the
  Notes say so in the layout's wording.
- Compute the Contributions and the rebuild in code where the session can run it; otherwise by
  hand, and check that the Contributions add to the change.

## When a lever cannot be read

A missing column, a report the user cannot export or a lever in the table above with no Source
reads "No data". Drop it with one line, in the chat and in the Notes, naming what it needs ("Margin
% needs a source carrying cost of goods"). The split is partial, as `references/contribution.md`
sets out.

A column missing from a file the tree needs is named to the user with what it feeds, and the
re-export is asked for once. An unattended run asks for none.
