---
name: plan-ad-volume
description: Meta ad volume forecast. Use when the user asks how many new Meta ads they need a week, how many ads their spend needs, or how long their ads last, or how many ads a bigger Meta budget needs. Runs on the brand's Growth Brain, else a Meta connector, else one Ads Manager export.
---

# Meta ad volume forecast

Work out how many new Meta ads a week the account's spend needs, from the account's own Survival
curve and Hit rate, and produce `meta-ad-volume-<date>.html`: a page that opens on a Scorecard a
founder reads in seconds, three answer cards (whether the account has enough working ads, what is
holding it back, what is on the table) and three charted panels behind them, with the week-by-week
plan, the curve, the figures and the method on a second tab, How it's worked out. It is laid out as
`references/page-layout.md` fixes it. Then offer the Roadmap as `meta-ad-roadmap-<date>.md` for the
creative brief and say when to run it again. Run the steps in order. The user sees only the chat and the
page, never this skill or its references: say what the ads showed, in plain words with the figures,
and never cite a file, a rule or a query. The terms
Viable ad, Viable share, Viable share target, Viable ad stock, Launched ad, Survival curve, Viable lifespan, Hit rate, Days viable per
hit, Healthy lifespan, Spend per viable ad, Days to clear Ramping, Self-check, Ad stock check, Lever, Lever best,
Limiting factor, On the table, Worn out now, Wearing out, Current pipeline, Steady-state number, Budget,
Roadmap, Catch-up, Ads to launch, Expected to work, Live-by, Budget ladder, Format, Name coverage, Format split,
Roadmap file, Awareness campaign, Lead campaign, Unattended run, Source, Brain line, Scorecard, How it's worked out
and Page label are those of
`references/glossary.md`, and Next run is the repo's shared term; use them as written here and on
How it's worked out. The Scorecard, the Roadmap file and the chat's close speak to the user in the Page labels
`references/page-layout.md` gives each term instead. The ad
statuses and CAC are judged exactly as `references/fatigue.sql` judges them.

## Unattended run

A run is unattended when its message says so or says not to ask, or when it is a scheduled session
or routine: nobody is there to answer. It asks nothing at any step. Where a step would ask, it takes
that step's recommended answer, and only where a step recommends none (several Growth Brains and
none plainly the brand's, no export attached) does it stop with one line saying what it needed.
Its defaults, every one of them:

- Step 3 sends no message and takes the proposed retargeting, awareness and lead campaigns as confirmed.
- It plans current spend held flat for 4 weeks: no Budget is asked for or used, so the Budget ladder
  shows its three rungs at current spend, 1.5 times and 2 times it.
- It uses no Format split, so the Roadmap shows new ads as a total.
- The page's How it's worked out says the run was unattended, in the words `references/page-layout.md`
  gives.
- The Close asks nothing: it saves the Roadmap file beside the page without offering it, and gives
  the Next run without the calendar offer.

## 1. Connect

Take the ad-by-day rows from the first of these Sources that holds them, and say which in a line:

1. **A Growth Brain**: a connector named `<Client> - Growth Brain` that offers `list_tables` and
   `run_sql`. With several, use the one whose client name plainly matches the brand the user
   named; ask which one only when none match or more than one does.
2. **A Meta connector** in the session, probed as `references/exports.md` sets out.
3. **One Ads Manager export** the user gives: a file already in the conversation counts, else ask
   for it in one message, with the steps of `references/exports.md` in plain words, and wait.

A Growth Brain is read for the last 365 complete days; a Meta connector or an export for the last
180.

**Done when** the run names its Source, and for a Meta connector or an export holds the rows for
the last 180 complete days, or for the days it holds when the user cannot give more.

## 2. Read

A session with no code or analysis tool: say in one line that the plan needs one, and stop.

**Without a Growth Brain**, read the rows as `references/exports.md` sets out, then list the
campaigns, count the Launched ads and work out the Format split default as below.

**With a Growth Brain**, call `list_tables` once with no arguments, then once naming only
`<client>-meta_performance` (`<client>` is the prefix the roster carries). If that mart is missing,
say in one line that the brain holds no Meta ad table and take the next Source from step 1 (a brain
is still connected, so the page carries no Brain line). The mart is one row per day, campaign, ad
set and ad. Read its columns from the second call and take these, never assuming one: the date;
the ad id; the ad set id and the campaign id; the three display names (campaign, ad set and ad);
spend; new orders; ad age; campaign type; and `video_views`. Group by the ad id, never a display
name: a rename keeps the id, and two ads can share a name. Read the last 365 complete days.
Without an ad set id or a campaign id, that display name stands in as its key, each ad taking the
one on its latest row. A missing column other than those two ids, campaign type and `video_views`:
name it in one line and stop. Without campaign type, the intake proposes retargeting campaigns from
their names alone. Without `video_views`, Format falls back to the name only, and an ad whose name
decides nothing counts as image.

On a brain, use new orders as the CAC denominator and never the purchases Meta claims, which are
fractional and not the same count. Never sum reach. Leave out rows with no ad (an ad id of
"Unknown", which takes in unrendered templates).

**List the campaigns**, from either Source, before the Launched ads are counted. With a Growth
Brain, one `run_sql` query listing each campaign's key (its id, or its name without one), name,
type and spend over the last 7 complete days, for campaigns with spend in the window; without one,
the same list from the rows read, by name alone, as no campaign type is held. From it, propose three
sets for the intake:

- **Awareness campaigns**: those whose name contains awareness, reach, video views, VV, engagement
  or traffic, or reads as one of those, or, through a Meta connector, whose objective is neither
  sales nor leads.
- **Lead campaigns**: those whose name contains lead, leads, giveaway, competition, comp, signup,
  sign-up or sign up (whole words, ignoring case), or reads as one of those, or, through a Meta
  connector, whose objective is leads. A campaign proposed as awareness is not proposed here too.
- **Retargeting and existing-customer campaigns**: those whose campaign type is `RET`, plus those
  whose name contains retargeting, RT, remarketing, existing or retention, or reads as one of
  those. A campaign proposed as awareness or as a lead campaign is not proposed here too.

**Count the Launched ads and work out the Format split default** before anything else is asked,
leaving out the proposed awareness and lead campaigns: the Launched ads are those whose first day of spend
falls after the window's first day, and the Launched ads at least 28 days old are those whose first
spend is at least 27 days before the last complete day. The Format split default and its Name
coverage are step 4's definitions, held here so the intake quotes real figures. Without a Growth Brain, compute them from
the rows. With a Growth Brain, open `references/intake.sql`, make its edits 1 and 2 (the mart's
name, in `mart_rows` and in `video_plays`, with any column names from the second call; and the
proposed awareness and lead campaign keys together), and run it with `run_sql` as one statement. It returns
`launched_ads`, `hit_rate_ads` (the Launched ads at least 28 days old) and the Format split default
(`video_pct`, `image_pct`) with its `name_coverage_pct`, all three null where no Launched ad's first
spend fell in the last 8 complete weeks. With fewer than 20 Launched ads at least 28 days old, stop
here, before step 3, with one line: "<Brand> does not yet launch enough ads to read a hit rate: <n> ads
launched at least 28 days ago in the last <365 or 180> days, and it needs 20." Write no page and ask
nothing more. This holds for an unattended run too.

**Done when** the rows are read from a connector or export and grouped by Ad ID and Day, the
window's first and last dates are named, the run holds the campaign names with their spend over
the last 7 complete days and all three proposed sets of campaigns, every ad carries a Format (step 4
sets the rule), and the Launched ads at least 28 days old are counted at 20 or more with the Format split default and
its Name coverage worked out for the proposed awareness and lead campaigns (or no proposal, where no Launched
ad is recent), or the run has stopped with that one line; or, with a Growth Brain, every column
above is named from the second call, or the run has stopped with a line saying which is missing, or
has moved to the next Source.

## 3. Intake

Send one message, then wait for the reply:

1. The method in brief, in these words with the days and basis filled in (365 days from a Growth Brain,
   180 otherwise): "I'll judge every Meta ad on every day of the last 365 days by its CAC, the way an
   ad audit does. Then, from every ad you launched in that time, I'll work out your hit rate (how
   many of your new ads become viable: their CAC holding up, under 20% above your account average
   and not climbing off its best, or recovering towards it) and how long the ones that work stay viable. That tells me how many
   viable ads your spend needs live at once, aiming at the best share of your spend your account has
   put on viable ads, and so how many new ads a week it takes to hold them.
   CAC here is <basis>. If you give me a monthly budget, I'll step your spend to it week by week and
   work out the new ads each week." The basis is "spend over your own new orders" from a Growth Brain,
   and "Meta's own cost per purchase" otherwise. Then the offer, in these words: "Ask me about the
   method if you want the detail." The method stops there; `references/method.md` holds its windows
   and thresholds.
2. The proposed awareness campaigns, by name with their spend over the last 7 complete days:
   bought for awareness, reach or video views rather than purchases, so CAC is the wrong measure
   for them and the plan leaves them out, their spend included. Ask the user to confirm the list,
   add to it or remove from it. Recommend the proposal. With no campaign that fits, say so and
   recommend none.
3. The proposed lead campaigns, by name with their spend over the last 7 complete days: bought for
   leads, sign-ups, giveaways or competitions rather than purchases, so CAC is the wrong measure
   for them and the plan leaves them out, their spend included. Ask the user to confirm the list,
   add to it or remove from it. Recommend the proposal. With no campaign that fits, say so and
   recommend none.
4. The proposed retargeting and existing-customer campaigns, by name with their spend over the last
   7 complete days, judged against their own blend. Ask the user to confirm it, add to it or remove
   from it. Recommend the proposal ("yes" accepts every proposal). With no campaign that fits, say
   so and recommend none.
5. The Budget: the monthly Meta budget the user wants to reach, outside the awareness and lead campaigns,
   and, if they like, the week to reach it by (an ISO week, or a date in it). State the defaults in
   the message: with no week, the ISO week 4 weeks from now, named with its Monday date; with no
   Budget, current spend held flat for 4 weeks. A Budget below current spend is allowed. Recommend
   no Budget ("yes" takes that).
6. The Format split, in these words with the figures filled in: "Your last 8 weeks were 30% video,
   70% image (names gave the format of 82% of ads). Split the roadmap that way, give your own split,
   or no split?" The proposal is the Format split default and the coverage is the Name coverage, both
   as step 2 worked them out for the proposed awareness and lead campaigns. Recommend the proposal ("yes"
   keeps it). A split of the user's own is a video percentage, with image the rest. With no Launched
   ad in the last 8 complete weeks there is no proposal: say so and recommend no split.

The answer is confirmed once. "Just run it" and "yes" take the proposals and go on.

When the user asks about the method, at this step or any later one, answer from
`references/method.md`, and only as much of it as the question needs.

An unattended run sends nothing: it takes the proposed campaigns, no Budget and no Format split,
and goes on.

Where the reply changes the awareness or lead campaigns, count the Launched ads and work out the Format
split default and Name coverage again with the confirmed ones, as step 2 does, and stop the same way
where the Launched ads at least 28 days old are now fewer than 20. A split of the user's own stands, with the new Name
coverage. Where the user kept the proposal and the new figures differ from the ones quoted, say the
new split and coverage in one line and use them.

**Done when** the user has answered (an unattended run needs no answer) and the run holds the
confirmed retargeting, awareness and lead campaign keys, or the proposed ones for an unattended
run, or none, a count of 20 or more Launched ads at least 28 days old outside the awareness and lead campaigns it holds, the Budget as a
monthly figure with its Budget week (given, or the default), or no Budget, and the Format split as
a video and image percentage, or no split.

## 4. Model

Judge every ad on every day of the window and compute the figures from these definitions, which
`references/method.md` sets out in words. **Without a Growth Brain**, judge and compute in code, as
`references/exports.md` sets out. **With a Growth Brain**, open `references/fatigue.sql`, make its
edits 1 to 3 (the mart's name, in `mart_rows` and in `video_plays`, with any column names from step
2; the confirmed retargeting campaign keys; and the confirmed awareness and lead campaign keys together), leave edit
4, and run the whole file with `run_sql` as one statement. It judges every ad on every day of the
365, and returns one row holding `viable_lifespan` (W), `hit_rate` (h), `days_viable_per_hit` (D) and
`hit_rate_ads`, `spend_per_viable_ad`, `healthy_lifespan` with `age_below_75` and `age_below_25`,
`days_to_clear_ramping`, `current_spend`, `current_pipeline`, `viable_share_p90`,
`viable_share_target`, `viable_share_weeks` (the weeks counted), `viable_share_weeks_left_out`,
`viable_ad_stock` (L), `steady_state_number` (N0), `today_date` with today's counts, the Format split default (`video_pct`, `image_pct`) with its
`name_coverage_pct`, the `survival_table` (age, reached, viable, survival, viable_spend), the Scorecard
figures (`launches_best`; `hit_rate_best` with `hit_rate_months`; `days_viable_per_hit_best` with
`dvph_quarters`; `limiting_factor` with `launches_at_best_hit_rate` (N1), `hit_rate_needed`,
`days_viable_per_hit_needed` and their `_beyond_best` flags; the `budget_ladder` table, one row for each of
current spend, 1.5 times and 2 times it, with `multiple`, `daily_spend`, `viable_ad_stock`,
`steady_state_number` and `steady_state_over_pipeline`; and On the table: the `share_`, `customers_` and
`cac_` figures for `viable`, `test_phase`, `worn_out` and `other`, `groups_without_customers`,
`nothing_on_the_table`, `customers_week`, `customers_week_at_target`, `customers_week_gain`,
`blended_cac`, `blended_cac_at_target`, `blended_cac_change` and `biggest_waste`). Type
none of them by hand. Where the brain's own instructions name the store's timezone, set it as the
file says. A query error: fix the column from step 2 and run again, and never invent one. The plan
below is worked in code from that row. Compute each figure once, from these definitions:

- **Viable** is Healthy, Winner or Improving on that day. The statuses are judged as audit-ads judges
  them; this skill reads Improving, an ad recovering towards viable, as viable because it converts like
  Healthy, and it widens the test where the plan reads the status, never in the classification. Every
  count and share below that tests a viable status takes the three: the Survival curve, the Hit rate,
  Spend per viable ad, the weekly Viable share, today's viable ads and On the table.
- A **Launched ad** is one whose first day of spend falls after the window's first day. Only
  Launched ads feed the Survival curve. An ad's **age** is the days since its first spend (the
  first day is age 0). A Launched ad has **reached** age a when its first spend is at least a days
  before the last complete day.
- **Survival curve**: at each age a, the denominator is every Launched ad that has reached age a;
  the numerator is those of them viable on their day at age a. A day with no spend (Inactive),
  Ramping, Unknown or any status that is not viable counts as not viable, so an ad that stops
  spending or never leaves Ramping stays in the count. An age counts only with 3 or more ads in
  the denominator. The rates are raw, never smoothed.
- **Viable lifespan** (W) is the sum of the survival rates over the ages that count. W is a **lower
  bound** when the survival rate at the last age that counts (the last with 3 or more ads) is 25% or
  above (`w_is_lower_bound` on a brain): the curve was cut short while ads were still viable, so the
  ads to launch are a ceiling.
- **Hit rate** (h) is, over the Launched ads whose first spend is at least 27 days before the last
  complete day (ages 0 to 27 all inside the window), the share that were viable on at least one of
  those 28 days. `hit_rate_ads` is the number of those ads.
- **Days viable per hit** (D) is W over h, so h times D is W exactly.
- **Spend per viable ad** is the spend on viable ad-days over the number of viable ad-days: the
  ad-days are those of the Launched ads at the ages that count.
- **Healthy lifespan** reads from the curve's peak, its highest rate (the first age that holds it):
  it is the first age after the peak with a rate below half the peak rate; the quartile range runs
  from the first age after the peak below 75% of the peak rate to the first below 25% of it. Either
  end can read "not reached".
- **Days to clear Ramping** is the median, over Launched ads, of the age at which an ad first
  stops being Ramping.
- **Format** is read for every ad from its ad name alone, never its ad set or campaign name. Split
  the name into words at every character that is not a letter or a digit, and compare each word
  with these, ignoring case. Video: `video`, `vid`, `reel`. Image: `image`, `img`, `static`,
  `still`, `carousel`. A name with words of one kind only decides the Format. A name with neither
  kind, or both, leaves the ad video if it had any 3-second video plays (`video_views` on a brain) in the rows
  read, and image otherwise.
- **Format split default** is the video and image shares of the Launched ads whose first spend fell
  in the last 8 complete ISO weeks, as whole percentages that sum to 100 (video rounded, image the
  rest). **Name coverage** is the share of those same ads whose name decided the Format, as a whole
  percentage. Step 2 works these out for the intake with the proposed awareness and lead campaigns, by the
  same definition (on a brain, `references/intake.sql` carries the same block as `references/fatigue.sql`);
  this step gives them again with the confirmed ones, and the page quotes these.
- **Current spend** is the last complete ISO week's spend over 7, outside the awareness and lead campaigns,
  as is every spend the plan reads. **Current pipeline** is the Launched ads per week, averaged over
  the last 8 complete ISO weeks.
- **Weekly viable share**: for each complete ISO week of the window (Monday to Sunday, both inside
  it; the window's first day is the first day of the window read), the spend on viable ad-days over
  that week's spend. Count every ad, Launched or not, outside the awareness and lead campaigns.
- **Weeks counted**: leave out the window's first 6 complete weeks (the weekday index, life spend and
  Peak CAC warm up from the window's first day, so those weeks lean towards Ramping). Of the weeks
  that remain, leave out any whose spend is below 25% of their median weekly spend (an even count
  takes the mean of the middle two): a thin week gives a noisy share. The weeks left are the weeks
  counted. With fewer than 8, use those there are and say how many in This run.
- **P90** is the 90th percentile of the weekly viable shares counted, by nearest rank: with them
  sorted from lowest to highest, the share at rank 0.9 times their number, rounded up.
  `viable_share_p90` is the same value.
- **Viable share target** is the smaller of 100% and P90 times 1.2 (`viable_share_target`).
- **L**, the Viable ad stock, is current spend times the Viable share target over the Spend per
  viable ad. The **Steady-state number** is L times 7 over W, rounded up, which is L times 7 over h
  times D.
- **Today** is the window's last complete day, the one every count named today reads, never a day the
  Source is still loading, which reads no orders and so no viable ads. A day is loaded when its spend and
  its new orders (purchases without a brain) are each at least half their mean over the 7 days before it.
  Today is the latest loaded day of the window's last 14 days, which is yesterday unless that is still
  loading, and yesterday where none is. Name its date in This run.
- **Today's counts**, on today: viable ads (S(0)); live ads past Ramping; Worn out now (live ads past
  Ramping that are Fatiguing, Fatigued or Low efficiency).
- **Self-check**: predicted viable ads is the Current pipeline times W over 7. It passes when it is
  within 25% of today's viable ads (the difference over today's viable ads).

**Stop** where h is 0, with one line and no page: "None of the <n> ads launched at least 28 days ago
became viable, so there is no hit rate to plan from." (n is `hit_rate_ads`.) **Stop** too where no
week is counted, with one line and no page: "<Brand>'s weekly spend is too uneven to read a viable
share." Both hold for an unattended run too.

**The plan.** Weeks are ISO weeks, counted from the current week (the one holding today) as week 0,
so next week is week 1. Carry every stock unrounded, and check every tie on the unrounded figures; only Ads to launch is a whole
number in the working. The page shows every ad count as a whole ad, rounded up (step 5).

- **Daily Budget** is the monthly Budget times 12 over 365. **B** is the Budget week counted this way:
  the week the user gave, else week 4; a week before week 1 is week 1.
- **Daily spend(w)** steps linearly from current spend to the daily Budget: for w from 1 to B, current
  spend plus (daily Budget less current spend) times w over B; then the daily Budget for the 4 weeks
  after B. With no Budget it is current spend for w from 1 to 4 (B is 4). The Roadmap has one row for each w.
  A Budget below current spend is allowed: daily spend steps down, and the weeks that follow work
  as below.
- **L(w)** is daily spend(w) times the Viable share target over the Spend per viable ad. **S(0)** is the viable ads live on the last
  complete day.
- **Gap0** is L at current spend less S(0).
- **Wearing out(w)** is the smaller of S(w−1) and S(w−1) times 7 over D.
- **Target T(w)**: where Gap0 is above 0 and w is B or less, T(w) is L(w) less Gap0 times (B less
  w) over B. This is the **Catch-up**: the gap closes evenly by the Budget week. Otherwise T(w) is L(w).
- **Ads to launch(w)** is the larger of 0 and T(w) less (S(w−1) less Wearing out(w)), over h, rounded
  up: a whole number, never below 0. In a scale-down, a week whose stock after Wearing out is
  already at or above T(w) has Ads to launch(w) of 0 (the Roadmap reads "None needed"), and the
  stock runs down on its own, week by week, until it meets T(w).
- **Expected to work(w)** is Ads to launch(w) times h, unrounded.
- **S(w)** is S(w−1) less Wearing out(w) plus Expected to work(w).
- **Video(w) and image(w)** divide Ads to launch(w) by the confirmed Format split, by largest
  remainder: each format first takes the whole ads of its share of Ads to launch(w), and the one ad
  left over, if any, goes to the format with the larger remainder (on a tie, the larger share; on
  equal shares, video). The two always sum to Ads to launch(w). With no split there is only Ads to
  launch(w).
- **Live-by(w)** is the Monday of week w less the Days to clear Ramping, a date.
- **Launches to keep up(w)** is Wearing out(w) over h, rounded up. **Launches to catch up(w)** is Ads
  to launch(w) less that, which is below 0 in a week where the stock runs down on its own. The
  **total catch-up launches** is their sum over weeks 1 to B, worked only where Gap0 is above 0.
- **Budget ladder.** The rungs are current spend, 1.5 times and 2 times current spend, and the Budget
  (as a daily spend) where the user gave one that differs from those three. For each rung: L at that
  spend (with the same Viable share target and Spend per viable ad), N0 at that spend (the ceiling of
  L times 7 over W), and N0 over the Current pipeline to one decimal. A brain returns the three fixed
  rungs in `budget_ladder`; the Budget rung, and every rung without a brain, is worked in code from
  those formulas.
- **Lever best.** Each Lever's best is what the account has done, with the periods it counted. Take
  percentiles by nearest rank, written `APPROX_QUANTILES(x, 100)[OFFSET(90)]` on a brain and, in code,
  the value at rank 0.9 times their number rounded up with the values sorted from lowest to highest.
  - **Launches (B)** is the highest average of Launched ads a week over any 8 complete ISO weeks in a
    row in the window; none with fewer than 8 complete weeks.
  - **Hit rate (h_best).** For each calendar launch month (by first spend), the month's Hit rate. A
    month counts when its last day is at least 28 days before today, it has 10 or more Launched ads,
    and it starts after the window's first 6 weeks. h_best is the 90th percentile of the months
    counted (`hit_rate_months` of them); with fewer than 4 months, there is no best (null).
  - **Days viable per hit (D_best).** For each calendar launch quarter, D_q is W_q over h_q, worked
    from that quarter's Launched ads alone: W_q is the sum of that cohort's survival rates over the
    ages that 3 or more of its ads have reached, and h_q the cohort's Hit rate. A quarter counts when
    its last day is at least 60 days before today and it has 10 or more hits. D_best is the highest
    D_q (`dvph_quarters` counted); with fewer than 2 quarters, there is no best (null).
- **Limiting factor.** First work out L, h, D, W and P (the Current pipeline) as above, N0 (the
  Steady-state number, the ceiling of L times 7 over W) and, where h_best exists, N1, the ceiling of L
  times 7 over h_best times D. The factor is the first of these that holds, with what it needs the
  account to hit:

  | Limiting factor | When | To hit |
  |---|---|---|
  | **On track** | S(0) is 0.8 times L or more, and N0 is P or less | none |
  | **Volume** | N0 is 1.2 times B or less | launches N0 a week |
  | **Both** | h_best exists and N1 is 1.2 times B or less | hit rate h_best and launches N1 a week |
  | **Finding winners** | room_h is room_D or more | hit rate h_need, L times 7 over D times B, "beyond your best" where h_need is above h_best |
  | **Keeping winners** | room_D is above room_h | days viable per hit D_need, L times 7 over h times B, "beyond your best" where D_need is above D_best |

  room_h is h_best over h and room_D is D_best over D, a null best giving a room of 0. With both bests
  null the factor is Finding winners, and This run says "not enough history to compare". Where B is
  null, Volume and Both do not hold. Keep each of N0, N1, the rooms and the figures to hit unrounded
  until the page shows them.
- **On the table**, over the last 90 complete days to today, on the skill's CAC basis (new orders, or
  Meta's purchases without a brain). Every ad-day falls in one group by its status: **viable** (Healthy,
  Winner and Improving), **test phase** (Ramping), **worn out** (Fatiguing, Fatigued and Low
  efficiency), and **other** (any status left). For each group: spend, new customers and CAC (spend
  over customers). Today's v0 is the viable group's spend over total spend.
  - Where v0 is the Viable share target v\* or more, there is nothing on the table (the brain's
    `nothing_on_the_table`).
  - Otherwise set viable spend to v\* times total spend, and scale every non-viable group pro rata so
    they sum to (1 less v\*) times total spend. customers' is the sum, over the groups, of spend' over
    that group's CAC. Report per week (over 90, times 7): today's customers, customers', the gain,
    the blended CAC today (total spend over customers) and at target (total spend over customers'),
    and the change between them as a relative percentage.
  - A group that spent and has no customers in the 90 days takes the CAC of the next-worse group,
    in the order viable, test phase, worn out, other; where none is left, it is left out of the
    customers and This run says so (`groups_without_customers` names them).
  - The **biggest waste** is whichever of test phase and worn out has the larger share of spend (worn
    out on a tie).

**Done when** the run holds W, h, D, Spend per viable ad, the Healthy lifespan with its quartile
range, Days to clear Ramping, current spend, the Current pipeline, the weekly viable shares and the
weeks counted (6 left out for warm-up, then the thin ones, the run stopped on its line where none
is left), P90, the Viable share target (at most 100%), L
(current spend times the Viable share target over the Spend per viable ad, the same at every L(w)
and every Budget ladder rung), the Steady-state number (N0), today's date and
counts (read on the last complete day, and not a day still loading), the Self-check, and the Format split default with its Name coverage, each from one calculation;
the survival table (age, ads reached, viable, survival, spend on viable ad-days) has rates that sum to
W, h times D equals W to two decimals, and the Spend per viable ad is the spend on viable ad-days over
their number; the run holds the three Lever bests, each with the months or quarters it counted (or
null, where fewer than 4 months or 2 quarters counted), the Limiting factor read off the table above
on the unrounded figures (N0 at most 1.2 times B and N1 at most 1.2 times B for Both, which needs N0 above
1.2 times B), with what it needs the account to hit, the Budget ladder's rungs each with L, N0 and N0 over
the Current pipeline, and On the table, its groups' spend, customers and CAC and its figures per week, or
"nothing" where v0 is the Viable share target or more; and the run has not stopped on a guard. The Roadmap holds a row for each of its weeks,
with start, less Wearing out, plus Expected to work equal to the end stock on the unrounded figures, to one decimal, in every row,
no Ads to launch below 0 and video plus image equal to Ads to launch in every row (with a split). Where Gap0 is above 0, the end stock at the Budget week is at or
above L(B) and the Catch-up is spread evenly over weeks 1 to B. At a flat budget with S(0) equal to L,
every week's Ads to launch is the Steady-state number, give or take one ad. The Budget ladder's current-spend rung
has the Steady-state number as its N0, the launches to keep up and to catch up for week 1 sum to its Ads to launch, and the run knows whether W is a lower bound.

## 5. Write the page

Write the page as `references/page-layout.md` fixes it: two tabs switched by CSS alone, opening on
the Scorecard. The Scorecard holds the masthead, then the strip of three cards (Enough ads?, Holding
you back, On the table), then three charted panels in the Page labels, each with labels only and one
action line: Enough working ads for your spend?, What's holding you back? and What's on the table.
Card 1's verdict is read off today's viable ads against L: Short below 80% of L, Ahead above 150% of
L, otherwise About right, with the gap as a whole count of ads, and it is the only verdict colour on
the page. Card 2 and Panel 2's action line carry the Limiting factor's to-hit in the words
`references/page-layout.md` gives, with a need marker only on the Levers it moves. Panel 1 charts the
Budget ladder's rungs, Panel 3 the spend shares today and at target. The Scorecard defines nothing:
each label's Says lives on How it's worked out under Terms. Every figure on the Scorecard is its source figure
from step 4, shown rounded once and used rounded in every label beside it, and every ad count is a
whole ad, rounded up. Where W is a lower bound, Panel 1's action line says the counts may read a
little high, and the figures say "at least" before a lasting figure.

How it's worked out holds seven parts, in this order: the Week-by-week plan (its first line the
Catch-up, the table with whole numbers rounded up and the line "Figures are rounded up to whole ads,
so a row can be one out.", and no chart), the Survival curve with its fitted axis (the first of 5%,
10%, 20%, 25%, 50% and 100% at or above the curve's highest point, four gridlines at quarters of it),
the figures (Hit rate, Viable lifespan, Days viable per hit, Spend per viable ad, the Viable share
with its target, each Lever best with the months or quarters it counted, CAC and spend share by group
over 90 days, and the Self-check line), Terms, This run, `references/method.md` word for word, and
the Brain line only on a run that page-layout gives one (the Source is not a Growth Brain and the
session holds none). It names the Source and the CAC basis in the masthead and This run, and where
W is a lower bound says so in the words `references/page-layout.md` gives. Save the page as
`meta-ad-volume-<date>.html` in the working folder; where none persists (a chat), hand it over as a
download.

**Done when** the first tab is the masthead, the three cards and the three panels, in that order,
with no prose beyond labels and one action line for each panel; card 1 reads "<S> of <⌈L⌉>" with
its pill (Short, About right or Ahead, the gap a whole count, read on viable ads only); card 2 names
the Limiting factor with its to-hit, and On track reads "nothing: keep launching <P> a week"; card 3
reads "+<n> customers" with its CAC change, or "Nothing" where nothing is on the table (Panel 3 then
shows Today's bar only); Panel 1 has a bar for the working ads needed on every rung and a filled bar
for the working ads now on Today, with its two-row table of N0 and N0 over P; Panel 2 has one track
for each Lever with now, best (or "no best yet") and need markers on the Levers the to-hit moves
only, and none on On track; every figure on the Scorecard equals its step 4 figure, whole ad counts
rounded up; no glossary term shows on the Scorecard where page-layout gives it a Page label, and no
definition does either; How it's worked out follows the order above, its Week-by-week plan's table
and the Roadmap file holding the same weeks and the same video and image figures (or the total alone
with no split); its figures name the number of months and quarters each Lever best counted; This run
names today's date, the Limiting factor with its figures and the groups left out of On the table
where there are any; a lower bound W is said on both tabs; the Self-check line is there, with its
fail clause where the check failed; an unattended run says so in This run; and the Brain line,
where the run has one, is the last line of How it's worked out.

## 6. Close

In chat, after the page, in this order:

1. One line, in the Page labels, in these words with the figures filled in: "<Limiting factor>:
   <the to-hit>. <S> of <⌈L⌉> working ads; on the table, +<n> new customers a week." The to-hit is
   the words of the to-hit table in `references/page-layout.md` without bold; with On track it reads
   "On track: keep launching <P> a week." and with nothing on the table the last clause reads "nothing
   on the table".
2. **The Roadmap file.** Offer the Week-by-week plan as a file, `meta-ad-roadmap-<date>.md`, to hand to whoever makes
   the ads, and say what it holds: the Budget, the weeks, the new ads by format, the Go live by
   dates, the Limiting factor and what it needs to hit, and one line each on your hit rate and the spend one working ad carries. On "yes", write it as
   `references/page-layout.md` fixes it and save it in the working folder; where none persists (a
   chat), hand it over as a download. It is self-contained: someone who has not seen the page can
   brief from it.
3. **The Next run.** Tell the user to run this again in 2 weeks, with its date (14 days from today),
   and give the prompt to paste into that session, in a block: "Plan my Meta ad volume again.
   Monthly Meta budget: <the Budget, or "no change to current spend">. Format split: <the split
   used, or "none">. Retargeting campaigns: <the confirmed names, or "none">. Awareness
   campaigns: <the confirmed names, or "none">. Lead campaigns: <the confirmed names, or "none">." Add "Run it unattended." when this run was.
   Without a Growth Brain, add "I'll attach a fresh Ads Manager export." Where a calendar connector
   is in the session, offer to add the date as an event carrying the prompt; with none, say nothing
   about a calendar.

**Done when** the chat holds the line (with the Limiting factor in it), the Roadmap file offered with its contents named (or, on an
unattended run, saved), and the Next run with its date, its prompt, and the calendar offer where a
calendar connector is in the session.
