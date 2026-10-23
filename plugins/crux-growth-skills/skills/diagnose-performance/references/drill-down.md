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

A level is one dimension (channel, campaign, order category) read in both periods, from the
lever's own Source so the segments add up to the lever. Take the dates from `periods` and apply
the Basis rule of `SKILL.md` step 4. A level's **parent** is the lever at the first level, and
the segment descended into below it.

**A segment's contribution to the lever:**

- A lever that is a count or an amount (visits, new customers, spend): the segment's change, in
  the lever's unit.
- A lever that is a ratio of a numerator N to a denominator D (conversion, order value, margin
  %): the segment's change in the lever is its numerator in the Current period over the lever's
  whole denominator in the Current period, less the same for the Comparison period:
  `N_seg1 ÷ D1 − N_seg0 ÷ D0`. A segment whose volume grew or shrank therefore counts, as well as
  one whose rate moved. Show it in Success KPI units: its share of the lever's change times the
  lever's Contribution. Percentage points never appear as a contribution; the two period columns
  carry the rates.

Either way the segments add exactly to the parent's change, so a level can be checked.

**Volume** is the lever's count or amount, or a ratio lever's denominator (sessions for
conversion, orders for order value, revenue for margin %). Show each segment's Current period
volume, its share of its parent's volume and its share of its parent's change beside its
contribution.

**Choosing among dimensions.** Where a step of a path offers several dimensions, read each at
that level and take the one whose largest qualifying segment carries most of the parent's change;
name the others in one line. A dimension the lever has no values on is skipped (landing page
carries no spend). A qualifying segment is one the volume floor leaves on its own row.

**The descent rule.** Every cut-off is here, and none is named on the page.

- Go down a level into a segment that carries at least half its parent's change, in the direction
  of the change.
- The volume floor: a segment under 5% of its parent's volume in both periods joins one "Other"
  row, which keeps the level adding up, and is never descended into. A segment carrying at least
  half its parent's change is never floored.
- Stop at three levels, or when the Source holds no finer dimension. Say which in the Drivers
  block, and name the finer dimension in the Notes.
- With no segment carrying half the change, stop at that level: the change is spread, and the
  table shows how.
- A level whose parent holds one segment is collapsed: it gets no table, says in one line which
  segment it is, and the descent continues below it. A collapsed or skipped level does not count
  toward the three.
- Each stop, collapse and "Other" row is worded on the page as `references/diagnosis-layout.md`
  sets out; the page never names a floor, a cap or a share.

Rank each table by contribution, the largest in the direction of the change first and segments
pulling the other way last. Round as `references/contribution.md` does, so the rows add exactly.

**Worked example.** An invented brand whose visits lever fell from 100,000 to 90,000 (−10,000).
The floor at level 1 is 5% of the lever's volume: 5,000 visits in the Comparison period, 4,500 in
the Current period.

Level 1, channel:

| Channel | Comparison | Current | Contribution | Share of change | Share of volume |
|---|---|---|---|---|---|
| Paid social | 30,000 | 21,000 | −9,000 | 90% | 23% |
| Organic search | 35,000 | 34,000 | −1,000 | 10% | 38% |
| Email | 15,000 | 14,000 | −1,000 | 10% | 16% |
| Direct | 20,000 | 21,000 | +1,000 | −10% | 23% |

Paid social carries 90% of the change, so the descent goes into it. Level 2, campaign within
paid social, is measured against paid social: its change is −9,000, and the floor is 5% of its
volume, 1,500 visits in the Comparison period and 1,050 in the Current period. Its rows add to
−9,000:

| Campaign | Comparison | Current | Contribution | Share of change | Share of volume |
|---|---|---|---|---|---|
| Prospecting | 18,000 | 10,800 | −7,200 | 80% | 51% |
| Retargeting | 8,000 | 6,650 | −1,350 | 15% | 32% |
| Brand | 4,000 | 3,550 | −450 | 5% | 17% |

Prospecting carries 80% of paid social's change, so a third level follows where the Source holds
one, and the descent then stops at three levels. If the visits lever's Contribution to revenue is
−£90,000, Prospecting's share of the lever's change is 7,200 ÷ 10,000 = 72%, so its KPI at stake
is 72% × −£90,000 = −£64,800.

## Paths

Follow the lever's path in order. Never reorder it. Without a Growth Brain the Source may hold
only part of a path (`references/exports.md` names the finest dimension each holds): descend as
far as it goes and stop there. Never begin at a lower level because the first is missing; a
landing page report with no channel does not start the path.

| Lever | Path |
|---|---|
| visits, new customers, new visitor share, new-customer conversion, conversion, marketing spend, spend (CAC, MER / ROAS) | channel → campaign → landing page, ad group or ad |
| engaged rate, add to basket, checkout start, purchase | channel → campaign → landing page, for the stage |
| order value (store trees) | discount → order mix → product category |
| returning orders, active customers, repeat rate | channel → CRM campaign or flow → cohort |
| platform ROAS tree: spend, impressions, click-through, platform conversion, order value | campaign → ad set or ad group → ad |
| margin % | product category → product → discount |
| cost per visit (spend and visits ranked together, `SKILL.md` step 5) | the path of spend and visits: channel → campaign → landing page, ad group or ad |
| any lever with no fixed path | the dimensions the source holds, ranked by contribution |

**Where each dimension is held.** A path reads a dimension only from the Source below; where a
Source does not hold it, the Drill-down stops above it. Confirm each column in `list_tables`.

| Dimension | Growth Brain | Without one |
|---|---|---|
| channel | `<client>-channel_reporting` | GA4 sessions by default channel group |
| campaign | `<client>-channel_reporting` | the Google Ads or Meta Ads campaign report |
| landing page, ad group, ad | `<client>-channel_reporting` | a connector that reads it; the exports stop at campaign |
| discount, new against repeat, order-level flags, order category | `<client>-orders` | none |
| product | `<client>-order_items`, where `list_tables` shows it carries the lever's measure | none |
| CRM campaign or flow | the CRM or email mart, where the roster lists one | none |
| cohort | `<client>-ltv_retention` | none |
| funnel stage | `<client>-ecommerce_funnel` | none |

The platform ROAS tree reads every dimension from the platform's own Source
(`references/lever-trees.md` names it), never from `<client>-channel_reporting`.

**Traffic, new customers, conversion, cost per visit, CAC.**

- Go to channels first. Landing pages before channels is the framework's named trap: a page's
  numbers move with the traffic sent to it, so only a channel level says whether the traffic or
  the page changed.
- The third level is one criterion: of landing page, ad group and ad, the dimension whose largest
  qualifying segment carries most of the campaign's change, by Choosing among dimensions above.
- New customers and new-customer conversion read new orders.
- **Conversion and new-customer conversion** also check the stages before the channels. Read
  session → engaged and engaged → checkout in both periods, from the funnel Source, and name the
  stage that moved furthest in the direction of the change. This check is one small table and
  does not count as a level. Then run the channel path for the lever itself. Where no funnel
  Source is held, skip the check with one line. When no channel carries half the change, suspect
  a site-wide fault (checkout, payments, a key product page) and say so in the Drivers block.

**Order value (store trees).**

- Discount first, from the orders mart. The level's segments are discounted orders and orders at
  full price. Beside them show the discount rate (the share of orders discounted) and the
  discount depth (the discount over pre-discount revenue, on discounted orders), in both periods.
  When the discounted orders are floored, say so in one line and read order mix across all orders.
- Then order mix, inside the segment carried: new against repeat, and the order-level flags the
  orders mart holds. Take the dimension by Choosing among dimensions.
- Then product category: the orders mart's order category, which is order-level and so adds to
  order-level revenue.

**Returning orders, repeat rate, active customers.** Repeat orders by channel, then CRM campaign
or flow, then cohort. A cohort is read only once it is mature for the horizon the lever uses: a
cohort younger than the horizon joins the "Other" row and is named in the Notes. When the source holds
no CRM campaign or flow, stop at the channel level.

**Platform ROAS tree.** Every lever takes the platform's own path: campaign, then ad set or ad
group, then ad, down to the finest level the Source holds. Order value is the platform's
conversion value per purchase, so it takes this path too, not the discount path. Read platform
figures only, never the store's.

**Margin %.** Product category, then product, then discount.

**Any other lever.** Read each dimension the source holds at one level, take the dimension by
Choosing among dimensions, and descend by the rule above.

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
| order value | a promotion or price change; a change in the free-shipping minimum or bundles; a change in the product mix sold |
| returning orders, repeat rate, active customers | a flow or newsletter paused or changed; a promotion that pulled orders forward; a cohort ageing |
| margin % | a discount or price change; a supplier cost change; a change in the product mix sold |
| platform levers | a creative, audience or bidding change; a platform delivery change; for order value, a price or promotion change |

"Don't know" sets that driver's Cause to "Not confirmed". Any other answer is the Cause, in
the user's words.

**Cause evidence.** Where a lever has zero levels (Shopify sessions with no channel), the
question may name in one sentence the landing pages whose sessions moved most. That is evidence
for the Cause, never a Drill-down level.

### Recommendations

Each drilled driver gets 1 to 3 recommendations, ranked by the KPI at stake. The **segment the
Drill-down ended on** is the largest segment in the direction of the change at the last level
read.

- The first recommendation follows that segment. A driver with zero levels has no segment: its
  recommendations take the lever itself, each a different action on it, and its KPI at stake is
  the lever's whole Contribution.
- A second or third may take the next segment in the direction of the change, at the same level
  or the parent's.
- A segment pulling against the change gets no recommendation of its own.

The **KPI at stake** is the Success KPI's change that the recommendation's segment carries: the
segment's share of the lever's change times the lever's Contribution, in the Success KPI's unit,
and never more than the lever's Contribution. Where a recommendation spans segments, use their
sum, capped the same way. State it as the change at stake, never as a forecast of what the action
recovers.

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

An Also large lever in step 5 gets one action line, check-first: the first segment or
level to open and what to look for. An Offset gets no action.
