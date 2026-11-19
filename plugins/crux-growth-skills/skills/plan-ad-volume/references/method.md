The number of new ads a month is worked out from how long your own ads stay good. Every Meta ad is judged on every day of the window read, and the ads you launched in that time show how long a new one lasts. The window is the last 365 complete days from a Growth Brain, and the last 180 from a Meta connector or an Ads Manager export. Here is how.

**1. Judging each ad each day.** Each ad is judged by its CAC, which is its spend divided by the new customers it brought. With a Growth Brain these are your own first-time orders; otherwise they are the purchases Meta reports for the ad, which counts every purchase Meta claims. Each day's CAC is adjusted for the day of the week (some weekdays are always dearer) before any comparison. The current window is the 5 days to that day. An ad's Peak CAC is its best (lowest) 7-day CAC in the 42 days to that day. The Account blend is the CAC of all live ads together over the same 5 days; ads in your retargeting and existing-customer campaigns are judged against the blend of those campaigns alone, and every other ad against the rest. Campaigns bought for awareness, reach or video views, or for leads, sign-ups, giveaways or competitions, are left out of the whole plan, their spend included: they are not bought to win customers, so CAC is the wrong measure for them.

**2. Ramping.** An ad needs all three of: 300 spent in its life, at least 2 days old, and 30 a day on average over the 5-day window (all in the account's currency). Below any of them it is Ramping, with no verdict.

**3. One status per ad per day, the first that fits:**

1. **Low efficiency**: 5-day CAC is 20% or more above its blend.
2. **Fatigued**: 5-day CAC is 50% or more above the Peak CAC on each of the last 3 days, and not improving.
3. **Fatiguing**: 20% or more above the Peak CAC on each of the last 2 days, and not improving.
4. **Improving**: 20% or more above the Peak CAC, but CAC has fallen over the last 3 days.
5. **Winner**: 5-day CAC is 20% or more below its blend.
6. **Healthy**: none of the above.

**4. Viable.** An ad is viable on a day when its status is Healthy, Winner or Improving: an ad that is recovering towards viable converts like a Healthy one, so the plan counts it. Fatiguing, Fatigued and Low efficiency are not viable, and nor is Ramping. The statuses are judged as in an ad audit, where Improving means recovering and stays out; only this plan reads it as viable.

**5. Launched ads and age.** A Launched ad is one whose first day of spend falls after the first day of the window, so its age is known. Only Launched ads feed the curve below. An ad's age is the number of days since its first day of spend: the first day is age 0.

**6. The survival curve.** At each age, the denominator is every Launched ad that has reached that age inside the window: its first spend is at least that many days before the last complete day. The numerator is those of them that are viable on their day at that age. A day with no spend (the ad is Inactive), a day in Ramping, a day with no status, and any status that is not viable all count as not viable. So an ad that stops spending, or never leaves Ramping, stays in the count as not viable, and does not drop out. An age counts only when 3 or more ads have reached it, and the rates are used as they come, not smoothed.

**7. Lifespans.** The Viable lifespan is the sum of the survival rates over the ages that count: the average number of days one Launched ad is viable, the ones that never work included. Where the curve is still at 25% or above when the 3-ad floor cuts it off, it is a lower bound, and the Steady-state number and the Ads to launch in the Roadmap, which divide by it, are a ceiling. The Healthy lifespan reads from the curve's peak, its highest rate (the first age that holds it): it is the first age after the peak at which the rate is below half the peak rate, with a quartile range from the first age after the peak below 75% of the peak rate to the first below 25% of it. Either end reads "not reached" where the curve never gets there. The Days to clear Ramping is the median, over Launched ads that leave Ramping, of the age at which an ad first stops being Ramping.

**8. Spend per viable ad, the Spend bar and the Hit rate.** The Spend per viable ad is the spend on every viable ad-day of the Launched ads, at the ages that count, divided by the number of those viable ad-days: the typical daily spend on one viable ad. The Spend bar is the larger of 300 and 3 times the Spend per viable ad, in the account's currency. 300 is the lifetime spend an ad needs before it is judged at all (step 2), so where 3 times the Spend per viable ad is under 300 the bar is 300, and every ad that was ever viable has already cleared it: the bar only starts to remove hits where a viable ad spends over 100 a day. The base is the Launched ads whose first spend is at least 27 days before the last complete day (ages 0 to 27 all inside the window). A hit is an ad in the base that passes all three tests over those 28 days: it spent the Spend bar or more (Meta gave it real budget); its 28-day CAC, its spend over its new orders in the 28 days, is no more than 1.2 times the account's over the same 28 calendar days (the account's is every ad's spend over every ad's new orders, outside the awareness and lead campaigns, so an ad with no new orders fails; 1.2 is the Low efficiency line of step 3); and it was viable on at least one of those days. So an ad that started well and was poor for the rest of its month is not a hit. The Hit rate is the hits over the base. The Low-spend rate is the ads in the base that spent less than the Spend bar over those 28 days, viable or not, over the base, so no ad is both a hit and low-spend. Every ad in the base is a hit, low-spend, or spent the bar but is not a hit (at or above the bar, but never viable or over the CAC line), so those three counts add up to the base. The CAC test changes how the Viable lifespan splits between the Hit rate and the Days viable per hit, not the Viable lifespan, so the ad count does not move. The Days viable per hit is the Viable lifespan divided by the Hit rate: how long a hit stays viable. So the Hit rate times the Days viable per hit is the Viable lifespan exactly. The Viable spend per hit is the Spend per viable ad times the Days viable per hit: the spend one hit carries over its viable life.

**9. The viable share.** No account puts every pound of spend on a viable ad: some always sits on ads in their test phase and on ads that have stopped working. So the plan aims at a share it can reach. A week's viable share is its spend on viable ads over its spend, counting every ad, not only the ones you launched in the window, and leaving out the awareness and lead campaigns. The weeks are the complete ISO weeks of the window, Monday to Sunday. The first 6 are left out, because the weekday index, an ad's life spend and its Peak CAC all warm up from the window's first day, so those weeks lean towards Ramping. Of the weeks that remain, any whose spend is below 25% of their median weekly spend is left out too, because a thin week gives a noisy share. The weeks left are the weeks counted. With fewer than 8, the plan uses those there are and says how many; with none, it stops, because the weekly spend is too uneven to read a viable share. The 90th percentile (P90) of the weekly viable shares counted is the share at rank 0.9 times their number, rounded up, once they are sorted from lowest to highest: the best weeks your account has sustained. The Viable share target is the smaller of 100% and the P90 times 1.2: your own best, plus 20% for running creative production well. It rests on your account's history, not on a benchmark, so another account reads a different target. The page also gives the median weekly share of spend on ads still in their test phase (Ramping) and on ads that have stopped working (Fatiguing, Fatigued and Low efficiency), over the same weeks, to show where the rest of the spend goes.

**10. Viable ad stock.** The Viable ad stock is the number of viable ads your spend needs live at once: your current spend a day times the Viable share target, divided by the Spend per viable ad. At a target of 100% that is every pound on a viable ad; a lower target needs fewer viable ads, because some spend is always on ads that are not viable. Current spend is the last complete calendar month's spend, outside the awareness and lead campaigns, and current spend a day is that spend divided by the month's days. The last complete calendar month is the month before the one holding today. The Viable share target holds at every stock in the plan: at current spend, in each month of the Roadmap and at every spend the page's slider runs.

**11. Ads a month.** Hold the Viable ad stock, and the viable ads that stop being viable have to be replaced, but a launch adds the Hit rate in viable ads, not one. The Steady-state number is the Viable ad stock times the month's days, divided by the Viable lifespan, rounded up. That is the same as the Viable ad stock times the month's days, divided by the Hit rate times the Days viable per hit: the viable ads that wear out in a month, over the viable ads a launch adds. Written with the Viable spend per hit, it is the same figure from a month's spend, and the plan and the page's slider share it as one function, `ads_for_spend(monthly_spend)`: a month's spend times the Viable share target, divided by the Hit rate times the Viable spend per hit, rounded up to a whole ad. Its figure at current spend (last month's spend) is the Steady-state number. The Current pipeline is the Launched ads a month, averaged over the last 3 complete calendar months. A calendar month is complete when it starts after the window's first day (an ad that first spent on that day is not a Launched ad) and ends on or before the last complete day.

**12. The check on today's ads.** Today means the last complete day: yesterday, unless the data for it is still loading, which reads no orders and so no viable ads. A day is loaded when its spend and its new orders are each at least half their mean over the 7 days before it, and today is the latest loaded day of the last 14. The run names the date. The check reads viable ads only. Short: viable ads below 80% of the Viable ad stock. About right: from 80% to 150% of it. Ahead: viable ads above 150% of it. Worn out now: live ads past Ramping that are Fatiguing, Fatigued or Low efficiency; they take spend but are not stock.

**13. The Budget and the ramp.** A Budget is a monthly spend and the month to reach it by, the Budget month: the month 3 months on from the one holding today if you name none, and never before next month. The Roadmap has one row for each calendar month from next month (month 1) to the Budget month (month n), so 3 rows by default. The daily Budget is the Budget divided by the Budget month's days. Your spend does not jump to it. Daily spend steps in equal amounts month by month from current daily spend to the daily Budget: month k of n is current daily spend plus the daily Budget less current daily spend, times k over n. A month's spend is its daily spend times its days, so the Budget month's spend is the Budget itself, and a longer month spends more at the same daily spend. A Budget below your current spend steps down the same way. With no Budget, current daily spend is held for 3 months.

**14. The stock, month by month.** The Viable ad stock a month needs is that month's daily spend times the Viable share target, divided by the Spend per viable ad. The plan starts from the viable ads you have live on the last complete day, today's stock. The gap is the Viable ad stock at current spend less today's stock. Each month some of the stock stops being viable: Wearing out is the stock at the start of the month times the month's days, divided by the Days viable per hit, and never more than the whole stock. A gap above zero is closed by the Catch-up: each month's target is the stock needed less a share of the gap that shrinks evenly to nothing at the Budget month, so by then the target is the stock needed in full. In month k of n to the Budget month, the target is the stock needed less the gap times (n less k) over n; where there is no gap, it is the stock needed. The Ads to launch are whole ads: the target, less the stock left after Wearing out, divided by the Hit rate, rounded up and never below zero. Expected to work is the Ads to launch times the Hit rate, left unrounded: the viable ads those launches are likely to add. The stock at the end of the month is the stock at its start, less Wearing out, plus Expected to work. With the stock at the month's target, the Ads to launch are `ads_for_spend` of that month's spend, exactly; over a run of months at a flat budget the stock sits a little above target, because each launch count is rounded up, so each month is the Steady-state number, give or take one ad. When spend steps down, the stock needed can fall faster than ads wear out: a month may then need no launches, and the stock above what spend needs wears out on its own. Where the Days viable per hit is under the month's days, the whole stock wears out within the month, so the Ads to launch are the target over the Hit rate, which sits below `ads_for_spend`: the page says so in that case.

**Next month's ads, in three parts.** Month 1's Ads to launch is the sum of three launches, each a change in the stock over the Hit rate. The change is Wearing out plus the target less today's stock, and the target less today's stock splits in two. **To stay level** replaces what wears out: Wearing out(1) over the Hit rate, x. **To catch up** closes this month's share of the gap, the gap over the months to the Budget month (n), and is 0 where there is no gap: Gap0 over n over the Hit rate, y. **To grow** is the rest, z: the Viable ad stock needed at month 1's spend less the larger of the Viable ad stock needed at current spend and today's stock, over the Hit rate. It is above 0 where spend rises, below 0 where spend falls, and below 0 where today's stock is already above the stock needed at current spend, because the target is then the stock needed and the spare ads are not replaced. Where the gap is above 0 this is the rise from current spend to month 1's spend; where it is not, it is the rise from today's stock. x, y and z are carried unrounded and add to the launches needed before Ads to launch rounds them up, so Ads to launch is above their sum by less than 1 where the sum is above 0. To show whole ads: round x up, round y and z each to the nearest whole ad, then give the rounding difference, Ads to launch less the sum of the three, to the part with the largest unrounded figure (on a tie, stay level before catch up before grow). The difference is 1, 0 or −1, and the three parts then add to Ads to launch exactly. Where Ads to launch is 0 there are no parts: the stock after Wearing out already meets the target.

**15. Live-by.** A new ad needs the Days to clear Ramping before it earns a verdict, so each month's new ads should be live that many days before the month's 1st. That date is the Live-by, and about a quarter of the month's ads launch each week after it.

**16. Ads needed each month.** The page's slider works backwards from spend, and runs the Steady-state number's own function for any monthly spend: New ads is `ads_for_spend(monthly_spend)`, a month's spend times the Viable share target, divided by the Hit rate times the Viable spend per hit, rounded up to a whole ad. The slider runs from half current spend to 3 times it, wider where the Budget lies outside that range. At current spend it is the Steady-state number, the figure the Roadmap gives. Expected outliers a month is the New ads times the Outlier rate. Each new ad is an Outlier with a chance equal to the Outlier rate, whatever the others do, so the Outliers among N new ads follow a binomial: P(k) is N! ÷ (k! × (N − k)!) × rate^k × (1 − rate)^(N − k), and P(0), (1 − rate)^N, is the chance of finding none. The page charts P(k) for k = 0 to 4 and for 5 or more (one less the other five), each to one decimal: the six are cut to whole tenths of a percent and the tenths left over go to the largest remainders, so the six shown add to 100.0%. With no Outlier in the window the rate is 0 and the chart is left out. It assumes the Spend per viable ad, the Hit rate, the Outlier rate and the Viable share target hold as spend grows. If the extra spend goes into each ad rather than into more ads, fewer new ads are needed.

**17. Lever best.** Today's viable ads come from three Levers that multiply: how many ads you launch a month (the Current pipeline), the share of them that become hits (the Hit rate) and how long a hit stays viable (the Days viable per hit). Closing a gap by any one Lever alone takes the same multiple, so the size of a gap never says which Lever is short. Only each Lever's room against what your account has already done can. Each Lever best is that, taken from your own history in the window, with the periods it counted. **Launches:** the highest average of Launched ads a month over any 3 complete calendar months in a row. **Hit rate:** for each calendar month, by the first spend of its ads, the Hit rate of that month's Launched ads, at the account's Spend bar (one bar for every month). A month counts when its last day is at least 28 days before the last complete day (so each of its ads has had its 28 days), it has 10 or more Launched ads, and it starts after the window's first 6 weeks (when the judging leans towards Ramping). The best is the 90th percentile of the months counted, by nearest rank: with them sorted from lowest to highest, the month at rank 0.9 times their number, rounded up. With fewer than 4 months counted there is no best. **Days viable per hit:** for each calendar quarter, by the first spend of its ads, work the Days viable per hit from that quarter's Launched ads alone: the sum of their survival rates over the ages that 3 or more of them have reached, divided by their Hit rate at the account's Spend bar. A quarter counts when its last day is at least 60 days before the last complete day and it has 10 or more hits. The best is the highest quarter, and with fewer than 2 quarters counted there is no best. The run says how many months and quarters it counted.

**18. The Limiting factor.** The plan names the Lever holding the account back, the first of these that holds. B is the launches best, P the Current pipeline, N0 the Steady-state number, and N1 the launches a month needed at your best Hit rate: the Viable ad stock times the days of the last complete month, divided by the best Hit rate times the Days viable per hit, rounded up. **On track:** today's viable ads are 80% of the Viable ad stock or more, and N0 is within P. There is nothing to hit. **Volume:** N0 is within 1.2 times B, so launching at the pace you have already sustained keeps up. The target is N0 launches a month. **Both:** at your best Hit rate N1 is within 1.2 times B. Launching at your best pace is not enough on its own, and nor is your best Hit rate: the target is both, the best Hit rate and N1 launches a month. Otherwise the Lever with more room below its best. Room is the best over today's figure, and a Lever with no best has a room of 0. **Finding hits** holds when the Hit rate has the room (or the rooms are equal): the Hit rate needed is the Viable ad stock times the days of the last complete month, divided by the Days viable per hit times B, which is "beyond your best" where it is above the best Hit rate. **Keeping hits** holds when the Days viable per hit has more room: the Days viable per hit needed is the Viable ad stock times the days of the last complete month, divided by the Hit rate times B, "beyond your best" where it is above the best. With no best on either Lever the factor is Finding hits, and the run says there is not enough history to compare. The 1.2 allows a fifth more than your best pace, since a best month is not a standing pace.

**19. On the table.** Over the last 90 complete days, each ad-day is put in a group by its status: viable (Healthy, Winner and Improving), test phase (Ramping), worn out (Fatiguing, Fatigued and Low efficiency) or other (any status left). Each group has its spend, its new customers and its CAC, which is its spend divided by its customers. Today's viable share is the viable group's spend over the total. Where it is at or above the Viable share target, there is nothing on the table. Otherwise, put the viable spend at the target share of the total, and scale every other group in proportion so that together they take the rest of the spend. Each group's customers at the new spend are its new spend divided by its own CAC, and the new customers a week are their sum, divided by 90 and times 7, set against today's. The blended CAC today is the total spend over the customers, and at target is the same spend over the new customers; the change is relative. It assumes each group's CAC holds as the shares move, which is the CAC gap between viable and other spend holding. A group that spent with no customers in the 90 days takes the CAC of the next-worse group (in the order viable, test phase, worn out, other), or is left out of the customers with a note. The biggest waste is whichever of the test phase and worn out has the larger share of spend.

**20. Format.** Each ad is read as video or image from its ad name alone, never its ad set or campaign name. The name is split into words at every character that is not a letter or a digit, and each word is compared with these, ignoring case. Video: video, vid, reel. Image: image, img, static, still, carousel. A name with words of one kind only decides the Format. A name with neither kind, or both, leaves the ad video if it had any 3-second video plays in the rows read, and image otherwise. The Name coverage is the share of the spend behind the Format split (step 21) whose ad name decided the Format.

**21. The Format split.** The proposed split is the video and image shares of spend over the last 8 complete ISO weeks (Monday to Sunday), every ad that spent counted, Launched or not, outside the awareness and lead campaigns, in whole percentages that sum to 100: spend shows what Meta chose to deliver, not what the team happened to make. Where the Name coverage is under 50%, the split rests mostly on video plays, and the intake asks you to confirm it or give your own. You can keep it, give your own (a video percentage, with image the rest) or turn it off. Each month's new ads are divided by it in whole ads, by largest remainder: each format first takes the whole ads of its share, and the ad left over, if there is one, goes to the format with the larger remainder (on a tie, the larger share; on equal shares, video). The video and image ads always add up to the month's new ads. With no split, only the total is shown.

**22. What the figures describe.** Every figure comes from your ads' own history in the window read, so it describes how your ads have behaved, not how ads behave in general. That holds for the Viable share target too: it is your own best weeks, not an industry figure. An account with few Launched ads gives a rough curve, and one with fewer than 20 launched at least 28 days ago is not read at all: it does not yet launch enough ads to read a hit rate. Nor is one in which none of those ads became a hit (viable and at or above the Spend bar), because there is then no Hit rate to plan from. Nor is one whose weekly spend is too uneven, with no week left to read a viable share from.

**23. The self-check.** Every run tests its own curve against the account. The Viable lifespan is the viable ad-days one launch delivers, so the Launched ads of the last 3 complete calendar months, divided by those months' days and times the Viable lifespan, is the number of viable ads that launching at that rate should leave live. That is the predicted viable ads, and it is set against today's viable ads. The check passes when the two are within 25% of each other, taken relative to today's viable ads. The run states the check either way, and where it fails it says the curve and today's count disagree, so the plan is a guide. A failed check does not stop the run.

**24. The seven measures of the Creative score.** Each is worked once, from the same rows as the plan, with the awareness and lead campaigns left out. The last 30 days are the 30 complete days to today.

- **Evergreen share**: the share of the last 30 days' spend that sat on ads aged 30 days or more on the day it was spent. Every ad counts, not only Launched ads. An ad's age is the days since its first spend, so an ad that spent on the window's first day is older than the window and is aged on every day.
- **Spend degradation**: over the Launched ads whose first spend is at least 27 days before the last complete day (the base of the Hit rate), each ad's mean daily spend over ages 7 to 27 divided by its mean daily spend over ages 0 to 6, less 1. A day with no spend counts as 0. The measure is the median across those ads (the mean of the middle two where the count is even). The means run over 21 days and 7, so an ad's figure is its spend over ages 7 to 27 divided by 3 times its spend over ages 0 to 6, less 1.
- **Viable after week 1**: of the hits (step 8) whose first spend is at least 28 days before the last complete day, the share that were viable on their day at age 28. A day with no spend is not viable. A hit younger than that has not reached age 28 and is left out.
- **Top-5 concentration**: the share of the last 30 days' spend on the 5 ads that spent most in those 30 days.
- **Outlier rate**: step 25.
- **Hit rate** and **Low-spend rate**: step 8.

With no hit that has reached age 28, Viable after week 1 cannot be read, and the Creative score is not shown: the page says which measure is missing.

**25. Outliers.** An Outlier is a Launched ad (any, not only those 28 days old) whose spend over the window is at or above the mean plus 1 population standard deviation of every Launched ad's spend over the window. That sum is the line. The Outlier rate is the Outliers over the Launched ads. Beside it the page gives the Outliers' share of the Launched ads' spend; the spend per Launched ad as its mean, median (the mean of the middle two where the count is even), standard deviation, line and maximum; and the days each Outlier took from its first spend to the day its cumulative spend reached the line (the first day is day 0), as the 25th percentile, median and 75th percentile over the Outliers. The quartiles are by nearest rank: with the days sorted from lowest to highest, the value at rank 0.25 times their number and at rank 0.75 times their number, each rounded up. With no Outlier, the rate is 0 and the days read "no Outliers".

**26. Top-10 turnover.** For each complete calendar quarter in the window (its first day is not before the window's first day and its last day is not after its last complete day), take the 10 ads that spent most in the quarter, or all of them where fewer than 10 spent. Turnover is the number of those whose first spend fell in that quarter, out of the 10, and their spend as a share of the quarter's whole spend. An ad that spent on the window's first day is not new in any quarter. It needs 2 or more complete quarters: with fewer it is not shown. It is never scored, and never in the Creative score. A window of 180 days can never hold 2 complete quarters, so it is shown only from a Growth Brain.

**27. Spending power.** For each complete calendar month of the window (the months behind the Current pipeline), outside the awareness and lead campaigns, the spend, the new orders (the purchases without a Growth Brain) and the CAC: the spend over the orders, none where a month has no orders. With 6 or more complete months, the relative change in spend is the total spend of the last 3 months over the total spend of the 3 before, less 1, and the relative change in CAC is the last 3 months' total spend over their total orders, against the same for the 3 before, less 1. With fewer than 6 months, neither change is shown, and the months are charted with 2 or more.

## Worked example

An invented brand, Fern & Co, with six Launched ads. Each ad is one line of its status on each day of its life, from age 0 to the last complete day: R is Ramping, V is viable (Healthy, Winner or Improving), X is a spending day that is not viable (Fatiguing, Fatigued or Low efficiency), a dot is a day with no spend, and a dash is an age the ad has not reached yet. The last complete day is 27 days after the first spend of ads A to E, and 19 days after the first spend of ad F.

```
Age   0123456789 0123456789 01234567
A     RRRVVVVVVV VVVVVVXXXX ........
B     RRRVVVVVVV VVVVVVVVVV VVVVVVVV
C     RRRRXXXXXX XXXXXXXXXX XXXXXXXX
D     RRRRRRRRRR RRRRRRRRRR RRRRRRRR
E     RRRRXXXXXX XX........ ........
F     RRRRRVVVVV VVVXXXXXXX --------
```

Ads A and E stop spending, and ad D never leaves Ramping. They stay in the count as not viable. A real run needs 20 Launched ads at least 28 days old; six keep the arithmetic readable.

**The curve.** At each age, count the ads that have reached it, and how many of them are viable. Ads A to E have reached every age to 27, and ad F every age to 19, so 6 ads have reached ages 0 to 19 and 5 have reached ages 20 to 27. The last column is the spend on those viable ad-days, each ad's day spend in whole pounds.

| Age | Reached | Viable | Survival | Spend on viable ad-days |
|---|---|---|---|---|
| 0 to 2 | 6 | 0 | 0 | £0 |
| 3 and 4 (each) | 6 | 2 (A, B) | 2 ÷ 6 = 1/3 (0.33) | £40 |
| 5 to 12 (each) | 6 | 3 (A, B, F) | 3 ÷ 6 = 1/2 (0.50) | £90 |
| 13 to 15 (each) | 6 | 2 (A, B) | 2 ÷ 6 = 1/3 (0.33) | £60 |
| 16 to 19 (each) | 6 | 1 (B) | 1 ÷ 6 = 1/6 (0.17) | £40 |
| 20 to 27 (each) | 5 | 1 (B) | 1 ÷ 5 = 1/5 (0.20) | £30 |

Age 28 has not been reached by any ad, so it does not count. Every counted age has 3 or more ads.

**Viable lifespan.** The sum of the survival rates: 0 + 2 × 1/3 + 8 × 1/2 + 3 × 1/3 + 4 × 1/6 + 8 × 1/5 = 2/3 + 4 + 1 + 2/3 + 8/5 = 119 ÷ 15 = 7.93 days. The curve ends at 20%, below 25%, so this is not a lower bound. Had it ended at 25% or above, W would be a lower bound and the monthly figures a ceiling.

**Healthy lifespan.** The peak is 0.50, first reached at age 5. Half of it is 0.25, and the first age after the peak below that is 16 (0.17). 75% of it is 0.375, and the first age below that is 13 (0.33). Nothing falls below 0.125, a quarter of the peak, so the top of the quartile range reads "not reached".

**Days to clear Ramping.** The ads leave Ramping at ages 3, 3, 4, 4 and 5 (ad D never does and is left out), so the median is 4 days.

**Spend per viable ad.** The spend on viable ad-days is 2 × £40 + 8 × £90 + 3 × £60 + 4 × £40 + 8 × £30 = 80 + 720 + 180 + 160 + 240 = £1,380. The viable ad-days are 2 + 2 + 8 × 3 + 3 × 2 + 4 + 8 = 46. So the Spend per viable ad is 1,380 ÷ 46 = £30 a day.

**Spend bar.** The larger of 300 and 3 × £30 = £90, which is 300. Where 3 times the Spend per viable ad is under 300, the bar is 300; here the floor sets it.

**Hit rate.** Ads A to E first spent at least 27 days before the last complete day, so their ages 0 to 27 are all inside the window; ad F is only 19 days old and is left out. These five are the base. They first spent on the same day, so they share the same 28 calendar days, over which every ad in the account spent £16,800 and brought 420 new orders: an account CAC of £40, and a line of 1.2 × £40 = £48. Over those 28 days:

| Ad | 28-day spend | New orders | 28-day CAC | Viable on a day | Counts as |
|---|---|---|---|---|---|
| A | £520 (£370 of it on its viable days) | 12 | £43.33, within £48 | yes | hit |
| B | £1,100 | 30 | £36.67, within £48 | yes | hit |
| C | £900 | 15 | £60.00, over £48 | no | at or above the bar, not a hit |
| D | £200 | 4 | £50.00, over £48 | no | low-spend (under £300) |
| E | £450 | 9 | £50.00, over £48 | no | at or above the bar, not a hit |

A and B were viable on at least one day, spent £300 or more and held a CAC within £48, so both are hits. C and E spent £300 or more but were never viable. D spent £200, below the bar. The Hit rate is 2 ÷ 5 = 0.40, which is 2 in 5. The bar removed no hit, because A and B could not have left Ramping on less than 300 of lifetime spend.

**The CAC check removing a hit.** Say instead that ad A had brought only 8 new orders over its 28 days. Its CAC would be £520 ÷ 8 = £65.00, above the £48 line, so A, which was viable on a day and cleared the bar, is not a hit: it started well and was dear for the rest of its month. Only B is a hit, so the Hit rate is 1 ÷ 5 = 0.20 (it was 2 ÷ 5 = 0.40 with A counted). The partition still ties: 1 hit (B) + 1 low-spend (D) + 3 that spent the bar but are not hits (A, C, E) = 5, the base. The Days viable per hit is 7.933 ÷ 0.20 = 39.67 days (the Viable lifespan unrounded, 119 ÷ 15) and the Viable spend per hit is £30 × 39.67 = £1,190, so the Steady-state number is £18,600 × 0.60 ÷ (0.20 × £1,190) = 11,160 ÷ 238 = 46.89 again: the test moved how the same 7.93 days split, not the 7.93. The rest of this example keeps A's 12 orders, so A is a hit.

**Low-spend rate.** Only D spent under £300: 1 ÷ 5 = 0.20. The partition ties: 2 hits (A, B) + 1 low-spend (D) + 2 that spent the bar but are not hits (C, E) = 5, the base.

**Days viable per hit.** 7.93 ÷ 0.40 = 19.83 days. As a check, 0.40 × 19.83 = 7.93, the Viable lifespan.

**Viable spend per hit.** £30 × 19.83 = £595: the spend one hit carries over its viable life. It gives the Steady-state number again: a month's spend of £18,600 × 0.60 ÷ (0.40 × £595) = 11,160 ÷ 238 = 46.89, the same 46.89 as below.

**The bar removing a hit.** The bar bites where a viable ad spends over 100 a day. Take Birch & Co, whose six ads have the same statuses as Fern & Co's (so the same curve, 7.93 days of Viable lifespan and 46 viable ad-days) but spend far more: A £400, B £13,000 and F £400 on their viable ad-days, £13,800 in all. The Spend per viable ad is 13,800 ÷ 46 = £300 a day, and the Spend bar is the larger of 300 and 3 × £300 = £900, which is 900. Over their 28 days A spent £780 (£260 while Ramping, £400 viable, £120 Fatiguing), B £13,300, C £1,500, D £250 and E £600. Say the same 28 calendar days saw every ad in the account spend £140,000 and bring 1,750 new orders: an account CAC of £80 and a line of £96. B brought 190 new orders, a CAC of £13,300 ÷ 190 = £70, within the line. Only B is viable, at or above £900 and within the CAC line, so it is the one hit. A was viable on 13 days but spent £780, under the bar, so it is low-spend and not a hit, and D and E are low-spend too. C is at or above the bar and was never viable, so it is not a hit.

| Ad | 28-day spend | Viable | Counts as |
|---|---|---|---|
| A | £780 | yes | low-spend (under £900) |
| B | £13,300 | yes | hit |
| C | £1,500 | no | at or above the bar, not a hit |
| D | £250 | no | low-spend |
| E | £600 | no | low-spend |

The partition ties: 1 hit + 3 low-spend + 1 that spent the bar but is not a hit = 5, the base. The Hit rate is 1 ÷ 5 = 0.20 (without the bar it would have been 2 ÷ 5 = 0.40, with A counted) and the Low-spend rate is 3 ÷ 5 = 0.60. The Days viable per hit is 7.933 ÷ 0.20 = 39.67 days (the Viable lifespan unrounded, 119 ÷ 15), and the Viable spend per hit is £300 × 39.67 = £11,900. The bar changed how the same 7.93 days split between the Hit rate and the Days viable per hit, not the 7.93 itself, so the Steady-state number does not move.

**Viable share target.** Say Fern & Co's window, 180 days from a connector or an export, holds 25 complete ISO weeks. The first 6 are left out for warm-up, leaving 19. Their median weekly spend is £4,200, so a week below 25% of it, £1,050, is thin, and one week of £800 is left out: 18 weeks are counted, which is 8 or more. Sorted from lowest to highest, the weekly viable shares have their nearest-rank 90th percentile at rank ⌈0.9 × 18⌉ = 17, and the 17th is 50%. So the P90 is 50% and the Viable share target is the smaller of 100% and 50% × 1.2 = 60%. Across those weeks the median share of spend on ads in their test phase is 30% and on ads that have stopped working 12%, so the larger share of the rest sits in the test phase.

**Viable ad stock.** Say Fern & Co's last complete month, October, cost £18,600 over its 31 days, so current spend is £18,600 a month, £600 a day. The Viable ad stock is 600 × 0.60 ÷ 30 = 12 viable ads live at once. Without the target it would be 600 ÷ 30 = 20, which assumes every pound of spend sits on a viable ad.

**Steady-state number.** 12 × 31 ÷ 7.93 = 46.89, which rounds up to 47 launches a month. It is also 12 × 31 ÷ (0.40 × 19.83), and `ads_for_spend(18,600)`: 47 launches add 47 × 0.40 = 18.8 viable ads a month, and 12 viable ads wear out at 12 × 31 ÷ 19.83 = 18.76 a month.

**The check on today's ads.** At 12, Short is below 9.6 viable ads (80%) and Ahead is above 18 (150%). Fern & Co runs this on Monday 9 November. The data for Sunday 8 November is loaded (its spend and orders are well over half their mean for the 7 days before), so today is Sunday 8 November, the last complete day. 13 ads are live past Ramping: 8 are viable, which includes any that are Improving, and 5 are Worn out now. Fern & Co is Short, by 4 viable ads. Had Sunday's data still been loading, today would be Saturday 7 November, and the run would say so.

**The self-check.** Say Fern & Co launched 105 ads in the last 3 complete months, August to October, which is 35 a month (its Current pipeline) over 92 days. Launching at that rate predicts 105 ÷ 92 × 7.93 = 9.05 viable ads, and today it has 8, a difference of (9.05 − 8) ÷ 8 = 13%, inside 25%. The run says: "Check: launching 35 a month at a hit rate of 40% predicts 9.1 viable ads; you have 8." Had today's count been 5, the difference would be 81%, and the run would add that the curve and today's count disagree by 81%, so the plan is a guide. The self-check does not read the Viable share target.

## The Roadmap, worked

Birch & Co, from above (its Days viable per hit is 39.67 days, its Hit rate 0.20, its Viable spend per hit £11,900 and its Spend per viable ad £300), with a Viable share target of 60%. Its last complete month, October, cost £155,000 over 31 days, so current spend is £155,000 a month, £5,000 a day, and its Viable ad stock is 5,000 × 0.60 ÷ 300 = 10. It has 6 viable ads today, so the gap is 4. It gives a Budget of £224,000 a month, to be reached in February (the default: 3 months on from November), which has 28 days, so the daily Budget is £8,000. It runs this on Monday 9 November, so the Roadmap has three rows, December (31 days), January (31 days) and February (28 days). Daily spend steps by (8,000 − 5,000) ÷ 3 = £1,000 a month, and a month's spend is its daily spend times its days. The Catch-up lifts the target by a share of 4 that shrinks evenly to nothing by February: the target is the stock needed less 4 × (3 − k) ÷ 3. Wearing out each month is the stock × the month's days ÷ 39.67, which is 93 ÷ 119 of it in a 31-day month and 84 ÷ 119 in February. Live-by is the 1st less 4 days (Birch & Co's Days to clear Ramping, as Fern & Co's). The stock needed each month is its daily spend × 0.60 ÷ 300, which is the daily spend ÷ 500.

| Month | Days | Daily spend | Spend | Stock needed | Target |
|---|---|---|---|---|---|
| 1 (Dec) | 31 | £6,000 | £186,000 | 6,000 ÷ 500 = 12 | 12 − 4 × 2 ÷ 3 = 9.33 |
| 2 (Jan) | 31 | £7,000 | £217,000 | 7,000 ÷ 500 = 14 | 14 − 4 × 1 ÷ 3 = 12.67 |
| 3 (Feb) | 28 | £8,000 | £224,000 | 8,000 ÷ 500 = 16 | 16 |

| Month | Start | Wearing out | Launches needed | Ads to launch | Expected to work | End | Live-by |
|---|---|---|---|---|---|---|---|
| Dec | 6.00 | 6 × 93 ÷ 119 = 4.69 | (9.33 − (6.00 − 4.69)) ÷ 0.20 = 40.11 | 41 | 41 × 0.20 = 8.20 | 6.00 − 4.69 + 8.20 = 9.51 | Fri 27 Nov |
| Jan | 9.51 | 7.43 | (12.67 − (9.51 − 7.43)) ÷ 0.20 = 52.94 | 53 | 10.60 | 9.51 − 7.43 + 10.60 = 12.68 | Mon 28 Dec |
| Feb | 12.68 | 12.68 × 84 ÷ 119 = 8.95 | (16 − (12.68 − 8.95)) ÷ 0.20 = 61.36 | 62 | 12.40 | 12.68 − 8.95 + 12.40 = 16.13 | Thu 28 Jan |

Each row ties: start, less Wearing out, plus Expected to work, is the end stock. The figures are carried unrounded and shown here to two decimals so each row can be added up, so a launches-needed figure such as 40.11 rounds up to 41 whole ads. The end stock in February is 16.13, above the 16 that spend then needs, and the Catch-up spread the 4 missing viable ads evenly over the three months: the target sits 2.67, 1.33 and 0 below the stock needed. Set against the page's slider, `ads_for_spend` at each month's spend is 186,000 × 0.60 ÷ (0.20 × 11,900) = 46.89, so 47, then 55 and 57. December sits below it because only 6 viable ads are there to wear out, and February sits above it because the Catch-up is still closing the gap.

**December in three parts.** Month 1's Ads to launch of 41 splits into the three parts. The Viable ad stock needed at current spend is 10 and at December's spend 12, and today's stock is 6, so the gap is 4 and the Budget month is 3 months on (n = 3). Each part is a stock change over the Hit rate of 0.20:

| Part | Stock change | Over 0.20 | Whole ads |
|---|---|---|---|
| To stay level | Wearing out, 4.69 | 23.45 | 24 (rounded up) |
| To catch up | 4 ÷ 3 = 1.33 | 6.67 | 7 |
| To grow | 12 − max(10, 6) = 2 | 10.00 | 10 |
| Total | 8.02 | 40.11 | 41 |

24 + 7 + 10 = 41, which is December's Ads to launch, so the rounding difference is 0. The page reads "About 5 of your working ads will wear out next month; at your hit rate of 20% that takes 24 launches to replace.", "You are 4 working ads short of what your spend needs; closing that over 3 months adds 7 a month.", "Your Budget raises spend next month, which needs 10 more.", and "41 new ads next month". Say instead Birch & Co had 9 viable ads today, so the gap is 1. Wearing out is 9 × 93 ÷ 119 = 7.03, the target is 12 − 1 × 2 ÷ 3 = 11.33, and Ads to launch is ⌈(11.33 − (9 − 7.03)) ÷ 0.20⌉ = ⌈46.83⌉ = 47. The parts are 35.17 to stay level (7.03 ÷ 0.20), 1.67 to catch up ((1 ÷ 3) ÷ 0.20) and 10.00 to grow, which add to 46.83. Rounded, they are 36, 2 and 10, which add to 48, one over 47. The difference of −1 goes to the largest part, To stay level, which reads 35: 35 + 2 + 10 = 47. In the scale-down below, December's Ads to launch is 0, so it has no parts and the page reads "None needed next month".

**What the page shows.** Every ad count on the page is the unrounded figure above rounded up to a whole ad, and the ties above stay checked on the unrounded figures. The Month-by-month plan and the stock behind it read:

| Month | Viable ads needed | Expected to wear out | Ads to launch | Expected to work | Stock at start | Stock at end |
|---|---|---|---|---|---|---|
| Dec | 12 | 5 | 41 | 9 | 6 | 10 |
| Jan | 14 | 8 | 53 | 11 | 10 | 13 |
| Feb | 16 | 9 | 62 | 13 | 13 | 17 |

A row can be one out, because each figure is rounded up on its own, which is why the table carries the line "Figures are rounded up to whole ads, so a row can be one out."

**The stock, month by month.** The first month starts from the 9 live ads past Ramping less the 3 that are Worn out now, which is 6 viable ads. Then, for each month, take off Wearing out, add Expected to work, and the end stock is the next month's start, set against the stock needed:

| Month | Starts at | Wearing out | Expected to work | Ends at | Stock needed |
|---|---|---|---|---|---|
| Dec | 6.00 | 4.69 | 8.20 | 9.51 | 12 |
| Jan | 9.51 | 7.43 | 10.60 | 12.68 | 14 |
| Feb | 12.68 | 8.95 | 12.40 | 16.13 | 16 |

**A flat budget.** Say Birch & Co held £5,000 a day with 10 viable ads today, so there is no gap and the stock needed is 10 every month. December's spend is £155,000 and `ads_for_spend(155,000)` = ⌈155,000 × 0.60 ÷ 2,380⌉ = ⌈39.08⌉ = 40. The Roadmap gets the same by the stock: Wearing out is 10 × 93 ÷ 119 = 7.82, Ads to launch is ⌈(10 − (10 − 7.82)) ÷ 0.20⌉ = ⌈39.08⌉ = 40, Expected to work is 8.0 and the end stock is 10.18. January starts a little above target, because 40 was rounded up from 39.08, so its Ads to launch is ⌈38.87⌉ = 39 against `ads_for_spend` of 40: one under, which is the "give or take one ad". February has 28 days and a spend of £140,000: `ads_for_spend(140,000)` = ⌈35.29⌉ = 36, and the Roadmap gives ⌈35.26⌉ = 36. A shorter month needs fewer ads because the ads wear out for fewer days. Where the Days viable per hit is under the month's days, as Fern & Co's 19.83 is under 31, the whole stock wears out within the month: Fern & Co at a flat £600 a day with 12 viable ads has Wearing out of 12 and Ads to launch of 12 ÷ 0.40 = 30, below its `ads_for_spend` of 47, and the plan says so.

**A scale-down.** Say instead Birch & Co had 40 viable ads today and gives a Budget of £56,000 a month for February, which is £2,000 a day over its 28 days. Daily spend steps down by £1,000 a month. There is no gap, so the target is the stock needed, daily spend ÷ 500.

| Month | Daily spend | Stock needed | Start | Wearing out | Ads to launch | Expected to work | End |
|---|---|---|---|---|---|---|---|
| Dec | £4,000 | 8 | 40.00 | 40 × 93 ÷ 119 = 31.26 | max(0, ⌈(8 − (40.00 − 31.26)) ÷ 0.20⌉) = max(0, ⌈−3.70⌉) = 0 | 0.00 | 40.00 − 31.26 + 0.00 = 8.74 |
| Jan | £3,000 | 6 | 8.74 | 6.83 | ⌈(6 − (8.74 − 6.83)) ÷ 0.20⌉ = ⌈20.45⌉ = 21 | 4.20 | 8.74 − 6.83 + 4.20 = 6.11 |
| Feb | £2,000 | 4 | 6.11 | 4.31 | ⌈(4 − (6.11 − 4.31)) ÷ 0.20⌉ = ⌈11.02⌉ = 12 | 2.40 | 6.11 − 4.31 + 2.40 = 4.20 |

In December the stock left after Wearing out (8.74) is already above the 8 needed, so no ads are launched (the Roadmap reads "None needed") and the surplus wears out on its own. Ads to launch is never negative. In January the stock after Wearing out (1.91) has fallen below the 6 needed, so launches resume.

**The Format split.** Birch & Co's last 8 complete weeks put £60,000 of spend on ads read as video and £140,000 on ads read as image, so the split is 30% video and 70% image. The ad names decided the format of ads carrying £164,000 of that £200,000, so the Name coverage is 82%, above 50%, and the intake proposes the split without asking more. Under 50% (say £90,000 of £200,000, 45%) it would ask the user to confirm the split or give their own. Dividing December's 41 Ads to launch at 30/70 by largest remainder: video is 41 × 0.30 = 12.3 and image is 41 × 0.70 = 28.7. Each format takes its whole ads, 12 and 28, which is 40, so one ad is left. The remainders are 0.3 and 0.7, so the ad goes to image: 12 video and 29 image, which add up to 41. Rounding each share on its own can overshoot: 25 ads at 30/70 would round 7.5 and 17.5 up to 8 and 18, which is 26. Largest remainder never does. The Roadmap's months divide as follows.

| Month | Ads to launch | Video | Image |
|---|---|---|---|
| Dec | 41 | 12.3, whole 12 | 28.7, whole 28, plus the ad left over (the larger remainder): 29 |
| Jan | 53 | 15.9, whole 15, plus the ad left over (the larger remainder): 16 | 37.1, whole 37 |
| Feb | 62 | 18.6, whole 18, plus the ad left over (the larger remainder): 19 | 43.4, whole 43 |

Each row adds up: 12 + 29 = 41, 16 + 37 = 53 and 19 + 43 = 62. Each month's Expected to work is split between video and image in proportion to those launches.

**Ads needed each month.** The Viable share target of 60% and the Spend per viable ad of £30 hold at every spend, and Fern & Co's Hit rate is 0.40 and its Viable spend per hit £595. At the current £18,600 a month, `ads_for_spend(18,600)` = ⌈18,600 × 0.60 ÷ (0.40 × 595)⌉ = ⌈46.89⌉ = 47, the Steady-state number. At half of it, £9,300, it is ⌈23.45⌉ = 24; at 1.5 times, £27,900, ⌈70.34⌉ = 71; at 2 times, £37,200, ⌈93.78⌉ = 94; and at a Budget of £32,550 a month, ⌈82.06⌉ = 83. Fern & Co's Outlier rate is 1 in 6 (16.7%, from the six ads below). At 24 new ads, Expected outliers a month is 24 × 1 ÷ 6 = 4.0, and the chance of none is (5 ÷ 6)^24 = 1.26%, shown as 1.2% in the bars. Its six bars, k = 0 to 4 and 5 or more, are 12.58, 60.38, 138.87, 203.68, 213.87 and 370.62 tenths of a percent. Cut to whole tenths they add to 996, and the 4 left over go to the largest remainders (0.87, 0.87, 0.68 and 0.62), so the bars read 1.2%, 6.0%, 13.9%, 20.4%, 21.4% and 37.1%, which add to 100.0%. At 47 new ads, Expected outliers a month is 7.8 and the chance of none is 0.0% (0.02% unrounded); the bars read 0.0%, 0.2%, 0.8%, 2.5%, 5.4% and 91.1%. Set against what the account launches, N0 is 47 and the Current pipeline is 35 a month, so the answer reads "At your current spend you need 47 new ads a month. Over the last 3 months you launched 35 a month." 35 is more than 10% below 47 (within 10% is 43 to 51), so the verdict is "Make about 12 more a month." At the Budget a second line reads "At your Budget of £32,550 a month you need 83 new ads a month." The Outlier rate is rarely that high: at 4%, the same 47 new ads give 1.9 Expected outliers a month and a 14.7% chance of none.

**Lever best.** Say Fern & Co's history is longer than the six ads above, as it is for the Viable share target, and gives these bests. Every Hit rate and Days viable per hit below is worked at Fern & Co's Spend bar of £300.

- **Launches (B).** The highest average over any 3 complete calendar months in a row is 114 Launched ads over 3 months, 38 a month. B is 38, against the 35 a month of the last 3 months.
- **Hit rate (h_best).** 7 launch months count: each has 10 or more Launched ads, ends at least 28 days before today and starts after the window's first 6 weeks. Their Hit rates, lowest to highest, are 30%, 35%, 40%, 40%, 45%, 55% and 55%. The nearest rank for the 90th percentile is ⌈0.9 × 7⌉ = 7, the 55%. h_best is 55%, against 40% now.
- **Days viable per hit (D_best).** 3 launch quarters count: each ends at least 60 days before today and has 10 or more hits. Each is worked from its own Launched ads: 7.0 ÷ 0.40 = 17.5, 7.6 ÷ 0.40 = 19.0 and 10.8 ÷ 0.45 = 24.0 days. D_best is the highest, 24, against 19.83 now.

The run would say it counted 7 months and 3 quarters. With 3 months, or 1 quarter, that Lever would have no best.

**The Limiting factor.** Fern & Co has L = 12, today's viable ads S(0) = 8, P = 35, N0 = 47 and B = 38, so 1.2 × B = 45.6. Down the rules in order:

1. On track needs S(0) of at least 0.8 × 12 = 9.6. It has 8, so no.
2. Volume needs N0 within 45.6. It is 47, so no.
3. Both needs N1 within 45.6. N1 = ⌈12 × 31 ÷ (0.55 × 19.83)⌉ = ⌈372 ÷ 10.91⌉ = ⌈34.10⌉ = 35, so yes.

The Limiting factor is **Both**, and it ties: N1 = 35 is within 1.2 × B = 45.6, which is below N0 = 47. To hit: a hit rate of 55% and 35 launches a month. At today's 40% hit rate Fern & Co needs 47 launches a month, more than 1.2 times its best pace of 38, so volume alone cannot close the gap; at its best hit rate of 55% it needs 35, which it already launches. Had B been 28, so that 1.2 × B = 33.6, neither Volume nor Both would hold (N1 = 35). The rooms would decide: room_h = 0.55 ÷ 0.40 = 1.38 and room_D = 24 ÷ 19.83 = 1.21, so Finding hits, with a Hit rate needed of 372 ÷ (19.83 × 28) = 0.670, which is 67% and "beyond your best", the 55%. With no best on either Lever, both rooms are 0, the factor is Finding hits, and the run says there is not enough history to compare.

**On the table.** Over the last 90 complete days Fern & Co spent £600 a day, £54,000, with the Viable share target at 60%. Each group's spend, customers and CAC, and then the same spend moved to the target (viable spend at 60% of £54,000 = £32,400, the other three groups scaled by (£54,000 − £32,400) ÷ (£54,000 − £27,000) = £21,600 ÷ £27,000 = 0.8):

| Group | Spend | Customers | CAC | Spend at target | Customers at target |
|---|---|---|---|---|---|
| Viable | £27,000 (50%) | 900 | £30 | £32,400 (60%) | 32,400 ÷ 30 = 1,080 |
| Test phase | £16,200 (30%) | 270 | £60 | £12,960 | 12,960 ÷ 60 = 216 |
| Worn out | £8,100 (15%) | 90 | £90 | £6,480 | 6,480 ÷ 90 = 72 |
| Other | £2,700 (5%) | 30 | £90 | £2,160 | 2,160 ÷ 90 = 24 |
| Total | £54,000 | 1,290 | £41.86 | £54,000 | 1,392 |

Today's viable share v0 is 50%, under the 60% target, so there is something on the table. Per week (÷ 90 × 7), that is about 100 new customers today and 108 at target: 8 more a week. The blended CAC moves from £54,000 ÷ 1,290 = £41.86 to £54,000 ÷ 1,392 = £38.79, a change of −7.3%. The biggest waste is the test phase, with 30% of spend against 15% for worn out. Had v0 been 60% or more, there would be nothing on the table. Had the worn out group spent with no customers, it would take the CAC of the next-worse group, other, £90.

## Creative score bands

Each measure is placed on three fixed anchors, the same for every account: Poor, Average and Good. Where less is better (Top-5 concentration and Low-spend rate), Good is below Poor.

| Measure | Poor | Average | Good |
|---|---|---|---|
| Evergreen share | 10% | 30% | 50% |
| Spend degradation | −80% | −55% | −30% |
| Viable after week 1 | 15% | 35% | 60% |
| Top-5 concentration | 70% | 45% | 20% |
| Outlier rate | 1% | 3% | 6% |
| Hit rate | 2% | 5% | 10% |
| Low-spend rate | 95% | 85% | 70% |

**The scorer.** A measure x with anchors Poor P, Average A and Good G scores 0 at P, 50 at A and 100 at G, in a straight line between each pair of anchors, whichever way the anchors run. On the Good side of Average, where (x − A) ÷ (G − A) is 0 or more, the sub-score is 50 + 50 × (x − A) ÷ (G − A); on the Poor side it is 50 × (x − P) ÷ (A − P). It is then held between 0 and 100, so a measure beyond Poor scores 0 and one beyond Good scores 100. The sub-scores are carried unrounded. The Creative score is the plain mean of the seven sub-scores, rounded to a whole number. A measure that cannot be worked leaves the score unshown. Top-10 turnover is shown beside the score and never scored. The score is a read-out: the number of new ads comes from the Hit rate and Viable spend per hit themselves, never from the score.

For example, a Hit rate of 7% sits between Average (5%) and Good (10%), two fifths of the way, so it scores 50 + 50 × 2 ÷ 5 = 70.

## The Creative score, worked

Fern & Co's six ads give four of the measures from their own spend; its longer history, as for the Viable share target, gives three.

**Spend degradation.** Ads A to E are the base of the Hit rate. Each ad's spend over ages 0 to 6 and over ages 7 to 27, in whole pounds:

| Ad | Ages 0 to 6 | Ages 7 to 27 | Total | Late ÷ (3 × early) − 1 |
|---|---|---|---|---|
| A | £130 | £390 | £520 | 390 ÷ 390 − 1 = 0.0% |
| B | £430 | £670 | £1,100 | 670 ÷ 1,290 − 1 = −48.1% |
| C | £300 | £600 | £900 | 600 ÷ 900 − 1 = −33.3% |
| D | £80 | £120 | £200 | 120 ÷ 240 − 1 = −50.0% |
| E | £270 | £180 | £450 | 180 ÷ 810 − 1 = −77.8% |

Sorted, the five read −77.8%, −50.0%, −48.1%, −33.3% and 0.0%, so the median is the middle one, −48.1% (B's −0.4806).

**Outlier rate.** The six Launched ads' spend over the window is A £520, B £1,100, C £900, D £200, E £450 and F £480: £3,650 in all. The mean is 3,650 ÷ 6 = £608.33 and the median is (480 + 520) ÷ 2 = £500. The squared distances from the mean add to 542,883, so the population variance is 542,883 ÷ 6 = 90,481 and the standard deviation is £300.80. The line is 608.33 + 300.80 = £909.13, and the maximum is £1,100. Only B is at or above it: C, at £900, falls £9 short. The Outlier rate is 1 ÷ 6 = 16.7%, and B's £1,100 is 1,100 ÷ 3,650 = 30.1% of the Launched ads' spend. B spent £330 over ages 0 to 2, £40 over ages 3 and 4, £30 a day over ages 5 to 15, £40 a day over ages 16 to 19 and £30 a day from age 20, so its cumulative spend is £700 by age 15, £860 by age 19, £890 at age 20 and £920 at age 21, which is the first day over £909.13. With one Outlier, the 25th percentile, median and 75th percentile of the days to the line all read 21.

**Hit rate and Low-spend rate.** 0.40 and 0.20, from the six ads above.

**From the longer history.** Over its last 30 days Fern & Co spent £18,000. £2,700 sat on ads aged 30 days or more, so the Evergreen share is 15%. The 5 ads that spent most took £7,200, so the Top-5 concentration is 40%. Of the 20 hits that have reached age 28 (ads A to E have not, as their last day is age 27), 5 were viable on their day at age 28, so Viable after week 1 is 25%.

| Measure | Value | Poor | Average | Good | Sub-score |
|---|---|---|---|---|---|
| Evergreen share | 15.0% | 10% | 30% | 50% | between Poor and Average: 50 × (15 − 10) ÷ (30 − 10) = 12.5 |
| Spend degradation | −48.1% | −80% | −55% | −30% | between Average and Good: 50 + 50 × (−48.06 + 55) ÷ 25 = 63.9 |
| Viable after week 1 | 25.0% | 15% | 35% | 60% | between Poor and Average: 50 × (25 − 15) ÷ (35 − 15) = 25 |
| Top-5 concentration | 40.0% | 70% | 45% | 20% | lower is better, between Average and Good: 50 + 50 × (45 − 40) ÷ (45 − 20) = 60 |
| Outlier rate | 16.7% | 1% | 3% | 6% | beyond Good, capped: 100 |
| Hit rate | 40.0% | 2% | 5% | 10% | beyond Good, capped: 100 |
| Low-spend rate | 20.0% | 95% | 85% | 70% | beyond Good, capped: 100 |

The sub-scores add to 12.5 + 63.9 + 25 + 60 + 100 + 100 + 100 = 461.4 (461.38 unrounded), and 461.38 ÷ 7 = 65.91, so the Creative score is 66.

The bars' colours, from the unrounded sub-scores: Evergreen share (12.5) and Viable after week 1 (25) are red; Spend degradation (63.9) and Top-5 concentration (60) are amber; Outlier rate, Hit rate and Low-spend rate (100 each) are green. The lowest sub-score is Evergreen share's, so the page reads "Weakest point: Evergreen share, 15.0% against 50.0% for Good. Too little of your spend sits on ads that have lasted, so let your working ads keep spending: pause only ads that have stopped working (run `/audit-ads` to see which)."

**Top-10 turnover.** Fern & Co's 180-day window holds at most 1 complete quarter, so Top-10 turnover is not shown. Had a Growth Brain given a year holding the complete quarters Q2 and Q3, the page would read, for Q2, 3 of its 10 top-spending ads first spent in Q2 and took 15% of the quarter's spend, and for Q3, 5 of 10, 28%. Neither figure enters the mean: the score stays 66.

## Spending power, worked

Say Fern & Co's year of history holds 8 complete months. Its last 3, August to October, spent £19,200, £18,000 and £18,600, £55,800 in all, on 1,860 new orders, a CAC of £30.00. The 3 before, May to July, spent £15,000, £15,600 and £15,000, £45,600, on 1,368 new orders, a CAC of £33.33. Spend changed by 55,800 ÷ 45,600 − 1 = +22.4%, and CAC by 30.00 ÷ 33.33 − 1 = −10.0%. With 5 complete months (a 180-day window), the months are charted and neither change is shown.
