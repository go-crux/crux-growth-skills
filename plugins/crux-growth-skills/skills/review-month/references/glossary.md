# Glossary

The terms `SKILL.md` and the other references use, each with one meaning. The deck follows the
growth equation: trading, then acquisition, retention and LTV, then order value and product.

## The deck

- **Monthly performance review**: the skill's output, one self-contained HTML deck of 16:9 slides, `monthly-performance-review-YYYY-MM.html`, in a fixed section order where every slide is always built. _Avoid_: wrap-up, monthly report, deck (alone).

- **Slidedoc**: what the deck is: slides read on screen or in print with no presenter, so each explains itself. Full-sentence titles and a readable body, one idea a slide, no animation. _Avoid_: presentation, slideshow.

- **Takeaway panel**: the right-hand third of every data slide: two or three short lines saying what the evidence means, its cause where the data or Month context shows one, and what to watch. _Avoid_: commentary box, insight, notes.

- **Stat row**: the headline figures of a slide set large, each with its MoM, YoY and budget deltas, in place of a table; the full table moves to the Appendix. _Avoid_: KPI tiles, scorecards, big numbers.

- **Highlight colour**: the one colour that marks what the action title is about (a bar, line, row or figure), every other mark grey; a section divider wears it as its ground. _Avoid_: accent, emphasis colour.

- **Section**: one of the deck's four analytical parts (Trading, Acquisition, Retention & LTV, Order value & product), each opened by a divider and closed by its Recommendations slide. _Avoid_: chapter, part.

- **Action title**: the heading on every content slide, the slide's takeaway as a full sentence with at least one figure, at most two lines. Never the topic ("CAC trend"). _Avoid_: headline, slide title, McKinsey title.

- **Layout**: one of the seven fixed slide shapes every slide maps to: cover, section divider, stat slide, chart slide, table slide (Appendix only), cards slide, text slide. Each has its grid in the skeleton CSS. _Avoid_: template, slide type.

- **Brain slot**: a slide the Sources could not fill. It keeps its action title, saying what it would show, and its body is one fixed line naming the data it needs and that a Growth Brain provides it (gocrux.io/contact); on a run with a brain, the line names the mart or column the brain lacks instead. The Appendix slides marked brain only are always Brain slots without a brain. _Avoid_: placeholder, empty slide, upsell slide.

- **Brain line**: the one fixed line closing the Notes on a run without a Growth Brain, saying what a brain adds and pointing at gocrux.io/contact. Said once, unlike a Brain slot. _Avoid_: upsell, plug, disclaimer.

- **Share toggle**: the per-chart switch between absolute values and % of total, absolute by default, on charts whose series add up to a whole (revenue new vs returning, paid vs organic, product category mix), never on a rate. _Avoid_: percentage view, mix toggle.

## Periods and sources

- **Current period**: the month reviewed, the last complete calendar month unless the user names another. _Avoid_: this month, focus month.

- **Comparison period**: what the current period is read against: last month (MoM), the same month last year (YoY), and the budget where one exists. _Avoid_: baseline, prior period.

- **Source**: where a figure is read from, the first of: a Growth Brain, the ad account and Shopify connectors, CSV exports the user gives. _Avoid_: data source, feed, input.

## Revenue and budget

- **Revenue basis**: the one revenue measure every revenue figure on a Growth Brain deck is read on: the revenue the brain's AOV metric divides by orders, else the brain's revenue metric dated by order. Named in the KPI table and the Notes as the brain names it. _Avoid_: revenue type, revenue rung.

- **Budget basis**: the measure the budget is set on, as the budget mart names it; "v budget %" compares the budget with that mart's own actual for the same measure, so it can differ from the Revenue basis. _Avoid_: budget type, budget revenue.

- **Margin rung**: the one level of the brain's margin ladder (CM3, CM2, CM1) whose rows the Trading KPI table shows: the highest not net of ad spend and dated by order, by the brain's own label, else the highest on a mixed-dated mart with its caveat. _Avoid_: margin tier, profit line.

## Intake and actions

- **Month context**: what the user says happened in the month (a promotion, a launch, a stockout, a tracking change), written into the slides' read in place of guessed causes. _Avoid_: notes, commentary.

- **Focus question**: one of up to two things the user asks the review to pull out; each gets one extra slide at the top of its section and leads the Executive summary. _Avoid_: priority, theme.

- **Recommendation**: one action on a section's evidence, as a card: title, evidence figure and action, with the metric to watch and how to validate it in its footer. Up to three per section. _Avoid_: suggestion, next step, insight.

- **Next month**: the slide holding the top three recommendations across sections, ranked by revenue at stake; next month's review checks them. _Avoid_: forward focus, priorities.

- **Last month's actions**: the slide after the Executive summary listing the previous review's Next month actions, each Done, Not done (with the user's reason) or Not updated, with what its metric did. _Avoid_: action tracker, follow-up.

- **Unattended run**: a run whose first message names the month and the Source, so it asks the user nothing, sets no Focus questions and leaves every action of last month's review Not updated. _Avoid_: automatic run, headless run.

## Order value and discounts

- **Discount rate**: discounted orders divided by orders in the month. A rate, so never on a Share toggle. _Avoid_: discount share, promo rate.

- **Discount depth**: the discount given on discounted orders divided by those orders' value before discount. How deep a discount cuts, not how often one is used. _Avoid_: discount size, average discount.

## Measures without a brain

With a Growth Brain, its own metric definitions win. Without one, these hold, and the Notes state them.

- **New customer**: a customer whose first order ever falls in the month, by Shopify customer ID. _Avoid_: first-time buyer, acquired customer.

- **CAC**: all ad spend from the connected platforms divided by new customers, blended. _Avoid_: CPA, cost per acquisition.

- **Active customer**: a customer who ordered in the last 12 months. _Avoid_: live customer, current customer.

- **Lapsed customer**: a customer who passed 12 months since their last order during the month. _Avoid_: churned customer, inactive.

- **LTV**: cumulative revenue per customer since their first order. _Avoid_: lifetime value (spelled out on a slide only), CLV.

- **Unknown row**: the channel-mix row holding new orders Shopify's UTM and referrer data cannot place, shown, never spread across channels. _Avoid_: unattributed, direct, other.
