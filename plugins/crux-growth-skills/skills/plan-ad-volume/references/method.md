The number of new ads a week is worked out from how long your own ads stay good. Every Meta ad is judged on every day of the window read, and the ads you launched in that time show how long a new one lasts. The window is the last 365 complete days from a Growth Brain, and the last 180 from a Meta connector or an Ads Manager export. Here is how.

**1. Judging each ad each day.** Each ad is judged by its CAC, which is its spend divided by the new customers it brought. With a Growth Brain these are your own first-time orders; otherwise they are the purchases Meta reports for the ad, which counts every purchase Meta claims. Each day's CAC is adjusted for the day of the week (some weekdays are always dearer) before any comparison. The current window is the 5 days to that day. An ad's Peak CAC is its best (lowest) 7-day CAC in the 42 days to that day. The Account blend is the CAC of all live ads together over the same 5 days; ads in your retargeting and existing-customer campaigns are judged against the blend of those campaigns alone, and every other ad against the rest. Campaigns bought for awareness, reach or video views, or for leads, sign-ups, giveaways or competitions, are left out of the whole plan, their spend included: they are not bought to win customers, so CAC is the wrong measure for them.

**2. Ramping.** An ad needs all three of: 300 spent in its life, at least 2 days old, and 30 a day on average over the 5-day window (all in the account's currency). Below any of them it is Ramping, with no verdict.

**3. One status per ad per day, the first that fits:**

1. **Low efficiency**: 5-day CAC is 20% or more above its blend.
2. **Fatigued**: 5-day CAC is 50% or more above the Peak CAC on each of the last 3 days, and not improving.
3. **Fatiguing**: 20% or more above the Peak CAC on each of the last 2 days, and not improving.
4. **Improving**: 20% or more above the Peak CAC, but CAC has fallen over the last 3 days.
5. **Winner**: 5-day CAC is 20% or more below its blend.
6. **Healthy**: none of the above.

**4. Viable.** An ad is viable on a day when its status is Healthy or Winner. Improving, Fatiguing, Fatigued and Low efficiency are not viable, and nor is Ramping.

**5. Launched ads and age.** A Launched ad is one whose first day of spend falls after the first day of the window, so its age is known. Only Launched ads feed the curve below. An ad's age is the number of days since its first day of spend: the first day is age 0.

**6. The survival curve.** At each age, the denominator is every Launched ad that has reached that age inside the window: its first spend is at least that many days before the last complete day. The numerator is those of them that are viable on their day at that age. A day with no spend (the ad is Inactive), a day in Ramping, a day with no status, and any status that is not viable all count as not viable. So an ad that stops spending, or never leaves Ramping, stays in the count as not viable, and does not drop out. An age counts only when 3 or more ads have reached it, and the rates are used as they come, not smoothed.

**7. Lifespans and the Hit rate.** The Viable lifespan is the sum of the survival rates over the ages that count: the average number of days one Launched ad is viable, the ones that never work included. Where the curve is still at 25% or above when the 3-ad floor cuts it off, it is a lower bound, and the Steady-state number and the Ads to launch in the Roadmap, which divide by it, are a ceiling. The Hit rate is, of the Launched ads whose first spend is at least 27 days before the last complete day (ages 0 to 27 all inside the window), the share that were viable on at least one of those 28 days. The Days viable per hit is the Viable lifespan divided by the Hit rate: how long an ad that works stays viable. So the Hit rate times the Days viable per hit is the Viable lifespan exactly. The Healthy lifespan reads from the curve's peak, its highest rate (the first age that holds it): it is the first age after the peak at which the rate is below half the peak rate, with a quartile range from the first age after the peak below 75% of the peak rate to the first below 25% of it. Either end reads "not reached" where the curve never gets there. The Days to clear Ramping is the median, over Launched ads that leave Ramping, of the age at which an ad first stops being Ramping.

**8. Spend per viable ad.** Add up the spend on every viable ad-day of the Launched ads, at the ages that count, and divide by the number of those viable ad-days: the typical daily spend on one viable ad.

**9. The viable share.** No account puts every pound of spend on a viable ad: some always sits on ads in their test phase and on ads that have stopped working. So the plan aims at a share it can reach. A week's viable share is its spend on viable ads over its spend, counting every ad, not only the ones you launched in the window, and leaving out the awareness and lead campaigns. The weeks are the complete ISO weeks of the window, Monday to Sunday. The first 6 are left out, because the weekday index, an ad's life spend and its Peak CAC all warm up from the window's first day, so those weeks lean towards Ramping. Of the weeks that remain, any whose spend is below 25% of their median weekly spend is left out too, because a thin week gives a noisy share. The weeks left are the weeks counted. With fewer than 8, the plan uses those there are and says how many; with none, it stops, because the weekly spend is too uneven to read a viable share. The 90th percentile (P90) of the weekly viable shares counted is the share at rank 0.9 times their number, rounded up, once they are sorted from lowest to highest: the best weeks your account has sustained. The Viable share target is the smaller of 100% and the P90 times 1.2: your own best, plus 20% for running creative production well. It rests on your account's history, not on a benchmark, so another account reads a different target. The page also gives the median weekly share of spend on ads still in their test phase (Ramping) and on ads that have stopped working (Fatiguing, Fatigued and Low efficiency), over the same weeks, to show where the rest of the spend goes.

**10. Viable ad stock.** The Viable ad stock is the number of viable ads your spend needs live at once: your current spend a day times the Viable share target, divided by the Spend per viable ad. At a target of 100% that is every pound on a viable ad; a lower target needs fewer viable ads, because some spend is always on ads that are not viable. Current spend is the last complete week's spend (Monday to Sunday), outside the awareness and lead campaigns, divided by 7. The Viable share target holds at every stock in the plan: at current spend, in each week of the Roadmap and on every rung of the Budget ladder.

**11. Ads a week.** Hold the Viable ad stock, and the viable ads that stop being viable have to be replaced, but a launch adds the Hit rate in viable ads, not one. The Steady-state number is the Viable ad stock times 7, divided by the Viable lifespan, rounded up. That is the same as the Viable ad stock times 7, divided by the Hit rate times the Days viable per hit: the viable ads that wear out in a week, over the viable ads a launch adds. The Current pipeline is the Launched ads a week, averaged over the last 8 complete weeks.

**12. The check on today's ads.** Today means the last complete day, and the check reads viable ads only. Short: viable ads below 80% of the Viable ad stock. About right: from 80% to 150% of it. Ahead: viable ads above 150% of it. Worn out now: live ads past Ramping that are Fatiguing, Fatigued or Low efficiency; they take spend but are not stock.

**13. The Budget and the ramp.** A Budget is a monthly figure, so the daily Budget is the month times 12, divided by 365. Your spend does not jump to it. It steps in equal amounts week by week, from your current spend to the daily Budget, and lands in the Budget week you name, or the week 4 weeks from now if you name none. It then holds there for 4 more weeks. The Roadmap starts next week and has one row for each of those weeks. A Budget below your current spend steps down the same way. With no Budget, current spend is held flat for 4 weeks.

**14. The stock, week by week.** The Viable ad stock a week needs is that week's daily spend times the Viable share target, divided by the Spend per viable ad. The plan starts from the viable ads you have live on the last complete day, today's stock. The gap is the Viable ad stock at current spend less today's stock. Each week some of the stock stops being viable: Wearing out is the stock at the start of the week times 7, divided by the Days viable per hit, and never more than the whole stock. A gap above zero is closed by the Catch-up: each week's target is the stock needed less a share of the gap that shrinks evenly to nothing at the Budget week (week 4 with no Budget), so by then the target is the stock needed in full. In week w of B weeks to the Budget week, the target is the stock needed less the gap times (B less w) over B; after the Budget week, and where there is no gap, it is the stock needed. The Ads to launch are whole ads: the target, less the stock left after Wearing out, divided by the Hit rate, rounded up and never below zero. Expected to work is the Ads to launch times the Hit rate, left unrounded: the viable ads those launches are likely to add. The stock at the end of the week is the stock at its start, less Wearing out, plus Expected to work. At a flat budget with no gap, the Ads to launch each week are the Steady-state number, give or take one ad for rounding. When spend steps down, the stock needed can fall faster than ads wear out: a week may then need no launches, and the stock above what spend needs wears out on its own. Where the Days viable per hit is under 7 days, the whole stock wears out within a week, so the Ads to launch are the target over the Hit rate, which sits below the Steady-state number.

**15. Live-by.** A new ad needs the Days to clear Ramping before it earns a verdict, so each week's new ads should be live that many days before the week's Monday. That date is the Live-by.

**16. The Budget ladder.** The Steady-state number, worked out as in item 11, at your current spend, at 25% more, at 50% more and at your Budget. It assumes the Spend per viable ad and the Viable share target hold as spend grows. If the extra spend goes into each ad rather than into more ads, fewer new ads are needed.

The same sum is also run at a better Hit rate: today's, 20% higher (the Hit rate times 1.2) and 30% higher (times 1.3). Each row is the Viable ad stock times 7, divided by that Hit rate times the Days viable per hit, rounded up, and the Days viable per hit is held fixed, so only the share of launches that work moves. The change against today is relative, on the whole launches shown. With a Budget, each row is worked again at the Budget's stock. The point is how many launches a week a better hit rate saves, which better briefs and testing are what raise.

**17. Format.** Each ad is read as video or image from its ad name alone, never its ad set or campaign name. The name is split into words at every character that is not a letter or a digit, and each word is compared with these, ignoring case. Video: video, vid, reel. Image: image, img, static, still, carousel. A name with words of one kind only decides the Format. A name with neither kind, or both, leaves the ad video if it had any 3-second video plays in the rows read, and image otherwise. The Name coverage is the share of those same Launched ads (first spend in the last 8 complete weeks) whose name decided the Format.

**18. The Format split.** The proposed split is the video and image shares of the Launched ads whose first spend fell in the last 8 complete weeks, in whole percentages that sum to 100. You can keep it, give your own (a video percentage, with image the rest) or turn it off. Each week's new ads are divided by it in whole ads, by largest remainder: each format first takes the whole ads of its share, and the ad left over, if there is one, goes to the format with the larger remainder (on a tie, the larger share; on equal shares, video). The video and image ads always add up to the week's new ads. With no split, only the total is shown.

**19. What the figures describe.** Every figure comes from your ads' own history in the window read, so it describes how your ads have behaved, not how ads behave in general. That holds for the Viable share target too: it is your own best weeks, not an industry figure. An account with few Launched ads gives a rough curve, and one with fewer than 20 launched at least 28 days ago is not read at all: it does not yet launch enough ads to read a hit rate. Nor is one in which none of those ads became viable, because there is then no Hit rate to plan from. Nor is one whose weekly spend is too uneven, with no week left to read a viable share from.

**20. The self-check.** Every run tests its own curve against the account. The Viable lifespan is the viable ad-days one launch delivers, so the Current pipeline times the Viable lifespan, divided by 7, is the number of viable ads that launching at that rate should leave live. That is the predicted viable ads, and it is set against today's viable ads. The check passes when the two are within 25% of each other, taken relative to today's viable ads. The run states the check either way, and where it fails it says the curve and today's count disagree, so the plan is a guide. A failed check does not stop the run.

## Worked example

An invented brand, Fern & Co, with six Launched ads. Each ad is one line of its status on each day of its life, from age 0 to the last complete day: R is Ramping, V is viable (Healthy or Winner), X is a spending day that is not viable (Fatiguing, Fatigued, Improving or Low efficiency), a dot is a day with no spend, and a dash is an age the ad has not reached yet. The last complete day is 27 days after the first spend of ads A to E, and 19 days after the first spend of ad F.

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

**Viable lifespan.** The sum of the survival rates: 0 + 2 × 1/3 + 8 × 1/2 + 3 × 1/3 + 4 × 1/6 + 8 × 1/5 = 2/3 + 4 + 1 + 2/3 + 8/5 = 119 ÷ 15 = 7.93 days. The curve ends at 20%, below 25%, so this is not a lower bound. Had it ended at 25% or above, W would be a lower bound and the weekly figures a ceiling.

**Hit rate.** Ads A to E first spent at least 27 days before the last complete day, so their ages 0 to 27 are all inside the window; ad F is only 19 days old and is left out. A and B were viable on at least one of those 28 days, and C, D and E were not: the Hit rate is 2 ÷ 5 = 0.40, which is 2 in 5.

**Days viable per hit.** 7.93 ÷ 0.40 = 19.83 days. As a check, 0.40 × 19.83 = 7.93, the Viable lifespan.

**Healthy lifespan.** The peak is 0.50, first reached at age 5. Half of it is 0.25, and the first age after the peak below that is 16 (0.17). 75% of it is 0.375, and the first age below that is 13 (0.33). Nothing falls below 0.125, a quarter of the peak, so the top of the quartile range reads "not reached".

**Days to clear Ramping.** The ads leave Ramping at ages 3, 3, 4, 4 and 5 (ad D never does and is left out), so the median is 4 days.

**Spend per viable ad.** The spend on viable ad-days is 2 × £40 + 8 × £90 + 3 × £60 + 4 × £40 + 8 × £30 = 80 + 720 + 180 + 160 + 240 = £1,380. The viable ad-days are 2 + 2 + 8 × 3 + 3 × 2 + 4 + 8 = 46. So the Spend per viable ad is 1,380 ÷ 46 = £30 a day.

**Viable share target.** Say Fern & Co's window, 180 days from a connector or an export, holds 25 complete ISO weeks. The first 6 are left out for warm-up, leaving 19. Their median weekly spend is £4,200, so a week below 25% of it, £1,050, is thin, and one week of £800 is left out: 18 weeks are counted, which is 8 or more. Sorted from lowest to highest, the weekly viable shares have their nearest-rank 90th percentile at rank ⌈0.9 × 18⌉ = 17, and the 17th is 50%. So the P90 is 50% and the Viable share target is the smaller of 100% and 50% × 1.2 = 60%. Across those weeks the median share of spend on ads in their test phase is 30% and on ads that have stopped working 12%, so the larger share of the rest sits in the test phase.

**Viable ad stock.** Say Fern & Co's last complete week cost £4,200, so current spend is £600 a day. The Viable ad stock is 600 × 0.60 ÷ 30 = 12 viable ads live at once. Without the target it would be 600 ÷ 30 = 20, which assumes every pound of spend sits on a viable ad.

**Steady-state number.** 12 × 7 ÷ 7.93 = 10.59, which rounds up to 11 launches a week. It is also 12 × 7 ÷ (0.40 × 19.83): 11 launches add 11 × 0.40 = 4.4 viable ads a week, and 12 viable ads wear out at 12 × 7 ÷ 19.83 = 4.24 a week.

**The check on today's ads.** At 12, Short is below 9.6 viable ads (80%) and Ahead is above 18 (150%). Today, Monday 9 November, 16 ads are live past Ramping: 8 are viable, 5 are Worn out now and 3 are Improving. Fern & Co is Short, by 4 viable ads.

**The self-check.** Say Fern & Co launched 8 a week over the last 8 weeks. Launching 8 a week predicts 8 × 7.93 ÷ 7 = 9.1 viable ads, and today it has 8, a difference of (9.07 − 8) ÷ 8 = 13%, inside 25%. The run says: "Check: launching 8 a week at a hit rate of 40% predicts 9.1 viable ads; you have 8." Had today's count been 5, the difference would be 81%, and the run would add that the curve and today's count disagree by 81%, so the plan is a guide. The self-check does not read the Viable share target.

## The Roadmap, worked

Fern & Co gives a Budget of £36,500 a month, which is 36,500 × 12 ÷ 365 = £1,200 a day, to be reached in the week of Monday 7 December, 4 weeks from now. Daily spend steps by (1,200 − 600) ÷ 4 = £150 a week. The gap is 12 − 8 = 4 viable ads, so the Catch-up lifts the target by a share of 4 that shrinks evenly to nothing by week 4: the target is the stock needed less 4 × (4 − w) ÷ 4. Wearing out each week is the stock × 7 ÷ 19.83, which is 6/17 of it. Live-by is the Monday less 4 days. The stock needed each week is that week's daily spend × 0.60 ÷ 30, which is the daily spend ÷ 50.

| Week (Monday) | Daily spend | Stock needed | Target |
|---|---|---|---|
| 1 (16 Nov) | £750 | 750 ÷ 50 = 15 | 15 − 4 × 3 ÷ 4 = 12 |
| 2 (23 Nov) | £900 | 900 ÷ 50 = 18 | 18 − 4 × 2 ÷ 4 = 16 |
| 3 (30 Nov) | £1,050 | 1,050 ÷ 50 = 21 | 21 − 4 × 1 ÷ 4 = 20 |
| 4 (7 Dec) | £1,200 | 1,200 ÷ 50 = 24 | 24 |

| Week | Start | Wearing out | Launches needed | Ads to launch | Expected to work | End | Live-by |
|---|---|---|---|---|---|---|---|
| 1 | 8.00 | 8 × 6 ÷ 17 = 2.82 | (12 − (8.00 − 2.82)) ÷ 0.40 = 17.06 | 18 | 18 × 0.40 = 7.20 | 8.00 − 2.82 + 7.20 = 12.38 | Thu 12 Nov |
| 2 | 12.38 | 4.37 | (16 − (12.38 − 4.37)) ÷ 0.40 = 19.98 | 20 | 8.00 | 12.38 − 4.37 + 8.00 = 16.01 | Thu 19 Nov |
| 3 | 16.01 | 5.65 | (20 − (16.01 − 5.65)) ÷ 0.40 = 24.10 | 25 | 10.00 | 16.01 − 5.65 + 10.00 = 20.36 | Thu 26 Nov |
| 4 | 20.36 | 7.19 | (24 − (20.36 − 7.19)) ÷ 0.40 = 27.07 | 28 | 11.20 | 20.36 − 7.19 + 11.20 = 24.37 | Thu 3 Dec |

Each row ties: start, less Wearing out, plus Expected to work, is the end stock. The figures are carried unrounded and shown here to two decimals so each row can be added up, so a launches-needed figure such as 27.07 rounds up to 28 whole ads (the page shows one decimal). The end stock in week 4 is 24.37, above the 24 that spend then needs, and the Catch-up spread the 4 missing viable ads evenly over weeks 1 to 4: the target sits 3, 2, 1 and 0 below the stock needed. The Roadmap goes on for 4 more weeks at £1,200 a day.

**The Waterfall of the ramp.** The start bar is the 16 live ads past Ramping, drawn already dropped by the 8 that are Worn out now (5) or Improving (3), down to 8. Then, for each week, a down bar for Wearing out, an up bar for Expected to work, and the end stock, with the stock needed marked as a line:

| Week | Starts at | Down | Up | Ends at | Line at |
|---|---|---|---|---|---|
| 1 | 8.00 | 2.82 | 7.20 | 12.38 | 15 |
| 2 | 12.38 | 4.37 | 8.00 | 16.01 | 18 |
| 3 | 16.01 | 5.65 | 10.00 | 20.36 | 21 |
| 4 | 20.36 | 7.19 | 11.20 | 24.37 | 24 |

**A flat budget.** Say Fern & Co held £600 a day with 12 viable ads today, so there is no gap. The stock needed is 12 every week. Week 1: Wearing out is 12 × 6 ÷ 17 = 4.24, Ads to launch is ⌈(12 − (12 − 4.24)) ÷ 0.40⌉ = ⌈10.59⌉ = 11, Expected to work is 4.4, and the end stock is 12.16. Week 2 is ⌈10.32⌉ = 11 again. Every week is the Steady-state number, 11. With today's 8 viable ads there is a gap, and the Catch-up raises the early weeks above it for 4 weeks.

**A scale-down.** Say instead Fern & Co had 16 viable ads today, within range of the 12 its spend needs, and gives a Budget of £3,650 a month, which is £120 a day, reached in week 3. Daily spend steps down by £160 a week. There is no gap, so the target is the stock needed, daily spend ÷ 50.

| Week | Daily spend | Stock needed | Start | Wearing out | Ads to launch | Expected to work | End |
|---|---|---|---|---|---|---|---|
| 1 | £440 | 8.8 | 16.0 | 5.6 | max(0, ⌈(8.8 − (16.0 − 5.6)) ÷ 0.40⌉) = 0 | 0.0 | 16.0 − 5.6 + 0.0 = 10.4 |
| 2 | £280 | 5.6 | 10.4 | 3.7 | 0 | 0.0 | 10.4 − 3.7 + 0.0 = 6.7 |
| 3 | £120 | 2.4 | 6.7 | 2.4 | 0 | 0.0 | 6.7 − 2.4 + 0.0 = 4.3 |
| 4 | £120 | 2.4 | 4.3 | 1.5 | 0 | 0.0 | 4.3 − 1.5 + 0.0 = 2.8 |
| 5 | £120 | 2.4 | 2.8 | 1.0 | ⌈(2.4 − (2.8 − 1.0)) ÷ 0.40⌉ = ⌈1.5⌉ = 2 | 0.8 | 2.8 − 1.0 + 0.8 = 2.6 |

For four weeks the stock left after Wearing out is already above the stock needed, so no ads are launched (the Roadmap reads "None needed") and the surplus wears out on its own. Ads to launch is never negative. In week 5 the stock after Wearing out (1.8) has fallen below the 2.4 needed, so launches resume.

**The Format split.** Fern & Co's last 8 weeks were 30% video and 70% image, and the ad names gave the format of 82% of those ads. Dividing 18 Ads to launch at 30/70 by largest remainder: video is 18 × 0.30 = 5.4 and image is 18 × 0.70 = 12.6. Each format takes its whole ads, 5 and 12, which is 17, so one ad is left. The remainders are 0.4 and 0.6, so the ad goes to image: 5 video and 13 image, which add up to 18. Rounding each share on its own can overshoot: 25 ads at 30/70 would round 7.5 and 17.5 up to 8 and 18, which is 26. Largest remainder never does. The ramp's weeks divide as follows.

| Week | Ads to launch | Video | Image |
|---|---|---|---|
| 1 | 18 | 5.4, whole 5 | 12.6, whole 12, plus the ad left over (the larger remainder): 13 |
| 2 | 20 | 6 | 14 |
| 3 | 25 | 7.5, whole 7 | 17.5, whole 17, plus the ad left over (equal remainders, the larger share): 18 |
| 4 | 28 | 8.4, whole 8 | 19.6, whole 19, plus the ad left over (the larger remainder): 20 |

Each row adds up: 5 + 13 = 18, 6 + 14 = 20, 7 + 18 = 25 and 8 + 20 = 28. In the Waterfall, each week's up bar is Expected to work, split between video and image in proportion to those launches.

**The Budget ladder.** The Viable share target of 60% holds on every rung. The Steady-state number at £600 a day is 11. At 25% more, £750 a day, the stock needed is 15 and the number is ⌈15 × 7 ÷ 7.93⌉ = ⌈13.24⌉ = 14. At 50% more, £900 a day, it is 18 and ⌈15.88⌉ = 16. At the £1,200 Budget it is 24 and ⌈21.18⌉ = 22.

**The Hit-rate scenarios.** Fern & Co's Hit rate is 0.40 and its Days viable per hit is 19.83, fixed, with 12 viable ads needed at £600 a day. At 20% higher the Hit rate is 0.48 (48%) and the Viable lifespan 0.48 × 19.83 = 9.52, so the launches a week to keep up are ⌈12 × 7 ÷ 9.52⌉ = ⌈8.82⌉ = 9, against 11 today: −18%, and 2 launches a week saved. At 30% higher the Hit rate is 0.52 (52%) and the Viable lifespan 10.31, so ⌈8.15⌉ = 9: also −18% and 2 saved, since launches are whole ads. At the £1,200 Budget, with 24 viable ads needed, the three rows are 22, ⌈168 ÷ 9.52⌉ = 18 and ⌈168 ÷ 10.31⌉ = 17.
