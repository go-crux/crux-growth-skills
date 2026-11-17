# Page layout

A Meta ad volume forecast is one self-contained HTML file, `meta-ad-volume-<date>.html` (`<date>`
is today as `YYYY-MM-DD`), written to the working folder, with inline CSS and inline SVG, no script,
and no network request. It opens on a Scorecard a founder reads in seconds: three answer cards, then
three charted panels, labels only. Everything else sits on a second tab. Crux house style: British
English, no em dashes, outcome before mechanism, relative percentage changes (2.0% to 1.8% is "−10%").
Money is in the export's currency, rounded to whole units; CAC and Spend per viable ad to two
decimals; and every count of ads a whole number, rounded up (⌈x⌉) where it is worked out as a stock
or a flow. The maths underneath keeps every figure unrounded, and each tie is checked on those, to
one decimal.

Formats used throughout:

- **Hit rate** as a percentage, to one decimal below 10% ("6.5%") and otherwise a whole number
  ("12%"); "1 in N" is N the whole number nearest 1 over the Hit rate.
- **Days viable per hit** to the whole day on the Scorecard and to one decimal on How it's worked
  out, with "at least" before it where the Viable lifespan is a lower bound.
- **Shares of spend** as whole percentages, each rounded once from its source figure.

## Two tabs

The page has two tabs, **Scorecard** and **How it's worked out**, switched with CSS alone: two
radio inputs, each with a label styled as a tab, and each panel shown only while its input is
checked. Scorecard's input is checked when the page opens. Under `@media print` both panels show,
Scorecard first. The masthead sits above the tabs and shows with either. On a phone the three
cards stack, and every chart is an SVG with a `viewBox` that scales to the width of the screen.

## Page labels

The Scorecard and the chat speak to the user in these labels, never in the term on the left, and so
do the Week-by-week plan's columns and the Roadmap file. The Scorecard carries no definitions: each
Says is given once, on How it's worked out under Terms, which is this table as Label, Term and Says
(the rows with a Says), so a reader can match the two. A row with no Says is a heading or a chart
title and needs no gloss.

| Term (glossary) | Label | Says |
|---|---|---|
| Viable ad | working ad | its CAC holding up: under 20% above your account average and not climbing off its best, or recovering towards it |
| Viable ad stock (L) | working ads needed ("Needed" in the chart) | the working ads your spend needs live at once, at the share of spend the plan aims to put on them |
| Viable share target | target | the share of your spend the plan aims to put on working ads |
| Ramping | test phase | too new, or too little spend, to judge yet |
| Short | Short | fewer working ads than your spend needs |
| About right | About right | within the range your spend needs |
| Ahead | Ahead | more working ads than your spend needs |
| Worn out now | Worn out | ads old enough to be judged whose CAC has slipped; they take spend but do not count |
| Wearing out | Expected to wear out | working ads likely to stop working in that time |
| Hit rate | Hit rate | the share of your new ads that become working ads |
| Days viable per hit | Days a winner works | how long a new ad that works stays working, on average |
| Days to clear Ramping | Days in the test phase | the days a new ad needs before it can be judged |
| Survival curve | Share of your launched ads still working, by age | of the ads you launched, the share still working at each age |
| Launched ad | New ads read | ads first launched inside the window, the ones the curve rests on |
| Improving | recovering | not working today by the audit's measure, but its CAC has fallen over the last 3 days; it counts as a working ad here because it converts like one |
| Current pipeline | Launches a week (now) | new ads a week, averaged over your last 8 weeks |
| Lever best | best | the best your account has done on that Lever: your best 8 weeks in a row for launches, your best launch months for hit rate, your best launch quarter for days a winner works |
| Limiting factor | Holding you back | the one Lever furthest from what your spend needs, read against your own best |
| On track | On track | enough working ads, and you launch enough to keep up |
| Volume | Volume | launching at a pace you have already reached would keep up |
| Both | Both | keeping up needs your best hit rate and launching near your best pace |
| Finding winners | Finding winners | the hit rate has the most room: raise the share of new ads that work |
| Keeping winners | Keeping winners | the days a winner works has the most room: make working ads last longer |
| Steady-state number | Launches a week needed | the new ads a week that replace the working ads wearing out, at that spend |
| Budget ladder | Enough working ads for your spend? (panel 1) | |
| Steady-state number over Current pipeline | × what you launch now | how many times what you launch now each rung asks for |
| On the table | On the table | the extra new customers a week at today's spend if your target share of spend were on working ads; it assumes the CAC gap between working and other spend holds as the share moves |
| Catch-up | Catch-up | the extra launches that close today's gap by your Budget week |
| Ads to launch | Ads to launch | the new ads to make in a week |
| Expected to work | Expected to work | the launches likely to become working ads |
| Spend per viable ad | Spend one working ad carries | the typical daily spend on one working ad |
| Roadmap | Week-by-week plan | |
| Live-by | Go live by | the date a week's new ads must go live to be judged in time |
| Format split | Video and image split | |
| Name coverage | names gave the format of | the share of ads whose name said video or image |

## The masthead

One heading, "<Brand> · Meta ads scorecard", and under it one small line, "Last complete day <date>
· <Source> · CAC on <basis>". The date is today (the last complete day). The Source is the Growth
Brain connector's name, the Meta connector's name, or "Ads Manager export" with the file's name. The
basis is "first-party new orders" with a Growth Brain, and "platform-attributed purchases" otherwise.

# Scorecard

The masthead, then the strip of three cards, then three panels, in that order. The first tab holds
no prose beyond labels and one action line for each panel. Every figure on it is its source figure
from `SKILL.md` step 4, worked once and shown rounded once: a figure shown rounded is the figure
every label and difference beside it uses. S is the working ads today, L the Viable ad stock (⌈L⌉
where shown), P the Current pipeline, B the launches Lever best, N0 the Steady-state number and N1
the launches a week at the best Hit rate.

## The strip

Three cards across, stacked on a phone. Each has a small caps label, one big figure and one small
line.

1. **Enough ads?**
   - Big figure: "<S> of <⌈L⌉>".
   - Small line: a pill, then "working ads for today's spend". The pill is "Short <g>" below 80% of
     L, "About right" from 80% to 150%, and "Ahead <g>" above 150%, g being the difference between
     ⌈L⌉ and S. Each verdict has its own pill colour and always carries its words, so the card does
     not depend on colour alone. No other card carries a verdict colour.
2. **Holding you back**
   - Big figure: the Limiting factor (On track, Volume, Both, Finding winners or Keeping winners).
   - Small line: the to-hit in words, from the table below, for example "lift hit rate to 11% (your
     best), then launch 43 a week".
3. **On the table**
   - Big figure: "+<n> customers", n the new customers a week gained (`customers_week_gain`) to the
     nearest whole customer, never below 1 where anything is on the table.
   - Small line: "a week at today's spend · CAC −<x>%", x the blended CAC change as a whole percentage.
   - With nothing on the table: big figure "Nothing", small line "your spend is already on working
     ads".

## The to-hit

One wording of what the account has to hit, used by card 2 and, with its figures in bold, by Panel
2's action line. h_best and N1 are the hit rate best and the launches at it; h_need and D_need the
hit rate and Days viable per hit that launching B a week would need. Each need marker on Panel 2
sits on the Lever the to-hit moves.

| Limiting factor | The to-hit | Need markers on |
|---|---|---|
| On track | "nothing: keep launching <P> a week" | none |
| Volume | "launch <N0> a week" | Launches a week at N0 |
| Both | "lift hit rate to <h_best>% (your best), then launch <N1> a week" | Hit rate at h_best; Launches a week at N1 |
| Finding winners | "lift hit rate to <h_need>%, launching <B> a week (your best)" | Hit rate at h_need |
| Keeping winners | "keep a winner working <D_need> days, launching <B> a week (your best)" | Days a winner works at D_need |

Where h_need or D_need is above its best, "(beyond your best)" follows it. Where B is null (fewer
than 8 complete weeks), h_need and D_need are null: the to-hit reads "not enough launch history yet
to name a target" and there is no need marker.

## Panel 1: "Enough working ads for your spend?"

**The chart** is inline SVG, one grouped bar for each rung of the Budget ladder, in the ladder's
order: Today, 1.5× spend, 2× spend and, where the user gave a Budget that differs from those three,
Your Budget.

- Today has a filled bar for the working ads now (S). Every rung, Today included, has a dashed
  outline bar for the working ads needed (⌈L⌉ at that rung's spend), in the same slot on every rung.
- The whole number sits above each bar.
- Each rung is labelled under its group with its name and its daily spend ("Today", "£600 a day").
- The vertical axis runs from 0 to the largest figure plus 10%, with light gridlines.
- A two-item legend: "Working now" (filled) and "Needed" (dashed outline).

Give the chart a title and a text alternative that read the figures aloud.

**Under the chart**, a two-row table with one column for each rung:

| Row | Holds |
|---|---|
| Launches a week needed | N0 at that rung's spend: a whole number. |
| × what you launch now (<P>) | N0 over P, to one decimal; "n/a" where P is 0. P is the whole figure in the row's label. |

**The action line**, by verdict:

- Short: "Launch <N0> a week to keep up; the Week-by-week plan adds the Catch-up."
- About right: "Launch <N0> a week to keep up."
- Ahead: "Launch fewer for now: you have more working ads than your spend needs, so they wear down first."

Where the Viable lifespan is a lower bound, the line ends "Counts may read a little high; How it's
worked out has the detail."

## Panel 2: "What's holding you back?"

The Limiting factor is a pill in the heading, a single accent colour that is the same for every
factor except On track, which has none.

**The chart** is inline SVG, one horizontal track for each Lever, in this order and with these
labels: "Launches a week", "Hit rate", "Days a winner works". Each row is on its own scale, from 0
to the largest of its now, best and need figures plus 10%. A row shows:

- a filled bar from 0 to now, with a dot at its end labelled "now <x>";
- a tick labelled "best <x>", or "no best yet" where the best is null (no tick is drawn);
- a red marker labelled "need <x>", only on the Levers the to-hit moves (the table above); "need
  <x>, beyond your best" where the figure is above its best. Where a need and a best are the same
  figure the two labels sit one above and one below the track.

Figures are in the formats above: launches as whole ads, the Hit rate as a percentage, Days a winner
works in whole days ("at least" before now where the Viable lifespan is a lower bound). With On
track the chart has no need markers. Give the chart a title and a text alternative.

**The action line**: "To hit: <the to-hit, figures in bold>." Where the to-hit raises the Hit rate
(Both and Finding winners), it adds "At today's hit rate it takes <N0> a week." With On track it
reads "To hit: nothing. Keep launching <P> a week."

## Panel 3: "What's on the table"

**The chart** is inline SVG, two 100% stacked horizontal bars, "Today" and "At target", split into
Working, Test phase, Worn out and, only where it holds any spend, Other. Today's shares are the 90-day
spend shares (`share_viable`, `share_test_phase`, `share_worn_out`, `share_other`). At target, Working
is the target and each of the other three is its share scaled so the three together take the rest.
Each segment over about 6% carries its percentage; the groups have distinct fills, named in a
legend, so the chart does not depend on colour alone. Give it a title and a text alternative.
With nothing on the table the chart has Today's bar only.

**The action line** names the biggest waste (`biggest_waste`) with its share of spend:

- Worn out: "<n>% of your spend is on ads that have stopped working: run `/audit-ads` to see which to pause."
- Test phase: "<n>% of your spend is on ads still in their test phase: launch fewer, stronger ads."

With nothing on the table: "Nothing on the table: <v0>% of your spend is on working ads, at or above
your <target>% target." The page names no ad.

# How it's worked out

Seven parts, in this order.

## Week-by-week plan

The Ads to launch each week. No chart: the table is the plan.

**First line, the Catch-up.** Where S is below ⌈L⌉ (the gap is above 0 whole ads): "You are <g>
working ads short, so the plan adds <the total catch-up launches> launches over the <k> weeks to
<the Budget week's Monday date>, on top of keeping up." Where the verdict is About right, "short"
reads "under what your spend needs". k is the number of weeks to the Budget week (4 with no
Budget). The total catch-up launches is the sum, over those k weeks, of each week's Ads to launch less its launches to keep up (that
week's Wearing out over the Hit rate, rounded up). The first line is left out where S is at or above
⌈L⌉, and the plan then needs no catch-up.

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
| Working ads needed | ⌈L(w)⌉: the daily spend times the Viable share target over the Spend per viable ad, rounded up to a whole ad. |
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

The action: the first row's new ads go live by its Go live by date, and each later row's by its own.
Where you are Ahead, or the Budget is below current spend, one sentence says the working ads above
what spend needs wear out on their own, so Ads to launch fall below Launches a week needed. A week
with surplus shows "None needed".

## Survival curve

**The chart, "Share of your launched ads still working, by age"**, is inline SVG: age in days along
the bottom, the share of Launched ads still viable up the side from 0% to a top that fits the curve.
The top is the first of 5%, 10%, 20%, 25%, 50% and 100% that is at or above the curve's highest
point, so a curve that peaks at 4.2% has an axis to 5% and one that peaks at 60% has an axis to 100%.
Four gridlines sit at quarters of that top (for an axis to 5%: 1.25%, 2.5%, 3.75% and 5%), each
labelled to as few decimals as it needs. Draw one point per age that counts, joined by a line, and no
point for an age under the 3-ad floor. Mark the test phase with a vertical line at Days in the test
phase, labelled "Test phase: <n> days". Label both axes in plain words ("Days since the ad launched",
"Still working"), give the chart a title and a text alternative, and write the figures in the labels in
the same format as the figures below.

Under it, one line: "New ads read: <n>", the Launched ads the curve rests on, and, below 10, one
sentence saying the curve is rough.

## The figures

The figures behind the Scorecard, one line each, in this order and in the formats above:

1. **Hit rate**: "1 in 8, 12%", with the Hit rate ads it rests on ("from <n> ads launched at least 28
   days ago").
2. **Viable lifespan**: the days to one decimal, with "at least" before it where it is a lower bound.
3. **Days viable per hit**: the days to one decimal, with "at least" where the Viable lifespan is a
   lower bound.
4. **Spend per viable ad**: to two decimals, a day.
5. **Viable share and its target**, in these words with the figures filled in: "Viable share: your
   best weeks (the 90th percentile of <n> weeks counted) put <P90>% of spend on viable ads, so the
   target is <target>% (<P90>% times 1.2, never above 100%). <m> weeks were left out: the first 6 for
   warm-up and <m less 6> for thin spend." Where fewer than 8 weeks were counted, add "Only <n> weeks
   were counted, so the target is rough."
6. **Each Lever best**, with the periods it counted, one line each: "Launches best: <B> a week (your best
   8 weeks in a row)"; "Hit rate best: <h_best>% (the 90th percentile of <n> launch months)"; "Days
   viable per hit best: <D_best> days (your best of <n> launch quarters)". A null best reads "no best
   yet" with how many were counted and how many it needs ("2 launch months counted, 4 needed"; for
   launches, "<n> complete weeks, 8 needed").
7. **CAC and spend share by group, last 90 days**: one table, a row for each of Working, Test phase,
   Worn out and (only where it holds spend) Other, with the columns Share of spend, New customers and
   CAC (two decimals). A group that spent and has no customers reads "no new customers" and is
   named in This run. Under it, one line: "On the table assumes the CAC gap between working and other
   spend holds as the share moves."
8. **The Self-check**, as one line in these words with the figures filled in (the Current pipeline for
   the launches a week, the Hit rate as a percentage, the Current pipeline times the Viable lifespan
   over 7 to one decimal, and today's viable ads): "Check: launching <pipeline> a week at a hit rate
   of <h> predicts <predicted> viable ads; you have <today>." Where it fails, by more than 25% of
   today's viable ads, the line adds "the curve and today's count disagree by <x>%, so read the plan
   as a guide".

## Terms

The Page labels table above, as Label, Term and Says, for the labels the Scorecard and the Week-by-week
plan used.

## This run

A short list:

- the Source: the Growth Brain connector's name, the Meta connector's name, or the file named;
- the CAC basis: with a Growth Brain, first-party new orders; otherwise platform-attributed, Meta's
  own cost per purchase, counting every purchase Meta claims;
- the Budget, as the monthly figure, its daily equivalent and the Budget week, or "None given"; the
  Week-by-week plan's weeks are ISO weeks counted from next week, and its dates are Mondays;
- the Format split used, as "30% video, 70% image" and whether it was the proposal or the user's
  own, with the Name coverage, or "None"; Format is read from the ad name alone, then from 3-second
  video plays (`video_views` on a Growth Brain) where the name gives neither or both kinds, or from
  the name alone where the brain's mart held no `video_views`;
- the Healthy lifespan, the age by which half the ads viable at the curve's peak have stopped being
  viable, with its quartile range ("a quarter by day 9, three quarters by day 40"; an end the
  curve did not reach reads "not reached"), and the Days to clear Ramping;
- the Limiting factor, as one line in these words with the figures filled in: "Limiting factor:
  Both (launches needed <N0> a week, your best <B>; at your best hit rate <N1>)." The name is On
  track, Volume, Both, Finding winners or Keeping winners; a null B or N1 reads "no best yet". Where
  both the hit rate best and the days viable per hit best are null, the line adds "not enough
  history to compare";
- the groups left out of On the table, named, where a group spent and had no customers in the 90
  days (the nearest worse group's CAC was used, or it was left out of the customers), or "None";
- where the Viable lifespan is a lower bound, this note, in these words with the figures filled in:
  "The Viable lifespan of <W> days is a lower bound: the survival curve was still at <share>% at
  <age> days, the last age with 3 or more ads, so ads were still viable when the data ran out. The
  Steady-state number and the new ads in the Week-by-week plan are therefore a ceiling: they may read a
  little high." The trigger is a survival rate of 25% or more at the last counted age. A curve that
  ends below 25% carries no such note;
- the window: the first and last date read, the last complete day (today) and any later day left out
  as still loading, the last complete ISO week used for current spend and that spend a day outside
  the awareness and lead campaigns, the 8 weeks behind the Current pipeline, and the timezone the
  days follow or that none was named;
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

## The Brain line

On a run whose Source is not a Growth Brain and whose session holds none, the last line of How it's
worked out, in these words and no others: "With a Growth Brain, the survival curve judges every ad
on a single attribution source rather than every purchase Meta claims, and reads a year of history
without an export." A run with a Growth Brain connected carries no Brain line, whichever Source it
fell to, and ends on the method.

# The Roadmap file

`meta-ad-roadmap-<date>.md` (`<date>` is today as `YYYY-MM-DD`) is a markdown file the user keeps
and hands to whoever makes the ads. It is self-contained: it reads without the page, in the same
house style, money, counts of ads and Page labels as the Scorecard. It holds these, in this order,
under a title of "Meta ad roadmap" with the brand and the date:

1. **Budget**: the Budget as the Week-by-week plan's Budget line gives it (the monthly figure, its
   daily equivalent, the Budget week with its Monday date), or "No Budget given: current spend held
   flat for 4 weeks", with current spend a day beside it. Where the page shows the Catch-up line
   ("You are <g> working ads short, so the plan adds ..."), it follows as the file's second line, in
   the page's words.
2. **The weeks**: the Week-by-week plan's table, with the columns Week, Daily spend, Video and Image
   (only with a Format split), Ads to launch, Expected to work and Go live by, one row for each week,
   and its Video and image split line, then the table's rounding line ("Figures are rounded up to
   whole ads, so a row can be one out."). Every figure is the page's whole number.
3. **Hit rate**: one line, "<1 in N, x%> of your new ads work (Hit rate: <the Says of Hit rate>), and
   a working ad stays working (<the Says of working ad>) for about <the Days viable per hit, to the
   whole day> days" (with "at least" before the figure and "so the ad counts may read a little high"
   after it where the Viable lifespan is a lower bound).
4. **Holding you back**: one line, "<Limiting factor>: <the to-hit, in the words of the to-hit
   table, without bold>." With On track, "On track: nothing to hit. Keep launching <P> a week."
5. **Spend one working ad carries**: one line, "One working ad carries <figure> a day of spend, so a
   day's spend of <current spend>, aiming at <target>% of it on working ads, needs <⌈L⌉> working ads
   live at once, and <the Steady-state number> launches a week keep up".

It carries no heading beyond the title and these five, and no method, no chart and no survival
curve. A run that stopped before the page writes no Roadmap file.
