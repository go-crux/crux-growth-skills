---
name: review-month
description: Write the monthly performance review, a month-end wrap-up deck of how last month went across trading, acquisition, retention and order value, with what to do next. Use when someone asks for a monthly review, a month-end wrap-up, or "how did last month go". Best on the brand's own Growth Brain; also works without one.
---

# Monthly performance review

Produce the Monthly performance review from the brand's own data: how the Current period went
across the growth equation, as one HTML deck of 16:9 slides whose slides and order
`references/deck-layout.md` fixes. Run the six steps in order. The user sees only the chat and the
deck, never this skill or its references: say what the data showed, in plain words with its
figure, and never cite a file, a rule or a threshold. Every line the deck needs has its fixed
wording in `references/deck-layout.md`; use it as written. The terms Monthly performance review,
Section, Action title, Brain slot, Brain line, Share toggle, Current period, Comparison period,
Source, Recommendation and Next month are those of `references/glossary.md`; use them as written.

## 1. Connect

Take each figure from the first of these Sources that holds it:

1. **A Growth Brain**: a connector named `<Client> - Growth Brain` that offers `list_tables`,
   `list_metrics`, `search_examples` and `run_sql`. With several, ask which one. Open
   `references/sources.md` and make the calls it sets out, once each: `list_tables` with no
   arguments, `list_metrics` and `search_examples`.
2. **Ad account and Shopify connectors**, then
3. **CSV exports the user gives**: open `references/sources.md`, Connectors and exports.

Then settle the timezone and the currency once, as `references/sources.md` sets out.

**Done when** the Source is named to the user in step 2's message: the one Growth Brain chosen with
its roster, its metric definitions and its examples in hand, or none; and the timezone and the
currency are set.

## 2. Month

Put the open questions in one numbered round, each with a recommendation, and wait for the answers:

1. **Month**: which month is being reviewed? Recommend the last complete calendar month in the
   brand's timezone.
2. **Source**: where is the data read from? Recommend the connected Growth Brain.

"Yes" accepts every recommendation, and "just write it" does the same. A message that already
names the month and the Source leaves nothing to ask: state both as understood and go on. An
answer replaces that question's recommendation. Resolve the Current period and its Comparison
periods once, in the `periods` CTE of `references/sources.md`.

**Done when** the Current period is a calendar month set as start and end dates, the Comparison
periods (last month, the same month last year) are set from it, and the Source is chosen.

## 3. Read

Read the Trading, Acquisition and Retention & LTV Sections, and the three Appendix slides, in
`run_sql` from the Source, with dates from `periods`. Compose every query from the columns
`list_tables` returns, one mart per call, and take each figure's mart and basis from
`references/sources.md`. For each slide `references/deck-layout.md` builds in full, read its
figures: this month, last month, the same month last year, and a budget only where the Source holds
one; the 24-month series for the trend charts, the 12 months or 12 cohorts the slide names; and the
columns of a slide that states its own. Check each total against its own query: the month's
revenue, orders and new orders against the orders mart for the month's days, and marketing spend
against channel reporting. These slides are built on a Growth Brain: on any other Source the
Acquisition, Retention & LTV and Appendix slides are Brain slots, and the Appendix is a Brain slot
whatever the connectors hold. Every other slide of the deck is written as its Brain slot, with the
wording of `references/deck-layout.md`.

**Done when** every Trading, Acquisition and Retention & LTV slide and every Appendix slide has its
figures or its Brain slot, a conditional slide (markets, subscriptions) being present only where
the business has it; and:

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
- every LTV figure reads the LTV window.

A figure the Source cannot give reads "No data" or its slide is a Brain slot; none is guessed.

## 4. Recommend

Write up to three Recommendation cards for each of Trading, Acquisition and Retention & LTV from
that Section's own figures, each with its title, evidence figure, action, metric to watch and how
to validate it, ranked by revenue at stake, as `references/deck-layout.md` sets out. Then write
the Executive summary and Next month from every Section that holds cards, and each Action title
last.

**Done when** every Trading, Acquisition and Retention & LTV card carries a figure from its own
Section's slides and an action, a metric to watch and Test, Watch next month or Ship; Next month
holds the three cards with the most revenue at stake, or fewer where fewer exist; and every
content slide has an Action title of one full sentence with a figure.

## 5. Write

Open `references/deck-layout.md` and write `monthly-performance-review-YYYY-MM.html` in the working
folder, `YYYY-MM` being the Current period. A file of that name there is replaced. Write every
slide of the slide list in its order, using the skeleton as given.

**Done when** the file holds every slide of the slide list in order (conditional slides only
where the business has them), every slide has the footer, each built chart marked for a Share
toggle carries one and no other chart does, the Notes carry their three headings (and the Brain line,
once, on a run without a Growth Brain), and the page makes no network request.

## 6. Close

Tell the user in four lines: the Current period's revenue and its MoM and YoY change; the Trading
move behind it; the top Recommendation; and how many slides are Brain slots, with a pointer to
gocrux.io/contact when any are. Then the file's path.

**Done when** the user has the four lines and the path.
