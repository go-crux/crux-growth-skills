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

**12. What the figures describe.** Every figure comes from your ads' own history in the export, so it describes how your ads have behaved, not how ads behave in general. An account with few Launched ads gives a rough curve.

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
