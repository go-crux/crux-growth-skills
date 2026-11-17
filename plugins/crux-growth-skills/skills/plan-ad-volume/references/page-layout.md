# Page layout

A Meta ad volume forecast is one self-contained HTML file, `meta-ad-volume-<date>.html` (`<date>`
is today as `YYYY-MM-DD`), written to the working folder, with inline CSS and inline SVG, no script,
and no network request. It reads as a dashboard for someone who has never seen the method: the
answer first, as a picture, in plain words. Crux house style: British English, no em dashes, outcome
before mechanism, relative percentage changes (2.0% to 1.8% is "−10%"). Money is in the export's
currency, rounded to whole units; CAC and Spend per viable ad to two decimals; and every count of ads
a whole number, rounded up (⌈x⌉) where it is worked out as a stock or a flow. The maths underneath
keeps every figure unrounded, and each tie is checked on those, to one decimal.

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
| Viable ad stock (L) | Viable ads needed (on the tile and the bar, "needed") | the viable ads your spend needs live at once, at the share of spend the plan aims to put on them |
| Viable share target | Viable share target | the share of your spend the plan aims to put on viable ads |
| Ramping | test phase | too new, or too little spend, to judge yet |
| Short | Short | fewer viable ads than your spend needs |
| About right | About right | within the range your spend needs |
| Ahead | Ahead | more viable ads than your spend needs |
| Worn out now | Stopped working but still running | ads old enough to be judged whose CAC has slipped; they take spend but do not count |
| Wearing out | Expected to wear out | viable ads likely to stop being viable in that time |
| Hit rate | Hit rate | the share of your new ads that become viable |
| Days viable per hit | How a working ad lasts | how long a new ad that works stays viable, on average |
| Days to clear Ramping | Days in the test phase | the days a new ad needs before it can be judged |
| Survival curve | Share of your launched ads still viable, by age | of the ads you launched, the share still viable at each age |
| Launched ad | New ads read | ads first launched inside the window, the ones the curve rests on |
| Improving | recovering | not viable today, but its CAC has fallen over the last 3 days |
| Steady-state number | Launches a week to keep up | the new ads a week that replace the viable ads wearing out, at that spend |
| Steady-state number less Current pipeline | +<n> a week | the new ads a week you need on top of what you launch now |
| Steady-state number at or below Current pipeline | On pace | what you launch now already keeps up with what your spend needs |
| Catch-up | Catch-up | the extra launches that close today's gap by your Budget week |
| Ads to launch | Ads to launch | the new ads to make in a week |
| Expected to work | Expected to work | the launches likely to become viable |
| Current pipeline | You launch now | new ads a week, averaged over your last 8 weeks |
| Spend per viable ad | Spend one viable ad carries | the typical daily spend on one viable ad |
| Roadmap | Week-by-week plan | |
| Waterfall | How your viable ads change, week by week | |
| Live-by | Go live by | the date a week's new ads must go live to be judged in time |
| Focus | Focus | what to work on first: your hit rate, your volume, or both |
| Hit-rate scenarios | If more of your ads work | |
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
| Current spend | The last complete ISO week's dates, its spend outside the awareness and lead campaigns, and that spend a day. |

# Your plan

Four headline tiles, the Focus sentence under them, then five headings, always present, with these
words, in the order below; under a Focus of Hit rate first, If more of your ads work moves up to
straight after the Focus sentence, ahead of Do you have the right number of ads?, and the other four
keep their order. Under Both and Volume the order is as written. A
heading with nothing under it stays on the page, with one line saying why. Every section under a
heading ends on its action; the lower-bound line, where the run has one, follows the last. The page
tells one story from top to bottom (where you are, why, what to launch to keep up, what next week
asks for), and every figure on it is the one its source figure gives: the same figure is never
worked out a second time, and a figure shown rounded is the figure every sentence and difference
beside it uses.

## The headline tiles

One row of four tiles (two by two on a narrow screen), read left to right as one sentence. Each has
a caption, a big figure and one small line under it. Ads are whole ads throughout: the viable ads
today are a count already, the Viable ads needed is ⌈L⌉ (the figure the Week-by-week plan's table
uses for week 1's stock needed), and the gap is the difference between those two whole figures.

1. **Where you are**: "8 viable ads, 29 needed". The small line is the gap: "21 short" for Short,
   "within range" for About right, "11 ahead" for Ahead.
2. **Why**: the Hit rate as "1 in 8 new ads works" (N the whole number nearest 1 over the Hit rate).
   The small line: "<x>% of launches; a working ad lasts about <D> days". x is the Hit rate as a
   percentage, to one decimal below 10% ("6.5%") and otherwise a whole number ("12%"); D is the Days
   viable per hit to the whole day. Where the Viable lifespan is a lower bound, "at least" replaces
   "about".
3. **To keep up**: S is the Steady-state number and P the Current pipeline, both whole ads.
   - S above P: the big figure is the difference, "+57 a week" (S less P), and the small line is
     "<S> a week to keep up; you launch <P> now".
   - S at or below P: the big figure is "On pace", and the small line is "<S> a week keeps up; you
     launch <P> now". Where the verdict is Short, it adds "; the plan adds the catch-up".

   Where P rests on fewer than 8 weeks, the small line ends "over <n> weeks" ("93 a week to keep up; you
   launch 36 now, over 5 weeks").
4. **Next week**: the first Week-by-week plan row's Ads to launch ("None needed" where it is 0).
   The small line splits it in two. **k**, the launches to keep up, is week 1's Wearing out over the
   Hit rate, rounded up. **c**, the launches to catch up, is week 1's Ads to launch less k. The line
   reads "<k> to keep up + <c> to catch up", so k plus c is the figure above it. Where c is 0, it
   reads "<k> to keep up". Where c is below 0, it reads "<k> to keep up, less <the size of c>
   (fewer than usual: you are ahead)".

Under the row, one small line for each label the tiles and the Focus sentence use, giving its Says: viable, Hit rate,
Focus, Launches a week to keep up, "+<n> a week" or "On pace" (whichever tile 3 shows) and, where tile 4 shows a catch-up, Catch-up (where it does not, the
Week-by-week plan's first line gives the Catch-up its Says at first use). The verdict colour sits on tile 1
only: one colour each for Short, About right and Ahead, always with the words, so the tile does not
depend on colour alone. The other three tiles carry none.

## The Focus sentence

One sentence under the four tiles, on every run, giving the Focus `SKILL.md` step 4 reads off the
Hit rate and the ask. It names the lever and carries the figures. x is the Hit rate as tile 2 gives
it, S the Steady-state number and P the Current pipeline, both whole ads as tile 3 gives them, and
the ask is written to one decimal ("1.8×"), worked on the unrounded Current pipeline. By Focus:

- **Hit rate first:** "Focus on your hit rate: only <x>% of new ads work, so keeping up takes <S>
  launches a week, <ask>× what you make now. Raising the share that work cuts that faster than
  making more."
  - With a Low hit rate and an ask of 1.5 or less: "Focus on your hit rate: only <x>% of new ads
    work, so keeping up takes <S> launches a week (<ask>× what you make now), so most of what you
    launch is spent learning. Raising the share that work cuts what you need to make."
  - With a Current pipeline of 0 the ask has no figure: "Focus on your hit rate: only <x>% of new
    ads work, so keeping up takes <S> launches a week and you make none now. Raising the share that
    work cuts that faster than making more."
- **Both:** "Work on both: your hit rate of <x>% is fair, and <S> a week is within reach of the <P>
  you make now."
- **Volume:** "Focus on volume: <x>% of your new ads work, a strong hit rate, so the lever is
  launching enough. Keeping up takes <S> a week."

The action is the sentence itself, which names where to start: the hit rate (If more of your ads
work shows what it saves), the volume (the Week-by-week plan shows the launches) or both.

## Do you have the right number of ads?

Two lines, before the bar. Percentages are whole numbers, each rounded once from its source figure,
and L is the whole figure the tiles show.

**The target sentence**, in these words: "Your best weeks put <P90>% of your spend on viable ads. The
plan aims for <target>%, so your spend needs <L> viable ads." The P90 is the 90th-percentile weekly
Viable share, the target is the Viable share target; the sentence is that label's Says at its first use
on Your plan.

**Where the rest goes**, in these words, ending on the lever: "Most weeks, <ramping>% of spend sits on
ads still in their test phase and <worn>% on ads that have stopped working: <lever>." The two
figures are the ramping share and the worn out share. The lever is the larger of the two, as shown
(on a tie, the test phase):

- Test phase larger: "launch fewer, stronger ads".
- Stopped working larger: "pause what has stopped working: run `/audit-ads`".

**The bar** is inline SVG: one horizontal bar of counts of ads, from 0 on the left to the larger of
1.5 times L and the viable ads today, plus 10% of that, with ticks every 10 ads (every 20 where the
end passes 100). It carries these and nothing else:

- a filled bar from 0 to the viable ads today, labelled "You have <n> viable";
- one solid target mark at L, labelled "Your spend needs <L>";
- the gap between the end of the filled bar and the target mark, shaded and labelled "<g> short"
  where the viable ads are below L or "<g> ahead" where they are above it (the same g as tile 1);
- the bounds of About right, 80% and 150% of L, as two faint ticks, with the single label "about
  right" between them.

Give the bar a title and a text alternative. It has no second marker for running ads and no zones.

**The verdict**, in one plain sentence with the counts and the gap, all whole ads, read on viable
ads only:

- Short (viable ads below 80% of L): "You have 8 viable ads and your spend needs 29, so you are 21
  short."
- About right (from 80% to 150% of L): "You have 38 viable ads against 42 needed: within range."
- Ahead (above 150% of L): "You have 66 viable ads and your spend needs 42, so you are 24 ahead: you
  have more viable ads than your spend needs, so the plan launches fewer until they wear down."

Where any ad is Worn out now, one more sentence: "<n> ads have stopped working but still take
spend: run `/audit-ads` to see which to pause." The page names no ad, and the sentence is left out
where n is 0.

The action: the ads to launch to close the gap are in the Week-by-week plan below, week by week
(for Short), or that the plan keeps launching to hold the stock (for About right), or that the plan
launches fewer until the viable ads wear down (for Ahead).

## How your ads perform

How a new ad does in this account, in three lines and one chart.

- **Hit rate**, as a big figure: "1 in 8, 12%" (N the whole number nearest 1 over the Hit rate, then
  the percentage x as tile 2 gives it), with the Says of Hit rate under it and **New ads read** beside it: how many
  Launched ads the curve rests on. Below 10, one sentence says the curve is rough.
- **How a working ad lasts**: the Days viable per hit, in days to one decimal, with "at least"
  before it where the Viable lifespan is a lower bound.
- **Days in the test phase**: Days to clear Ramping, the median, in days, with its Says.

**The chart, "Share of your launched ads still viable, by age"**, is inline SVG: age in days along
the bottom, the share of Launched ads still viable up the side from 0% to a top that fits the curve.
The top is the first of 5%, 10%, 20%, 25%, 50% and 100% that is at or above the curve's highest
point, so a curve that peaks at 4.2% has an axis to 5% and one that peaks at 60% has an axis to 100%.
Four gridlines sit at quarters of that top (for an axis to 5%: 1.25%, 2.5%, 3.75% and 5%), each
labelled to as few decimals as it needs. Draw one point per age that counts, joined by a line, and no
point for an age under the 3-ad floor. Mark the test phase with a vertical line at Days in the test
phase, labelled "Test phase: <n> days". Label both axes in plain words ("Days since the ad launched",
"Still viable"), give the chart a title and a text alternative, and write the figures in the labels in
the same format as the lines above.

The action: "Raise the hit rate and every number below falls; see If more of your ads work."

## Week-by-week plan

The Ads to launch each week, then a chart of how the viable ads get there.

**First line, the Catch-up.** Where the viable ads today are below L (the gap is above 0 whole
ads): "You are <g> viable ads short, so the plan adds <the total catch-up launches> launches over the
<B> weeks to <the Budget week's Monday date>, on top of keeping up." Where the verdict is About
right, "short" reads "under what your spend needs". The total catch-up launches is the sum, over
weeks 1 to B, of each week's Ads to launch less its launches to keep up (that week's Wearing out
over the Hit rate, rounded up, as tile 4 works it for week 1), so week 1's share is tile 4's c. The
first line is left out where the viable ads are at or above L, and the plan then needs no catch-up.

**The Budget line.** The Budget as the user gave it (the monthly figure, its daily equivalent, and
the Budget week with its Monday date, saying when the week was the default of 4 weeks from now), or
"No Budget given: current spend held flat for 4 weeks."

**The Video and image split line** sits between the Budget line and the table: the split the table
uses ("Video and image split: 30% video, 70% image", with the Name coverage beside it, "names gave
the format of 82% of ads"), or "No video and image split: new ads are shown as a total."

**The table.** One row for each ISO week, from next week to the Budget week and then 4 weeks held at
the Budget (4 weeks in all with no Budget). Its columns, in this order:

| Column | Holds |
|---|---|
| Week | The week's Monday, as a date. |
| Daily spend | That week's daily spend, in whole units. |
| Viable ads needed | ⌈L(w)⌉: the daily spend times the Viable share target over the Spend per viable ad, rounded up to a whole ad. |
| Expected to wear out | ⌈Wearing out(w)⌉, a whole number. |
| Video | The week's Ads to launch that are video: a whole number. Only with a Format split. |
| Image | The week's Ads to launch that are image: a whole number. Only with a Format split. |
| Ads to launch | Ads to launch(w), the total: a whole number, never below 0; "None needed" where it is 0. |
| Expected to work | ⌈Expected to work(w)⌉: the Ads to launch times the Hit rate, rounded up to a whole ad. |
| Go live by | The Live-by date; "Already due" where that date has passed. |

The Video and Image columns are present only with a split. They divide each week's Ads to launch by
largest remainder, so in every row video plus image equals Ads to launch. With no split, the
table has the Video and Image columns left out entirely.

One line under the table, in these words: "Figures are rounded up to whole ads, so a row can be one
out."

**The chart, "How your viable ads change, week by week"** (the Waterfall), follows the table, as
inline SVG covering the plan's weeks only. Along the bottom is one group for each week, labelled with
its Monday. Up the side is a count of viable ads from 0, with gridlines. The bars, left to right:

1. **The start bar**: the ads running past their test phase today, drawn already dropped. The drop
   is the difference from the viable ads today (S(0)), so the bar comes down to S(0). Label the start stock, rounded up to a whole ad, and label the drop
   with its parts: "Stopped working but still running" with its count, and, where there are any,
   "recovering" with the Improving ads' count; the two sum to the drop.
2. **For each week**, three bars: a down bar for Expected to wear out, from the week's start stock;
   an up bar for Expected to work, from where the down bar ends; and the end stock, a bar from 0.
   With a Format split the up bar is stacked in proportion to the Ads to launch: the video share from
   where the down bar ends, the image share on top of it, each segment labelled with the launches it
   stands for and the Expected to work (⌈x⌉) labelled above the bar. A segment of 0 is left out. With no
   split, the up bar is a single bar labelled with Expected to work. The
   next week's down bar starts at that end stock.
3. **Viable ads needed**, L(w), drawn as a line across the week's group and named in the legend.

Give the kinds of bar (wearing out, new as video, new as image, end; with no split, new as one kind)
distinct fills, each labelled with its figure and named in the legend in plain words, so the chart
does not depend on colour alone. Label both axes, give the chart a title and a text alternative,
and write the figures in the labels in the same format as the table: the start stock, end stock,
wear-out, up-bar and L(w) labels are whole numbers, each rounded up, while the bars are drawn at the
unrounded values. For every week, the start stock less Expected to wear out plus Expected to work is
the end stock on the unrounded figures, to one decimal; a label can be one out, as the table can.

The action: the first row's new ads go live by its Go live by date, and each later row's by its own.
Where you are Ahead, or the Budget is below current spend, one sentence says the viable ads above
what spend needs wear out on their own, so Ads to launch fall below Launches a week to keep up. A
week with surplus shows "None needed", its up bar is left out, and the end stock sits above its
line, coming down to it over the weeks that follow.

## If more of your ads work

The launches a week to keep up at today's Hit rate and at two better ones, in one table of three
rows, or four where the ask is above 1.5 (the Focus's ask, as `SKILL.md` step 4 reads it):

| Row | Hit rate | Launches a week to keep up | Change against today | Launches a week at your Budget |
|---|---|---|---|---|
| Today | h, as "1 in 8 (12%)", x as tile 2 gives it. | ⌈L × 7 ÷ (h × D)⌉, the Steady-state number. | None (the row is the base). | ⌈L at the daily Budget × 7 ÷ (h × D)⌉. |
| +20% | h × 1.2, as "1 in N (x%)". | ⌈L × 7 ÷ (h × 1.2 × D)⌉. | Relative to Today's launches, "−17%". | The same formula at the daily Budget. |
| +30% | h × 1.3, as "1 in N (x%)". | ⌈L × 7 ÷ (h × 1.3 × D)⌉. | As above. | As above. |
| At 1.5× your launches (only where the ask is above 1.5) | h needed = L × 7 ÷ (D × 1.5 × P), as "1 in N (x%)". | ⌈1.5 × P⌉. | h needed against h, relative, "+110% hit rate". | h needed at the daily Budget's L over the same 1.5 × P, as "needs <x>%". |

L is the Viable ad stock at current spend and D is the Days viable per hit, both fixed down the
table; P is the Current pipeline, unrounded in the working. In each row N is the whole number
nearest 1 over that row's hit rate, and x its percentage as tile 2 gives it. The change is worked
from the launches as shown, whole ads, in whole percent. The last column is present only with a
Budget, and each cell is worked at the daily Budget with that row's hit rate.

**The 1.5× row** is the hit rate the most production can stretch to would need. Its Change cell
compares hit rates, not launches, alone in the table, and says so in the cell ("+110% hit rate",
worked unrounded, in whole percent). Where h needed is above 100%, its Hit rate cell reads "not
reachable at this spend", and so does the Budget cell where that rate is above 100%. With a Current
pipeline of 0 the row is left out, with one line saying "You launch nothing now, so there is no hit
rate to read at 1.5 times today's launches." h needed times D times 1.5 times P over 7 equals L.
Under the table, one line: "Making the most your team can (1.5× what you launch now), you need a
hit rate of <x>% to keep up." (x as tile 2 gives it; where h needed is above 100%, "…keeping up at
this spend is not reachable, as it needs a hit rate above 100%.") The Week-by-week plan stays
uncapped and shows the full launches.

Under the table, the assumption, in these words: "This holds how long a working ad lasts fixed and
moves only the share that work."

The action: the launches a week each step saves ("a hit rate of 1 in 6 saves 4 launches a week"),
for each of +20% and +30% against Today, in whole ads, and that the hit rate rises through better
briefs and testing, with `/audit-ads` showing what works now.

## If you spend more

Launches a week to keep up at four levels of spend, in one table:

| Rung | Daily spend | Viable ads needed | Launches a week to keep up |
|---|---|---|---|
| Today | Current spend a day. | ⌈L⌉ at that spend. | ⌈L × 7 ÷ (h × D)⌉ at it, the Steady-state number. |
| +25% | 1.25 times current spend. | ⌈L⌉ at that spend. | As above. |
| +50% | 1.5 times current spend. | ⌈L⌉ at that spend. | As above. |
| Your Budget | The daily Budget. | ⌈L⌉ at that spend. | As above. |

With no Budget the last rung is left out, with one line saying "no Budget given". Under the table,
the sentence: "This assumes each viable ad carries the same spend, and the same share of your spend
sits on viable ads, as you grow." Then the action: the
launches a week the next level of spend asks for over today's.

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
- the Healthy lifespan, the age by which half the ads viable at the curve's peak have stopped being
  viable, with its quartile range ("a quarter by day 9, three quarters by day 40"; an end the
  curve did not reach reads "not reached"), and the Viable lifespan to one decimal, with "at least"
  before it where it is a lower bound;
- the Focus, with its two readings, as one line in these words with the figures filled in: "Focus:
  Hit rate first (hit rate 6.0%, ask 1.8×)." The name is Hit rate first, Both or Volume; the hit rate
  is as tile 2 gives it and the ask is to one decimal, or "no launches now" where the Current
  pipeline is 0;
- the Viable share, as one line in these words with the figures filled in: "Viable share: your best
  weeks (the 90th percentile of <n> weeks counted) put <P90>% of spend on viable ads, so the target is
  <target>% (<P90>% times 1.2, never above 100%). <m> weeks were left out: the first 6 for warm-up and
  <m less 6> for thin spend." Where fewer than 8 weeks were counted, add "Only <n> weeks were counted,
  so the target is rough." The P90 and the target are the figures Your plan shows;
- the Self-check, as one line in these words with the figures filled in (the Current pipeline for
  the launches a week, the Hit rate as a percentage, the Current pipeline times the Viable lifespan
  over 7 to one decimal, and today's viable ads): "Check: launching <pipeline> a week at a hit rate
  of <h> predicts <predicted> viable ads; you have <today>." Where it fails, by more than 25% of
  today's viable ads, the line adds "the curve and today's count disagree by <x>%, so read the plan
  as a guide";
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
- the campaigns left out as lead campaigns, by name with their spend over the last 7 complete days,
  or "None";
- an unattended run, in these words with the campaigns filled in: "This run was unattended, so
  nobody was asked. The proposed retargeting campaigns (<names>), awareness campaigns (<names>) and lead
  campaigns (<names>) were used, no Budget was given, so current spend was held flat for 4 weeks, and no Format split
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

1. **Budget**: the Budget as the Week-by-week plan's Budget line gives it (the monthly figure, its
   daily equivalent, the Budget week with its Monday date), or "No Budget given: current spend held
   flat for 4 weeks", with current spend a day beside it. Where the page shows the Catch-up line
   ("You are <g> viable ads short, so the plan adds ..."), it follows as the file's second line, in
   the page's words.
2. **The weeks**: the Week-by-week plan's table, with the columns Week, Daily spend, Video and Image
   (only with a Format split), Ads to launch, Expected to work and Go live by, one row for each week,
   and its Video and image split line, then the table's rounding line ("Figures are rounded up to
   whole ads, so a row can be one out."). Every figure is the page's whole number.
3. **How your ads perform**: one line, "<1 in N, x%> of your new ads work (Hit rate: <the Says of
   Hit rate>), and a working ad stays viable (<the Says of viable ad>) for about <the Days viable
   per hit, to the whole day> days" (x as tile 2 gives it; with "at least" before the figure and "so the ad counts may
   read a little high" after it where the Viable lifespan is a lower bound).
4. **Focus**: one line, the Focus sentence as Your plan words it.
5. **Spend one viable ad carries**: one line, "One viable ad carries <figure> a day of spend, so a
   day's spend of <current spend>, aiming at <target>% of it on viable ads, needs <⌈L⌉> viable ads
   live at once, and <the Steady-state number> launches a week keep up".

It carries no heading beyond the title and these five, and no method, no bar, no Waterfall and no
survival chart. A run that stopped before the page writes no Roadmap file.
