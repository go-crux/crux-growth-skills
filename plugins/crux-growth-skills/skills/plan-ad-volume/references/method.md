The number of new ads a week is worked out from how long your own ads stay good. Every Meta ad is judged on every day of the last 180 complete days, and the ads you launched in that time show how long a new one lasts. Here is how.

**1. Judging each ad each day.** Each ad is judged by its CAC, which is its spend divided by the new customers it brought. Without a Growth Brain these are the purchases Meta reports for the ad, which counts every purchase Meta claims. Each day's CAC is adjusted for the day of the week (some weekdays are always dearer) before any comparison. The current window is the 5 days to that day. An ad's Peak CAC is its best (lowest) 7-day CAC in the 42 days to that day. The Account blend is the CAC of all live ads together over the same 5 days; ads in your retargeting and existing-customer campaigns are judged against the blend of those campaigns alone, and every other ad against the rest.

**2. Ramping.** An ad needs all three of: 300 spent in its life, at least 2 days old, and 30 a day on average over the 5-day window (all in the account's currency). Below any of them it is Ramping, with no verdict.

**3. One status per ad per day, the first that fits:**

1. **Low efficiency**: 5-day CAC is 20% or more above its blend.
2. **Fatigued**: 5-day CAC is 50% or more above the Peak CAC on each of the last 3 days, and not improving.
3. **Fatiguing**: 20% or more above the Peak CAC on each of the last 2 days, and not improving.
4. **Improving**: 20% or more above the Peak CAC, but CAC has fallen over the last 3 days.
5. **Winner**: 5-day CAC is 20% or more below its blend.
6. **Healthy**: none of the above.

**4. Viable.** An ad is viable on a day when its status is Healthy or Winner. Improving, Fatiguing, Fatigued and Low efficiency are not viable, and nor is Ramping.

**5. Launched ads and age.** A Launched ad is one whose first day of spend falls after the first day of the 180 days, so its age is known. Only Launched ads feed the curve below. An ad's age is the number of days since its first day of spend: the first day is age 0.

**6. The survival curve.** At each age, the survival rate is the viable Launched ads divided by the Launched ads classified that day. An ad is classified on a day when it spent that day and is not Ramping (an ad that spent nothing is Inactive, and one with no status is Unknown; neither counts). An age counts only when 3 or more ads are classified at it, and the rates are used as they come, not smoothed.

**7. Lifespans.** The Viable lifespan is the sum of the survival rates over the ages that count: the average number of days a new ad stays viable. Where the curve is still at 25% or above when the 3-ad floor cuts it off, it is a lower bound. The Healthy lifespan is the first age with a survival rate below 50%, with a quartile range from the first age below 75% to the first age below 25%. Either end reads "not reached" where the curve never gets there. The Days to clear Ramping is the median, over Launched ads, of the age at which an ad first stops being Ramping.

**8. Spend per viable ad.** At each age that counts, take the average daily spend of the ads classified at it. Weight each by its survival rate and divide by the sum of the survival rates: the typical daily spend on one viable ad.

**9. Viable ad stock.** The Viable ad stock is the number of viable ads your spend needs live at once: your current spend a day divided by the Spend per viable ad. Current spend is the last complete week's spend (Monday to Sunday) divided by 7.

**10. Ads a week.** Hold the Viable ad stock, and a new ad is needed for each one that stops being viable. The Steady-state number is the Viable ad stock times 7, divided by the Viable lifespan, rounded up. The Current pipeline is the Launched ads a week, averaged over the last 8 complete weeks.

**11. The check on today's ads.** Today means the last complete day. Short: viable ads below 80% of the Viable ad stock. Over-stocked: live ads past Ramping above 150% of it. Both can hold. Worn out now: live ads past Ramping that are Fatiguing, Fatigued or Low efficiency. Wearing out over the next 2 weeks: viable ads times 14, divided by the Viable lifespan.

**12. The Budget and the ramp.** A Budget is a monthly figure, so the daily Budget is the month times 12, divided by 365. Your spend does not jump to it. It steps in equal amounts week by week, from your current spend to the daily Budget, and lands in the Budget week you name, or the week 4 weeks from now if you name none. It then holds there for 4 more weeks. The Roadmap starts next week and has one row for each of those weeks. A Budget below your current spend steps down the same way. With no Budget, current spend is held flat for 4 weeks.

**13. The stock, week by week.** The Viable ad stock a week needs is that week's daily spend divided by the Spend per viable ad. The plan starts from the viable ads you have live on the last complete day. Each week some of that stock stops being viable: Wearing out is the stock times 7, divided by the Viable lifespan, and never more than the whole stock. New ads then fill what is missing: the stock needed, less the stock left after Wearing out, rounded up to a whole ad and never below zero. The stock at the end of the week is the stock at its start, less Wearing out, plus the new ads. At a flat budget, once the stock matches what spend needs, the new ads each week are the Steady-state number. When spend steps down, the stock needed can fall faster than ads wear out: a week may then need no new ads, and the stock above what spend needs wears out on its own. Where the Viable lifespan is under 7 days, the whole stock wears out within a week, so the new ads are the stock needed, rounded up, which sits below the Steady-state number: the plan never makes more ads a week than spend needs live at once.

**14. Live-by.** A new ad needs the Days to clear Ramping before it earns a verdict, so each week's new ads should be live that many days before the week's Monday. That date is the Live-by.

**15. The Budget ladder.** The Steady-state number, worked out as in item 10, at your current spend, at 25% more, at 50% more and at your Budget. It assumes the Spend per viable ad holds as spend grows. If the extra spend goes into each ad rather than into more ads, fewer new ads are needed.

**16. What the figures describe.** Every figure comes from your ads' own history in the export, so it describes how your ads have behaved, not how ads behave in general. An account with few Launched ads gives a rough curve.

## Worked example

An invented brand, Fern & Co, with six Launched ads and a short run of days. Each row is one ad, each column its age in days, and the cell is its status that day: R is Ramping, V is viable (Healthy or Winner), X is not viable (Fatiguing, Fatigued, Improving or Low efficiency), and a dash is an age the ad has not reached yet.

| Ad | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
|---|---|---|---|---|---|---|---|---|---|---|
| A | R | R | R | V | V | X | X | X | X | X |
| B | R | R | R | V | V | V | V | V | V | – |
| C | R | R | R | R | V | V | X | X | X | – |
| D | R | R | R | R | V | V | V | V | – | – |
| E | R | R | R | R | V | V | V | – | – | – |
| F | R | R | R | R | R | V | – | – | – | – |

**The curve.** Count the ads that are not Ramping at each age, and how many of them are viable.

| Age | Classified | Viable | Survival |
|---|---|---|---|
| 3 | 2 (A, B) | 2 | does not count: fewer than 3 ads |
| 4 | 5 | 5 | 5 ÷ 5 = 1.00 |
| 5 | 6 | 5 | 5 ÷ 6 = 5/6 (0.83) |
| 6 | 5 | 3 | 3 ÷ 5 = 3/5 (0.60) |
| 7 | 4 | 2 | 2 ÷ 4 = 1/2 (0.50) |
| 8 | 3 | 1 | 1 ÷ 3 = 1/3 (0.33) |
| 9 | 1 (A) | 0 | does not count: fewer than 3 ads |

**Viable lifespan.** 1 + 5/6 + 3/5 + 1/2 + 1/3 = 98 ÷ 30 = 3.27 days. The curve is still at 33% at age 8, above 25%, so this is a lower bound.

**Healthy lifespan.** 0.50 is not below 50%, so the first age below 50% is 8. The first age below 75% is 6. The curve never gets below 25%, so the top of the quartile range reads "not reached".

**Days to clear Ramping.** The ads stop Ramping at ages 3, 3, 4, 4, 4 and 5, so the median is 4 days.

**Spend per viable ad.** The average daily spend of the ads classified at each age is £20 at age 4, £30 at age 5, £40 at age 6, £40 at age 7 and £30 at age 8. Weight each by its survival rate: 20 × 1 + 30 × 5/6 + 40 × 3/5 + 40 × 1/2 + 30 × 1/3 = 20 + 25 + 24 + 20 + 10 = 99. Divide by the sum of the survival rates: 99 ÷ 3.27 = £30.31 a day (99 × 30 ÷ 98).

**Viable ad stock.** Say Fern & Co's last complete week cost £4,200, so current spend is £600 a day. The Viable ad stock is 600 ÷ 30.31 = 19.8 viable ads live at once.

**Steady-state number.** 19.8 × 7 ÷ 3.27 = 42.4, which rounds up to 43 new ads a week. As a check, it is also the weekly spend divided by the survival-weighted spend of one ad over its viable life: 4,200 ÷ 99 = 42.4. Because the Viable lifespan is a lower bound, the figure may be a little high.

**The check.** At 19.8, Short is below 15.8 viable ads (80%) and Over-stocked is above 29.7 live ads past Ramping (150%). If today 12 ads are viable and 22 are live past Ramping, Fern & Co is Short and not Over-stocked.

## The Roadmap, worked

The ten-day table above is too short to show a stock wearing out over weeks, so the Roadmap takes the figures Fern & Co's full 180 days would give instead: a Viable lifespan of 14 days and a Spend per viable ad of £30 a day, with the same 4 days to clear Ramping and the same current spend of £600 a day. The Viable ad stock is 600 ÷ 30 = 20, and the Steady-state number is 20 × 7 ÷ 14 = 10 new ads a week. Today, Monday 9 November, 22 ads are live past Ramping: 12 are viable, 8 are Worn out now and 2 are Improving. So the starting stock is 12, and Wearing out each week is the stock × 7 ÷ 14, half of it.

**A ramp.** Fern & Co gives a Budget of £45,625 a month, which is 45,625 × 12 ÷ 365 = £1,500 a day, to be reached in the week of Monday 30 November, 3 weeks from now. Daily spend steps by (1,500 − 600) ÷ 3 = £300 a week. Live-by is the Monday less 4 days.

| Week (Monday) | Daily spend | Stock needed | Start | Wearing out | New | End | Live-by |
|---|---|---|---|---|---|---|---|
| 1 (16 Nov) | £900 | 900 ÷ 30 = 30 | 12 | 12 × 7 ÷ 14 = 6 | ⌈30 − (12 − 6)⌉ = 24 | 12 − 6 + 24 = 30 | Thu 12 Nov |
| 2 (23 Nov) | £1,200 | 1,200 ÷ 30 = 40 | 30 | 15 | ⌈40 − 15⌉ = 25 | 30 − 15 + 25 = 40 | Thu 19 Nov |
| 3 (30 Nov) | £1,500 | 1,500 ÷ 30 = 50 | 40 | 20 | ⌈50 − 20⌉ = 30 | 40 − 20 + 30 = 50 | Thu 26 Nov |

Every week ties: start, less Wearing out, plus New, is the end stock, and each end stock lands on the stock needed. The Roadmap goes on for 4 more weeks at £1,500 a day; the first of them (week 4) has a start of 50, Wearing out of 25 and New of ⌈50 − 25⌉ = 25, which is the Steady-state number at £1,500: 50 × 7 ÷ 14 = 25.

**The Waterfall of the ramp.** The start bar is the 22 live ads past Ramping, drawn already dropped by the 10 that are Worn out now (8) or Improving (2), down to 12. Then, for each week, a down bar for Wearing out, an up bar for New, and the end stock, with the stock needed marked as a line:

| Week | Starts at | Down | Up | Ends at | Line at |
|---|---|---|---|---|---|
| 1 | 12 | 6 | 24 | 30 | 30 |
| 2 | 30 | 15 | 25 | 40 | 40 |
| 3 | 40 | 20 | 30 | 50 | 50 |

**A flat budget.** Held at £600 a day, the stock needed is 20 every week. Week 1: Wearing out is 6, New is ⌈20 − (12 − 6)⌉ = 14, and the end stock is 20. Week 2: Wearing out is 10, New is ⌈20 − (20 − 10)⌉ = 10, and the end stock is 20. From week 2 the new ads equal the Steady-state number, 10. Week 1 is higher because today's 12 viable ads are short of the 20 needed.

**A scale-down.** Give a Budget of £3,650 a month, which is £120 a day, reached in week 3. Daily spend steps down by £160 a week.

| Week | Daily spend | Stock needed | Start | Wearing out | New | End |
|---|---|---|---|---|---|---|
| 1 | £440 | 14.7 | 12 | 6 | ⌈14.7 − 6⌉ = 9 | 12 − 6 + 9 = 15 |
| 2 | £280 | 9.3 | 15 | 7.5 | ⌈9.3 − 7.5⌉ = 2 | 15 − 7.5 + 2 = 9.5 |
| 3 | £120 | 4 | 9.5 | 4.75 | max(0, ⌈4 − 4.75⌉) = 0 | 9.5 − 4.75 + 0 = 4.75 |

In week 3 the stock left after Wearing out (4.75) is already above the 4 spend needs, so no new ads are made, and the surplus wears out in the weeks after. New is never negative.

**The Budget ladder.** The Steady-state number at £600 a day is 10. At 25% more, £750 a day, the stock needed is 25 and the number is ⌈25 × 7 ÷ 14⌉ = 13. At 50% more, £900 a day, it is 30 and 15. At the £1,500 Budget it is 50 and 25.

**The gap.** The growth is the stock needed at the Budget less the stock needed now: 50 − 20 = 30.
