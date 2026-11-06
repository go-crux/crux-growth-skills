# Without a Growth Brain

Opened by `SKILL.md` steps 1, 2, 3, 4 and 8 when the Source is a Meta connector or an Ads Manager
export. It holds how the user downloads the export, how a connector is read, and how the rows are
judged in code. The judging itself is `references/fatigue.sql`, ported: nothing here restates a
threshold, a window or the order of the statuses.

## The rows

Both Sources give the same rows: one per ad per day, for the last 60 complete days, with these
columns and no others.

| Column | Feeds |
|---|---|
| Ad ID | the ad: the grain every figure is grouped on |
| Ad name | the ad's name on the page |
| Ad set name | the ad set's name on the page, and the Minimum live ads count |
| Campaign name | the campaign's name on the page, the Account blend's two groups and the retargeting proposal |
| Day | the window a row falls in |
| Amount spent | spend |
| Impressions | nothing in the verdict |
| Reach | nothing in the verdict; never summed |
| Frequency | nothing in the verdict; never averaged |
| Link clicks | nothing in the verdict |
| Purchases | new customers, the denominator of CAC, and the confidence |
| Purchase value | nothing in the verdict |

## Meta connector

Any connector in the session that reads Meta Ads insights at ad level. Probe it, and read it,
through its insights tool.

- **Probe.** One small read: yesterday's rows at ad level. An error or a refusal makes it no Source;
  tell the user what it refused and go on to the export. A read that returns zero rows is not a
  refusal.
- **Rows.** Level ad, one row per day (daily time increment), for the last 60 complete days, with
  the twelve columns above.
- **Attribution.** Leave the account's default attribution setting, the same for every day.
- **Account.** Use only an ad account that is plainly the brand's; with several, ask which.
- **Pages.** Take every page of rows before any sum. A first page alone understates spend.

## Ads Manager export

Ask for it in one message that gives the steps below in plain words, then wait for the file. A
file already in the conversation counts.

1. In Meta Ads Manager, open the **Ads** tab. Make sure no filter hides ads that are switched off
   or have finished: an ad that spent in the last 60 days belongs in the audit even if it is off now.
2. Set the date range to the last 60 days, ending yesterday.
3. Open **Breakdown**, choose **By time**, then **Day**.
4. Open **Columns**, choose **Customise columns**, and tick exactly: Ad ID, Ad name, Ad set name,
   Campaign name, Day, Amount spent, Impressions, Reach, Frequency, Link clicks, Purchases and
   Purchase value. Ads Manager may label the last one "Purchases conversion value". Ad ID is not
   in the default columns, so it is the one most often missed.
5. Leave the attribution setting as the account has it.
6. Open **Reports**, then **Export table data**, choose **CSV**, and drop the file into this chat.

## Reading the rows

- Match column headers loosely: labels vary by report version and language. Read numbers as
  amounts, ignoring thousands separators, in the currency the Source reports. A blank Purchases is
  0.
- Leave out any total or summary row, any row with no Ad ID, and any row dated today.
- **Dates.** The 60 complete days end yesterday. A file that starts after the first of them or stops
  before the last is asked for again once, with the range it missed; a day an ad has no row for is
  a day with no spend.
- **Timezone.** A file that names a timezone is read in it; a connector's is the ad account's. Where
  none is named, say so in the Notes. Days are not converted.
- **Currency.** The one the Source reports in. Where a file names none, ask once.

## Judging in code

Compute in the session's code or analysis tool, never by reading rows by eye. A session with
neither: say in one line that the audit needs one to judge the ads, and stop.

Port `references/fatigue.sql` CTE by CTE and apply it to the rows. Take every threshold, window and
multiple from its `cut` CTE and every status and size from its later CTEs; `references/method.md`
and the glossary say the same in words, and neither is restated here. Keep each comparison as
the file writes it (spend against a multiple of CAC times purchases), so an ad with no
purchases counts as above any CAC. Three changes, because the rows are not the brain's mart:

- **Grain and keys.** Group by Ad ID, and sum the rows that share an Ad ID and a Day. Where the SQL
  reads the three name keys, the campaign key is the Campaign name, the ad set key the Ad set
  name and the ad key the Ad ID. The ad set count of live ads past Ramping and the retargeting
  campaigns (matched by Campaign name) read those.
- **Orders.** Purchases stand where the SQL reads `new_orders`, so CAC is Amount spent over
  Purchases, Meta's own cost per purchase: platform-attributed, counting every purchase Meta
  claims. Confidence reads the same count.
- **Age and life spend.** The rows carry no ad age and no life spend before the 60 days. An ad's
  age is the days from its first day with spend to the last day, counting both, and its life spend
  is its spend over the rows read.

Display names come from the ad's latest row. Campaign type is not held, so it is empty.

The result is the one row per Reported ad that `references/fatigue.sql` returns, with the same
column names, so every later step reads it without knowing the Source: Ad set name in `ad_group`,
and Ad ID in `ad_name_key`.

**Done when** every Reported ad has exactly one status, the 7-day spend over the rows equals the
spend in the file or connector for the same 7 days, and every Reported ad's row carries its
`ad_set_live_ads`.
