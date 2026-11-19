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
| Campaign name | the campaign's name, the Account blend's two groups, and the retargeting, awareness and lead proposals |
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
  for the awareness and lead proposals: a leads objective proposes the campaign as a lead campaign,
  and any objective other than sales (or the older conversions or catalogue sales objectives) or
  leads proposes it as awareness. Without one, propose by name alone.

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
- **Awareness and lead campaigns.** Drop the ads of the awareness and lead campaigns together,
  matched by the Campaign name on each ad's latest row, as the SQL's `keyed` does: an ad whose
  campaign was renamed is left out whole, its rows under the old name too. Drop the proposed campaigns for the Launched-ad count and the Format split default of
  `SKILL.md` step 2, and the confirmed ones once step 3's reply is in.
- **Orders.** Purchases stand where the SQL reads `new_orders`, so CAC is Amount spent over
  Purchases, Meta's own cost per purchase: platform-attributed, counting every purchase Meta
  claims.
- **Age and life spend.** The rows carry no ad age and no life spend before the window. An ad's age
  in the port is the days from its first day with spend to the day judged, counting both, and its
  life spend is its spend over the rows up to that day. This is the port's `ad_age`; the model's
  age (`references/method.md`) is one less.

**Viable, live, reached.** On a day, an ad is *viable* when its status is Healthy, Winner or
Improving (the port reads the widening where it tests the status, never in the classification, which
audit-ads carries unchanged); it is
*live past Ramping* when it spent that day and its status is not Ramping. An ad that spent nothing
that day is Inactive, an ad the port gives no status is Unknown, and Ramping and every status that
is not viable are not viable either: all of them count as not viable. A *Launched ad* is one whose first
day with spend is on or after the window's first day plus 42 days; an ad that first spent earlier is in
no Launched-ad count, and in no curve, rate or Lever best. A Launched ad has *reached*
age a when its first spend is at least a days before the last complete day.

**The model.** From the statuses, the spend per ad per day and the rows' first spend days, compute
every figure of the Model step of `SKILL.md`, the plan included, as `references/method.md` defines
it, and each once: the survival curve over every Launched ad at every age it has reached (the
denominator), the Viable lifespan, the Spend per viable ad over the viable ad-days, the Spend bar (the larger of 300 and 3 times the
Spend per viable ad), the Hit rate over the Launched ads whose first spend is at least 27 days before
the last complete day (a hit spent the Spend bar or more over those 28 days, was viable on one of
them, and had a 28-day CAC no more than 1.2 times the account's over the same 28 calendar days: the
ad's spend over its new orders, against every ad's, outside the awareness and lead campaigns; an ad
with no new orders fails), the Low-spend rate (the share of those ads whose spend over the 28 days was below the bar), the
Days viable per hit, and the Viable spend per hit (the Spend per viable ad times the Days viable per
hit). Then work the Recent fit once, as `references/method.md` step 7 defines it: over the 28 complete days
to today, the actual (the mean daily count of viable Launched ads) and the predicted (the mean daily sum,
over the Launched ads first spent on or before that day, of the survival rate at their age that day,
an age past the curve's last counted age reading 0), and c, the actual over the predicted, held between
0.5 and 2 and 1 where the predicted is 0. Keep the curve's sum as it is, and take the Viable lifespan
as the curve's sum times c; the Days viable per hit and the Viable spend per hit above are then worked
from that Viable lifespan, and so is every figure after them. The Lever bests stay as measured. The Self-check reads the actual and the
predicted before the fit.
Compute the Viable share target once, as `SKILL.md`'s Model step defines it, from
the statuses of every ad on every day it spent (not only the Launched ads), outside the awareness and
lead campaigns: each complete ISO week from the first Monday on or after the window's first day to
the last Sunday on or before its last day (a week with no spend is still a week), its spend on viable
ad-days over its spend, then the warm-up and thin-week rules, P90 by nearest rank (the share at rank
⌈0.9 × weeks counted⌉ from the lowest), the target as the smaller of 100% and P90 × 1.2, and the median
weekly shares of spend on Ramping ads and on Fatiguing, Fatigued and Low efficiency ads over the weeks
counted.

**The Creative deep dive figures.** Compute each once, in code, as `SKILL.md` step 4 defines it and the SQL
below `-- END shared classification` in `references/fatigue.sql` works it. Take percentiles by nearest
rank: with the values sorted from lowest to highest, the value at rank ⌈0.9 × their number⌉, as the
brain's SQL takes it.

- **Today and its counts.** Today is the window's last complete day, as step 4 defines it: yesterday,
  or the latest loaded day of the last 14 where yesterday is still loading (a day is loaded when its
  spend and its purchases are each at least half their mean over the 7 days before it). Read viable
  ads, live ads past Ramping and Worn out now on it, and name its date.
- **Current spend and Current pipeline.** Current spend is the last complete calendar month's spend (the
  month before the one holding today) outside the awareness and lead campaigns, and that spend over the
  month's days a day. The Current pipeline is the Launched ads for each complete calendar month of the
  window (one that starts after the window's first day and ends by the last complete day), averaged over the
  last 3.
- **Launches (B).** The highest average of Launched ads a month over any 3 complete calendar months in a
  row (none with fewer than 3 months).
- **Hit rate (h_best).** For each calendar month of first spend, the Hit rate of that month's Launched
  ads, at the account's Spend bar. Keep a month whose last day is at least 28 days before the last complete day, with 10 or more
  Launched ads, that starts after the window's first 6 weeks; the 90th percentile of those months, none
  with fewer than 4. Keep the number of months counted.
- **Days viable per hit (D_best).** For each calendar quarter of first spend, build the survival curve
  from that quarter's Launched ads alone (the ads reached at each age, and those viable on their day),
  W_q the sum of its rates over the ages that 3 or more of them have reached, and D_q = W_q ÷ the
  quarter's Hit rate at the account's Spend bar. Keep a quarter whose last day is at least 60 days before the last complete day,
  with 10 or more hits; D_best is the highest D_q, none with fewer than 2. Keep the number of quarters
  counted.
- **Limiting factor.** L, N0 and N1 and the five rules in order, as step 4 gives them, with each room
  and each "to hit" figure (the launches, the Hit rate needed, the Days viable per hit needed, and
  whether either is beyond its best).
- **Spending power.** For each complete calendar month of the window (the months the Current pipeline
  counts), the spend and the purchases outside the awareness and lead campaigns, and the CAC (spend over
  purchases; none where a month has no purchases). With 6 or more months, the relative change in the
  spend of the last 3 against the 3 before (their total spend over the earlier total, less 1) and the
  relative change in their CAC (their total spend over their total purchases, against the same for the
  3 before, less 1); with fewer than 6, neither change.
- **Ads needed each month.** `ads_for_spend` of current monthly spend (the Steady-state number) and of
  the Budget where one was given, and the figures the page's script reads (`references/page-layout.md`).
- **On the table.** Over the last 90 complete days, every ad-day grouped by its status (viable: Healthy,
  Winner and Improving; test phase: Ramping; worn out: Fatiguing, Fatigued and Low efficiency; other:
  any status left, and any ad-day with no status), each group's spend, purchases and CAC, then the
  share-to-target maths of step 4, with the groups that spent and brought no purchases named.
- **What it's worth.** Where something is on the table: the new customers a month, the Worth and the Production budget, from On the table and current spend as step 4 gives them, each worked once on unrounded figures.
- **The Creative score.** The seven measures, the Outlier stats and Top-10 turnover, each worked once as
  `references/method.md` (steps 24 to 26) defines them and the SQL below `-- END shared classification`
  in `references/fatigue.sql` works them: the last 30 days are the 30 complete days to today, an ad's
  age is the days from its first day with spend in the rows (an ad that spent on the first day read is
  aged on every day, and not a Launched ad), and spend is the Amount spent outside the awareness and lead
  campaigns. Read the Hit rate and Low-spend rate from the model above and the Spend degradation over the
  Hit rate's base. Place each measure on the bands of `references/method.md` with its scorer, carry the
  sub-scores unrounded, and give the score as their mean rounded to a whole number, none where a
  measure cannot be read. Percentiles by nearest rank and medians as the method sets out. Top-10 turnover
  is worked for each complete calendar quarter in the rows read and shown only with 2 or more; the
  180 days of a Meta connector or an export never hold 2, so it is not shown there.

Print the figures, the survival table (age, ads reached, viable, survival, spend on that age's viable
ad-days) and the Roadmap rows, never the rows of the export.

**Done when** every ad that spent on a day carries exactly one status for that day, the spend over
the rows read equals the spend in the file for the same days outside the awareness and lead campaigns (each
ad by its latest row's campaign), and the survival table lists each age with the ads reached and the viable count that give its rate, its
rates sum to the curve's sum, the Viable lifespan equals that sum times the Recent fit, the actual,
the predicted and the Recent fit are printed (with the Self-check's pass or fail), the Hit rate times
the Days viable per hit equals the Viable lifespan to two decimals, the Spend per viable ad is the spend on viable ad-days over their
number, the Spend bar is printed (300 where 3 times the Spend per viable ad is under it), and the
hits, the low-spend ads and the ads that spent the bar but are not hits add up to the Launched
ads at least 28 days old, with the Low-spend rate and Viable spend per hit printed, and the weekly viable shares, the weeks counted and left out, P90 and the Viable share target
(at most 100%) are printed, the run having stopped on its line where no week is counted; the last
complete day is named; and the three Lever bests (each with the months or quarters it counted, or
none), the Limiting factor with its figures, Spending power's months and its two changes (or their absence with
fewer than 6 months), `ads_for_spend` at current spend and at the Budget, On the table (or
"nothing") and What it's worth (its three figures, or none) are printed, and so are the seven measures with their sub-scores, the Creative score (the mean of
the seven, none where one cannot be read), the Outlier stats (the spend per Launched ad, the line, the Outliers
with their share of spend and the days to the line) and Top-10 turnover, or its absence with fewer than 2
complete quarters.
