---
name: plan-ad-volume
description: Meta ad volume forecast. Use when the user asks how many new Meta ads they need a week, how many ads their spend needs, or how long their ads last, or how many ads a bigger Meta budget needs. Runs on the brand's Growth Brain, else a Meta connector, else one Ads Manager export.
---

# Meta ad volume forecast

Work out how many new Meta ads a week the account's spend needs, from the account's own Survival
curve, and produce `meta-ad-volume-<date>.html`: the Ad stock check, The gap, the Churn cycle, Ads
a week, the Roadmap with its Waterfall, the Budget ladder, and Notes and Method, laid out as
`references/page-layout.md` fixes it, then offer the Roadmap as `meta-ad-roadmap-<date>.md` for the
creative brief and say when to run it again. Run the steps in order. The user sees only the chat and the
page, never this skill or its references: say what the ads showed, in plain words with the figures,
and never cite a file, a rule or a query. The terms
Viable ad, Viable ad stock, Launched ad, Survival curve, Viable lifespan, Healthy lifespan, Spend per
viable ad, Days to clear Ramping, Ad stock check, Worn out now, Wearing out, Current pipeline, Churn
cycle, Steady-state number, Budget, Roadmap, Live-by, Waterfall, Budget ladder, Format, Name coverage,
Format split, Roadmap file, Unattended run, Source and Brain line are those of `references/glossary.md`, and Next
run is the repo's shared term; use them as written. The ad statuses and CAC are judged exactly as `references/fatigue.sql` judges
them.

## Unattended run

A run is unattended when its message says so or says not to ask, or when it is a scheduled session
or routine: nobody is there to answer. It asks nothing at any step. Where a step would ask, it takes
that step's recommended answer, and only where a step recommends none (several Growth Brains and
none plainly the brand's, no export attached) does it stop with one line saying what it needed.
Its defaults, every one of them:

- Step 3 sends no message and takes the proposed retargeting campaigns as confirmed.
- It plans current spend held flat for 4 weeks: no Budget is asked for or used, so the Budget ladder
  shows its three rungs at current spend, +25% and +50%.
- It uses no Format split, so the Roadmap shows new ads as a total.
- The page's Notes and Method says the run was unattended, in the words `references/page-layout.md`
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

**Without a Growth Brain**, read the rows as `references/exports.md` sets out and go to step 3.

**With a Growth Brain**, call `list_tables` once with no arguments, then once naming only
`<client>-meta_performance` (`<client>` is the prefix the roster carries). If that mart is missing,
say in one line that the brain holds no Meta ad table and take the next Source from step 1 (a brain
is still connected, so the page carries no Brain line). The mart is one row per day, campaign, ad
set and ad. Read its columns from the second call and take these, never assuming one: the date;
the ad id; the ad set id and the campaign id; the three display names (campaign, ad set and ad);
spend; new orders; ad age; campaign type; and `video_views`. Group by the ad id, never a display
name: a rename keeps the id, and two ads can share a name. Read the last 365 complete days.
Without an ad set id or a campaign id, that display name stands in as its key. A missing column
other than those two ids, campaign type and `video_views`: name it in one line and stop. Without
campaign type, the intake proposes retargeting campaigns from their names alone. Without
`video_views`, Format falls back to the name only, and an ad whose name decides nothing counts as
image.

On a brain, use new orders as the CAC denominator and never the purchases Meta claims, which are
fractional and not the same count. Never sum reach. Leave out rows with no ad (an ad id of
"Unknown", which takes in unrendered templates).

**Count the Launched ads** before anything else is asked: the ads whose first day of spend falls
after the window's first day. Without a Growth Brain, count them from the rows. With a Growth
Brain, run one `run_sql` query counting the distinct ad ids whose first day of spend in the
window falls after the window's first day. With fewer than 20, stop here, before step 3, with
one line: "<Brand> does not yet launch enough ads to read a curve: <n> Launched
ads in the last <365 or 180> days, and a curve needs 20." Write no page and ask nothing more. This
holds for an unattended run too.

**Done when** the rows are read from a connector or export and grouped by Ad ID and Day, the
window's first and last dates are named, the run holds the campaign names with their spend over
the last 7 complete days, every ad carries a Format (step 4 sets the rule), and the Launched ads
are counted at 20 or more, or the run has stopped with that one line; or, with a Growth Brain,
every column above is named from the second call, or the run has stopped with a line saying which
is missing, or has moved to the next Source.

## 3. Intake

Send one message, then wait for the reply:

1. The method in brief, in these words with the days filled in (365 from a Growth Brain, 180
   otherwise): "I'll judge every Meta ad on every day of the last 365 days by its CAC, the way an ad
   audit does, then draw a survival curve from the ads you launched in that time to see how long a
   new ad stays viable. That tells me how many viable ads your spend needs live at once, and so how
   many new ads a week it takes to hold them. CAC here is <basis>. If you give me a monthly budget,
   I'll step your spend to it week by week and work out the new ads each week." The basis is "spend
   over your own new orders" from a Growth Brain, and "Meta's own cost per purchase" otherwise. Then
   the offer, in these words: "Ask me about the method if you want
   the detail." The method stops there; `references/method.md` holds its windows and thresholds.
2. The proposed retargeting and existing-customer campaigns: those whose name contains retargeting,
   RT, remarketing, existing or retention, or reads as one of those, plus, with a Growth Brain, those
   whose campaign type is `RET`. With a Growth Brain, find them with one `run_sql` query listing each
   campaign's key (its id, or its name without one), name, type and spend over the last 7 complete days, for campaigns with spend in
   the window. List the proposal by name with its spend over the last 7 complete days, and ask the
   user to confirm it, add to it or remove from it. Recommend the proposal ("yes" accepts it). With no campaign that fits, say so and recommend
   none.
3. The Budget: the monthly Meta budget the user wants to reach and, if they like, the week to reach
   it by (an ISO week, or a date in it). State the defaults in the message: with no week, the ISO
   week 4 weeks from now, named with its Monday date; with no Budget, current spend held flat for 4
   weeks. A Budget below current spend is allowed. Recommend no Budget
   ("yes" takes that).
4. The Format split, in these words with the figures filled in: "Your last 8 weeks were 30% video,
   70% image (names gave the format of 82% of ads). Split the roadmap that way, give your own split,
   or no split?" The proposal is the Format split default and the coverage is the Name coverage, both
   from step 4. Recommend the proposal ("yes" keeps it). A split of the user's own is a video
   percentage, with image the rest. With no Launched ad in the last 8 complete weeks there is no
   proposal: say so and recommend no split.

The answer is confirmed once. "Just run it" and "yes" take the proposal and go on.

When the user asks about the method, at this step or any later one, answer from
`references/method.md`, and only as much of it as the question needs.

An unattended run sends nothing: it takes the proposed campaigns, no Budget and no Format split,
and goes on.

**Done when** the user has answered (an unattended run needs no answer) and the run holds the
confirmed campaign names, or the proposed ones for an unattended run, or none, the Budget as a
monthly figure with its Budget week (given, or the default), or no Budget, and the Format split as
a video and image percentage, or no split.

## 4. Model

Judge every ad on every day of the window and compute the figures from these definitions, which
`references/method.md` sets out in words. **Without a Growth Brain**, judge and compute in code, as
`references/exports.md` sets out. **With a Growth Brain**, open `references/fatigue.sql`, make its
edits 1 and 2 (the mart's name, in `source` and in `video_plays`, with any column names from step
2, and the confirmed campaign keys), leave edit 3, and run the whole file with `run_sql` as one
statement. It judges every ad on every day of the 365, and returns one row holding `viable_lifespan`
(W), `spend_per_viable_ad`, `healthy_lifespan` with `age_below_75` and `age_below_25`,
`days_to_clear_ramping`, `current_spend`, `current_pipeline`, `viable_ad_stock` (L),
`steady_state_number`, today's counts, the Format split default (`video_pct`, `image_pct`) with its
`name_coverage_pct`, and the `survival_table`. Type none of them by hand. Where the brain's own
instructions name the store's timezone, set it as the file says. A query error: fix the column from
step 2 and run again, and never invent one. The plan below is worked in code from that row. Compute
each figure once, from these definitions:

- **Viable** is Healthy or Winner on that day.
- A **Launched ad** is one whose first day of spend falls after the window's first day. Only
  Launched ads feed the Survival curve. An ad's **age** is the days since its first spend (the
  first day is age 0).
- **Survival curve**: at each age, the viable Launched ads over the Launched ads classified that
  day (spent that day and not Ramping, Inactive or Unknown). An age counts only with 3 or more ads.
  The rates are raw, never smoothed.
- **Viable lifespan** (W) is the sum of the survival rates over the ages that count. W is a **lower
  bound** when the survival rate at the last age that counts (the last with 3 or more ads) is 25% or
  above (`w_is_lower_bound` on a brain): the curve was cut short while ads were still viable, so the
  ads to make are a ceiling.
- **Spend per viable ad** is the sum of survival times the average daily spend per ad at that age,
  over the sum of survival.
- **Healthy lifespan** is the first age with survival below 50%; the quartile range runs from the
  first age below 75% to the first age below 25%. Either end can read "not reached".
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
  percentage. These are the figures step 3 puts to the user.
- **Current spend** is the last complete ISO week's spend over 7. **Current pipeline** is the
  Launched ads per week, averaged over the last 8 complete ISO weeks.
- **L**, the Viable ad stock, is current spend over the Spend per viable ad. The **Steady-state
  number** is L times 7 over W, rounded up.
- **Today's counts**, on the last complete day: viable ads; live ads past Ramping; Worn out now
  (live ads past Ramping that are Fatiguing, Fatigued or Low efficiency). **Wearing out** over the
  next 2 weeks is viable ads times 14 over W.

**The plan.** Weeks are ISO weeks, counted from the current week (the one holding today) as week 0,
so next week is week 1. Carry every stock unrounded; only New is a whole number.

- **Daily Budget** is the monthly Budget times 12 over 365. **B** is the Budget week counted this way:
  the week the user gave, else week 4; a week before week 1 is week 1.
- **Daily spend(w)** steps linearly from current spend to the daily Budget: for w from 1 to B, current
  spend plus (daily Budget less current spend) times w over B; then the daily Budget for the 4 weeks
  after B. With no Budget it is current spend for w from 1 to 4. The Roadmap has one row for each w.
  A Budget below current spend is allowed: daily spend steps down, and the weeks that follow work
  as below.
- **L(w)** is daily spend(w) over the Spend per viable ad. **S(0)** is the viable ads live on the last
  complete day.
- **Wearing out(w)** is the smaller of S(w−1) and S(w−1) times 7 over W.
- **New(w)** is the larger of 0 and L(w) less (S(w−1) less Wearing out(w)), rounded up. It is never
  negative. In a scale-down, a week whose stock after Wearing out is already above L(w) has New(w)
  of 0 (the Roadmap reads "None needed"), and the stock runs down on its own, week by week, until
  it meets L(w).
- **Video(w) and image(w)** divide New(w) by the confirmed Format split, by largest remainder: each
  format first takes the whole ads of its share of New(w), and the one ad left over, if any, goes to
  the format with the larger remainder (on a tie, the larger share; on equal shares, video). The two
  always sum to New(w). With no split there is only New(w).
- **S(w)** is S(w−1) less Wearing out(w) plus New(w).
- **Live-by(w)** is the Monday of week w less the Days to clear Ramping, a date.
- **Waterfall.** The start bar is the live ads past Ramping today, dropped by the difference from S(0)
  (Worn out now, and any Improving ads) down to S(0). Each week then has a down bar of Wearing out(w),
  an up bar of New(w) stacked as video(w) and image(w), or one bar of New(w) with no split, the end
  stock S(w) and L(w) as a mark.
- **Budget ladder.** The Steady-state number at current spend, at 1.25 times it, at 1.5 times it and
  at the daily Budget (left out with no Budget), each with its L.
- **Growth** is L at the daily Budget less L at current spend, and 0 with no Budget.

When no age has 3 or more classified Launched ads, or every counted age reads 0%, say in one line
how many Launched ads the Source holds and that it is too few to draw a curve, and stop with no
page.

**Done when** the run holds W, Spend per viable ad, the Healthy lifespan with its quartile range,
Days to clear Ramping, current spend, the Current pipeline, L, the Steady-state number, today's
counts, and the Format split default with its Name coverage, each from one calculation, and the
survival table (age, ads classified, viable, survival, average daily spend per ad) sums to W. The Roadmap holds a row for each of its weeks, with start,
less Wearing out, plus New equal to the end stock in every row, no New below 0, video plus image
equal to New in every row (with a split), and the Waterfall's bars taken from those rows, and the
Budget ladder and the growth are computed, and the run knows whether W is a lower bound.

## 5. Write the page

Write the page as `references/page-layout.md` fixes it: its seven headings (Ad stock check, The gap,
Churn cycle, Ads a week, Roadmap, Budget ladder, Notes and Method), in order, with the Ad stock
check read off today's counts against L: Short below 80% of L, Over-stocked above 150% of L,
otherwise About right. Where both hold, or any ad is Worn out now, the Ad stock check says to run
`/audit-ads` for which ads to pause and names no ad. Notes and Method carries `references/method.md`
word for word, and no second wording of it, names the Source and the CAC basis, and ends on the
Brain line only on a run that page-layout gives one (the Source is not a Growth Brain and the
session holds none). Where W is a lower bound, Notes and Method says so, and says the ad counts are a ceiling, in the words
`references/page-layout.md` gives; the Churn cycle shows "not reached" for a quartile the curve does
not reach. Save the page as `meta-ad-volume-<date>.html` in the working folder; where
none persists (a chat), hand it over as a download.

**Done when** the page holds the seven headings in order, the Ad stock check names Short,
Over-stocked or About right with the counts behind it, the Steady-state number stands against the
Current pipeline, the Roadmap table and the Waterfall hold the same weeks and the same video and
image figures (or the total alone with no split), the Budget ladder states its assumption, a lower
bound W is said in Notes and Method, an unattended run says so in Notes and Method, and the Brain line, where the run has one, is the last
line.

## 6. Close

In chat, after the page, in this order:

1. One line: where the page is, the Ad stock check's verdict, and the Steady-state number against
   the Current pipeline.
2. **The Roadmap file.** Offer the Roadmap as `meta-ad-roadmap-<date>.md`, to hand to whoever makes
   the ads, and say what it holds: the Budget, the weeks, the new ads by format, the Live-by dates,
   and one line each on the Viable lifespan and the Spend per viable ad. On "yes", write it as
   `references/page-layout.md` fixes it and save it in the working folder; where none persists (a
   chat), hand it over as a download. It is self-contained: someone who has not seen the page can
   brief from it.
3. **The Next run.** Tell the user to run this again in 2 weeks, with its date (14 days from today),
   and give the prompt to paste into that session, in a block: "Plan my Meta ad volume again.
   Monthly Meta budget: <the Budget, or "no change to current spend">. Format split: <the split
   used, or "none">. Retargeting campaigns: <the confirmed names, or "none">." Add "Run it
   unattended." when this run was. Without a Growth Brain, add "I'll attach a fresh Ads Manager
   export." Where a calendar connector is in the session, offer to add the date as an event
   carrying the prompt; with none, say nothing about a calendar.

**Done when** the chat holds the line, the Roadmap file offered with its contents named (or, on an
unattended run, saved), and the Next run with its date, its prompt, and the calendar offer where a
calendar connector is in the session.
