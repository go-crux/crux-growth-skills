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
| Window | The complete days read, first to last date: 365 from a Growth Brain, 180 from a Meta connector or an export (or the days the Source held, if fewer). |
| Source | The Source the run used: the Growth Brain connector's name, the Meta connector's name, or "Ads Manager export" with the file's name. |
| Measure | With a Growth Brain: "CAC: spend over new customers, counted from your own first orders." Otherwise: "CAC: Meta spend over the purchases Meta reports for the ad. Platform-attributed: it counts every purchase Meta claims." |
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
  number below is therefore a ceiling (Notes and Method gives the full note).
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
| Video | The week's new ads that are video: a whole number. Only with a Format split. |
| Image | The week's new ads that are image: a whole number. Only with a Format split. |
| New ads | The ads to make, the total: a whole number, never below 0; "None needed" where it is 0. |
| Live-by | The week's Monday less the Days to clear Ramping, as a date; "Already due" where that date has passed. |

**The Format split line** sits between the first line and the table: the split the table uses
("Format split: 30% video, 70% image", with the Name coverage beside it, "names gave the format of
82% of ads"), or "No Format split: new ads are shown as a total." The Video and Image columns are
present only with a split. They divide each week's New ads by largest remainder, so in every row
video plus image equals New ads. With no split, the table has the Video and Image columns left out
entirely and the New ads column alone.

**The Waterfall** follows the table, as inline SVG covering the Roadmap weeks only. Along the bottom
is one group for each week, labelled with its Monday. Up the side is a count of ads from 0, with
gridlines. The bars, left to right:

1. **The start bar**: the live ads past Ramping today, drawn already dropped. The drop is the
   difference from the viable ads today (S(0)), labelled "Worn out now" with its count, and with the
   Improving ads' count beside it where there are any, so the bar comes down to S(0).
2. **For each week**, three bars: a down bar for Wearing out, from the week's start stock; an up bar
   for New ads, from where the down bar ends; and the end stock, a bar from 0. With a Format split
   the up bar is stacked: the video ads from where the down bar ends, the image ads on top of them,
   each segment labelled with its count and the total New ads labelled above the bar. A segment of 0
   is left out. With no split, the up bar is a single bar labelled with the total. The next week's down
   bar starts at that end stock.
3. **L(w)**, drawn as a line across the week's group and labelled in the legend as the Viable ad stock.

Give the kinds of bar (down, up as video, up as image, end stock; with no split, up as one kind)
distinct fills, each labelled with its figure, so the chart does not
depend on colour alone. Label both axes, give the chart a title and a text alternative, and write
the figures in the labels in the same format as the table. For every week, the start stock less
Wearing out plus New ads is the end stock, to one decimal.

End the section with its action: the first row's New ads go live by its Live-by date, and each later
row's by its own. Where the Budget is below current spend, one sentence says the stock above what
spend needs wears out on its own, so New ads fall below the Steady-state number. A week with surplus
stock shows 0 new ("None needed"), its Waterfall up bar is left out, and the end stock sits above its
L(w) line, coming down to the line over the weeks that follow.

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
   - the Source: the Growth Brain connector's name, the Meta connector's name, or the file named;
   - the CAC basis: with a Growth Brain, first-party new orders; otherwise platform-attributed,
     Meta's own cost per purchase, counting every purchase Meta claims;
   - the Budget, as the monthly figure, its daily equivalent and the Budget week, or "None given";
     the Roadmap's weeks are ISO weeks counted from next week, and its dates are Mondays;
   - the Format split used, as "30% video, 70% image" and whether it was the proposal or the user's
     own, with the Name coverage, or "None"; Format is read from the ad name alone, then from
     3-second video plays (`video_views` on a Growth Brain) where the name gives neither or both
     kinds, or from the name alone where the brain's mart held no `video_views`;
   - where the Viable lifespan is a lower bound, this note, in these words with the figures filled
     in: "The Viable lifespan of <W> days is a lower bound: the survival curve was still at <share>%
     at <age> days, the last age with 3 or more ads, so ads were still viable when the data ran
     out. The Steady-state number and the new ads in the Roadmap are therefore a ceiling: they may
     read a little high." The trigger is a survival rate of 25% or more at the last counted age.
     A curve that ends below 25% carries no such note;
   - the window: the first and last date read, the last complete ISO week used for current spend,
     the 8 weeks behind the Current pipeline, and the timezone the days follow or that none was
     named;
   - ads are grouped by Ad ID, on every Source; an ad's life spend is counted from the window
     read, and its age from its first day of spend there, or on a Growth Brain the highest age the
     brain records for it;
   - the campaigns confirmed as retargeting or existing-customer, by name, or "None";
   - an unattended run, in these words with the campaigns filled in: "This run was unattended, so
     nobody was asked. The proposed retargeting campaigns were used (<names>), no Budget was given,
     so current spend was held flat for 4 weeks, and no Format split was given, so new ads are
     shown as a total." Leave it out on a run that was not unattended.
2. **The method**, the text of `references/method.md` word for word, worked example included.
3. **The Brain line**, on a run whose Source is not a Growth Brain and whose session holds none: the
   last line of Notes and Method, in these words and no others: "With a Growth Brain, the survival
   curve judges every ad on a single attribution source rather than every purchase Meta claims, and
   reads a year of history without an export." A run with a Growth Brain connected carries no Brain
   line, whichever Source it fell to, and ends on the method.

# The Roadmap file

`meta-ad-roadmap-<date>.md` (`<date>` is today as `YYYY-MM-DD`) is a markdown file the user keeps
and hands to whoever makes the ads. It is self-contained: it reads without the page, and in the
same house style, money, and counts of ads as the page. It holds these, in this order, under a title
of "Meta ad roadmap" with the brand and the date:

1. **Budget**: the Budget as the page's Roadmap first line gives it (the monthly figure, its daily
   equivalent, the Budget week with its Monday date), or "No Budget given: current spend held flat
   for 4 weeks", with current spend a day beside it.
2. **The weeks**: the Roadmap's table, with the columns Week, Daily spend, Video and Image (only with
   a Format split), New ads and Live-by, one row for each week, and its Format split line. The New
   ads are the page's, to the ad.
3. **Viable lifespan**: one line, "A new ad stays viable for <W> days on average" (with "at least"
   before the figure and "so the ad counts are a ceiling" after it where W is a lower bound).
4. **Spend per viable ad**: one line, "One viable ad takes <figure> a day of spend, so a day's spend
   of <current spend> needs <L> viable ads live at once".

It carries no heading beyond the title and these four, and no method, no Waterfall and no Survival
curve. A run that stopped before the page writes no Roadmap file.
