# Glossary

The terms `SKILL.md` and the other references use, each with one meaning. The shared term Next run is in the repo's root `GLOSSARY.md`; this skill is a forecast, not an Action skill, so it has no Recommendation, Mode or Hand-off; its Next run is always 2 weeks. The ad statuses (Ramping, Low efficiency, Fatigued, Fatiguing, Improving, Winner, Healthy) and the measures behind them (CAC, Account blend, Peak CAC, Eligibility floors) are judged exactly as `audit-ads` judges them, by the copy in `references/fatigue.sql`.

## Ad stock

- **Viable ad**: an ad whose status that day is Healthy, Winners included. Every other status, Improving included, is not viable. _Avoid_: active ad, live ad, good ad.

- **Viable share**: a week's spend on viable ads over its spend, every ad counted (Launched or not) outside the Awareness and Lead campaigns. Read for each complete ISO week of the window. _Avoid_: efficiency, share of voice.

- **Viable share target**: the share of spend the plan aims to put on viable ads: the smaller of 100% and the 90th-percentile weekly Viable share times 1.2. The weeks read leave out the window's first 6 complete weeks, which lean towards Ramping, and any week whose spend is below 25% of the median of the rest; with fewer than 8 left, those there are, and with none the run stops. No account puts every pound on a viable ad, so the target is the account's own best plus 20% for running creative production well. _Avoid_: benchmark, goal, best share.

- **Viable ad stock**: the number of viable ads a level of daily spend needs live at once: daily spend times the Viable share target over Spend per viable ad. The L of Little's law. _Avoid_: ad stock alone (that is MMM carryover), ad inventory, creative stock.

- **Launched ad**: an ad whose first day of spend falls inside the window after its first day. Only Launched ads feed the Survival curve, because an ad already live on day one has an unknown age. _Avoid_: new ad.

- **Survival curve**: for each day of age, the share of every Launched ad that has reached that age which is viable that day; an ad that stopped spending or is still Ramping counts as not viable. An age counts only with 3 or more ads. _Avoid_: decay curve, fatigue curve, a curve of running ads only.

- **Viable lifespan**: the average viable days one Launched ad delivers, duds included: the area under the Survival curve, and Hit rate times Days viable per hit. The W of Little's law. Where the curve is still at 25% or above when the 3-ad floor cuts it off, it is a lower bound. _Avoid_: ad lifespan, shelf life.

- **Hit rate**: the share of Launched ads at least 28 days old that were viable on at least one day in their first 28 days. A new ad adds Hit rate viable ads, not one. _Avoid_: success rate, win rate, conversion rate.

- **Days viable per hit**: the Viable lifespan over the Hit rate: how long an ad that works stays viable. Today's viable ads wear out at 1 over it. _Avoid_: winner lifespan, hit lifespan.

- **Healthy lifespan**: the age by which half the ads viable at the Survival curve's peak have stopped being viable, with the quartile range (the ages at 75% and 25% of the peak). Quoted on How it's worked out. _Avoid_: median life, half-life.

- **Spend per viable ad**: the account's typical daily spend on one viable ad: spend on viable ad-days over the number of viable ad-days. _Avoid_: spend per ad, ad budget.

- **Days to clear Ramping**: the median number of days a Launched ad spends Ramping before its first status. Sets the Live-by date. _Avoid_: learning phase, ramp time.

## The check

- **Self-check**: the test of the Survival curve against the account on every run: Current pipeline times Viable lifespan over 7 predicts today's viable ads, and it passes within 25% of them. A fail is said on How it's worked out and does not stop the run. _Avoid_: validation, sanity check.

- **Ad stock check**: today's viable ads against the Viable ad stock at current spend. **Short**: below 80% of it. **Ahead**: above 150% of it. **About right**: between. Your plan shows it as "Do you have the right number of ads?", one bar with the gap as a count of ads. _Avoid_: health check, ad audit, over-stocked.

- **Focus**: what the plan tells the brand to work on first, read from the Hit rate and the ask (Launches a week to keep up over the Current pipeline). **Hit rate first**: Hit rate under 8%, or under 15% with an ask above 1.5. **Both**: Hit rate 8% to under 15% with an ask of 1.5 or less. **Volume**: Hit rate 15% or above. Said in one sentence under the tiles. _Avoid_: health check, priority, verdict.

- **Worn out now**: live ads past Ramping that are Fatiguing, Fatigued or Low efficiency. They take spend but are not stock. _Avoid_: dead ads, fatigued ads.

- **Wearing out**: viable ads expected to stop being viable over a period: the stock times the period's days over Days viable per hit. _Avoid_: churn, decay, losing.

- **Current pipeline**: Launched ads per week, averaged over the last 8 complete weeks. What the steady-state number is compared with. _Avoid_: launch rate, creative velocity.

- **Churn cycle**: how ads perform in this account, shown on Your plan as "How your ads perform": Hit rate with the Launched ads it rests on, Days viable per hit, Days to clear Ramping and the Survival curve chart. _Avoid_: lifecycle, fatigue profile.

## The plan

- **Budget**: the monthly Meta spend the user wants to reach outside the Awareness and Lead campaigns, and the week to reach it by; without a week, 4 weeks from now. It may be below current spend. _Avoid_: target, goal.

- **Steady-state number**: new ads a week to hold a level of spend: Viable ad stock times 7 over the Viable lifespan. _Avoid_: run rate, replacement rate.

- **Roadmap**: one row per ISO week from next week to the Budget week, then 4 weeks held at the Budget: that week's spend, Viable ad stock, Wearing out, Ads to launch (by format), Expected to work and the Live-by date. _Avoid_: plan, schedule, forecast.

- **Roadmap file**: `meta-ad-roadmap-<date>.md`, the Roadmap handed over as markdown for whoever makes the ads: the Budget, the weeks, the new ads by format, the Live-by dates, and one line each on the Viable lifespan and the Spend per viable ad. Offered at the Close; the page does not need it. _Avoid_: handover file (that is the Action skills'), brief, export.

- **Catch-up**: the launches above keeping up in the weeks to the Budget week (4 with no Budget): each week's Ads to launch less Wearing out over the Hit rate, rounded up. They close today's gap, the viable ads short of the Viable ad stock over the Hit rate spread evenly, and where the Budget is above current spend they also grow the stock. _Avoid_: backlog, top-up.

- **Expected to work**: a week's launches times the Hit rate: the viable ads they add, and the Waterfall's up bar. _Avoid_: expected winners, yield.

- **Ads to launch**: the whole ads a Roadmap week launches: the week's target, less the stock left after Wearing out, over the Hit rate, rounded up and never below 0. _Avoid_: new ads to make, New.

- **Live-by**: the date a Roadmap week's new ads must go live: the week's Monday less the Days to clear Ramping. _Avoid_: launch date, deadline.

- **Waterfall**: the chart of the Roadmap, week by week: stock at the start, less Wearing out, plus new ads (stacked by format), equals stock at the end, with that week's Viable ad stock marked. _Avoid_: bridge, flow chart.

- **Budget ladder**: the Steady-state number at current spend, +25%, +50% and the Budget, on the stated assumption that Spend per viable ad and the Viable share target hold as spend grows. _Avoid_: scenarios, sensitivity.

- **Hit-rate scenarios**: the Steady-state number at today's Hit rate, 20% higher and 30% higher, each with Days viable per hit held fixed, so only the share of launches that work moves; with a Budget, also the launches a week at the Budget. Where the ask is above 1.5, a fourth row gives the Hit rate needed to keep up at 1.5 times the Current pipeline (the most production can stretch to): Viable ad stock times 7 over Days viable per hit times 1.5 times the Current pipeline, or "not reachable at this spend" above 100%. Your plan shows them as "If more of your ads work". _Avoid_: what-ifs, improvement targets.

- **Format**: video or image, per ad. Read from the ad name alone first (whole-word tokens: video, vid, reel; image, img, static, still, carousel), and where the name gives neither or both, video if the ad had any video views in its life (3-second video plays on an export). _Avoid_: creative type, asset type.

- **Name coverage**: the share of ads whose name decided their Format, quoted beside the proposed Format split: the ads are the Launched ads whose first spend fell in the last 8 complete weeks, which the split rests on. _Avoid_: match rate, tagging rate.

- **Format split**: the video and image share the Roadmap divides new ads by, in whole ads by largest remainder so the two sum to the total: by default the shares of the Launched ads whose first spend fell in the last 8 complete weeks, which the user keeps, replaces or turns off. Worked out before the intake, from the Launched ads outside the proposed awareness and lead campaigns, and again where the reply changes those campaigns. _Avoid_: creative mix.

- **Awareness campaign**: a campaign the user confirms at the intake as bought for awareness, reach, video views, engagement or traffic rather than purchases. Left out of the plan whole: no status, no curve, no spend, no new ads; named with its spend in This run on How it's worked out. _Avoid_: brand campaign, upper funnel, TOF.

- **Lead campaign**: a campaign the user confirms at the intake as bought for leads, sign-ups, giveaways or competitions rather than purchases. Left out of the plan whole, like an Awareness campaign: no status, no curve, no spend, no new ads; named with its spend in This run on How it's worked out. _Avoid_: lead gen, TOF.

- **Source**: where the ad-by-day rows come from, the first that holds them of a Growth Brain (the last 365 days), a Meta connector in the session and one Ads Manager export (each the last 180 days). Named on the page. _Avoid_: data source, feed.

- **Unattended run**: a run whose message says so or says not to ask, or a scheduled session. It asks nothing, takes the proposed retargeting, awareness and lead campaigns, plans current spend held flat for 4 weeks with no Budget and no Format split, saves the Roadmap file without offering it, and says so in This run on How it's worked out. _Avoid_: automatic run, headless run.

- **Brain line**: the fixed sentence, "With a Growth Brain, the survival curve judges every ad on a single attribution source rather than every purchase Meta claims, and reads a year of history without an export.", said as the last line of How it's worked out on a run whose Source is not a Growth Brain and whose session holds no Growth Brain. _Avoid_: upsell, plug.

## The page

- **Your plan**: the page's first tab, the one it opens on: the four headline tiles and the Focus sentence, then Do you have the right number of ads? (one bar), How your ads perform, the Week-by-week plan, If more of your ads work and If you spend more, all in Page labels; under a Focus of Hit rate first, If more of your ads work comes straight after the Focus sentence. _Avoid_: dashboard tab, summary.

- **How it's worked out**: the page's second tab: Terms on the plan, This run, the method word for word, and the Brain line where the run has one. _Avoid_: Notes and Method, appendix.

- **Page label**: the plain words Your plan, the Roadmap file and the chat use for a term, fixed once in the Page labels table of `references/page-layout.md`, each explained at its first use. The terms themselves stay on How it's worked out. _Avoid_: display name, friendly name.
