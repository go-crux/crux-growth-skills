The number of new ads a week is worked out from how long your own ads stay good. Every Meta ad is judged on every day of the window read, and the ads you launched in that time show how long a new one lasts. The window is the last 365 complete days from a Growth Brain, and the last 180 from a Meta connector or an Ads Manager export. Here is how.

**1. Judging each ad each day.** Each ad is judged by its CAC, which is its spend divided by the new customers it brought. With a Growth Brain these are your own first-time orders; otherwise they are the purchases Meta reports for the ad, which counts every purchase Meta claims. Each day's CAC is adjusted for the day of the week (some weekdays are always dearer) before any comparison. The current window is the 5 days to that day. An ad's Peak CAC is its best (lowest) 7-day CAC in the 42 days to that day. The Account blend is the CAC of all live ads together over the same 5 days; ads in your retargeting and existing-customer campaigns are judged against the blend of those campaigns alone, and every other ad against the rest. Campaigns bought for awareness, reach or video views are left out of the whole plan, their spend included: they are not bought to win customers, so CAC is the wrong measure for them.

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

**9. Viable ad stock.** The Viable ad stock is the number of viable ads your spend needs live at once: your current spend a day divided by the Spend per viable ad. Current spend is the last complete week's spend (Monday to Sunday), outside the awareness campaigns, divided by 7.

**10. Ads a week.** Hold the Viable ad stock, and the viable ads that stop being viable have to be replaced, but a launch adds the Hit rate in viable ads, not one. The Steady-state number is the Viable ad stock times 7, divided by the Viable lifespan, rounded up. That is the same as the Viable ad stock times 7, divided by the Hit rate times the Days viable per hit: the viable ads that wear out in a week, over the viable ads a launch adds. The Current pipeline is the Launched ads a week, averaged over the last 8 complete weeks.

**11. The check on today's ads.** Today means the last complete day, and the check reads viable ads only. Short: viable ads below 80% of the Viable ad stock. About right: from 80% to 150% of it. Ahead: viable ads above 150% of it. Worn out now: live ads past Ramping that are Fatiguing, Fatigued or Low efficiency; they take spend but are not stock. Wearing out over the next 2 weeks: viable ads times 14, divided by the Days viable per hit.

**12. The Budget and the ramp.** A Budget is a monthly figure, so the daily Budget is the month times 12, divided by 365. Your spend does not jump to it. It steps in equal amounts week by week, from your current spend to the daily Budget, and lands in the Budget week you name, or the week 4 weeks from now if you name none. It then holds there for 4 more weeks. The Roadmap starts next week and has one row for each of those weeks. A Budget below your current spend steps down the same way. With no Budget, current spend is held flat for 4 weeks.

**13. The stock, week by week.** The Viable ad stock a week needs is that week's daily spend divided by the Spend per viable ad. The plan starts from the viable ads you have live on the last complete day, today's stock. The gap is the Viable ad stock at current spend less today's stock. Each week some of the stock stops being viable: Wearing out is the stock at the start of the week times 7, divided by the Days viable per hit, and never more than the whole stock. A gap above zero is closed by the Catch-up: each week's target is the stock needed less a share of the gap that shrinks evenly to nothing at the Budget week (week 4 with no Budget), so by then the target is the stock needed in full. In week w of B weeks to the Budget week, the target is the stock needed less the gap times (B less w) over B; after the Budget week, and where there is no gap, it is the stock needed. The Ads to launch are whole ads: the target, less the stock left after Wearing out, divided by the Hit rate, rounded up and never below zero. Expected to work is the Ads to launch times the Hit rate, left unrounded: the viable ads those launches are likely to add. The stock at the end of the week is the stock at its start, less Wearing out, plus Expected to work. At a flat budget with no gap, the Ads to launch each week are the Steady-state number, give or take one ad for rounding. When spend steps down, the stock needed can fall faster than ads wear out: a week may then need no launches, and the stock above what spend needs wears out on its own. Where the Days viable per hit is under 7 days, the whole stock wears out within a week, so the Ads to launch are the target over the Hit rate, which sits below the Steady-state number.

**14. Live-by.** A new ad needs the Days to clear Ramping before it earns a verdict, so each week's new ads should be live that many days before the week's Monday. That date is the Live-by.

**15. The Budget ladder.** The Steady-state number, worked out as in item 10, at your current spend, at 25% more, at 50% more and at your Budget. It assumes the Spend per viable ad holds as spend grows. If the extra spend goes into each ad rather than into more ads, fewer new ads are needed.

**16. Format.** Each ad is read as video or image from its ad name alone, never its ad set or campaign name. The name is split into words at every character that is not a letter or a digit, and each word is compared with these, ignoring case. Video: video, vid, reel. Image: image, img, static, still, carousel. A name with words of one kind only decides the Format. A name with neither kind, or both, leaves the ad video if it had any 3-second video plays in the rows read, and image otherwise. The Name coverage is the share of those same Launched ads (first spend in the last 8 complete weeks) whose name decided the Format.

**17. The Format split.** The proposed split is the video and image shares of the Launched ads whose first spend fell in the last 8 complete weeks, in whole percentages that sum to 100. You can keep it, give your own (a video percentage, with image the rest) or turn it off. Each week's new ads are divided by it in whole ads, by largest remainder: each format first takes the whole ads of its share, and the ad left over, if there is one, goes to the format with the larger remainder (on a tie, the larger share; on equal shares, video). The video and image ads always add up to the week's new ads. With no split, only the total is shown.

**18. What the figures describe.** Every figure comes from your ads' own history in the window read, so it describes how your ads have behaved, not how ads behave in general. An account with few Launched ads gives a rough curve, and one with fewer than 20 launched at least 28 days ago is not read at all: it does not yet launch enough ads to read a hit rate. Nor is one in which none of those ads became viable, because there is then no Hit rate to plan from.

**19. The self-check.** Every run tests its own curve against the account. The Viable lifespan is the viable ad-days one launch delivers, so the Current pipeline times the Viable lifespan, divided by 7, is the number of viable ads that launching at that rate should leave live. That is the predicted viable ads, and it is set against today's viable ads. The check passes when the two are within 25% of each other, taken relative to today's viable ads. The run states the check either way, and where it fails it says the curve and today's count disagree, so the plan is a guide. A failed check does not stop the run.

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

**Viable ad stock.** Say Fern & Co's last complete week cost £4,200, so current spend is £600 a day. The Viable ad stock is 600 ÷ 30 = 20 viable ads live at once.

**Steady-state number.** 20 × 7 ÷ 7.93 = 17.65, which rounds up to 18 launches a week. It is also 20 × 7 ÷ (0.40 × 19.83): 18 launches add 18 × 0.40 = 7.2 viable ads a week, and 20 viable ads wear out at 20 × 7 ÷ 19.83 = 7.06 a week.

**The check on today's ads.** At 20, Short is below 16 viable ads (80%) and Ahead is above 30 (150%). Today, Monday 9 November, 22 ads are live past Ramping: 15 are viable, 5 are Worn out now and 2 are Improving. Fern & Co is Short, by 5 viable ads. Wearing out over the next 2 weeks is 15 × 14 ÷ 19.83 = 10.6.

**The self-check.** Say Fern & Co launched 14 a week over the last 8 weeks. Launching 14 a week predicts 14 × 7.93 ÷ 7 = 15.9 viable ads, and today it has 15, a difference of (15.9 − 15) ÷ 15 = 6%, inside 25%. The run says: "Check: launching 14 a week at a hit rate of 40% predicts 15.9 viable ads; you have 15." Had today's count been 10, the difference would be 59%, and the run would add that the curve and today's count disagree by 59%, so the plan is a guide.

## The Roadmap, worked

Fern & Co gives a Budget of £36,500 a month, which is 36,500 × 12 ÷ 365 = £1,200 a day, to be reached in the week of Monday 7 December, 4 weeks from now. Daily spend steps by (1,200 − 600) ÷ 4 = £150 a week. The gap is 20 − 15 = 5 viable ads, so the Catch-up lifts the target by a share of 5 that shrinks evenly to nothing by week 4: the target is the stock needed less 5 × (4 − w) ÷ 4. Wearing out each week is the stock × 7 ÷ 19.83, which is 6/17 of it. Live-by is the Monday less 4 days.

| Week (Monday) | Daily spend | Stock needed | Target |
|---|---|---|---|
| 1 (16 Nov) | £750 | 750 ÷ 30 = 25 | 25 − 5 × 3 ÷ 4 = 21.25 |
| 2 (23 Nov) | £900 | 900 ÷ 30 = 30 | 30 − 5 × 2 ÷ 4 = 27.5 |
| 3 (30 Nov) | £1,050 | 1,050 ÷ 30 = 35 | 35 − 5 × 1 ÷ 4 = 33.75 |
| 4 (7 Dec) | £1,200 | 1,200 ÷ 30 = 40 | 40 |

| Week | Start | Wearing out | Launches needed | Ads to launch | Expected to work | End | Live-by |
|---|---|---|---|---|---|---|---|
| 1 | 15.0 | 15 × 6 ÷ 17 = 5.3 | (21.25 − (15.0 − 5.3)) ÷ 0.40 = 28.86 | 29 | 29 × 0.40 = 11.6 | 15.0 − 5.3 + 11.6 = 21.3 | Thu 12 Nov |
| 2 | 21.3 | 7.5 | (27.5 − (21.3 − 7.5)) ÷ 0.40 = 34.28 | 35 | 14.0 | 21.3 − 7.5 + 14.0 = 27.8 | Thu 19 Nov |
| 3 | 27.8 | 9.8 | (33.75 − (27.8 − 9.8)) ÷ 0.40 = 39.43 | 40 | 16.0 | 27.8 − 9.8 + 16.0 = 34.0 | Thu 26 Nov |
| 4 | 34.0 | 12.0 | (40 − (34.0 − 12.0)) ÷ 0.40 = 45.03 | 46 | 18.4 | 34.0 − 12.0 + 18.4 = 40.4 | Thu 3 Dec |

Each row ties: start, less Wearing out, plus Expected to work, is the end stock. The figures are carried unrounded and shown to one decimal, so a launches-needed figure such as 45.03 rounds up to 46 whole ads. The end stock in week 4 is 40.4, above the 40 that spend then needs, and the Catch-up spread the 5 missing viable ads evenly over weeks 1 to 4: the target sits 3.75, 2.5, 1.25 and 0 below the stock needed. The Roadmap goes on for 4 more weeks at £1,200 a day.

**The Waterfall of the ramp.** The start bar is the 22 live ads past Ramping, drawn already dropped by the 7 that are Worn out now (5) or Improving (2), down to 15. Then, for each week, a down bar for Wearing out, an up bar for Expected to work, and the end stock, with the stock needed marked as a line:

| Week | Starts at | Down | Up | Ends at | Line at |
|---|---|---|---|---|---|
| 1 | 15.0 | 5.3 | 11.6 | 21.3 | 25 |
| 2 | 21.3 | 7.5 | 14.0 | 27.8 | 30 |
| 3 | 27.8 | 9.8 | 16.0 | 34.0 | 35 |
| 4 | 34.0 | 12.0 | 18.4 | 40.4 | 40 |

**A flat budget.** Say Fern & Co held £600 a day with 20 viable ads today, so there is no gap. The stock needed is 20 every week. Week 1: Wearing out is 20 × 6 ÷ 17 = 7.06, Ads to launch is ⌈(20 − (20 − 7.06)) ÷ 0.40⌉ = ⌈17.65⌉ = 18, Expected to work is 7.2, and the end stock is 20.1. Week 2 is ⌈17.42⌉ = 18 again. Every week is the Steady-state number, 18. With today's 15 viable ads there is a gap, and the Catch-up raises the early weeks above it for 4 weeks.

**A scale-down.** Say instead Fern & Co had 24 viable ads today, and gives a Budget of £3,650 a month, which is £120 a day, reached in week 3. Daily spend steps down by £160 a week. There is no gap, so the target is the stock needed.

| Week | Daily spend | Stock needed | Start | Wearing out | Ads to launch | Expected to work | End |
|---|---|---|---|---|---|---|---|
| 1 | £440 | 14.7 | 24.0 | 8.5 | max(0, ⌈(14.7 − (24.0 − 8.5)) ÷ 0.40⌉) = 0 | 0.0 | 24.0 − 8.5 + 0.0 = 15.5 |
| 2 | £280 | 9.3 | 15.5 | 5.5 | 0 | 0.0 | 15.5 − 5.5 + 0.0 = 10.0 |
| 3 | £120 | 4.0 | 10.0 | 3.5 | 0 | 0.0 | 10.0 − 3.5 + 0.0 = 6.5 |
| 4 | £120 | 4.0 | 6.5 | 2.3 | 0 | 0.0 | 6.5 − 2.3 + 0.0 = 4.2 |
| 5 | £120 | 4.0 | 4.2 | 1.5 | ⌈(4.0 − (4.2 − 1.5)) ÷ 0.40⌉ = ⌈3.19⌉ = 4 | 1.6 | 4.2 − 1.5 + 1.6 = 4.3 |

For four weeks the stock left after Wearing out is already above the stock needed, so no ads are launched (the Roadmap reads "None needed") and the surplus wears out on its own. Ads to launch is never negative. In week 5 the stock after Wearing out (2.7) has fallen below the 4 needed, so launches resume.

**The Format split.** Fern & Co's last 8 weeks were 30% video and 70% image, and the ad names gave the format of 82% of those ads. Dividing 29 Ads to launch at 30/70 by largest remainder: video is 29 × 0.30 = 8.7 and image is 29 × 0.70 = 20.3. Each format takes its whole ads, 8 and 20, which is 28, so one ad is left. The remainders are 0.7 and 0.3, so the ad goes to video: 9 video and 20 image, which add up to 29. Rounding each share on its own can overshoot: 25 ads at 30/70 would round 7.5 and 17.5 up to 8 and 18, which is 26. Largest remainder never does. The ramp's weeks divide as follows.

| Week | Ads to launch | Video | Image |
|---|---|---|---|
| 1 | 29 | 8.7, whole 8, plus the ad left over (the larger remainder): 9 | 20.3, whole 20: 20 |
| 2 | 35 | 10.5, whole 10 | 24.5, whole 24, plus the ad left over (equal remainders, the larger share): 25 |
| 3 | 40 | 12 | 28 |
| 4 | 46 | 13.8, whole 13, plus the ad left over (the larger remainder): 14 | 32.2, whole 32: 32 |

Each row adds up: 9 + 20 = 29, 10 + 25 = 35, 12 + 28 = 40 and 14 + 32 = 46. In the Waterfall, each week's up bar is Expected to work, split between video and image in proportion to those launches.

**The Budget ladder.** The Steady-state number at £600 a day is 18. At 25% more, £750 a day, the stock needed is 25 and the number is ⌈25 × 7 ÷ 7.93⌉ = ⌈22.06⌉ = 23. At 50% more, £900 a day, it is 30 and ⌈26.47⌉ = 27. At the £1,200 Budget it is 40 and ⌈35.29⌉ = 36.

**The growth.** The growth is the stock needed at the Budget less the stock needed now: 40 − 20 = 20.
