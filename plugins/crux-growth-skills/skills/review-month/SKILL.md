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
Section, Action title, Brain slot, Brain line, Share toggle, Current period, Comparison period,
Source, Month context, Focus question, Recommendation, Next month, Last month's actions and
Unattended run are those of `references/glossary.md`; use them as written.

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

Take each figure from the first of these Sources that holds it, starting at the one the intake
settled:

1. **A Growth Brain**: a connector named `<Client> - Growth Brain` that offers `list_tables`,
   `list_metrics`, `search_examples` and `run_sql`; the one the intake settled where several are
   connected. Open `references/sources.md` and make the calls it sets out, once each: `list_tables`
   with no arguments, `list_metrics` and `search_examples`.
2. **Ad account and Shopify connectors**, then
3. **CSV exports the user gives**: open `references/sources.md`, Connectors and exports.

Then settle the timezone and the currency once, as `references/sources.md` sets out, and resolve
the Current period and its Comparison periods once, in the `periods` CTE there, from the month the
intake settled.

**Done when** the one Growth Brain chosen has its roster, its metric definitions and its examples in
hand, or there is none; the timezone and the currency are set; and the Current period is a calendar
month set as start and end dates, with the Comparison periods (last month, the same month last
year) set from it.

## 3. Read

Read the Trading, Acquisition, Retention & LTV and Order value & product Sections, and the three
Appendix slides, in `run_sql` from the Source, with dates from `periods`. Compose every query from
the columns `list_tables` returns, one mart per call, and take each figure's mart and basis from
`references/sources.md`. For each slide `references/deck-layout.md` builds in full, read its
figures: this month, last month, the same month last year, and a budget only where the Source holds
one; the 24-month series for the trend charts, the 12 months or 12 cohorts the slide names; and the
columns of a slide that states its own. Check each total against its own query: the month's
revenue, orders and new orders against the orders mart for the month's days, and marketing spend
against channel reporting. These slides are built on a Growth Brain: on any other Source the
Acquisition, Retention & LTV, Order value & product and Appendix slides are Brain slots, and the
Appendix is a Brain slot whatever the connectors hold. Last month's actions is built on every
Source: read what each action's metric did, last month against this month, as
`references/deck-layout.md` sets out. For each Focus question, read the figures its Focus slide
needs, from its Section's own slides where they hold them.

**Done when** every Trading, Acquisition, Retention & LTV and Order value & product slide and every
Appendix slide has its figures or its Brain slot, a conditional slide (markets, subscriptions,
discount codes) being present only where the business has it; every action of the previous review
has its metric's last month and this month figures or "No data"; every Focus question has its
figures, or its Focus slide is a Brain slot; and:

- the KPI table's revenue, orders and new orders each equal an unfiltered total for the Current
  period's days read in its own query; new plus returning revenue equals revenue in every month of
  the series; and the customer base rolls forward (last month's active customers, plus new and
  reactivated, less lapsed, equals this month's) wherever the glossary's definitions are used;
- the Channel mix rows, its Unknown row included, add up to the Total row's new orders, which
  equals the KPI table's new orders, and its spend equals the KPI table's marketing spend, in every
  period shown (or the Notes carry the Channel total caveat);
- paid, organic and Unknown new orders add up to new orders in each of the 12 months;
- each ad platform with spend in the Current period has one campaigns slide of at most ten
  campaigns ranked by new orders;
- the cohort table's Current period cohort size equals the KPI table's new orders, every cohort
  starts at 100% in month 0, and the cohort LTV lines and the rolling average read the same
  cohorts as the table;
- every LTV figure reads the LTV window;
- the blended AOV equals the KPI table's Average order value in every month of the series;
- the Product and category mix rows, No category included, add up to the Total row, whose orders
  and sales equal the KPI table's, and each month's columns add up to that month's revenue;
- discounted and full-price orders add up to orders in each of the 24 months;
- the Discount codes slide is present only where an order in the Current period carries a code, and
  its rows add up to its Total row.

A figure the Source cannot give reads "No data" or its slide is a Brain slot; none is guessed.

## 4. Recommend

Write up to three Recommendation cards for each of Trading, Acquisition, Retention & LTV and Order
value & product from that Section's own figures, each with its title, evidence figure, action,
metric to watch and how to validate it, ranked by revenue at stake, as `references/deck-layout.md`
sets out. Then write the Executive summary, led by the Focus questions, and Next month from every
Section that holds cards, with the Month context in place of any cause the figures do not show,
and each Action title last.

**Done when** every Trading, Acquisition, Retention & LTV and Order value & product card carries a
figure from its own Section's slides and an action, a metric to watch and Test, Watch next month or
Ship; Next month holds the three cards with the most revenue at stake, or fewer where fewer exist;
every Focus question leads the Executive summary in Performance and Read; a Month context the user
gave appears on each slide it bears on and in the Read, and no slide states a cause that neither
the Month context nor the data supports; and every content slide has an Action title of one full
sentence with a figure.

## 5. Write

Open `references/deck-layout.md` and write `monthly-performance-review-YYYY-MM.html` in the working
folder, `YYYY-MM` being the Current period. A file of that name there is replaced. Write every
slide of the slide list in its order, the Focus slides after their Section's divider and Last
month's actions after the Executive summary, using the skeleton with the brand's values over its
colours and font stack as `references/deck-layout.md` sets out.

**Done when** the file holds every slide of the slide list in order (conditional slides only
where the business has them) and one Focus slide for each Focus question, Last month's actions
holds one row for each action of the previous review or its fixed line, the brand's values are the
only change to the skeleton's CSS, every slide has the footer, each built chart marked for a Share
toggle carries one and no other chart does, the Notes carry their three headings (and the Brain line,
once, on a run without a Growth Brain), and the page makes no network request.

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
