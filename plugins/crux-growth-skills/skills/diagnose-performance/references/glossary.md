# Glossary

The terms `SKILL.md` and the other references use, each with one meaning. The method is the Crux
analysis framework: split the change into levers, find the main driver, drill into it, act.

- **Success KPI**: the one figure the user is judging performance on (CM3, revenue, CAC, ROAS or any other), named by the user at intake. Every lever tree rebuilds it. _Avoid_: north star, target metric, headline metric.

- **Current period**: the period being diagnosed, as the user names it (a week, a month, a quarter, a year). _Avoid_: this period, focus period.

- **Comparison period**: the period the current period is read against, as the user names it (the one before, the same one last year, or any other). _Avoid_: baseline, control, prior period.

- **Lever**: one term of the lever tree, either a volume (visits, new customers, spend) or an efficiency (conversion, order value, margin %, cost per visit). _Avoid_: pillar, factor, component, driver.

- **Lever tree**: the 3 to 5 levers that rebuild the Success KPI exactly, at least one volume and one efficiency, taken from the catalogue or derived to the same rule, and confirmed by the user before any query. _Avoid_: metric tree, KPI tree, decomposition.

- **Source**: the one place a lever is read from, the same for both periods: a Growth Brain mart, a platform connector (Shopify, GA4, Google Ads, Meta Ads) or a file the user gives. Taken in that order, per lever. _Avoid_: data source, feed, input.

- **Contribution**: a lever's share of the Success KPI's change between the two periods, computed so the contributions add exactly to the whole change. _Avoid_: impact, effect, attribution.

- **Main driver**: the lever with the largest contribution. A second lever with at least half its contribution is a main driver too; at most two are drilled. _Avoid_: root cause, key driver, culprit.

- **Offset**: a lever whose contribution runs against the Success KPI's change; named with its figure, never drilled. _Avoid_: headwind, tailwind.

- **Drill-down**: the levels a main driver is sliced through, broad to narrow, descending while one segment carries at least half its parent's change (the lever's, at the first level), to at most three levels. _Avoid_: deep dive, breakdown.

- **Cause**: what happened in the business behind a drilled main driver (a promotion, a paused flow, a broken checkout), confirmed by the user, else "Not confirmed". _Avoid_: reason, explanation.

- **Recommendation**: one action on a drilled main driver, with a hypothesis ("if we X, the KPI moves because Y"), the action, the metric to watch and how to validate it (test, watch next period or ship); 1 to 3 per driver, ranked by the KPI at stake. _Avoid_: suggestion, next step, insight.

- **Check-first**: an action that opens with the check that would confirm the cause, used when the Cause is "Not confirmed". _Avoid_: investigate, look into.

- **Brain line**: the one fixed line, said once on the page and once in the chat on a run without a Growth Brain, saying what a brain adds (margin (CM3), one source for every lever, the drill-down by channel, product and cohort) and pointing at gocrux.io/contact. _Avoid_: upsell, plug, disclaimer.

- **Performance diagnosis**: the skill's output, one HTML page with fixed headings (Summary, The change, Levers, Drivers, Cause, Recommendations, Notes). _Avoid_: report, analysis, wrap-up.
