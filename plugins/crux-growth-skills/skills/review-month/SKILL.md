---
name: review-month
description: Write the monthly performance review, a month-end wrap-up deck of how last month went across trading, acquisition, retention and order value, with what to do next. Use when someone asks for a monthly review, a month-end wrap-up, or "how did last month go". Best on the brand's own Growth Brain; also works without one.
---

# Monthly performance review

Produce the Monthly performance review from the brand's own data: how the Current period went
across the growth equation, as one HTML deck of 16:9 slides whose slides and order
`references/deck-layout.md` fixes. Run the seven steps in order. The user sees only the chat and the
deck, never this skill or its references: say what the data showed, in plain words with its
figure, and never cite a file, a rule or a threshold. Every line the deck needs has its fixed
wording in `references/deck-layout.md`; use it as written. The terms Monthly performance review,
Slidedoc, Takeaway panel, Stat row, Highlight colour, Layout, Section, Action title, Brain slot,
Brain line, Share toggle, Current period, Comparison period, Source, Month context, Focus question,
Recommendation, Next month, Last month's actions and Unattended run are those of
`references/glossary.md`; use them as written.

## 1. Intake

Open `references/intake.md` and run it: the month, the Source, the brand, the Month context, up to
two Focus questions and last month's review with the status of each of its actions, in numbered
rounds with a recommendation to each question. A first message that names the month and the Source
is an Unattended run: it asks nothing at this step or any other, and takes every choice from the
Unattended contract there.

**Done when** the month, the Source, the brand, the Month context (or none), the Focus questions
(none, one or two, each with its Section) and the previous review's actions with their statuses (or
no previous review) are settled as `references/intake.md` sets out, and the Source is stated to
the user in one line.

## 2. Connect

Check for a Growth Brain first, then take each figure from the first of these Sources that holds
it, starting at the one the intake settled:

1. **A Growth Brain**: a connector named `<Client> - Growth Brain` that offers `list_tables`,
   `list_metrics`, `search_examples` and `run_sql`; the one the intake settled where several are
   connected. Open `references/sources.md` and make the calls it sets out: `list_tables` with no
   arguments for the roster; `list_metrics` with no arguments for the index, then with the `metrics`
   argument naming the measures the deck shows for their definitions; `search_examples` once, with an intent naming the review.
   A run with a brain reads the brain alone.
2. **Ad account and Shopify connectors** the session offers, then
3. **CSV exports the user gives**: with no Growth Brain, open `references/sources.md`, Connectors
   and exports, and run it: probe only the connectors the session offers, skip an account that
   cannot be told to be the brand's, and ask for an export only for a figure no connector reads.

Then settle the timezone and the currency once, as `references/sources.md` sets out, and resolve
the Current period and its Comparison periods once, in the `periods` CTE there, from the month the
intake settled.

**Done when** the one Growth Brain chosen has its roster, its metric index, the definitions for the
measures the deck shows and its examples in hand, or there is none and each connector the session
offers has had one probe read, with any that refused or could not be told to be the brand's named
to the user (in the Notes on an Unattended run) and any export a figure needs asked for once or its
figure marked "No data"; the timezone and the currency are set; and the Current period is a
calendar month set as start and end dates, with the Comparison periods (last month, the same month
last year) set from it.

## 3. Read

Read the Trading, Acquisition, Retention & LTV and Order value & product Sections, and the Appendix
slides, from the Source, with dates from `periods`. On a Growth Brain compose every query
for `run_sql` from the columns `list_tables` returns, one mart per call and one pull for every mart
read, the ad platform marts included, and take each figure's mart and basis from
`references/sources.md`; without one, read the connectors and files as its Connectors and exports
section sets out. For each slide `references/deck-layout.md` builds in full, read its
figures: this month, last month, the same month last year, and a budget only where the Source holds
one; the 24-month series for the trend charts, the 12 months or 12 cohorts the slide names; and the
columns of a slide that states its own. Check each total against its own read: the month's
revenue, orders and new orders against an unfiltered total of your orders for the month's days, and
marketing spend against channel reporting (without a brain, against each ad platform's own total).
On a Source that is not a Growth Brain, a slide is built where the Slides without a Growth Brain
table in `references/deck-layout.md` says that Source fills it and is a Brain slot otherwise, and
the three Appendix slides that are brain only are Brain slots whatever the connectors and files hold,
and the other Appendix slides are built where their main slide is. Last month's actions is built on every
Source: read what each action's metric did, last month against this month, as
`references/deck-layout.md` sets out. For each Focus question, read the figures its Focus slide
needs, from its Section's own slides where they hold them. For each Recommendation, read what its
sizing in `references/deck-layout.md` names that the slides do not hold: the budget's lever split,
the campaigns with spend and no new orders, and the single-category orders.

**Done when** every Trading, Acquisition, Retention & LTV and Order value & product slide and every
Appendix slide has its figures or its Brain slot (without a Growth Brain, built where the table
says its Source fills it and a Brain slot otherwise, the brain-only Appendix slides always Brain slots), a conditional slide (markets, subscriptions,
discount codes) being present only where the business has it; every action of the previous review
has its metric's last month and this month figures or "No data"; every Focus question has its
figures, or its Focus slide is a Brain slot; and:

- the KPI table's revenue, orders and new orders each equal an unfiltered total for the Current
  period's days read in its own query; new plus returning revenue equals revenue in every month of
  the series; and the customer base rolls forward (last month's active customers, plus new and
  reactivated, less lapsed, equals this month's) wherever the glossary's definitions are used or
  the brain's active includes one-order customers (where its active excludes them the check does
  not apply and the Notes say so);
- every measure `list_metrics` defines and the deck shows is read as the brain defines it, every
  slide names it as the brain does, and the Notes list each definition used;
- each figure sits on one basis, stated in the Notes, so no two slides disagree on a measure: MER
  as the brain defines it and labelled with its basis, cancelled orders counted or left out as
  channel reporting does, and a margin rate with margin and revenue on one basis;
- the Appendix channel table's rows, Other channels and its Unknown row included, are whole numbers
  that add up to its Total row's new orders, to the digit, which equals the KPI table's new orders,
  on the same basis as the channel CAC (modelled or measured), and its spend equals the KPI table's
  marketing spend, in every period shown (or the Notes carry the Channel total caveat); the
  `acq-channels` bars carry the same whole numbers as that table;
- paid, organic and Unknown new orders add up to new orders in each of the 12 months;
- each ad platform with spend in the Current period has one campaigns slide of its top five named
  campaigns by new orders and one Appendix slide of its top ten, its orders or spend not tied to a
  named campaign (attribution placeholders included) in a "No campaign" row below the ranking, never
  in it, so the ranking, that row and the other named campaigns add up to the platform's measured
  total of new orders, each title counting named campaigns only against that total, and the
  campaigns slide's source line saying campaign rows are measured new orders that can differ from a
  modelled channel row;
- the Appendix cohort table's Current period cohort size equals the KPI table's new orders where the
  cohort mart counts every order (otherwise the Cohort count caveat is in the Notes), every cohort
  starts at 100% in month 0, and the retention curves, the cohort LTV lines and the rolling average
  read the same cohorts as that table;
- every LTV figure reads the LTV window and the brain's LTV measure, and no `acq-ltv-channel` bar,
  best or worst channel or LTV gap rests on a channel of fewer than 30 customers (the source line
  counts those left off);
- the margin rows, where shown, are on a rung dated by order by the brain's own label and never net
  of ad spend, or on the highest such mixed-dated rung with the Mixed-dated margin caveat in the Notes, and a rung the brain says equals the one below
  carries the lower rung's name and the Equal rungs caveat;
- a Thin costing caveat names the month after the last dip of the fully costed share below half the
  Current period's;
- the blended AOV equals the KPI table's Average order value in every month of the series (and,
  where the brain defines an AOV metric, that metric), every revenue figure sits on the Revenue
  basis, and each budget cell is read from the budget mart on the Budget basis;
- the Appendix category table's rows, No category included, add up to its Total row, whose orders
  and sales equal the KPI table's, and the category bars, Other categories and No category included,
  add up to that month's revenue;
- discounted and full-price orders add up to orders in each of the 24 months, and the `aov-discount`
  source line counts the orders at 100% depth left out of depth (none left in a depth figure);
- no category row named "No category" holds an order that has a category, a multi-category bucket
  being a category row;
- the Discount codes slide and its Appendix slide are present only where an order in the Current
  period carries a code, their rows are code groups where `list_tables` shows a code group column on
  the orders and codes otherwise, a free-shipping row reads "free shipping" and a row of only 100%-depth orders "gifting" in its depth cell, and the
  Appendix rows add up to its Total row.

A figure the Source cannot give reads "No data" or its slide is a Brain slot; none is guessed.

## 4. Recommend

Write up to three Recommendation cards for each of Trading, Acquisition, Retention & LTV and Order
value & product from that Section's own figures, each with its title, evidence figure, action,
metric to watch and how to validate it, ranked by revenue at stake, as `references/deck-layout.md`
sets out. Then write Next month from every Section that holds cards, each data slide's Takeaway
panel, each divider's verdict, and the Executive summary, led by the Focus questions, with the
Month context in place of any cause the figures do not show, and each Action title last.

**Done when** every Trading, Acquisition, Retention & LTV and Order value & product card carries a
figure from its own Section's slides and an action, a metric to watch and Test, Watch next month or
Ship; Next month holds the three distinct gaps with the most revenue at stake (a card that
duplicates or sits inside a larger one, as the table in `references/deck-layout.md` defines "inside",
gives way), or fewer where fewer exist; every Budget gap card names its lever and how it was picked
and is sized on that lever's share of the shortfall, never the whole shortfall; every title and card
that names a budget gap is stated on the Budget basis; every Category gap
card compares single-category orders with single-category orders; every first-order cohort gap is
a first-order card, never a win-back; every paid channel or named campaign with spend and 0 new
orders has been checked for a Waste gap; no card is sized on a delta that reads "Not comparable"; every Focus question
leads the Executive summary; the Executive summary holds the four Stat row figures and one
takeaway with a figure for each of Acquisition, Retention & LTV, and Order value & product; every
data slide has a Takeaway panel that restates neither its Action title nor a Recommendation; every
divider has a verdict with a figure (or the fixed line where all its slides are Brain slots); a Month context the user gave appears on each
slide it bears on and in the Executive summary's takeaways, and no slide states a cause that neither the Month context nor
the data supports; and every content slide has an Action title of one full sentence with a figure.

## 5. Write

Open `references/deck-layout.md`, `references/slide-craft.md` and `references/crux-brand.md`, and
write `monthly-performance-review-YYYY-MM.html` in the working folder, `YYYY-MM` being the Current
period. A file of that name there is replaced. Write every slide of the slide list in its order,
the Focus slides after their Section's divider and Last month's actions after the Executive
summary, using the skeleton of `references/deck-layout.md` with the brand's values over the roles
of `references/crux-brand.md`, and each slide built to the craft of `references/slide-craft.md`.

**Done when** the file holds every slide of the slide list in order (conditional slides only
where the business has them), each one filled from the Source or a Brain slot, and one Focus slide for each Focus question, every stat and chart slide holding its Takeaway panel, Last month's actions
holds one row for each action of the previous review or its fixed line, the brand's values are the
only change to the skeleton's CSS (the Crux default where the brand has no look of its own), every slide has the footer, each built chart marked for a Share
toggle carries one and no other chart does, the Notes carry their fixed title and three headings (and the Brain line,
once, on a run without a Growth Brain), every Stat figure and table shows the bare symbol where the currency's symbol is longer than one character, with the Notes' Currency caveat naming the currency, every text size is at or above the minimums of `references/slide-craft.md` (the label size included), and the page makes no network request.

## 6. Close

Tell the user in four lines: the Current period's revenue and its MoM and YoY change; the Trading
move behind it; the top Recommendation; and how many slides are Brain slots, with a pointer to
gocrux.io/contact when any are. Then the file's path.

Then, when any action on Last month's actions is Not updated, list each one in the chat with its
metric's movement and ask which were done and, for any that were not, why. The run ends on that
question.

**Done when** the user has the four lines and the path, and every action that is Not updated is
listed with the question; where none is Not updated, no question is asked.

## 7. Update

On the user's reply, update the `last-actions` slide in the file written in step 5, in place: each
action the reply names takes Done, or Not done with the reason given ("No reason given" where there
is none), and the slide's Action title is rewritten from the new counts as `references/deck-layout.md`
sets out. An action the reply leaves out stays Not updated. Every other slide stays as written.

**Done when** the `last-actions` slide in the same file shows each status the reply gave, its Action
title agrees with the rows, no other slide has changed, and the user is told in one line that the
slide is updated, with any action still Not updated listed again.
