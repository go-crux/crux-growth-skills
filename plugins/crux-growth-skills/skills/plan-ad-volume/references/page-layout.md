# Page layout

A Meta ad volume forecast is one self-contained HTML file, `meta-ad-volume-<date>.html` (`<date>`
is today as `YYYY-MM-DD`), written to the working folder, with inline CSS and inline SVG, no script,
and no network request. It reads as a dashboard for someone who has never seen the method: the
answer first, as a picture, in plain words. Crux house style: British English, no em dashes, outcome
before mechanism, relative percentage changes (2.0% to 1.8% is "−10%"). Money is in the export's
currency, rounded to whole units; CAC and Spend per viable ad to two decimals; counts of ads to one
decimal for Viable ads needed and Expected to wear out in the Week-by-week plan, and whole numbers
for every other count.

## Two tabs

The page has two tabs, **Your plan** and **How it's worked out**, switched with CSS alone: two
radio inputs, each with a label styled as a tab, and each panel shown only while its input is
checked. Your plan's input is checked when the page opens. Under `@media print` both panels show,
Your plan first. The masthead sits above the tabs and shows with either.

## Page labels

Your plan speaks to the user in these labels, never in the term on the left. Each label with a
Says is explained in those words where it first appears on Your plan; a label with none is a
heading or a chart title and needs no gloss.
How it's worked out uses the terms, and opens with this table as **Terms on the plan** (Label,
Term, Says), so a reader can match the two.

| Term (glossary) | Label on Your plan | Says, at first use |
|---|---|---|
| Viable ad | viable ad | its CAC holding up: under 20% above your account average and not climbing off its best |
| Viable ad stock (L) | Viable ads needed | the viable ads your spend needs live at once to spend well |
| Ramping | test phase | too new, or too little spend, to judge yet |
| Live ads past Ramping | Running past their test phase | every ad taking spend that is old enough to judge |
| Short | Too few | fewer viable ads than your spend needs |
| Over-stocked | Too many | far more ads running than your spend needs, so each gets too little |
| About right | About right | within the range your spend needs |
| Worn out now | Stopped working but still running | ads past their test phase whose CAC has slipped; they take spend but do not count |
| Wearing out | Expected to wear out (in the gap: Expected to stop working in the next 2 weeks) | viable ads likely to stop being viable in that time |
| Growth | Extra for your Budget | the further viable ads your Budget will need |
| Healthy lifespan | Half stop being viable by | the age by which half your new ads have stopped being viable |
| Viable lifespan | Average days viable | how long a new ad stays viable, on average |
| Days to clear Ramping | Days in the test phase | the days a new ad needs before it can be judged |
| Survival curve | Share of new ads still viable | of the ads you launched, the share still viable at each age |
| Launched ads | New ads read | ads first launched inside the window, the ones the curve rests on |
| Improving | recovering | not viable today, but its CAC has fallen over the last 3 days |
| Steady-state number | New ads a week to keep up | the new ads a week that replace the viable ads wearing out, at that spend |
| Current pipeline | You launch now | new ads a week, averaged over your last 8 weeks |
| Spend per viable ad | Spend one viable ad carries | the typical daily spend on one viable ad |
| Roadmap | Week-by-week plan | |
| Waterfall | How your viable ads change, week by week | |
| Live-by | Go live by | the date a week's new ads must go live to be judged in time |
| Budget ladder | If you spend more | |
| Format split | Video and image split | |
| Name coverage | names gave the format of | the share of ads whose name said video or image |

## The masthead

The title "Meta ad volume", the brand, then one two-column table, a label on the left and its text
on the right, one row per label, in this order:

| Label | Text |
|---|---|
| Window | The complete days read, first to last date: 365 from a Growth Brain, 180 from a Meta connector or an export (or the days the Source held, if fewer). |
| Source | The Source the run used: the Growth Brain connector's name, the Meta connector's name, or "Ads Manager export" with the file's name. |
| Measure | With a Growth Brain: "CAC: spend over new customers, counted from your own first orders." Otherwise: "CAC: Meta spend over the purchases Meta reports for the ad. Platform-attributed: it counts every purchase Meta claims." |
| Current spend | The last complete ISO week's dates, its spend outside the awareness campaigns, and that spend a day. |

# Your plan

Four headline tiles, then five headings, always present, always in this order, with these words. A
heading with nothing under it stays on the page, with one line saying why. Every section under a
heading ends on its action; the lower-bound line, where the run has one, follows the last.

## The headline tiles

One row of four tiles (two by two on a narrow screen), each a big figure with one small line under
it:

1. **The verdict**: "Too few ads", "About right" or "Too many ads"; where Too few and Too many both
   hold, "Too few viable, too many running". The small line is the gap as a count: "12 viable ads
   short", "18 more running than you need", both where both hold, or "38 viable against 42
   needed" for About right.
2. **New ads a week to keep up**: the Steady-state number. The small line: "you launch 9 now", with
   the difference ("5 more a week needed" or "4 fewer than you launch").
3. **Half stop being viable by**: "day 21", or "not reached". The small line: "average 24.0 days
   viable" (with "at least" before the figure where the Viable lifespan is a lower bound).
4. **Ads to make next week**: the first Week-by-week plan row's New ads, or "None needed". The small
   line: "go live by <date>", or "already due".

Under the row, one small line gives the first use of viable its Says: "Viable: <the Says of
viable ad>." The tiles carry the page's colour for the verdict only: one colour each for Too few, About right and
Too many, always with the words, so the tile does not depend on colour alone.

## Do you have the right number of ads?

One sentence of what it means: "To spend <current spend a day> well, your account needs about <L>
viable ads live at once."

**The gauge** is inline SVG: one horizontal bar, a count of ads from 0 on the left to the right-hand end:
the largest of 1.5 times L, the viable ads today and the ads running past their test phase, plus
15% of that largest figure, rounded up to the next tick. Ticks every 10 ads, or every 20 where the
end passes 100. Three zones shade it, each labelled: **Too few** from 0 to 80% of L, **About right**
from 80% to 150% of L, **Too many** above 150% of L. A line marks L, labelled "Needed: <L>". Two
markers sit on it, each labelled with its count: **Viable now** (today's viable ads) and **Running
past their test phase** (today's live ads past Ramping). Give the gauge a title and a text
alternative. Under it, one line: "Too few reads your viable ads; too many reads every ad running
past its test phase, since each takes spend whether it is working or not."

**The verdict**, in one plain sentence with the counts and the gap, rounded to a whole ad:

- Too few (viable ads below 80% of L): "You have 30 viable ads and your spend needs 42, so you are
  12 short."
- Too many (live ads past Ramping above 150% of L): "You have 81 ads running past their test phase
  and your spend needs 42 viable ones, so 39 more are running than you need: your spend is spread
  too thin."
- Both can hold; say both.
- About right: "You have 38 viable ads against 42 needed: within range."

**What to make**, as a small labelled table or stacked bar, one row each, a count of ads with its
Says:

| Label | Holds |
|---|---|
| Stopped working but still running | Worn out now: live ads past Ramping that are Fatiguing, Fatigued or Low efficiency, today. |
| Expected to stop working in the next 2 weeks | Wearing out: viable ads times 14 over the Viable lifespan, a whole number. |
| Extra for your Budget | Growth: the Viable ad stock at the daily Budget less at current spend, one decimal; with no Budget, 0 and "no Budget given". |

The action: the ads to make to cover what has stopped and what will stop, and that the
Week-by-week plan below gives them week by week, growth included. Where Too few and Too many both
hold, or any ad has stopped working but is still running, one sentence says to run `/audit-ads` for which
ads to pause. The page names no ad.

## How long an ad lasts

How long a new ad stays viable in this account, in four lines and one chart.

- **Half stop being viable by**: the Healthy lifespan, with the quartile range beside it ("a quarter
  by day 9, three quarters by day 40"). An end that was not reached reads "not reached".
- **Average days viable**: W, in days to one decimal, with "at least" before it where W is a lower
  bound.
- **Days in the test phase**: Days to clear Ramping, the median, in days, with its Says.
- **New ads read**: how many Launched ads the curve rests on. Below 10, one sentence says the curve
  is rough.

**The chart, "Share of new ads still viable"**, is inline SVG: age in days along the bottom, the
share of Launched ads still viable up the side from 0% to 100%, with gridlines at 25%, 50% and 75%.
Draw one point per age that counts, joined by a line, and no point for an age under the 3-ad floor.
Mark Half stop being viable by with a vertical line and its label, and Days in the test phase with a second.
Label both axes in plain words ("Days since the ad launched", "Still viable"), give the chart a
title and a text alternative, and write the figures in the labels in the same format as the lines
above.

The action: a new ad takes its test phase to earn a verdict, so launch it that many days before it
must count.

## New ads a week

Two horizontal bars, inline SVG, each labelled with its count: **New ads a week to keep up** (the
Steady-state number, with its Says) and **You launch now** (the Current pipeline; fewer than 8 weeks
said in the label where the window holds fewer). Under them, the difference as one line: "5 more a
week needed" or "4 fewer than you launch".

One sentence says what it means in the brand's words, and ends on the action: the number of ads a
week to make, and the difference to close.

## Week-by-week plan

The new ads to make each week, then a chart of how the viable ads get there.

**First line.** The Budget as the user gave it (the monthly figure, its daily equivalent, and the
Budget week with its Monday date, saying when the week was the default of 4 weeks from now), or "No
Budget given: current spend held flat for 4 weeks."

**The Video and image split line** sits between the first line and the table: the split the table
uses ("Video and image split: 30% video, 70% image", with the Name coverage beside it, "names gave
the format of 82% of ads"), or "No video and image split: new ads are shown as a total."

**The table.** One row for each ISO week, from next week to the Budget week and then 4 weeks held at
the Budget (4 weeks in all with no Budget). Its columns, in this order:

| Column | Holds |
|---|---|
| Week | The week's Monday, as a date. |
| Daily spend | That week's daily spend, in whole units. |
| Viable ads needed | L(w): the daily spend over the Spend per viable ad, one decimal. |
| Expected to wear out | Wearing out(w), one decimal. |
| Video | The week's new ads that are video: a whole number. Only with a Format split. |
| Image | The week's new ads that are image: a whole number. Only with a Format split. |
| New ads to make | New(w), the total: a whole number, never below 0; "None needed" where it is 0. |
| Go live by | The Live-by date; "Already due" where that date has passed. |

The Video and Image columns are present only with a split. They divide each week's New ads by
largest remainder, so in every row video plus image equals New ads to make. With no split, the
table has the Video and Image columns left out entirely.

**The chart, "How your viable ads change, week by week"** (the Waterfall), follows the table, as
inline SVG covering the plan's weeks only. Along the bottom is one group for each week, labelled with
its Monday. Up the side is a count of viable ads from 0, with gridlines. The bars, left to right:

1. **The start bar**: the ads running past their test phase today, drawn already dropped. The drop
   is the difference from the viable ads today (S(0)), so the bar comes down to S(0). Label the drop
   with its parts: "Stopped working but still running" with its count, and, where there are any,
   "recovering" with the Improving ads' count; the two sum to the drop.
2. **For each week**, three bars: a down bar for Expected to wear out, from the week's start stock;
   an up bar for New ads to make, from where the down bar ends; and the end stock, a bar from 0.
   With a Format split the up bar is stacked: the video ads from where the down bar ends, the image
   ads on top of them, each segment labelled with its count and the total labelled above the bar. A
   segment of 0 is left out. With no split, the up bar is a single bar labelled with the total. The
   next week's down bar starts at that end stock.
3. **Viable ads needed**, L(w), drawn as a line across the week's group and named in the legend.

Give the kinds of bar (wearing out, new as video, new as image, end; with no split, new as one kind)
distinct fills, each labelled with its figure and named in the legend in plain words, so the chart
does not depend on colour alone. Label both axes, give the chart a title and a text alternative,
and write the figures in the labels in the same format as the table. For every week, the start
stock less Expected to wear out plus New ads to make is the end stock, to one decimal.

The action: the first row's new ads go live by its Go live by date, and each later row's by its own.
Where the Budget is below current spend, one sentence says the viable ads above what spend needs
wear out on their own, so new ads fall below New ads a week to keep up. A week with surplus shows
"None needed", its up bar is left out, and the end stock sits above its line, coming down to it over
the weeks that follow.

## If you spend more

New ads a week to keep up at four levels of spend, in one table:

| Rung | Daily spend | Viable ads needed | New ads a week to keep up |
|---|---|---|---|
| Today | Current spend a day. | L at that spend. | The Steady-state number at it. |
| +25% | 1.25 times current spend. | L at that spend. | As above. |
| +50% | 1.5 times current spend. | L at that spend. | As above. |
| Your Budget | The daily Budget. | L at that spend. | As above. |

With no Budget the last rung is left out, with one line saying "no Budget given". Under the table,
the sentence: "This assumes each viable ad carries the same spend as you grow." Then the action: the
ads a week the next level of spend asks for over today's.

**The lower-bound line.** Where the Viable lifespan is a lower bound, the last line of Your plan, in
these words: "Your ads were still lasting when the data ran out, so these ad counts may read a
little high. How it's worked out has the detail."

# How it's worked out

Three headings, in this order, then the Brain line where the run has one.

## Terms on the plan

The Page labels table above, as Label, Term and Says, for the labels Your plan used.

## This run

A short list:

- the Source: the Growth Brain connector's name, the Meta connector's name, or the file named;
- the CAC basis: with a Growth Brain, first-party new orders; otherwise platform-attributed, Meta's
  own cost per purchase, counting every purchase Meta claims;
- the Budget, as the monthly figure, its daily equivalent and the Budget week, or "None given"; the
  Roadmap's weeks are ISO weeks counted from next week, and its dates are Mondays;
- the Format split used, as "30% video, 70% image" and whether it was the proposal or the user's
  own, with the Name coverage, or "None"; Format is read from the ad name alone, then from 3-second
  video plays (`video_views` on a Growth Brain) where the name gives neither or both kinds, or from
  the name alone where the brain's mart held no `video_views`;
- where the Viable lifespan is a lower bound, this note, in these words with the figures filled in:
  "The Viable lifespan of <W> days is a lower bound: the survival curve was still at <share>% at
  <age> days, the last age with 3 or more ads, so ads were still viable when the data ran out. The
  Steady-state number and the new ads in the Roadmap are therefore a ceiling: they may read a
  little high." The trigger is a survival rate of 25% or more at the last counted age. A curve that
  ends below 25% carries no such note;
- the window: the first and last date read, the last complete ISO week used for current spend, the
  8 weeks behind the Current pipeline, and the timezone the days follow or that none was named;
- ads are grouped by Ad ID, on every Source; an ad's life spend is counted from the window read, and
  its age from its first day of spend there, or on a Growth Brain the highest age the brain records
  for it;
- the campaigns confirmed as retargeting or existing-customer, by name, or "None";
- the campaigns left out as awareness, by name with their spend over the last 7 complete days, or
  "None";
- an unattended run, in these words with the campaigns filled in: "This run was unattended, so
  nobody was asked. The proposed retargeting campaigns (<names>) and awareness campaigns (<names>)
  were used, no Budget was given, so current spend was held flat for 4 weeks, and no Format split
  was given, so new ads are shown as a total." Leave it out on a run that was not unattended.

## The method

The text of `references/method.md` word for word, worked example included.

**The Brain line**, on a run whose Source is not a Growth Brain and whose session holds none: the
last line of How it's worked out, in these words and no others: "With a Growth Brain, the survival
curve judges every ad on a single attribution source rather than every purchase Meta claims, and
reads a year of history without an export." A run with a Growth Brain connected carries no Brain
line, whichever Source it fell to, and ends on the method.

# The Roadmap file

`meta-ad-roadmap-<date>.md` (`<date>` is today as `YYYY-MM-DD`) is a markdown file the user keeps
and hands to whoever makes the ads. It is self-contained: it reads without the page, in the same
house style, money, counts of ads and Page labels as Your plan. It holds these, in this order, under
a title of "Meta ad roadmap" with the brand and the date:

1. **Budget**: the Budget as the Week-by-week plan's first line gives it (the monthly figure, its
   daily equivalent, the Budget week with its Monday date), or "No Budget given: current spend held
   flat for 4 weeks", with current spend a day beside it.
2. **The weeks**: the Week-by-week plan's table, with the columns Week, Daily spend, Video and Image
   (only with a Format split), New ads to make and Go live by, one row for each week, and its Video
   and image split line. The new ads are the page's, to the ad.
3. **How long an ad lasts**: one line, "A new ad stays viable (<the Says of viable ad>) for <W> days
   on average" (with "at least" before the figure and "so the ad counts may read a little high"
   after it where W is a lower bound).
4. **Spend one viable ad carries**: one line, "One viable ad carries <figure> a day of spend, so a
   day's spend of <current spend> needs <L> viable ads live at once".

It carries no heading beyond the title and these four, and no method, no gauge, no Waterfall and no
survival chart. A run that stopped before the page writes no Roadmap file.
