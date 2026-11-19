# Glossary

The terms `SKILL.md` and the other references use, each with one meaning. The shared term Next run is in the repo's root `GLOSSARY.md`; this skill is a forecast, not an Action skill, so it has no Recommendation, Mode or Hand-off; its Next run is monthly, around the 20th, so next month's ads can be briefed. The ad statuses (Ramping, Low efficiency, Fatigued, Fatiguing, Improving, Winner, Healthy) and the measures behind them (CAC, Account blend, Peak CAC, Eligibility floors) are judged exactly as `audit-ads` judges them, by the copy in `references/fatigue.sql`.

## Ad stock

- **Viable ad**: an ad whose status that day is Healthy (Winners included) or Improving, which converts like Healthy. Every other status is not viable. Read on the last complete day for today's count. Wider than audit-ads, where Improving means recovering and stays out. _Avoid_: active ad, live ad, good ad.

- **Viable share**: a week's spend on viable ads over its spend, every ad counted (Launched or not) outside the Awareness and Lead campaigns. Read for each complete ISO week of the window. _Avoid_: efficiency, share of voice.

- **Viable share target**: the share of spend the plan aims to put on viable ads: the smaller of 100% and the 90th-percentile weekly Viable share times 1.2. The weeks read leave out the window's first 6 complete weeks, which lean towards Ramping, and any week whose spend is below 25% of the median of the rest; with fewer than 8 left, those there are, and with none the run stops. No account puts every pound on a viable ad, so the target is the account's own best plus 20% for running creative production well. _Avoid_: benchmark, goal, best share.

- **Viable ad stock**: the number of viable ads a level of daily spend needs live at once: daily spend times the Viable share target over Spend per viable ad. The L of Little's law. _Avoid_: ad stock alone (that is MMM carryover), ad inventory, creative stock.

- **Launched ad**: an ad whose first day of spend falls on or after the window's first day plus 42 days, the same 6 weeks the Viable share leaves out. Only Launched ads feed the Survival curve, because an ad already live on day one has an unknown age, and an ad launched in the first 6 weeks is judged before the weekday index, life spend and Peak CAC have warmed up, so it reads worse than a later one. _Avoid_: new ad.

- **Recent fit**: the factor that scales the Survival curve to the account's last 28 complete days, so the plan matches the ads it has now: the actual divided by the predicted, held between 0.5 and 2, and 1 where the predicted is 0. The actual is the mean daily count of viable Launched ads over those days; the predicted is the mean daily sum, over Launched ads first spent on or before that day, of the curve's survival rate at their age that day, an age past the curve's last counted age reading 0. The Viable lifespan is the curve's sum times it, so Days viable per hit, Viable spend per hit and the Steady-state number carry it; the Hit rate and every Lever best stay as measured. _Avoid_: calibration, correction factor, adjustment.

- **Survival curve**: for each day of age, the share of every Launched ad that has reached that age which is viable that day; an ad that stopped spending or is still Ramping counts as not viable. An age counts only with 3 or more ads. _Avoid_: decay curve, fatigue curve, a curve of running ads only.

- **Viable lifespan**: the average viable days one Launched ad delivers, duds included: the area under the Survival curve times the Recent fit, and Hit rate times Days viable per hit. The W of Little's law. The curve's own area, before the fit, is the curve's sum, and the survival curve chart shows the curve as measured. Where the curve is still at 25% or above when the 3-ad floor cuts it off, it is a lower bound. _Avoid_: ad lifespan, shelf life.

- **Hit rate**: the share of Launched ads at least 28 days old that were viable on at least one day in their first 28 days, whose first-28-day spend reached the Spend bar, and whose first-28-day CAC was within 1.2 times the account's over the same 28 days (an ad with no new orders fails): Meta gave them budget and they converted at a good CAC. An ad that spent the bar but is not a hit is one of the three counts that make up the base, with hits and the low-spend ads. A new ad adds Hit rate viable ads, not one. _Avoid_: success rate, win rate, activation rate.

- **Days viable per hit**: the Viable lifespan over the Hit rate: how long a hit stays viable. Today's viable ads wear out at 1 over it. Times Spend per viable ad it is the Viable spend per hit. _Avoid_: winner lifespan, hit lifespan.

- **Healthy lifespan**: the age by which half the ads viable at the Survival curve's peak have stopped being viable, with the quartile range (the ages at 75% and 25% of the peak). Quoted on How it's worked out. _Avoid_: median life, half-life.

- **Spend per viable ad**: the account's typical daily spend on one viable ad: spend on viable ad-days over the number of viable ad-days. _Avoid_: spend per ad, ad budget.

- **Spend bar**: the larger of the 300 lifetime-spend eligibility floor and 3 days of Spend per viable ad: the first-28-day spend a Launched ad must reach to count as a hit, and below which it counts towards the Low-spend rate. On a small account the floor sets it; on a large one the 3 days do. It sits well below the Outlier line, so Low-spend, hit and Outlier stay three distinct tiers. _Avoid_: activation threshold, spend floor (the Eligibility floors are audit-ads').

- **Viable spend per hit**: Spend per viable ad times Days viable per hit: the spend one hit carries over its viable life. The divisor of the Steady-state number with the Hit rate. _Avoid_: activated spend, lifetime spend.

- **Days to clear Ramping**: the median number of days a Launched ad spends Ramping before its first status. Sets the Live-by date. _Avoid_: learning phase, ramp time.

## Creative score

- **Creative score**: the account's creative health out of 100: the plain mean of seven sub-scores (Evergreen share, Spend degradation, Viable after week 1, Top-5 concentration, Outlier rate, Hit rate, Low-spend rate), each placed on the fixed published bands in `references/method.md`: Poor 0, Average 50, Good 100, straight between and capped, the mean rounded to a whole number. A read-out of the plan's own measures plus health checks; it never multiplies the plan. _Avoid_: creative grade, quality score, benchmark rank.

- **Weakest point**: the one line under the Creative score naming the measure with the lowest sub-score (the first in bar order on a tie; never Top-10 turnover), its value against its Good anchor, and one fixed sentence on what to do. _Avoid_: biggest problem, worst metric.

- **Evergreen ad**: an ad aged 30 days or more that is still spending, age counted from its first spend (an ad live on the window's first day is older than the window). Not the same as viable: an old ad can spend without working. _Avoid_: long-runner, winner.

- **Evergreen share**: the share of the last 30 complete days' spend on ads that were Evergreen ads that day, every ad counted, not only Launched ads. _Avoid_: evergreen percentage, ad age mix.

- **Spend degradation**: across the Launched ads at least 28 days old (the Hit rate's base), the median of each ad's mean daily spend over ages 7 to 27 over its mean daily spend over ages 0 to 6, less 1; a day with no spend counts 0. _Avoid_: spend decay, drop-off.

- **Viable after week 1**: the share of hits that have reached age 28 that were viable on their day at age 28: whether hits keep working past launch. Replaces a CAC-after-launch measure, which order lag and spend shifting onto hits make read as improving. _Avoid_: CAC degradation, ROAS degradation, retention.

- **Top-5 concentration**: the share of the last 30 complete days' spend on the 5 ads that spent most. High means the account leans on few ads. _Avoid_: ad concentration, dependency.

- **Low-spend rate**: the share of Launched ads at least 28 days old whose first-28-day spend stayed below the Spend bar: ads Meta never gave budget. Normal within reason. _Avoid_: zero-spend rate, zero-revenue rate, dud rate.

- **Outlier**: a Launched ad whose spend in the window is at or above the mean plus one population standard deviation of every Launched ad's spend (the line): the few ads Meta scales hard. Judged on spend alone, unlike Viable. _Avoid_: winner (that is an audit-ads status), hero ad, breakout.

- **Outlier rate**: Outliers over Launched ads, with their share of spend and the days each took from first spend to its cumulative spend crossing the line (25th percentile, median, 75th percentile). Gives Expected outliers a month at the plan's launches. _Avoid_: hit rate (that is quality, not spend).

- **Expected outliers a month**: the new ads a month times the Outlier rate, to one decimal. Read as one line in the Outlier engine, at current spend and at the Budget, with no target: nothing in the forecast uses it. _Avoid_: expected winners (that is Expected to work), outlier forecast.

- **Top-10 turnover**: for each complete calendar quarter, how many of its 10 highest-spending ads first spent in that quarter, with those ads' share of the quarter's spend. An indicator only, never scored: high turnover is neither good nor bad against Evergreen share. Read on 2 or more complete quarters, else not shown. _Avoid_: rotation rate, refresh rate.

## The check

- **Self-check**: the test of the Survival curve against the account's last 28 days on every run, read before the Recent fit: the mean daily count of viable Launched ads (actual) against the mean the curve predicts for the same days (predicted). It passes within 25% of the actual. It is reported on How it's worked out and does not stop the run, and a fail is never given a cause beyond the words of its line. _Avoid_: validation, sanity check.

- **Ad stock check**: today's viable ads against the Viable ad stock at current spend. **Short**: below 80% of it. **Ahead**: above 150% of it. **About right**: between. Shown under Ads needed each month as a sentence, "You have <S> ads working today; your spend needs <⌈L⌉> working at once.", with the gap as a count of ads. _Avoid_: health check, ad audit, over-stocked.

- **Lever**: one of the three things today's viable ads come from, which multiply: Current pipeline (launches a month), Hit rate (finding hits) and Days viable per hit (keeping hits). Closing a gap by any one alone takes the same multiple, so the gap's size never says which lever is short. _Avoid_: driver, factor.

- **Lever best**: the best the account has done on a Lever. Launches: the highest Current pipeline over any 3 complete months in a row. Hit rate: the 90th-percentile launch month (months at least 28 days old with 10 or more Launched ads, outside the first 6 weeks; fewer than 4, no best). Days viable per hit: the highest launch quarter whose ads are all 60 days old with 10 or more hits (fewer than 2, no best). _Avoid_: benchmark, target, potential.

- **Limiting factor**: the Lever the Creative deep dive names as holding the account back, B being the launches Lever best. **On track**: viable ads at 80% of needed or more, and the Steady-state number within the Current pipeline. **Volume**: the Steady-state number within 1.2 times B. **Both**: within it at the best Hit rate. Else **Finding hits** or **Keeping hits**, whichever Lever has more room below its best. _Avoid_: focus, bottleneck, constraint.

- **On the table**: the extra new customers a week at today's spend if the Viable share rose to the Viable share target, from new-customer CAC by status over the last 90 days, with the blended CAC change beside it. Assumes the CAC gap holds; at or above target, nothing. _Avoid_: opportunity, upside, prize.

- **What it's worth**: the Creative deep dive's last section: what getting the Viable share target of spend onto working ads is worth at today's spend, from On the table and current spend. It gives the new customers a month, the CAC today and at target, the Worth a month W (current spend times 1 less the CAC at target over the CAC today) and the Production budget; with nothing on the table, one sentence and no figure. Plain HTML, it does not move with the slider. _Avoid_: ROI, payback, business case, opportunity.

- **Production budget**: the most the ads can cost to make and still pay for themselves: W over the extra ads a month (N0 less P) where the Steady-state number N0 is above the Current pipeline P, and over N0 otherwise. The page's label is "ceiling for making ads". _Avoid_: creative budget, content budget, ad spend, media budget.

- **Worn out now**: live ads past Ramping that are Fatiguing, Fatigued or Low efficiency. They take spend but are not stock. _Avoid_: dead ads, fatigued ads.

- **Wearing out**: viable ads expected to stop being viable over a period. They stop at a steady rate of 1 over Days viable per hit a day, so after d days the share of a stock still working is e^(−d ÷ Days viable per hit). In the Roadmap, a month's Wearing out is every working ad that stops during it, the ones launched in the month included: the start stock plus Expected to work, less the end stock. _Avoid_: churn, decay, losing.

- **Current pipeline**: Launched ads per month, averaged over the last 3 complete months. What the Steady-state number is compared with. _Avoid_: launch rate, creative velocity.

## The plan

- **Budget**: the monthly Meta spend the user wants to reach outside the Awareness and Lead campaigns, and the month to reach it by (the Budget month); without one, 3 months from now. It may be below current spend. _Avoid_: target, goal.

- **Steady-state number**: new ads a month to hold a level of spend: monthly spend times the Viable share target over the Hit rate times the Viable spend per hit, which is Viable ad stock times the month's days over the Viable lifespan. Written once as `ads_for_spend(monthly_spend)` in `method.md`, which the Roadmap and the page slider share. _Avoid_: run rate, replacement rate.

- **Roadmap**: one row per calendar month from next month to the Budget month (3 months held at current spend without a Budget): that month's spend, Viable ad stock, Wearing out, Ads to launch (by format), Expected to work and the Live-by date. _Avoid_: plan, schedule, forecast, weekly plan.

- **Roadmap file**: `meta-ad-roadmap-<date>.md`, the Roadmap handed over as markdown for whoever makes the ads: the Budget with the ads a month at current spend and at the Budget, the months, the new ads by format, the Live-by dates, and one line each on the Hit rate, the Limiting factor with its to-hit and the Spend per viable ad. Offered at the Close; the page does not need it. _Avoid_: handover file (that is the Action skills'), brief, export.

- **Catch-up**: the extra launches in month 1 that close today's gap, the viable ads short of the Viable ad stock at current spend. Every month aims at the stock it needs, with no glide to the Budget month, so the gap closes in month 1, once, and is not spread over the months. Month 1's Catch-up is the Gap launches where they are above 0. _Avoid_: backlog, top-up.

- **Stay-level launches**: month 1's launches that replace what the viable ads your current spend needs wear out next month: the Viable ad stock at current spend times month 1's days, over the Hit rate times the Days viable per hit. About the Steady-state number, up to the month's length. Page label **To stay level**. _Avoid_: replacement launches, maintenance.

- **Gap launches**: month 1's one-off launches for the gap between the Viable ad stock at current spend and today's viable ads, the gap times the share of today's stock still working at month 1's end, over the Hit rate times the average share of a month's launches still working at its end. Above 0 where today's viable ads are short, below 0 where they are ahead, 0 with no gap. Page label **To catch up** where above 0 and **Ahead** where below. _Avoid_: backlog launches.

- **Growth launches**: month 1's launches for the change in stock needed: the Viable ad stock at month 1's spend less the stock at current spend, over the Hit rate times the average share of a month's launches still working at its end. Above 0 where spend rises, below 0 where it falls. Page label **To grow**. _Avoid_: scaling launches.

Stay-level, Gap and Growth launches are worked unrounded and shown in whole ads, with the rounding difference given to the part with the largest absolute figure, so they sum to month 1's Ads to launch (`method.md`, "Next month's ads, in three parts").

- **Expected to work**: a month's launches times the Hit rate: the viable ads they add. _Avoid_: expected winners, yield.

- **Ads to launch**: the whole ads a Roadmap month launches: the Viable ad stock the month needs, less what is left of the starting stock at the month's end, over the Hit rate times the average share of a month's launches still working at its end, rounded up and never below 0. _Avoid_: new ads to make, New.

- **Live-by**: the date a Roadmap month's first new ads must go live: the month's 1st less the Days to clear Ramping, with about a quarter of the month's ads launched each week after it. _Avoid_: launch date, deadline.

- **Format**: video or image, per ad. Read from the ad name alone first (whole-word tokens: video, vid, reel; image, img, static, still, carousel), and where the name gives neither or both, video if the ad had any video views in its life (3-second video plays on an export). _Avoid_: creative type, asset type.

- **Name coverage**: the share of spend whose ad name decided its Format, quoted beside the proposed Format split: the spend is the last 8 complete weeks', outside the Awareness and Lead campaigns, which the split rests on. Under 50%, the split rests mostly on video views, and the intake asks the user to confirm it or give their own. _Avoid_: match rate, tagging rate.

- **Format split**: the video and image share the Roadmap divides new ads by, in whole ads by largest remainder so the two sum to the total: by default each Format's share of spend over the last 8 complete weeks, every ad counted outside the Awareness and Lead campaigns, because spend shows what Meta chose to deliver, not what the team happened to make. The user keeps, replaces or turns it off. _Avoid_: creative mix, launch mix.

- **Awareness campaign**: a campaign the user confirms at the intake as bought for awareness, reach, video views, engagement or traffic rather than purchases. Left out of the plan whole: no status, no curve, no spend, no new ads; named with its spend in This run on How it's worked out. _Avoid_: brand campaign, upper funnel, TOF.

- **Lead campaign**: a campaign the user confirms at the intake as bought for leads, sign-ups, giveaways or competitions rather than purchases. Left out of the plan whole, like an Awareness campaign: no status, no curve, no spend, no new ads; named with its spend in This run on How it's worked out. _Avoid_: lead gen, TOF.

- **Source**: where the ad-by-day rows come from, the first that holds them of a Growth Brain (the last 365 days), a Meta connector in the session and one Ads Manager export (each the last 180 days). Named on the page. _Avoid_: data source, feed.

- **Unattended run**: a run whose message says so or says not to ask, or a scheduled session. It asks nothing, takes the proposed retargeting, awareness and lead campaigns, plans current spend held flat for 3 months with no Budget and no Format split, saves the Roadmap file without offering it, and says so in This run on How it's worked out. _Avoid_: automatic run, headless run.

- **Brain line**: the fixed sentence, "With a Growth Brain, the survival curve judges every ad on a single attribution source rather than every purchase Meta claims, and reads a year of history without an export.", said as the last line of How it's worked out on a run whose Source is not a Growth Brain and whose session holds no Growth Brain. _Avoid_: upsell, plug.

## The page

- **Creative deep dive**: the page's first tab, the one it opens on, Crux-branded and laid out like CTC's creative report: the Creative score, Spending power (monthly spend against CAC, last 3 months against the 3 before), the Outlier engine, Creative rotation (Top-10 turnover), Hits (Hit rate, Low-spend rate, Viable spend per hit, the Spend bar), Ads needed each month (the Steady-state number against the Current pipeline with a verdict line, next month's ads in three parts that add up, the Limiting factor, a spend slider over the Steady-state number, Expected outliers a month, the Ad stock check in plain words and the Roadmap), and What it's worth (what the extra working ads are worth a month, with the Production budget). Labels only, no definitions beyond the hit test and the Spend bar's explanation under their figures, and the Hits and Outliers line; Spending power, the Outlier engine, Creative rotation, Hits and What it's worth each open with two fixed sentences on why the section is there and how to read it. _Avoid_: Scorecard, dashboard tab, summary.

- **How it's worked out**: the page's second tab: the Month-by-month plan table, the Survival curve, the figures behind the Creative deep dive, Terms, This run, the method word for word, and the Brain line where the run has one. _Avoid_: Notes and Method, appendix.

- **Page label**: the plain words the Creative deep dive, the Roadmap file and the chat use for a term, fixed once in the Page labels table of `references/page-layout.md`, each explained under Terms on How it's worked out, never on the Creative deep dive. The terms themselves stay on How it's worked out. _Avoid_: display name, friendly name.
