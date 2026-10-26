# Glossary

The terms `SKILL.md` and the other references use, each with one meaning. The method is the Crux
analysis framework: split the change into levers, find the main driver, drill into it, act.

- **Success KPI**: the one figure the user is judging performance on (CM3, revenue, CAC, ROAS or any other), named by the user at intake. Every lever tree rebuilds it. _Avoid_: north star, target metric, headline metric.

- **Current period**: the period being diagnosed, as the user names it (a week, a month, a quarter, a year). _Avoid_: this period, focus period.

- **Comparison period**: the period the current period is read against, as the user names it (the one before, the same one last year, or any other). _Avoid_: baseline, control, prior period.

- **Period timezone**: the one timezone that settles today's date when a period is named relative to today ("last month"); it may be the store's own with no name, or not known. Each Source is still read in its own timezone. _Avoid_: store timezone, reporting timezone.

- **Good direction**: whether higher or lower is better for the Success KPI (lower for CAC and any other cost per unit, higher for the rest), stated for each tree in the lever tree catalogue. A change in the good direction is an **improvement**, one against it a **decline**; a lever whose Contribution runs in the good direction **improved** the Success KPI, one against it **worsened** it. _Avoid_: positive, negative, a rise, a fall (for the KPI's change as good or bad news).

- **Lever**: one term of the lever tree, either a volume (visits, new customers, spend) or an efficiency (conversion, order value, margin %). _Avoid_: pillar, factor, component, driver.

- **Lever tree**: the 3 to 5 levers that rebuild the Success KPI exactly, at least one volume and one efficiency, taken from the catalogue or derived to the same rule, and confirmed by the user before any query. _Avoid_: metric tree, KPI tree, decomposition.

- **Source**: the one place a lever is read from, the same for both periods: a Growth Brain mart, a platform connector (Shopify, GA4, Google Ads, Meta Ads) or a file the user gives. Taken in that order, per lever. Named on the page in plain words (the layout lists them), never by mart or file. _Avoid_: data source, feed, input.

- **Contribution**: a lever's share of the Success KPI's change between the two periods, computed so the contributions add exactly to the whole change. _Avoid_: impact, effect, attribution.

- **Main driver**: the lever with the largest contribution in the direction of the change. A second lever with at least half that contribution is a main driver too; at most two, each taken through the drill-down. _Avoid_: root cause, key driver, culprit.

- **Also large**: a lever other than a main driver, in the direction of the Success KPI's change, with at least half the largest contribution; named with its figure and given one check-first action line, never drilled. _Avoid_: over the threshold, secondary driver, runner-up.

- **Offset**: a lever whose contribution runs against the Success KPI's change; named with its figure, never drilled. One whose contribution is larger in size than the largest main driver's also gets one check-first action line. _Avoid_: headwind, tailwind.

- **Cost pair**: spend and the volume it buys, ranked as one lever when their contributions run against each other: spend and visits as cost per visit, spend and impressions as CPM. The pair takes one role, shown on both rows. _Avoid_: blended cost, efficiency pair.

- **Drill-down**: the levels a main driver is sliced through, broad to narrow, descending while one segment carries at least half its parent's change (the lever's, at the first level), to at most three levels. A main driver whose source holds no finer dimension has zero levels and is still drilled: it gets a cause and recommendations. _Avoid_: deep dive, breakdown.

- **Cause**: what happened in the business behind a drilled main driver (a promotion, a paused flow, a broken checkout), confirmed by the user, else "Not confirmed". _Avoid_: reason, explanation.

- **Recommendation**: one action on a drilled main driver, with a hypothesis ("if we X, the KPI moves because Y"), the action, the metric to watch and how to validate it (test, watch next period or ship); 1 to 3 per driver, ranked by the KPI at stake. _Avoid_: suggestion, next step, insight.

- **Check-first**: an action that opens with the check that would confirm the cause, used when the Cause is "Not confirmed", and for the one action line an Also large lever or Offset gets, which has no Cause. _Avoid_: investigate, look into.

- **Brain line**: the one fixed line, said once on the page and once in the chat on a run without a Growth Brain (a stopped run, which writes no page, says it in the chat only), saying what a brain adds (margin (CM3), one source for every lever, the drill-down by channel, product and cohort) and pointing at gocrux.io/contact. _Avoid_: upsell, plug, disclaimer.

- **Performance diagnosis**: the skill's output, one HTML page with fixed headings (Summary, The change, Levers, Drivers, Cause, Recommendations, Notes). _Avoid_: report, analysis, wrap-up.
