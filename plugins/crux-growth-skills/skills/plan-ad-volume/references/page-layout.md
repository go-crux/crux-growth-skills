# Page layout

A Meta ad volume forecast is one self-contained HTML file, `meta-ad-volume-<date>.html` (`<date>`
is today as `YYYY-MM-DD`), written to the working folder, with inline CSS and inline SVG, no script,
and no network request. Crux house style: British English, no em dashes, outcome before mechanism,
relative percentage changes (2.0% to 1.8% is "−10%"). Money is in the export's currency, rounded to
whole units; CAC and Spend per viable ad to two decimals; counts of ads to one decimal for the
Viable ad stock and Wearing out in the Roadmap and whole numbers for every other count.

**The masthead** sits above the first heading, with no heading of its own: the title "Meta ad
volume", the brand, then one two-column table, a label on the left and its text on the right, one
row per label, in this order:

| Label | Text |
|---|---|
| Window | The 180 complete days read, first to last date (or the days the file held, if fewer). |
| Source | "Ads Manager export" with the file's name. |
| Measure | "CAC: Meta spend over the purchases Meta reports for the ad. Platform-attributed: it counts every purchase Meta claims." |
| Current spend | The last complete ISO week's dates, its spend, and that spend a day. |

**Seven headings**, always present, always in this order, with these words. A heading with nothing
under it stays on the page, with one line saying why.

## Ad stock check

One table, then the verdict, then the action.

| Row | Holds |
|---|---|
| Viable ads | Today's count (the last complete day). |
| Live past Ramping | Today's count. |
| Viable ad stock needed | The Viable ad stock (L) at current spend, one decimal. |
| Short below | 80% of L. |
| Over-stocked above | 150% of L. |

The verdict is one of three, in a sentence with the counts: **Short** (viable ads below 80% of L),
**Over-stocked** (live ads past Ramping above 150% of L), or **About right** (neither). Short and
Over-stocked can both hold; say both. The action follows: Short, make the new ads in Ads a week;
Over-stocked, the spend is spread over more ads than it needs; About right, keep launching at the
Steady-state number.

Where both hold, or any ad is Worn out now, add one sentence saying to run `/audit-ads` for which
ads to pause. The page names no ad.

## The gap

One table of three rows, each a count of ads with the line that says what it is:

| Row | Holds |
|---|---|
| Worn out now | Live ads past Ramping that are Fatiguing, Fatigued or Low efficiency, today. |
| Wearing out over the next 2 weeks | Viable ads times 14 over the Viable lifespan, rounded to a whole number. |
| Growth | The Viable ad stock at the daily Budget less the Viable ad stock at current spend, one decimal; with no Budget, 0 and the words "no Budget given". |

Under the table, one sentence of action: the ads to make to cover what is Worn out now and Wearing
out, and that the Roadmap below gives the ads to make each week, including the growth.

## Churn cycle

How long an ad lasts in this account, in four lines and one chart.

- **Healthy lifespan**: the age by which half the Launched ads have stopped being viable, with the
  quartile range (the ages at 75% and 25%) beside it. An end that was not reached reads "not
  reached".
- **Viable lifespan**: W, in days to one decimal. Where the curve is still at 25% or above at its
  last counted age, "at least" comes before the figure, and one sentence says the Steady-state
  number below may therefore read a little high.
- **Days to clear Ramping**: the median, in days.
- **Launched ads read**: how many Launched ads the curve rests on. Below 10, one sentence says the
  curve is rough.

**The Survival curve chart** is inline SVG: age in days along the bottom, the share of Launched ads
still viable up the side from 0% to 100%, with gridlines at 25%, 50% and 75%. Draw one point per age
that counts, joined by a line, and no point for an age under the 3-ad floor. Mark the Healthy
lifespan with a vertical line and its label, and the Days to clear Ramping with a second. Label both
axes, give the chart a title and a text alternative, and write the figures in the labels in the same
format as the lines above.

End the section with its action: a new ad takes the Days to clear Ramping to earn a verdict, so launch
it that many days before it must count in the Viable ad stock.

## Ads a week

The Steady-state number at current spend, against the Current pipeline, in one table:

| Row | Holds |
|---|---|
| Steady-state number | New ads a week to hold current spend: the Viable ad stock times 7 over the Viable lifespan, rounded up. |
| Current pipeline | Launched ads a week, averaged over the last 8 complete ISO weeks (fewer, said in the cell, where the window holds fewer). |
| Difference | The Steady-state number less the Current pipeline, with "more needed a week" or "fewer than the pipeline". |

One sentence under the table says what it means in the brand's words, and ends on the action: the
number of ads a week to make, and the Difference to close.

## Roadmap

The new ads to make each week, then the Waterfall of how the stock gets there.

**First line.** The Budget as the user gave it (the monthly figure, its daily equivalent, and the
Budget week with its Monday date, saying when the week was the default of 4 weeks from now), or "No
Budget given: current spend held flat for 4 weeks."

**The table.** One row for each ISO week, from next week to the Budget week and then 4 weeks held at
the Budget (4 weeks in all with no Budget). Its columns, in this order:

| Column | Holds |
|---|---|
| Week | The week's Monday, as a date. |
| Daily spend | That week's daily spend, in whole units. |
| Viable ad stock | L(w): the daily spend over the Spend per viable ad, one decimal. |
| Wearing out | Viable ads expected to stop being viable that week, one decimal. |
| New ads | The ads to make: a whole number, never below 0; "None needed" where it is 0. |
| Live-by | The week's Monday less the Days to clear Ramping, as a date; "Already due" where that date has passed. |

**The Waterfall** follows the table, as inline SVG covering the Roadmap weeks only. Along the bottom
is one group for each week, labelled with its Monday. Up the side is a count of ads from 0, with
gridlines. The bars, left to right:

1. **The start bar**: the live ads past Ramping today, drawn already dropped. The drop is the
   difference from the viable ads today (S(0)), labelled "Worn out now" with its count, and with the
   Improving ads' count beside it where there are any, so the bar comes down to S(0).
2. **For each week**, three bars: a down bar for Wearing out, from the week's start stock; an up bar
   for New ads, from where the down bar ends; and the end stock, a bar from 0. The next week's down
   bar starts at that end stock.
3. **L(w)**, drawn as a line across the week's group and labelled in the legend as the Viable ad stock.

Give the three kinds of bar distinct fills, each labelled with its figure, so the chart does not
depend on colour alone. Label both axes, give the chart a title and a text alternative, and write
the figures in the labels in the same format as the table. For every week, the start stock less
Wearing out plus New ads is the end stock, to one decimal.

End the section with its action: the first row's New ads go live by its Live-by date, and each later
row's by its own. Where the Budget is below current spend, one sentence says the stock above what
spend needs wears out on its own, so New ads fall below the Steady-state number.

## Budget ladder

The Steady-state number at four levels of spend, in one table:

| Rung | Daily spend | Viable ad stock | Steady-state number |
|---|---|---|---|
| Current spend | Current spend a day. | L at that spend. | New ads a week to hold it. |
| +25% | 1.25 times current spend. | L at that spend. | As above. |
| +50% | 1.5 times current spend. | L at that spend. | As above. |
| Budget | The daily Budget. | L at that spend. | As above. |

With no Budget the last rung is left out, with one line saying "no Budget given". Under the table,
the sentence: "This assumes the Spend per viable ad holds as spend grows." Then the action: the ads a week
the next level of spend asks for over today's.

## Notes and Method

In this order:

1. **This run**, a short list:
   - the Source, the file named;
   - the CAC basis: platform-attributed, Meta's own cost per purchase, counting every purchase Meta
     claims;
   - the Budget, as the monthly figure, its daily equivalent and the Budget week, or "None given";
     the Roadmap's weeks are ISO weeks counted from next week, and its dates are Mondays;
   - the window: the first and last date read, the last complete ISO week used for current spend,
     the 8 weeks behind the Current pipeline, and the timezone the days follow or that none was
     named;
   - ads are grouped by Ad ID, and an ad's age and life spend are counted from the window read;
   - the campaigns confirmed as retargeting or existing-customer, by name, or "None";
   - an unattended run: that nobody confirmed the retargeting campaigns, so the proposed ones were
     used, and that no Budget was asked for, so current spend was held flat for 4 weeks.
2. **The method**, the text of `references/method.md` word for word, worked example included.
3. **The Brain line**, the last line of Notes and Method, in these words and no others: "With a
   Growth Brain, the survival curve judges every ad on a single attribution source rather than every
   purchase Meta claims, and reads a year of history without an export."
