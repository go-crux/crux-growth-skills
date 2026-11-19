# Page layout

A Meta ad volume forecast is one self-contained HTML file, `meta-ad-volume-<date>.html` (`<date>`
is today as `YYYY-MM-DD`), written to the working folder, with inline CSS, inline SVG, one inline
JSON data block (`wb-figures`) and one inline `<script>`. It is Crux-branded as `references/crux-brand.md` sets out, and its only network request
is that file's Google Fonts stylesheet: the script makes none. It opens on the Creative deep dive,
which a founder reads top to bottom in a few minutes, in labels and a few fixed sentences; the method sits on a second tab.
Crux house style: British English, no em dashes, outcome before mechanism, relative percentage
changes (2.0% to 1.8% is "−10%"). Money is in the export's currency, rounded to whole units; CAC and
Spend per viable ad to two decimals; and every count of ads a whole number, rounded up (⌈x⌉) where it
is worked out as a stock or a flow. The maths underneath keeps every figure unrounded, and each tie
is checked on those, to one decimal.

Formats used throughout:

- **Hit rate** as a percentage, to one decimal below 10% ("6.5%") and otherwise a whole number
  ("12%"); "1 in N" is N the whole number nearest 1 over the Hit rate.
- **Days viable per hit** to the whole day on the Creative deep dive and to one decimal on How it's
  worked out, with "at least" before it where the Viable lifespan is a lower bound.
- **Shares of spend** as whole percentages, each rounded once from its source figure.
- **The seven measures** as percentages to one decimal, Spend degradation with its sign (−48.1%).

## Two tabs

The page has two tabs, **Creative deep dive** and **How it's worked out**, switched with CSS alone:
two radio inputs, each with a label styled as a tab, and each panel shown only while its input is
checked. Creative deep dive's input is checked when the page opens. Under `@media print` both panels
show, Creative deep dive first, and the slider's controls are hidden. The masthead sits above the tabs
and shows with either. On a phone the sections stack, and every chart is an SVG with a `viewBox` that
scales to the width of the screen.

## Page labels

The Creative deep dive and the chat speak to the user in these labels, never in the term on the left,
and so do the Month-by-month plan's columns and the Roadmap file. The one exception is the formula
under Ads needed each month, which is written in the terms so a reader can check it against How
it's worked out. The Creative deep dive carries no definitions beyond the hit test and the Spend bar's explanation under their figures: each Says is given once, on How it's
worked out under Terms, which is this table as Label, Term and Says (the rows with a Says), so a
reader can match the two. A row with no Says is a heading or a chart title and needs no gloss.

| Term (glossary) | Label | Says |
|---|---|---|
| Viable ad | working ad | its CAC holding up: under 20% above your account average and not climbing off its best, or recovering towards it |
| Viable ad stock (L) | working ads needed ("Needed" in the chart) | the working ads your spend needs live at once, at the share of spend the plan aims to put on them |
| Viable share target | target | the share of your spend the plan aims to put on working ads |
| Ramping | test phase | too new, or too little spend, to judge yet |
| Short | Short | fewer working ads than your spend needs |
| About right | About right | within the range your spend needs |
| Ahead | Ahead | more working ads than your spend needs |
| Ad stock check | Enough working ads for your spend? | the working ads you have today, against the working ads your spend needs live at once |
| Worn out now | Worn out | ads old enough to be judged whose CAC has slipped; they take spend but do not count |
| Wearing out | Expected to wear out | working ads likely to stop working in that time, the ones launched in it included |
| Stay-level launches | To stay level | the new ads that replace the working ads your current spend needs, which wear out next month |
| Gap launches | To catch up / Ahead | the one-off new ads that make up the working ads you are short today, or the fewer needed because you have more than your spend needs |
| Growth launches | To grow | the new ads for the extra working ads your spend needs next month |
| Creative score | Creative score | how healthy your creative is, out of 100: the plain average of seven measures, each placed on fixed bands from Poor to Good |
| Evergreen share | Evergreen share | the share of the last 30 days' spend on ads that are 30 days old or more |
| Spend degradation | Spend degradation | how much an ad's daily spend changes from its first week to the 3 weeks after, the middle figure across your new ads |
| Viable after week 1 | Working after week 1 | of your hits, the share still working at 28 days |
| Top-5 concentration | Top-5 concentration | the share of the last 30 days' spend on your 5 biggest ads |
| Outlier | Outlier | a new ad that has spent at least the line: the average spend of your new ads plus one standard deviation |
| Outlier rate | Outlier rate | the share of your new ads that are Outliers |
| Outlier rate | Outliers' share of spend | the share of your new ads' total spend that sits on Outliers |
| Weakest point | Weakest point | the measure with the lowest sub-score, its value against Good, and what to do about it |
| Top-10 turnover | Top-10 turnover | how many of a quarter's 10 biggest-spending ads first spent in that quarter; shown beside the score and never part of it |
| Expected outliers a month | Expected outliers a month | the new ads a month times your Outlier rate |
| Hit rate | Hit rate | the share of your new ads that are hits: a new ad is a hit when, in its first 28 days, it spent the Spend bar or more, kept its cost per new customer within 1.2 times your account's, and had at least one 5-day stretch at a good CAC |
| Spend bar | Spend bar | the spend a new ad needs in its first 28 days to count as a hit: the larger of 300 and 3 days of what one working ad spends |
| Low-spend rate | Ads that never got budget | the share of your new ads that spent less than the Spend bar in their first 28 days |
| Days viable per hit | Days a hit works | how long a hit stays working, on average |
| Viable spend per hit | Spend a hit carries | the spend one hit carries over its working life |
| Days to clear Ramping | Days in the test phase | the days a new ad needs before it can be judged |
| Survival curve | Share of your launched ads still working, by age | of the ads you launched, the share still working at each age |
| Launched ad | New ads read | ads first launched after the first 6 weeks of the window, the ones the curve rests on |
| Improving | recovering | not working today by the audit's measure, but its CAC has fallen over the last 3 days; it counts as a working ad here because it converts like one |
| Current pipeline | Launches a month (now) | new ads a month, averaged over your last 3 complete months |
| Lever best | best | the best your account has done on that Lever: your best 3 months in a row for launches, your best launch months for hit rate, your best launch quarter for days a hit works |
| Limiting factor | Holding you back | the one Lever furthest from what your spend needs, read against your own best |
| On track | On track | enough working ads, and you launch enough to keep up |
| Volume | Volume | launching at a pace you have already reached would keep up |
| Both | Both | keeping up needs your best hit rate and launching near your best pace |
| Finding hits | Finding hits | the hit rate has the most room: raise the share of new ads that become hits |
| Keeping hits | Keeping hits | the days a hit works has the most room: make hits last longer |
| Steady-state number | Launches a month needed | the new ads a month that replace the working ads wearing out, at that spend |
| On the table | On the table | the extra new customers a week at today's spend if your target share of spend were on working ads; it assumes the CAC gap between working and other spend holds as the share moves |
| What it's worth | What it's worth | what getting your target share of spend onto working ads is worth at today's spend |
| Production budget | ceiling for making ads | the most a month's extra ads can cost to make and still pay for themselves |
| Catch-up | Catch-up | the extra launches, once, that make up today's gap in next month |
| Ads to launch | Ads to launch | the new ads to make in a month |
| Expected to work | Expected to work | the launches likely to become working ads |
| Spend per viable ad | Spend one working ad carries | the typical daily spend on one working ad |
| Roadmap | Month-by-month plan | |
| Live-by | Go live by | the date a month's new ads must go live to be judged in time; about a quarter of the month's ads launch each week after it |
| Format split | Video and image split | |
| Name coverage | names gave the format of | the share of the last 8 weeks' spend whose ad name said video or image |

## The masthead

An eyebrow, "Meta ad volume", then one heading, "<Brand> · Creative deep dive", and under it one
small line, "Last complete day <date> · <Source> · CAC on <basis>". The brand's name sits in the heading
and nowhere else carries a brand's own styling. The date is today (the last complete day). The Source is
the Growth Brain connector's name, the Meta connector's name, or "Ads Manager export" with the file's
name. The basis is "first-party new orders" with a Growth Brain, and "platform-attributed purchases"
otherwise. A footer closes the page: "Built with Crux growth skills".

# Creative deep dive

The masthead, then seven sections in this order, each under a 4px Highlight rule, a small-caps eyebrow
and its title, which is its name below. The first tab holds no prose beyond labels, the two opening
sentences of Spending power, Outlier engine, Creative rotation and Hits, the hit test and the Spend bar's explanation, the Hits and Outliers line, What it's worth's two opening sentences and its lines, and, for most sections, one action line. Every figure on it is its source figure from `SKILL.md` step 4, worked once
and shown rounded once: a figure shown rounded is the figure every label and difference beside it
uses. S is the working ads today, L the Viable ad stock (⌈L⌉ where shown), P the Current pipeline, B the
launches Lever best, N0 the Steady-state number and N1 the launches a month at the best Hit rate.

## 1. Creative score

**The score.** The Creative score as one large figure in the display font, a whole number, with "out of
100" beside it. Where a measure could not be read, the figure reads "Not scored" and one line names the
measure and why ("Working after week 1 could not be read: no hit has reached 28 days old
yet"); the bars of the measures that could be read still show.

**The seven bars**, in this order, labelled as the Page labels give them: Evergreen share, Spend
degradation, Working after week 1, Top-5 concentration, Outlier rate, Hit rate and
Ads that never got budget (the Low-spend rate). Each is a horizontal bar on its own scale from Poor at
the left to Good at the right (a measure where less is better, Top-5 concentration and Low-spend rate,
runs its anchors the other way, so Good is still at the right):

- the filled length is the measure's sub-score, 0 at Poor to 100 at Good, with a tick at Average (50);
- its colour is set by the unrounded sub-score: `--score-low` under 35, `--score-mid` from 35 to 65
  inclusive, `--score-high` over 65 (the tokens of `references/crux-brand.md`), so a founder sees at a
  glance which measures are weak;
- its value, in the format above, sits at the end of the track;
- "Poor" sits at the left end and "Good" at the right, on the first bar only, so the words are not
  repeated six times; the colour is extra, and the bar's length and printed value carry the reading.

Give the seven bars one title and a text alternative that read the measures and the score aloud.

**Top-10 turnover**, beside the score as an indicator, with the line "Shown beside the score and never
part of it": the latest complete quarter's "<n> of 10" ("3 of your top 10 ads are new this quarter"),
under the quarter's name. With fewer than 2 complete quarters it is left out.

**The Weakest point** is one line under the score, in these words: "Weakest point: <measure>, <value>
against <Good> for Good. <sentence>". The measure is the one with the lowest sub-score (the first in the
order above on a tie), chosen from the measures that could be read where the score reads "Not scored";
Top-10 turnover is never chosen, as it is not scored. The value is as its bar prints it and <Good> is that
measure's Good anchor, in the same format. The sentence is the one fixed below, so every run says the same
thing:

| Weakest measure | Sentence |
|---|---|
| Evergreen share | "Too little of your spend sits on ads that have lasted, so let your working ads keep spending: pause only ads that have stopped working (run `/audit-ads` to see which)." |
| Spend degradation | "New ads lose their budget after the first week, so focus on launching longer-lasting copy and longer-lasting hooks that keep Meta spending on them." |
| Working after week 1 | "Hits are not still working at 28 days, so extend them: make new versions of each hit, with a fresh angle on the same idea." |
| Top-5 concentration | "Five ads carry too much of your spend, so focus on evergreen concepts rather than short-lived trends or hooks." |
| Outlier rate | "Too few new ads become big spenders, so launch more ads, and more different ones: Outliers come from volume and range." |
| Hit rate | "Too few new ads become hits, so put quality over quantity: brief fewer, stronger ads, built on what already works." |
| Ads that never got budget | "Most new ads never get spend, because Meta gives budget to the ads it already trusts. Test new ads in smaller batches in their own ad sets, so you control the budget each test gets." |

For example, "Weakest point: Ads that never got budget, 88.0% against 70.0% for Good. Most new ads never
get spend, because Meta gives budget to the ads it already trusts. Test new ads in smaller batches in
their own ad sets, so you control the budget each test gets." Where the lowest sub-score is 100, every
measure is at Good or better and the line reads "Weakest point: none, every measure is at Good or
better." With no measure readable it is left out.

## 2. Spending power

**The opening sentences**, in body text between the title and the chart, never a caption, and in these
words on every run: "Whether rising spend has pushed your CAC up: if it has, you need more working ads,
not just more budget. The bars are your monthly Meta spend and the line your CAC; read the two figures
under it as the last 3 months against the 3 before."

**The chart**, inline SVG: one bar for each complete calendar month of the window (`spending_power`),
oldest at the left, for the month's spend, and over them a line for the month's CAC, with two vertical
axes: spend on the left from 0 to the largest spend plus 10%, CAC on the right from 0 to the largest
CAC plus 10%, each with light gridlines. The month is labelled under its bar ("Aug"), the year added at
a January and at the first month. The first and last CAC carry their figures, to two decimals. Bars
are the base grey; where the page shows both changes below, the last 3 months' bars are the Highlight
colour. A month with no CAC (no new orders) has a bar and a gap in the line. The chart needs 2 or more
complete months; with fewer the whole section is left out. Direct labels "Monthly spend" and "CAC" sit
on the first bar and the line, so there is no legend. Give the chart a title and a text alternative.

**Two figures** under it, side by side, each with its label and the line "last 3 months against the 3
before": "Spend <+22%>" (`spending_power_spend_change`) and "CAC <−10%>" (`spending_power_cac_change`),
as relative changes to the whole percentage, with their sign. A CAC fall is in `--positive` and a rise
in `--negative`; the Spend figure carries no colour. With fewer than 6 complete months there are no
figures, and one line says "Needs 6 complete months to compare the last 3 with the 3 before".

**The action line**: where the CAC change is above 0, "CAC rose <x>% over the last 3 months: check
Enough working ads for your spend? below."; otherwise "CAC held or fell: the plan below keeps enough
working ads behind it." With no figures it is left out.

## 3. Outlier engine

**The opening sentences**, in body text between the title and the first figure, never a caption, and in
these words on every run: "An Outlier is a new ad that has spent at least one standard deviation above
your average new ad: the few ads Meta scales hard. A few Outliers tend to carry much of your new ads'
spend, so how often you find one, and how fast, matters more than any single ad."

**Two figures**: "Outlier rate" (`outlier_rate`, to one decimal) with the line "<n> of <Launched ads>
new ads", and "Outliers' share of spend" (`outlier_spend_share`, a whole percentage). With no Outlier
the first reads "No Outliers" and the second is left out.

**A table, "Spend per new ad"**, one row each, in these labels and in whole units of the account's
currency: Mean, Median, Standard deviation, Outlier line, Highest.

**Hits and Outliers**, one line under the two figures, in these words on every run: "An Outlier is a new
ad Meta spent far more on than the rest; a hit is a new ad that kept a good CAC. Most Outliers are hits,
but an Outlier can be unprofitable. Only hits set how many new ads you need."

**Time to outlier**, three figures labelled "Fastest quarter", "Median" and "Slowest quarter": the days
from first spend to the line, as `days_to_line_p25`, `days_to_line_median` and `days_to_line_p75`,
under the heading "Days from first spend to the Outlier line". With no Outlier they are left out.

**The action line**: "At <N0> new ads a month, expect about <x> Outliers a month (new ads × your
Outlier rate). There is no target: Outliers come from launching more ads, and more different ones." x is
Expected outliers a month at current spend, to one decimal. With no Outlier it reads "No new ad has yet spent like an Outlier: more ads, and more different ones, give
Meta more to scale."

## 4. Creative rotation

**The opening sentences**, in body text between the title and the chart, never a caption, and in these
words on every run: "Whether new ads keep breaking into your top 10, or the same old ads carry the
account. Each quarter shows how many of its 10 biggest-spending ads first spent that quarter; neither
high nor low is good on its own, read it beside Evergreen share."

**The chart**, inline SVG: one bar for each complete calendar quarter, oldest at the left, of "New among
the top 10" (a whole number out of 10, so the axis is 0 to 10), each labelled with its figure ("3 of
10") and, under the quarter's name, "<n>% of the quarter's spend" (the new ads' share of the quarter's
spend, a whole percentage). Give it a title and a text alternative. With fewer than 2 complete
quarters the whole section is left out, and so is the indicator in Creative score.

**The action line**, one sentence: "Read this beside Evergreen share: high turnover is neither good nor
bad on its own."

## 5. Hits

**The opening sentences**, in body text between the title and the figures, never a caption, and in these
words on every run: "A hit is a new ad that Meta gave real budget and that kept a good CAC through its
first month. Your hit rate and how long each hit lasts set how many new ads your spend needs. The more
of your new ads become hits, and the longer they last, the fewer you have to make."

**Four figures**, each with its label and its value in the formats above:

- "Hit rate": the Hit rate ("12%") with "1 in 8" and "of <n> ads launched at least 28 days ago", and
  under it the hit test, in these words on every run: "A new ad counts as a hit when, in its first 28
  days, it spent at least the Spend bar, its CAC over those 28 days was within 20% of your account's,
  and it had at least one 5-day stretch at a good CAC.";
- "Ads that never got budget": the Low-spend rate, a whole percentage;
- "Spend a hit carries": Viable spend per hit, whole units of the account's currency;
- "Spend bar": the amount, whole units, with "the 300 floor" where 3 times the Spend per viable ad is
  under it, and under it the Spend bar's explanation, in these words on every run: "**Spend bar:
  <amount>.** A new ad must spend at least this in its first 28 days to count as a hit, so an ad that
  looked good on a few pounds of spend does not count. It is 3 days of what a working ad typically
  spends, and never less than <currency symbol>300." The amount carries the account's currency symbol, and
  "pounds" reads as the account's currency (dollars, euros).

**One stacked bar**, inline SVG, "Your new ads at 28 days": the Hit rate ads split into hits (`hits`),
ads that never got budget (`low_spend_ads`) and ads that got budget but are not hits
(`spent_bar_not_hit_ads`), in the three category fills named by direct labels, "Hits", "Never got budget"
and "Got budget, not a hit", with their whole percentages. The three are shares of one base, so they
add to 100%. Give it a title and a text alternative.

**Hits and Outliers**, one line under the stacked bar, in the words given under the Outlier engine: "An
Outlier is a new ad Meta spent far more on than the rest; a hit is a new ad that kept a good CAC. Most
Outliers are hits, but an Outlier can be unprofitable. Only hits set how many new ads you need."

**The action line**: "A hit carries <Spend a hit carries> of spend, so <Spend bar> is the least
a new ad must spend to count." Where the Viable lifespan is a lower bound it adds "Counts may read a
little high; How it's worked out has the detail."

## 6. Ads needed each month

The section answers "how many ads does this spend need next month", says first whether the account
launches that many, and then what next month's ads are made of. The slider's formula is CTC's "work
backwards from spend". Its parts, in this order:

**a. The answer.** Plain HTML, written into the page and never by the script, so it prints and reads with
scripts off. Two sentences in these words, with the figures filled in and in bold: "At your current spend
you need **<N0> new ads a month**. Over the last 3 months you launched **<P> a month**." P is the Current
pipeline to the nearest whole ad, and a figure shown is the figure the verdict uses. Under them one
verdict line, set by N0 against P, with "within 10%" meaning the whole-ad P is within 0.1 times N0 of N0 either way (an N0 of 47 keeps pace from 43 to 51, and
an N0 of 0 only at a P of 0):

| P against N0 | Verdict line |
|---|---|
| within 10% | "You are keeping pace." |
| below that | "Make about <N0 − P> more a month." |
| above that | "You are launching more than your spend needs." |

Where the user gave a Budget, a second line: "At your Budget of <the Budget> a month you need <ads_for_spend
of the Budget> new ads a month." Without a Budget it is left out.

**The breakdown**, straight after those lines and before Holding you back: next month's new ads (the
Roadmap's first row), built from the headline and adjusted in three parts that add up. Plain HTML,
written into the page and never by the script, so it prints and reads with scripts off, and it does not
move with the slider. The figures are the whole ads of `references/method.md`, "Next month's ads, in
three parts", which gives the rounding; <x>, <y> and <z> are the parts after it. Each part is a label and
a line, in this order and in these words with the figures filled in and in bold:

| Part | The line | Left out |
|---|---|---|
| To stay level | "Your working ads last about <D> days, so the <⌈L0⌉> your spend needs mostly turn over each month. At your hit rate of <h>% that takes <x> launches to replace." | never |
| To catch up (y above 0) | "You are <g> working ads short today; making them up adds <y> next month, once." | where there is no gap, or <y> is 0 |
| Ahead (y below 0) | "You have <g> more working ads than your spend needs today, so next month needs <−y> fewer, once." | where there is no gap, or <y> is 0 |
| To grow | By <z>, below | where <z> is 0, as with no Budget and no spend change |

<D> is the Days viable per hit to the whole day, <⌈L0⌉> the Viable ad stock at current spend rounded up
to a whole ad, and <h> the Hit rate in the format above. <g> is the gap between L0 and today's viable ads,
rounded up to a whole ad; where the verdict is About right, "short" reads "under". <y> is the whole-ad
part, shown without its sign. The To grow line, by <z>:

| Where | The line |
|---|---|
| <z> above 0 (spend rises) | "Your Budget raises spend next month, which needs <z> more." |
| <z> below 0 (spend falls) | "Spend falls next month, so <−z> fewer are needed." |

Then **Total**: "<Ads to launch(1)> new ads next month. After that, about <N0> a month at this spend." The
Total is the Roadmap's Ads to launch for its first row exactly, and the parts above add up to it. The second
sentence is said only where spend is held flat (no Budget); with a Budget it names the Budget month's
figure instead, "After that, about <ads_for_spend of the Budget> a month at your Budget." Where Ads to
launch(1) is 0, the three parts and the Total are replaced by one line: "None needed next month: the
working ads you have will cover it."

**b. Holding you back.** The Limiting factor as a pill in the Highlight colour (On track, Volume, Both,
Finding hits or Keeping hits), then a table with one row for each Lever, in this order and with
these labels: "Launches a month", "Hit rate", "Days a hit works", and the columns Now, Best and
Need. Now and Best are in the formats above (Best reads "no best yet" where it is null; Days a hit
works has "at least" before Now where the Viable lifespan is a lower bound). Need is filled only on the
Levers the to-hit moves (the table below), with "beyond your best" after a figure above its best, and
"-" on the others. Under it the action line: "To hit: <the to-hit, figures in bold>." Where the to-hit
raises the Hit rate (Both and Finding hits), it adds "At today's hit rate it takes <N0> a month."
With On track it reads "To hit: nothing. Keep launching <P> a month."

**c. The slider.** A range input over monthly spend, labelled "Monthly spend", running from half current
spend to 3 times it (wider where the Budget lies outside that), with `step="any"` and set to current
spend when the page opens. Two marks under the track name "Current spend" and, where the user gave a
Budget, "Budget", each at its place on the track, and two buttons set the slider to each. Beside it the
monthly spend at the slider's position, in whole units of the account's currency, as an `<output>`. The
slider, its marks and its buttons sit together in the page's `wb-live` container, hidden, and the
script shows them.

**d. The formula**, in these words, in the terms: "New ads = monthly spend × Viable share target ÷
(Hit rate × Viable spend per hit)". Under it the same sum with the account's numbers, "<spend> ×
<target>% ÷ (<Hit rate> × <Viable spend per hit>) = <the quotient to two decimals>, rounded up: <ads>
new ads a month". Both sit outside `wb-live`: the page is written with the sum at current spend, where
`<ads>` is the Steady-state number N0, so it reads and prints with scripts off, and the script rewrites
the sum at the slider's spend.

**e. The stock check, in plain words.** The Ad stock check at current spend, which the slider does not
move, under the heading "Enough working ads for your spend?": "You have <S> ads working today; your spend
needs <⌈L⌉> working at once." Then one line: "Having enough today does not lower the monthly number: your working ads last about <D> days, so nearly all of them need replacing within a month, and about 1 in <⌈1 ÷ h⌉> launches becomes one." (<D> is the Days viable per hit to the whole day.) Then a pill and its action line. The pill is "Short <g>" below 80% of L,
"About right" from 80% to 150%, and "Ahead <g>" above 150%, g being the difference between ⌈L⌉ and S.
Each verdict has its own pill colour and always carries its words, so the check does not depend on colour
alone; no other mark on the page is a verdict pill. The action line, by verdict:

- Short: "Launch <N0> a month to keep up; next month's plan adds the Catch-up, once."
- About right: "Launch <N0> a month to keep up."
- Ahead: "Launch fewer for now: you have more working ads than your spend needs, so they wear down first."

Where the Viable lifespan is a lower bound the line ends "Counts may read a little high; How it's
worked out has the detail."

**f. The Roadmap.** The Month-by-month plan's Budget line and Video and image split line (both under How it's worked out), then its table cut to the columns
Month, Spend, Video and Image (only with a Format split), Ads to launch, Expected to work and Go live
by, one row for each month, with the same figures as the full table on How it's worked out and the same
two lines under it. The Catch-up line is left to How it's worked out.

## 7. What it's worth

The last section of the Creative deep dive: what the extra working ads are worth, in a money figure a
brand can use as its ad production budget. Plain HTML, written into the page and never by the script, so
it prints and reads with scripts off, and it does not move with the slider. The figures are On the table
(`references/method.md`, step 19) and current spend (the last complete month's, the plan's), each worked
once from its source figure and shown rounded once; the sums use the unrounded figures. It opens with two
sentences in these words: "What getting your target share of spend onto working ads is worth at today's
spend. Use the monthly figure as your ceiling for making ads: below it, the extra ads pay for themselves."
Then four lines, in this order and in these words with the figures filled in and in bold, and one line
under them:

| Line | In these words | The figure |
|---|---|---|
| New customers | "+<m> new customers a month at the same spend" | m is On the table's 90-day gain in new customers (`customers_week_gain` ÷ 7 × 90) ÷ 90 × 365 ÷ 12, to the nearest whole customer, never below 1 |
| CAC | "CAC <CAC now> → <CAC at target> (<change>%)" | `blended_cac` and `blended_cac_at_target` to two decimals in the account's currency, and `blended_cac_change` as a signed whole percentage |
| Worth a month | "Worth about <Worth> a month" | the Worth is current spend times (1 less CAC at target over CAC now), to whole units of the account's currency: what the same new customers would cost less |
| Production budget | "That is about <Worth ÷ (N0 − P)> for each of the <N0 − P> extra ads a month you need: make them for less and they pay for themselves." Where N0 is not above P: "That is about <Worth ÷ N0> for each of the <N0> ads a month you need." | N0 and P are the whole ads of Ads needed each month; the per-ad figure is the unrounded Worth over the count, to whole units |

Under the four, one line: "It assumes the CAC gap between working and other spend holds as the share moves."

Where there is nothing on the table (the Viable share v0 at or above the Viable share target), the opening
sentences, the four lines and the assumption line give way to one sentence, with no figure: "Your share
of spend on working ads is already at your <target>% target, so the ads you need hold today's CAC rather
than lower it." <target> is the Viable share target as a whole percentage.

## The to-hit

One wording of what the account has to hit, used by Holding you back and, with its figures in bold, by
its action line. h_best and N1 are the hit rate best and the launches at it; h_need and D_need the hit
rate and Days viable per hit that launching B a month would need.

| Limiting factor | The to-hit | Need on |
|---|---|---|
| On track | "nothing: keep launching <P> a month" | none |
| Volume | "launch <N0> a month" | Launches a month |
| Both | "lift your hit rate to <h_best>% (your best), then launch <N1> a month" | Hit rate (h_best); Launches a month (N1) |
| Finding hits | "lift your hit rate to <h_need>%, launching <B> a month (your best)" | Hit rate (h_need) |
| Keeping hits | "keep a hit working <D_need> days, launching <B> a month (your best)" | Days a hit works (D_need) |

Where h_need or D_need is above its best, "(beyond your best)" follows it. Where B is null (fewer
than 3 complete months), h_need and D_need are null: the to-hit reads "not enough launch history yet
to name a target" and the Need column is empty.

## The script

The slider is two blocks at the end of the body, between the page and the footer, both inline and with
no network call: the figures, as one `<script type="application/json" id="wb-figures">` block, and the
script, one plain `<script>`, which reads them. Copy the script below into every page verbatim, and fill
in only the figures block.

**The figures block** holds one JSON object, these keys and no others, each unrounded:

| Key | Holds |
|---|---|
| `currency` | the symbol or code the account's money is shown in, as a string (a code takes a space after it: `"USD "`) |
| `currentSpend` | the last complete month's spend, a number |
| `budget` | the Budget as a monthly figure, a number, or `null` with none |
| `target` | the Viable share target, a number from 0 to 1 |
| `hitRate` | the Hit rate, a number above 0 and up to 1 |
| `spendPerHit` | the Viable spend per hit, a number above 0 |

It is JSON, not JavaScript: double-quoted keys, `null` for none, bare numbers with no thousands
separators, currency symbols or percent signs, and no trailing comma.

```html
<script type="application/json" id="wb-figures">
{"currency": "£", "currentSpend": 18600, "budget": null, "target": 0.6, "hitRate": 0.4, "spendPerHit": 595}
</script>
<script>
(() => {
  const $ = id => document.getElementById(id);
  const F = JSON.parse($("wb-figures").textContent);
  const money = n => F.currency + Math.round(n).toLocaleString("en-GB");
  const hit = h => (h < 0.1 ? (h * 100).toFixed(1) : Math.round(h * 100)) + "%";
  const quotient = s => s * F.target / (F.hitRate * F.spendPerHit);
  const ads = s => Math.ceil(Number(quotient(s).toFixed(9)));

  function render(s) {
    const n = ads(s);
    $("wb-spend").textContent = money(s);
    $("wb-sum").textContent = money(s) + " × " + Math.round(F.target * 100) + "% ÷ ("
      + hit(F.hitRate) + " × " + money(F.spendPerHit) + ") = " + quotient(s).toFixed(2)
      + ", rounded up: " + n + " new ads a month";
  }

  const slider = $("wb-slider");
  const lo = F.budget === null ? F.currentSpend / 2 : Math.min(F.currentSpend / 2, F.budget);
  const hi = F.budget === null ? F.currentSpend * 3 : Math.max(F.currentSpend * 3, F.budget);
  slider.min = lo; slider.max = hi; slider.value = F.currentSpend;
  [["wb-mark-current", F.currentSpend], ["wb-mark-budget", F.budget]].forEach(([id, v]) => {
    const el = $(id);
    if (el && v !== null) el.style.left = (v - lo) / (hi - lo) * 100 + "%";
  });
  [["wb-set-current", F.currentSpend], ["wb-set-budget", F.budget]].forEach(([id, v]) => {
    const el = $(id);
    if (el) el.addEventListener("click", () => { slider.value = v; render(v); });
  });
  slider.addEventListener("input", () => render(Number(slider.value)));
  render(F.currentSpend);
  $("wb-live").hidden = false;
})();
</script>
```

The page's elements for it: `wb-live` (the container of the slider, its marks and buttons, `hidden` in the HTML), `wb-slider` (the range input), `wb-spend` (the output beside it),
`wb-sum` (the formula's sum with the account's numbers, outside `wb-live`, written at current spend),
`wb-mark-current` and `wb-mark-budget` (the two marks, the second only with a Budget), `wb-set-current`
and `wb-set-budget` (the two buttons, the second only with a Budget).

**The pre-save check.** Before saving the page, read it back and check that:

1. it holds both blocks, the `wb-figures` block and the script, and the script is the one above, copied
   verbatim;
2. `wb-figures` parses as JSON and holds every key in the table, each of `currentSpend`, `target`,
   `hitRate` and `spendPerHit` a finite number (`hitRate` and `spendPerHit` above 0),
   `budget` a number or `null`, and `currency` a non-empty string;
3. every figure equals its step 4 figure, and the sum in `wb-sum` ends on N0 new ads a month;
4. the elements `wb-live`, `wb-slider`, `wb-spend` and `wb-sum` exist.

Where any check fails, fix the page and check again. Where a check still fails, write the line "The spend
slider could not be built on this run" in plain HTML in the slider's place on the page (the answer, Holding
you back, the stock check and the Roadmap stay), and again in This run on How it's worked out, rather than
leave the page showing only its no-JavaScript text without saying so.

# How it's worked out

Seven parts, in this order.

## Month-by-month plan

The Ads to launch each calendar month, so next month's ads can be briefed. No chart: the table is the plan. Ads needed each month on the Creative deep dive shows the same table cut to fewer columns, with the same figures.

**First line, the Catch-up.** Where S is below ⌈L⌉ (the gap is above 0 whole ads) and the To catch up part
is above 0: "You are <g> working ads short, so <month 1's name> adds <y> launches, once, on top of keeping up."
Where the verdict is About right, "short" reads "under what your spend needs". <y> is the To catch up
part of next month's ads. The first line is left out where S is at or above ⌈L⌉, and the plan then needs
no catch-up.

**The Budget line.** The Budget as the user gave it (the monthly figure and the Budget month, saying
when the month was the default of 3 months from now), or "No Budget given: current spend held
flat for 3 months." Under it, the ads a month at each spend, in these words with the figures filled
in: "At your current spend of <last complete month's spend> a month, <N0> new ads a month keep up; at
your Budget of <the Budget> a month, <ads_for_spend of the Budget> a month." Without a Budget only the
first clause is said.

**The Video and image split line** sits between the Budget line and the table: the split the table
uses ("Video and image split: 30% video, 70% image of your last 8 weeks' spend", with the Name
coverage beside it, "names gave the format of 82% of that spend"), or "No video and image split: new
ads are shown as a total."

**The table.** One row for each calendar month, from next month to the Budget month (3 months with
no Budget). Its columns, in this order:

| Column | Holds |
|---|---|
| Month | The month's name and year. |
| Spend | That month's spend (its daily spend times its days), in whole units. |
| Working ads needed | ⌈L(k)⌉: the daily spend times the Viable share target over the Spend per viable ad, rounded up to a whole ad. |
| Expected to wear out | ⌈Wearing out(k)⌉, a whole number. |
| Video | The month's Ads to launch that are video: a whole number. Only with a Format split. |
| Image | The month's Ads to launch that are image: a whole number. Only with a Format split. |
| Ads to launch | Ads to launch(k), the total: a whole number, never below 0; "None needed" where it is 0. |
| Expected to work | ⌈Expected to work(k)⌉: the Ads to launch times the Hit rate, rounded up to a whole ad. |
| Go live by | The Live-by date; "Already due" where that date has passed. |

The Video and Image columns are present only with a split. They divide each month's Ads to launch by
largest remainder, so in every row video plus image equals Ads to launch. With no split, the
table has the Video and Image columns left out entirely.

Two lines under the table, in these words: "Figures are rounded up to whole ads, so a row can be one
out." and "Launch about a quarter of each month's ads each week from its Go live by date."

The action: the first row's new ads go live by its Go live by date, and each later row's by its own.
Where you are Ahead, one sentence says next month's launches are lower once, because the working ads above
what spend needs wear out on their own, and later months return to Launches a month needed. Where the
Budget is below current spend, one sentence says the working ads above what spend needs wear out on their
own, so Ads to launch fall below Launches a month needed. A month with surplus shows "None needed".

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
the same format as the figures below. The chart shows the curve as measured, before the Recent fit.

Under it, one line: "New ads read: <n>", the Launched ads the curve rests on, and, below 10, one
sentence saying the curve is rough.

## The figures

The figures behind the Creative deep dive, one line each, in this order and in the formats above:

1. **Hit rate**: "1 in 8, 12%", with the Hit rate ads it rests on ("from <n> ads launched at least 28
   days ago"), and under it the hit test in the words of the Creative deep dive.
2. **Viable lifespan**: the days to one decimal, the curve's sum times the Recent fit, with "at least"
   before it where it is a lower bound. Under it, one line: "The survival curve sums to <W_curve> days;
   the Recent fit scales it by <c> to match your last 28 days." (`viable_lifespan_curve` and `recent_fit`,
   to one decimal and two.)
3. **Days viable per hit**: the days to one decimal, with "at least" where the Viable lifespan is a
   lower bound.
4. **Spend per viable ad**: to two decimals, a day.
   After it, three lines in the same formats: **Spend bar**, the amount in the account's currency (with
   "the 300 floor" where 3 times the Spend per viable ad is under it), and under it its explanation in
   the words of the Creative deep dive; **Low-spend rate**, as a
   percentage, with the hits, low-spend ads and ads that spent the bar but were not hits beside it,
   which add up to the Hit rate ads; **Viable spend per hit**, in the account's currency, rounded to
   whole units.
5. **Viable share and its target**, in these words with the figures filled in: "Viable share: your
   best weeks (the 90th percentile of <n> weeks counted) put <P90>% of spend on viable ads, so the
   target is <target>% (<P90>% times 1.2, never above 100%). <m> weeks were left out: the first 6 for
   warm-up and <m less 6> for thin spend." Where fewer than 8 weeks were counted, add "Only <n> weeks
   were counted, so the target is rough."
6. **Each Lever best**, with the periods it counted, one line each: "Launches best: <B> a month (your best
   3 months in a row)"; "Hit rate best: <h_best>% (the 90th percentile of <n> launch months)"; "Days
   viable per hit best: <D_best> days (your best of <n> launch quarters)". A null best reads "no best
   yet" with how many were counted and how many it needs ("2 launch months counted, 4 needed"; for
   launches, "<n> complete months, 3 needed").
7. **CAC and spend share by group, last 90 days**: one table, a row for each of Working, Test phase,
   Worn out and (only where it holds spend) Other, with the columns Share of spend, New customers and
   CAC (two decimals). A group that spent and has no customers reads "no new customers" and is
   named in This run. Under it, one line: "On the table is shown under What it's worth."
   Last, the biggest waste (`biggest_waste`) with its share of spend: "<n>% of your spend is on ads that have stopped working: run `/audit-ads` to see
   which to pause." for Worn out, or "<n>% of your spend is on ads still in their test phase: launch
   fewer, stronger ads." for Test phase, left out with nothing on the table. The page names no ad.
8. **The Self-check**, as one line in these words with the figures filled in (the actual and the
   predicted mean daily counts of viable Launched ads over the last 28 days, each to one decimal, and the
   Recent fit to two): "Check: over the last 28 days you averaged <actual> working ads; your year's curve
   predicts <predicted>. The plan scales the curve by <c> to match your recent ads." Where the Recent fit
   was held at 0.5 or 2, the line adds "Your recent ads differ from the year's by more than the plan will
   adjust for, so read the plan as a guide." The line is these words and no others: the page gives no cause
   for a difference.
9. **The Creative score**, in this order, under a heading of its own:
   - **The bands table**: "Creative score: <score> out of 100", a whole number, and under it a table with a row
     for each of the seven measures in this order (Evergreen share, Spend degradation, Viable after week 1,
     Top-5 concentration, Outlier rate, Hit rate, Low-spend rate) and the columns Measure, Value, Poor,
     Average, Good and Score. Values and anchors are percentages to one decimal, Spend degradation with its
     sign (−48.1%); the Score is the sub-score to the nearest whole number. Under it one line: "The score is
     the plain mean of the seven, each placed on fixed bands: 0 at Poor, 50 at Average, 100 at Good, in a
     straight line between and capped." Where a measure could not be read, the score is not shown and one
     line names the measure and why ("Viable after week 1 could not be read: no hit has reached 28 days
     old yet").
   - **The Outlier stats**: "<n> Outliers among <Launched ads> Launched ads (<rate>%), <share>% of their
     spend", a table of the spend per Launched ad (Mean, Median, Standard deviation, Outlier line, Highest;
     whole units of the account's currency), and "Days from first spend to the line: <p25> (fastest
     quarter), <median>, <p75> (slowest quarter)". With no Outlier the first line reads "No Outliers" and
     the days line is left out.
   - **Top-10 turnover**, with the line "Shown beside the score and never part of it": a table with a row for
     each complete calendar quarter and the columns Quarter, New among the top 10 ("<n> of 10") and Share
     of the quarter's spend (the new ads' spend over the quarter's). With fewer than 2 complete quarters
     the table and its line are left out.
10. **Spending power**: a table with a row for each complete calendar month of the window and the
    columns Month, Spend (whole units), New orders (purchases without a Growth Brain) and CAC (two
    decimals; "none" where a month has no orders), and under it the two changes in the words of the
    Creative deep dive ("Spend +22%, CAC −10%: the last 3 complete months against the 3 before"), or,
    with fewer than 6 complete months, "Fewer than 6 complete months, so the last 3 are not compared
    with the 3 before." Left out with fewer than 2 complete months.
11. **Expected outliers**: one line, "At current spend, <N0> new ads a month give about <x> Expected
    outliers a month" (x to one decimal), and, with a Budget, the same at the Budget with `ads_for_spend`
    of it. With no Outlier, "No Outliers, so none are expected."

## Terms

The Page labels table above, as Label, Term and Says, for the labels the Creative deep dive and the Month-by-month
plan used.

## This run

A short list:

- the Source: the Growth Brain connector's name, the Meta connector's name, or the file named;
- the CAC basis: with a Growth Brain, first-party new orders; otherwise platform-attributed, Meta's
  own cost per purchase, counting every purchase Meta claims;
- the Budget, as the monthly figure, its daily equivalent and the Budget month, or "None given"; the
  Month-by-month plan's months are calendar months counted from next month, and its Go live by dates are
  the 1st of the month less the Days to clear Ramping;
- the Format split used, as "30% video, 70% image" and whether it was the proposal or the user's
  own, with the Name coverage, or "None"; Format is read from the ad name alone, then from 3-second
  video plays (`video_views` on a Growth Brain) where the name gives neither or both kinds, or from
  the name alone where the brain's mart held no `video_views`;
- the Healthy lifespan, the age by which half the ads viable at the curve's peak have stopped being
  viable, with its quartile range ("a quarter by day 9, three quarters by day 40"; an end the
  curve did not reach reads "not reached"), and the Days to clear Ramping;
- the spend slider, only where the pre-save check could not build it: "The spend slider could not be
  built on this run" (a run where it was built carries no line);
- the Self-check, as "Self-check passed" or "Self-check failed", with the difference between the predicted
  and the actual as a percentage of the actual to the whole percent, and the 25% it is held to: it passes
  within 25% and fails beyond it, and it fails where the actual is 0. The Recent fit is named beside it,
  as "Recent fit <c> (<actual> working ads a day on average over the last 28 days against <predicted>
  predicted)", and "held at <0.5 or 2>" where it was held. A failed check carries no cause beyond the
  Self-check line's words;
- the Limiting factor, as one line in these words with the figures filled in: "Limiting factor:
  Both (launches needed <N0> a month, your best <B>; at your best hit rate <N1>)." The name is On
  track, Volume, Both, Finding hits or Keeping hits; a null B or N1 reads "no best yet". Where
  both the hit rate best and the days viable per hit best are null, the line adds "not enough
  history to compare";
- the groups left out of On the table, named, where a group spent and had no customers in the 90
  days (the nearest worse group's CAC was used, or it was left out of the customers), or "None";
- where the Viable lifespan is a lower bound, this note, in these words with the figures filled in:
  "The Viable lifespan of <W> days is a lower bound: the survival curve was still at <share>% at
  <age> days, the last age with 3 or more ads, so ads were still viable when the data ran out. The
  Steady-state number and the new ads in the Month-by-month plan are therefore a ceiling: they may read a
  little high." The trigger is a survival rate of 25% or more at the last counted age. A curve that
  ends below 25% carries no such note;
- the months Spending power charts, as the first and last complete month, or "None";
- the window: the first and last date read, the earliest first spend a Launched ad can
  have (the window's first day plus 42 days; an ad that first spent earlier is not in the curve), the last complete day (today) and any later day left out
  as still loading, the last complete calendar month used for current spend and that spend a day outside
  the awareness and lead campaigns, the 3 months behind the Current pipeline, the 8 weeks behind the Format split, and the timezone the
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
  campaigns (<names>) were used, no Budget was given, so current spend was held flat for 3 months, and no Format split
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
house style, money, counts of ads and Page labels as the Creative deep dive. It holds these, in this order,
under a title of "Meta ad roadmap" with the brand and the date:

1. **Budget**: the Budget as the Month-by-month plan's Budget line gives it (the monthly figure and
   the Budget month), or "No Budget given: current spend held flat for 3 months", with current spend a
   month and a day beside it, and under it the Budget line's ads a month at current spend and at the
   Budget. Where the page shows the Catch-up line ("You are <g> working ads short, so <month 1's name> adds
   ..."), it follows as the file's next line, in the page's words.
2. **The months**: the Month-by-month plan's table, with the columns Month, Spend, Video and Image
   (only with a Format split), Ads to launch, Expected to work and Go live by, one row for each month,
   and its Video and image split line, then the table's rounding line and its line on launching a
   quarter of the month's ads each week. Every figure is the page's whole number.
3. **Hit rate**: one line, "<1 in N, x%> of your new ads are hits (Hit rate: <the Says of Hit rate>), and
   a hit stays working (<the Says of working ad>) for about <the Days viable per hit, to the
   whole day> days" (with "at least" before the figure and "so the ad counts may read a little high"
   after it where the Viable lifespan is a lower bound).
4. **Holding you back**: one line, "<Limiting factor>: <the to-hit, in the words of the to-hit
   table, without bold>." With On track, "On track: nothing to hit. Keep launching <P> a month."
5. **Spend one working ad carries**: one line, "One working ad carries <figure> a day of spend, so a
   day's spend of <current spend a day>, aiming at <target>% of it on working ads, needs <⌈L⌉> working ads
   live at once, and <the Steady-state number> launches a month keep up".

It carries no heading beyond the title and these five, and no method, no chart and no survival
curve. A run that stopped before the page writes no Roadmap file.
