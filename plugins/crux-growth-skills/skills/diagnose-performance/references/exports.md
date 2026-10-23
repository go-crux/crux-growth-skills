# Without a Growth Brain

Opened by `SKILL.md` steps 3, 4 and 6 when a lever's Source is a platform connector or a file the
user gives. A connector is read through its own reporting tool for the columns named here. The
export steps are for a lever no connected Source reads, and for nothing else; give the user only
the steps for the reports the confirmed Lever tree needs.

## Which Source reads which lever

Give each lever the first Source in `SKILL.md` step 1's order that holds it. A lever reads one
Source, with the same report, columns and filters, in both periods.

| Lever | Source and columns | Finest dimension held |
|---|---|---|
| visits | GA4 sessions by default channel group (Sessions); else Shopify sessions by landing page (Sessions, summed over every row) | channel (GA4); none for Shopify (see below) |
| new visitor share | GA4 sessions by default channel group (New users, over Sessions) | channel |
| orders, new customers, returning orders | Shopify sales over time (Orders, by customer type) | none |
| revenue, order value | Shopify sales over time (Orders, Net sales) | none |
| conversion | Shopify orders over the visits lever's sessions | none |
| new-customer conversion | Shopify new customers over the visits lever's sessions | none |
| spend (platform) | the Google Ads or Meta Ads campaign report (spend) | the finest level the export or connector holds (campaign, ad set or ad group, ad) |
| spend (marketing, for CAC and MER / ROAS) | the sum of the platform reports read | campaign |
| impressions, click-through, platform conversion, platform order value | the platform's campaign report (Impressions, Clicks, Purchases, and their value, named per platform in the tables below) | the finest level the export or connector holds (campaign, ad set or ad group, ad) |
| margin % | a Source carrying cost of goods, which none above does | none |
| active customers, repeat rate | a Source carrying distinct customers over time, which none above does | none |
| any lever | figures the user pastes or exports for both periods | what the figures hold |

The rest of the Lever tree's levers follow from these: each lever's counts come from the Source
named for it, and a ratio lever uses the same count as the volume lever beside it (the
conversion lever's sessions are the visits lever's sessions). The Levers table and The change name
each lever's Source in plain words ("your Shopify orders", "your Google Ads campaigns").

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

## Google Ads: campaign report

1. In Google Ads, open Campaigns and set the date range to the Current period's dates.
2. Add the columns Cost, Impressions, Clicks, Conversions and Conversion value, and keep the
   conversion actions to purchases.
3. Download as CSV and drop the file into this chat.
4. Repeat for the Comparison period's dates.

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

## Reading a connector or an export

- Match column headers loosely: labels vary by report version and language. Read numbers as
  counts or amounts, ignoring thousands separators, in the currency the Source reports.
- A file with a date column holds both periods in one file; split it on the periods' dates. Any
  other file is one period: confirm which from its date range, and ask for the re-export if the
  dates do not match.
- Add together the rows that share a segment, and check that the segments sum to the file's total.
- A connector is read for the same columns and the same dates, and the same Source is read for both
  periods.
- Leave out test orders wherever the Source flags them.
- Compute the Contributions and the rebuild in code where the session can run it; otherwise by
  hand, and check that the Contributions add to the change.

## When a lever cannot be read

A missing column, a report the user cannot export or a lever in the table above with no Source
reads "No data". Drop it with one line, in the chat and in the Notes, naming what it needs ("Margin
% needs a source carrying cost of goods"). The split is partial, as `references/contribution.md`
sets out.

A column missing from a file the tree needs is named to the user with what it feeds, and the
re-export is asked for once. An unattended run asks for none.
