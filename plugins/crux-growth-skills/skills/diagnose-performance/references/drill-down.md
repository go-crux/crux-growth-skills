# Drill-down

How a Main driver is sliced down to the segment behind it, what to ask about it, and what to
recommend. This is the Crux analysis framework's craft: split the change into levers, find the
Main driver, slice within the lever, end on an action.

## Principles

1. **Find the Main driver before investigating anything else.** Drill only the levers
   `SKILL.md` step 5 names as Main drivers.
2. **Start broad and narrow down.** Work the tree as a path, one level at a time, each level
   inside the segment the previous level found.
3. **Weight by volume, not percentage change.** A big swing in a small segment is noise. Rank by
   Contribution and show the volume beside it.
4. **Every insight ends on an action.** A finding without one is trivia.
5. **Match the metric to the question.** Acquisition reads new orders, never total orders.
   Retention reads cohorts or repeat orders. Order value reads order-level data.

## Reading a level

A level is one dimension (channel, campaign, product category) read in both periods, from the
lever's own source so the segments add up to the lever. Take the dates from `periods` and apply
the Basis rule of `SKILL.md` step 4.

**A segment's contribution to the lever** is in the lever's own unit:

- A lever that is a count or an amount (visits, new customers, spend): the segment's change.
- A lever that is a ratio of a numerator N to a denominator D (conversion, order value, margin
  %): the segment's numerator in the Current period over the lever's whole denominator in the
  Current period, less the same for the Comparison period: `N_seg1 ÷ D1 − N_seg0 ÷ D0`. A segment
  whose volume grew or shrank therefore counts, as well as one whose rate moved.

Either way the segments add exactly to the lever's change, so a level can be checked.

**Volume** is the lever's count or amount, or a ratio lever's denominator (sessions for
conversion, orders for order value, revenue for margin %). Show each segment's Current period
volume and its share of the lever's volume beside its contribution.

**The descent rule.**

- Go down a level while one segment carries at least half the lever's change: the segment's
  contribution is at least half the lever's change, in the direction of the change.
- Ignore segments under 5% of the lever's volume in both periods. They join one "Other" row,
  which keeps the level adding up, and are never descended into.
- Stop at three levels, or when the source holds no finer dimension. Say which in the Drivers
  block, and name the finer dimension in the Notes.
- With no segment carrying half the change, stop at that level: the change is spread, and the
  table shows how.

A level below the first reads the same dimension list for the next step of the path, inside the
one segment carried: its segments are measured against the lever's whole change and add to that
segment's contribution.

Rank each table by contribution, the largest in the direction of the change first and segments
pulling the other way last. Round as `references/contribution.md` does, so the rows add exactly.

**Worked example.** An invented brand whose visits lever fell from 100,000 to 90,000 (−10,000).
The floor is 5% of the lever's volume: 5,000 visits in the Comparison period, 4,500 in the
Current period.

Level 1, channel:

| Channel | Comparison | Current | Contribution | Share of change | Share of volume |
|---|---|---|---|---|---|
| Paid social | 30,000 | 21,000 | −9,000 | 90% | 23% |
| Organic search | 35,000 | 34,000 | −1,000 | 10% | 38% |
| Email | 15,000 | 14,000 | −1,000 | 10% | 16% |
| Direct | 20,000 | 21,000 | +1,000 | −10% | 23% |

Paid social carries 90% of the change, so the descent goes into it. Level 2, campaign within
paid social, whose rows add to its −9,000:

| Campaign | Comparison | Current | Contribution | Share of change | Share of volume |
|---|---|---|---|---|---|
| Prospecting | 18,000 | 10,000 | −8,000 | 80% | 11% |
| Retargeting | 8,000 | 7,500 | −500 | 5% | 8% |
| Other (Brand, under the floor) | 4,000 | 3,500 | −500 | 5% | 4% |

Prospecting carries 80% of the lever's change, so a third level (ad group or ad) follows where
the source holds one, and the descent then stops at three levels.

## Paths

Follow the lever's path in order. Never reorder it.

| Lever | Path |
|---|---|
| visits, new customers, new visitor share, new-customer conversion, conversion, marketing spend, spend (CAC, MER / ROAS) | channel → campaign → landing page, ad group or ad |
| engaged rate, add to basket, checkout start, purchase | channel → campaign → landing page, for the stage |
| order value | discount → order mix → product category |
| returning orders, active customers, repeat rate | channel → CRM campaign or flow → cohort |
| platform ROAS: spend, impressions, click-through, platform conversion, order value | campaign → ad set or ad group → ad |
| margin % | product category → product → discount |
| any lever with no fixed path | the dimensions the source holds, ranked by contribution |

**Traffic, new customers, conversion, cost per visit, CAC.**

- Go to channels first. Landing pages before channels is the framework's named trap: a page's
  numbers move with the traffic sent to it, so only a channel level says whether the traffic or
  the page changed.
- The third level is the finest of landing page, ad group and ad the source holds. Take the one
  that carries most of the campaign's change.
- New customers and new-customer conversion read new orders.
- **Conversion** also checks the stages before the channels. Read session → engaged, engaged →
  checkout and checkout → order in both periods, from the funnel mart where the roster lists
  one, and name the stage that fell furthest. This check is one small table and does not count
  as a level. Then run the channel path for that stage. When no channel carries half the change,
  suspect a site-wide fault (checkout, payments, a key product page) and say so in the Drivers
  block.

**Order value.**

- Discount first. The level's segments are discounted orders and orders at full price. Beside
  them show the discount rate (the share of orders discounted) and the discount depth (the
  discount over pre-discount revenue, on discounted orders), in both periods.
- Then order mix, inside the segment carried: new against repeat, order type, order category.
  Read each dimension the source holds and take the one whose largest segment carries the most
  of the change; name the others in one line.
- Then product category.

**Returning orders, repeat rate, active customers.** Repeat orders by channel, then CRM campaign
or flow, then cohort. A cohort is read only once it is mature for the horizon the lever uses: a
cohort younger than the horizon joins "Other" and is named in the Notes. When the source holds
no CRM campaign or flow, stop at the channel level.

**Platform ROAS.** The platform's own campaign, then ad set or ad group, then ad. Read platform
figures only, never the store's.

**Margin %.** Product category, then product, then discount.

**Any other lever.** Read each dimension the source holds at one level, take the dimension whose
largest segment carries the most of the lever's change, and descend by the rule above.

## After the drill-down

### The Cause question

One question per drilled driver, asked in one numbered round with the others, in plain words.
Open with the evidence in a sentence with its figures, then offer two or three likely causes,
the best fit for the evidence first, then "something else, or you don't know". Offer causes
that fit the lever:

| Lever | Likely causes |
|---|---|
| visits, new customers, marketing spend | a budget, bid or campaign change; a campaign paused or ended; a seasonal or tracking change |
| conversion, engaged rate, add to basket, checkout start, purchase | a site or checkout change; a payments or shipping issue; a change in the traffic sent |
| order value | a promotion or price change; a change in free-shipping threshold or bundles; a change in the product mix sold |
| returning orders, repeat rate, active customers | a flow or newsletter paused or changed; a promotion that pulled orders forward; a cohort ageing |
| margin % | a discount or price change; a supplier cost change; a change in the product mix sold |
| platform levers | a creative, audience or bidding change; a platform delivery change |

"Don't know" sets that driver's Cause to "Not confirmed". Any other answer is the Cause, in
the user's words.

### Recommendations

Each drilled driver gets 1 to 3 recommendations that follow from where the Drill-down ended,
ranked by the KPI at stake. The **KPI at stake** is the Success KPI's change that the
recommendation's segment carries: the segment's share of the lever's change times the lever's
Contribution, in the Success KPI's unit. Where a recommendation spans segments, use their sum.
State it as the change at stake, never as a forecast of what the action recovers.

Each recommendation carries:

- **Hypothesis**: "if we X, the KPI moves because Y", with Y taken from the evidence.
- **Action**: one concrete thing to do, naming the segment.
- **Metric to watch**: the lever, or the segment's measure, that shows whether it worked.
- **How to validate**: one of
  - **Test**, when the effect is uncertain and traffic or customers can be split;
  - **Watch next period**, when the action is cheap to reverse or the volume is too small to
    split;
  - **Ship**, when the cause is a confirmed fault and the action restores what worked before.

**Check-first.** Under a "Not confirmed" Cause the action opens with the check that would
confirm the cause (the promotion calendar for these dates, the campaign's change history, the
checkout's release log), and says what to do on each answer. Ship never applies to a check-first
action.

A lever over the threshold in step 5 gets one action line, check-first: the first segment or
level to open and what to look for. An Offset gets no action.
