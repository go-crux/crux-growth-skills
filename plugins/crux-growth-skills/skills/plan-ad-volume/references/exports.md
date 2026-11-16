# Without a Growth Brain

Opened by `SKILL.md` steps 1, 2 and 4 when the Source is a Meta connector or an Ads Manager export.
It holds how a connector is read, how the user downloads the export, and how the rows are judged in
code. A Growth Brain is read for the last 365 complete days by `references/fatigue.sql`'s brain path
and needs none of this; a connector or an export is read for the last 180. The judging itself is
`references/fatigue.sql`, ported: nothing here restates a threshold, a window or the order of the
statuses.

## The rows

Both Sources give the same rows: one per ad per day, for the last 180 complete days, with these
columns and no others.

| Column | Feeds |
|---|---|
| Ad ID | the ad: the grain every figure is grouped on |
| Ad name | the ad's name |
| Ad set name | the ad set's name |
| Campaign name | the campaign's name, the Account blend's two groups, and the retargeting and awareness proposals |
| Day | the window a row falls in, and each ad's age |
| Amount spent | spend |
| Impressions | nothing in the verdict or the curve |
| Reach | nothing in the verdict or the curve; never summed |
| Frequency | nothing in the verdict or the curve; never averaged |
| Link clicks | nothing in the verdict or the curve |
| Purchases | new customers, the denominator of CAC |
| Purchase value | nothing in the verdict or the curve |
| 3-second video plays | nothing in the verdict or the curve; settles an ad's Format where its name does not |

## Meta connector

Any connector in the session that reads Meta Ads insights at ad level. Probe it, and read it,
through its insights tool.

- **Probe.** One small read: yesterday's rows at ad level. An error or a refusal makes it no Source;
  tell the user what it refused and go on to the export. A read that returns zero rows is not a
  refusal.
- **Rows.** Level ad, one row per day (daily time increment), for the last 180 complete days, with
  the thirteen columns above, 3-second video plays included.
- **Attribution.** Leave the account's default attribution setting, the same for every day.
- **Account.** Use only an ad account that is plainly the brand's; with several, ask which.
- **Pages.** Take every page of rows before any sum. A first page alone understates spend.
- **Objective.** Read each campaign's objective once, through its campaigns tool where it has one,
  for the awareness proposal: any objective other than sales (or the older conversions or catalogue
  sales objectives) proposes the campaign. Without one, propose by name alone.

## Ads Manager export

Ask for it in one message that gives the steps below in plain words, then wait for the file. A file
already in the conversation counts.

1. In Meta Ads Manager, open the **Ads** tab. Make sure no filter hides ads that are switched off
   or have finished: an ad that spent in the last 180 days belongs in the plan even if it is off
   now, and the curve needs the ads that have worn out.
2. Set the date range to the last 180 days, ending yesterday. If Ads Manager cannot export that in
   one go, export two or three date ranges that do not overlap and drop every file into the chat.
3. Open **Breakdown**, choose **By time**, then **Day**.
4. Open **Columns**, choose **Customise columns**, and tick exactly: Ad ID, Ad name, Ad set name,
   Campaign name, Day, Amount spent, Impressions, Reach, Frequency, Link clicks, Purchases,
   Purchase value and 3-second video plays. Ads Manager may label the Purchase value column
   "Purchases conversion value". Ad ID is not in the default columns, so it is the one most often
   missed.
5. Leave the attribution setting as the account has it.
6. Open **Reports**, then **Export table data**, choose **CSV**, and drop the file into this chat.

## Reading the rows

- Match column headers loosely: labels vary by report version and language. Read numbers as
  amounts, ignoring thousands separators, in the currency the Source reports. A blank Purchases or
  3-second video plays is 0.
- Leave out any total or summary row, any row with no Ad ID, and any row dated today.
- **Dates.** The 180 complete days end yesterday. A file or a connector read that starts after the
  first of them or stops before the last is asked for again once, with the range it missed; if the
  user cannot give it, the window is the days it holds, and the page says so. A day an ad has no
  row for is a day with no spend. The window's first day is the first day of the window read.
- **Timezone.** A file that names a timezone is read in it; a connector's is the ad account's.
  Where none is named, say so in How it's worked out. Days are not converted.
- **Currency.** The one the Source reports in. Where a file names none, ask once.

## Judging in code

Compute in the session's code or analysis tool, never by reading rows by eye. A session with
neither: say in one line that the plan needs one to judge the ads, and stop.

**The classification.** Port `references/fatigue.sql` CTE by CTE, down to `judged`; the brain path
below it is for a Growth Brain and is not ported. Take every threshold, window and
multiple from its `cut` CTE and every status from its later CTEs; `references/method.md` and the
glossary say the same in words, and neither is restated here. Keep each comparison as the file
writes it (spend against a multiple of CAC times purchases), so an ad with no purchases counts as
above any CAC. Run the port once for each day of the window, as of that day: the rows up to and
including the day stand in for the rows the file reads, and the day stands for the last complete
day. The windows behind a day that reach back before the window's first day read the rows that
exist. The result is every ad's status on every day it was judged. Four changes, because the rows
are not the brain's mart:

- **Grain and keys.** Group by Ad ID, and sum the rows that share an Ad ID and a Day. Where the SQL
  reads its three keys, the campaign key is the Campaign name, the ad set key the Ad set name and
  the ad key the Ad ID, each ad taking the names on its latest row as the SQL's `keyed` does. The
  retargeting campaigns are matched by Campaign name.
- **Awareness campaigns.** Drop the ads of the awareness campaigns, matched by the Campaign name
  on each ad's latest row, as the SQL's `keyed` does: an ad whose campaign was renamed is left out
  whole, its rows under the old name too. Drop the proposed campaigns for the Launched-ad count and the Format split default of
  `SKILL.md` step 2, and the confirmed ones once step 3's reply is in.
- **Orders.** Purchases stand where the SQL reads `new_orders`, so CAC is Amount spent over
  Purchases, Meta's own cost per purchase: platform-attributed, counting every purchase Meta
  claims.
- **Age and life spend.** The rows carry no ad age and no life spend before the window. An ad's age
  in the port is the days from its first day with spend to the day judged, counting both, and its
  life spend is its spend over the rows up to that day. This is the port's `ad_age`; the model's
  age (`references/method.md`) is one less.

**Viable, live, reached.** On a day, an ad is *viable* when its status is Healthy or Winner; it is
*live past Ramping* when it spent that day and its status is not Ramping. An ad that spent nothing
that day is Inactive, an ad the port gives no status is Unknown, and Ramping and every status that
is not viable are not viable either: all of them count as not viable. A Launched ad has *reached*
age a when its first spend is at least a days before the last complete day.

**The model.** From the statuses, the spend per ad per day and the rows' first spend days, compute
every figure of the Model step of `SKILL.md`, the plan included, as `references/method.md` defines
it, and each once: the survival curve over every Launched ad at every age it has reached (the
denominator), the Viable lifespan, the Hit rate over the Launched ads whose first spend is at least
27 days before the last complete day, the Days viable per hit, and the Spend per viable ad over the
viable ad-days. Print the figures, the survival table (age, ads reached, viable, survival, spend on
that age's viable ad-days) and the Roadmap rows, never the rows of the export.

**Done when** every ad that spent on a day carries exactly one status for that day, the spend over
the rows read equals the spend in the file for the same days outside the awareness campaigns (each
ad by its latest row's campaign), and the survival table lists each age with the ads reached and the viable count that give its rate, its
rates sum to the Viable lifespan, the Hit rate times the Days viable per hit equals the Viable
lifespan to two decimals, and the Spend per viable ad is the spend on viable ad-days over their
number.
