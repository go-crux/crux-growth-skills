# Page layout

A Meta ad volume forecast is one self-contained HTML file, `meta-ad-volume-<date>.html` (`<date>`
is today as `YYYY-MM-DD`), written to the working folder, with inline CSS and inline SVG, no script,
and no network request. Crux house style: British English, no em dashes, outcome before mechanism,
relative percentage changes (2.0% to 1.8% is "−10%"). Money is in the export's currency, rounded to
whole units; CAC and Spend per viable ad to two decimals; counts of ads to one decimal for the
Viable ad stock and whole numbers for every other count.

**The masthead** sits above the first heading, with no heading of its own: the title "Meta ad
volume", the brand, then one two-column table, a label on the left and its text on the right, one
row per label, in this order:

| Label | Text |
|---|---|
| Window | The 180 complete days read, first to last date (or the days the file held, if fewer). |
| Source | "Ads Manager export" with the file's name. |
| Measure | "CAC: Meta spend over the purchases Meta reports for the ad. Platform-attributed: it counts every purchase Meta claims." |
| Current spend | The last complete ISO week's dates, its spend, and that spend a day. |

**Five headings**, always present, always in this order, with these words. A heading with nothing
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
| Growth | 0, with the words "no Budget given". |

Under the table, one sentence of action: the ads to make to cover what is Worn out now and Wearing
out, and that the Steady-state number below is the rate to hold.

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

## Notes and Method

In this order:

1. **This run**, a short list:
   - the Source, the file named;
   - the CAC basis: platform-attributed, Meta's own cost per purchase, counting every purchase Meta
     claims;
   - the window: the first and last date read, the last complete ISO week used for current spend,
     the 8 weeks behind the Current pipeline, and the timezone the days follow or that none was
     named;
   - ads are grouped by Ad ID, and an ad's age and life spend are counted from the window read;
   - the campaigns confirmed as retargeting or existing-customer, by name, or "None";
   - an unattended run: that nobody confirmed the retargeting campaigns, so the proposed ones were
     used.
2. **The method**, the text of `references/method.md` word for word, worked example included.
3. **The Brain line**, the last line of Notes and Method, in these words and no others: "With a
   Growth Brain, the survival curve judges every ad on a single attribution source rather than every
   purchase Meta claims, and reads a year of history without an export."
