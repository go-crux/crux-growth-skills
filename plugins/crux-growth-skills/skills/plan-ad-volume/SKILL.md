---
name: plan-ad-volume
description: Meta ad volume forecast. Use when the user asks how many new Meta ads they need a week, how many ads their spend needs, or how long their ads last, or how many ads a bigger Meta budget needs. Runs on one Ads Manager export.
---

# Meta ad volume forecast

Work out how many new Meta ads a week the account's spend needs, from the account's own Survival
curve, and produce `meta-ad-volume-<date>.html`: the Ad stock check, The gap, the Churn cycle, Ads
a week, the Roadmap with its Waterfall, the Budget ladder, and Notes and Method, laid out as
`references/page-layout.md` fixes it. Run the steps in order. The user sees only the chat and the
page, never this skill or its references: say what the ads showed, in plain words with the figures,
and never cite a file, a rule or a query. The terms
Viable ad, Viable ad stock, Launched ad, Survival curve, Viable lifespan, Healthy lifespan, Spend per
viable ad, Days to clear Ramping, Ad stock check, Worn out now, Wearing out, Current pipeline, Churn
cycle, Steady-state number, Budget, Roadmap, Live-by, Waterfall, Budget ladder, Unattended run,
Source and Brain line are those of `references/glossary.md`, and Next run is the repo's shared term;
use them as written. The ad statuses and CAC are judged exactly as `references/fatigue.sql` judges
them.

## Unattended run

A run is unattended when its message says so or says not to ask, or when it is a scheduled session
or routine: nobody is there to answer. It asks nothing at any step. Where a step would ask, it takes
that step's recommended answer, and only where a step recommends none (no export attached) does it
stop with one line saying what it needed. Step 3 sends no message and takes the proposed retargeting
campaigns as confirmed, and the page's Notes and Method says the run was unattended.

## 1. Connect

Take the ad-by-day rows from one Ads Manager export the user gives, and say so in a line. A file
already in the conversation counts; else ask for it in one message, with the steps of
`references/exports.md` in plain words, and wait.

**Done when** the run names its Source and holds the rows for the last 180 complete days, or for
the days the file holds when the user cannot give more.

## 2. Read

Read the rows as `references/exports.md` sets out. A session with no code or analysis tool: say in
one line that the plan needs one, and stop.

**Done when** the rows are grouped by Ad ID and Day, the window's first and last dates are named,
and the run holds the campaign names with their spend over the last 7 complete days.

## 3. Intake

Send one message, then wait for the reply:

1. The method in brief, in these words: "I'll judge every Meta ad on every day of the last 180 days
   by its CAC, the way an ad audit does, then draw a survival curve from the ads you launched in that
   time to see how long a new ad stays viable. That tells me how many viable ads your spend needs
   live at once, and so how many new ads a week it takes to hold them. CAC here is Meta's own cost
   per purchase. If you give me a monthly budget, I'll step your spend to it week by week and work
   out the new ads each week." Then the offer, in these words: "Ask me about the method if you want
   the detail." The method stops there; `references/method.md` holds its windows and thresholds.
2. The proposed retargeting and existing-customer campaigns: those whose name contains retargeting,
   RT, remarketing, existing or retention, or reads as one of those. List the proposal by name with
   its spend over the last 7 complete days, and ask the user to confirm it, add to it or remove from
   it. Recommend the proposal ("yes" accepts it). With no campaign that fits, say so and recommend
   none.
3. The Budget: the monthly Meta budget the user wants to reach and, if they like, the week to reach
   it by (an ISO week, or a date in it). State the defaults in the message: with no week, the ISO
   week 4 weeks from now, named with its Monday date; with no Budget, current spend held flat for 4
   weeks. A Budget below current spend is allowed. Recommend no Budget
   ("yes" takes that).

The answer is confirmed once. "Just run it" and "yes" take the proposal and go on.

When the user asks about the method, at this step or any later one, answer from
`references/method.md`, and only as much of it as the question needs.

An unattended run sends nothing: it takes the proposal and the recommended answer (no Budget) and
goes on.

**Done when** the user has answered (an unattended run needs no answer) and the run holds the
confirmed campaign names, or the proposed ones for an unattended run, or none, and the Budget as a
monthly figure with its Budget week (given, or the default), or no Budget.

## 4. Model

Judge every ad on every day of the window and compute the figures, in code, as
`references/exports.md` and `references/method.md` set out. The method is fixed there; compute
each figure once, from these definitions:

- **Viable** is Healthy or Winner on that day.
- A **Launched ad** is one whose first day of spend falls after the window's first day. Only
  Launched ads feed the Survival curve. An ad's **age** is the days since its first spend (the
  first day is age 0).
- **Survival curve**: at each age, the viable Launched ads over the Launched ads classified that
  day (spent that day and not Ramping, Inactive or Unknown). An age counts only with 3 or more ads.
  The rates are raw, never smoothed.
- **Viable lifespan** (W) is the sum of the survival rates over the ages that count.
- **Spend per viable ad** is the sum of survival times the average daily spend per ad at that age,
  over the sum of survival.
- **Healthy lifespan** is the first age with survival below 50%; the quartile range runs from the
  first age below 75% to the first age below 25%. Either end can read "not reached".
- **Days to clear Ramping** is the median, over Launched ads, of the age at which an ad first
  stops being Ramping.
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
  A Budget below current spend is allowed.
- **L(w)** is daily spend(w) over the Spend per viable ad. **S(0)** is the viable ads live on the last
  complete day.
- **Wearing out(w)** is the smaller of S(w−1) and S(w−1) times 7 over W.
- **New(w)** is the larger of 0 and L(w) less (S(w−1) less Wearing out(w)), rounded up. It is never
  negative.
- **S(w)** is S(w−1) less Wearing out(w) plus New(w).
- **Live-by(w)** is the Monday of week w less the Days to clear Ramping, a date.
- **Waterfall.** The start bar is the live ads past Ramping today, dropped by the difference from S(0)
  (Worn out now, and any Improving ads) down to S(0). Each week then has a down bar of Wearing out(w),
  an up bar of New(w), the end stock S(w) and L(w) as a mark.
- **Budget ladder.** The Steady-state number at current spend, at 1.25 times it, at 1.5 times it and
  at the daily Budget (left out with no Budget), each with its L.
- **Growth** is L at the daily Budget less L at current spend, and 0 with no Budget.

When no age has 3 or more classified Launched ads, or every counted age reads 0%, say in one line
how many Launched ads the export holds and that it is too few to draw a curve, and stop with no
page.

**Done when** the run holds W, Spend per viable ad, the Healthy lifespan with its quartile range,
Days to clear Ramping, current spend, the Current pipeline, L, the Steady-state number and today's
counts, each from one calculation, and the survival table (age, ads classified, viable, survival,
average daily spend per ad) sums to W. The Roadmap holds a row for each of its weeks, with start,
less Wearing out, plus New equal to the end stock in every row, no New below 0 and the Waterfall's
bars taken from those rows, and the Budget ladder and the growth are computed.

## 5. Write the page

Write the page as `references/page-layout.md` fixes it: its seven headings (Ad stock check, The gap,
Churn cycle, Ads a week, Roadmap, Budget ladder, Notes and Method), in order, with the Ad stock
check read off today's counts against L: Short below 80% of L, Over-stocked above 150% of L, otherwise About right. Where
both hold, or any ad is Worn out now, the Ad stock check says to run `/audit-ads` for which ads to
pause and names no ad. Notes and Method carries `references/method.md` word for word, and no second
wording of it, and ends on the Brain line. Save the page as `meta-ad-volume-<date>.html` in the
working folder; where none persists (a chat), hand it over as a download.

**Done when** the page holds the seven headings in order, the Ad stock check names Short,
Over-stocked or About right with the counts behind it, the Steady-state number stands against the
Current pipeline, the Roadmap table and the Waterfall hold the same weeks, the Budget ladder states
its assumption, an unattended run says so in Notes and Method, and the Brain line is the last line.

## 6. Close

Tell the user in one line where the page is, the Ad stock check's verdict, and the Steady-state
number against the Current pipeline.

**Done when** the chat holds that line.
