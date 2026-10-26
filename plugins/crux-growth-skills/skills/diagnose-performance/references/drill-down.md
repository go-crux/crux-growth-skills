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
lever's own Source so the segments add up to the lever, except an order-mix level (next
paragraph). Take the dates from `periods` and apply the Basis rule of `SKILL.md` step 4. A
level's **parent** is the lever at the first level, and the segment descended into below it.

**An order-mix level reads its own mart.** A level whose dimension the table under Paths places
in `<client>-orders` or `<client>-order_items` (discount, new against repeat, order-level flags,
order category, product) is read there, even when the lever's Source is another mart, such as
channel reporting for a revenue tree's order value. The platform ROAS tree is not covered: it
reads the platform only. The Basis rule is unchanged: the tree's levers and the Success KPI
still come from one mart, and only a Drill-down level reads another. Apportion the level so its
rows add to the lever's Contribution: each segment's share of the change is its share as the
orders mart measures it (the ratio rule below), applied to the lever's Contribution. For an
order value level, that ratio's revenue is the orders mart's total sales, order-dated, on the
basis `SKILL.md` Basis gives that mart (and, on the CM3 tree, on the rows its order counts take),
and its orders are that mart's order count, whichever Source the tree's own revenue comes from:
only the shares come from the orders mart. Each further level inside a segment is apportioned
the same way, to that segment's Contribution. Say in one Notes line, in the wording of
`references/diagnosis-layout.md`, that the split comes from the orders while the lever's total
comes from its own Source. Where the orders mart shows no change in the lever between the
periods, no share exists: the level is not read and the Drill-down stops above it.

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
contribution. For a count or amount lever the Current period column already is the volume, so
the table drops the volume column and keeps the share of volume, as the worked example below
does.

**A segment that is new or gone.** A segment with no volume in the Comparison period is new: its
Comparison period cell reads "New", never "No data" or zero, and its whole Current period figure
is its change. One with no volume in the Current period reads "Stopped" there.

**Choosing among dimensions.** Where a step of a path offers several dimensions, read each at
that level and take the one whose largest qualifying segment carries most of the parent's change;
on a tie, take the dimension listed first in the path. Name the others in one line under the
level's table, in the wording of `references/diagnosis-layout.md`. A dimension the lever has no
values on is skipped (landing page carries no spend). A dimension on which the parent holds one
segment is not weighed, because that segment carries all the change by default; it is collapsed
only when every dimension the step offers holds one segment, and then the one listed first is
collapsed. A qualifying segment is one the volume floor leaves on its own row.

**The descent rule.** Every cut-off is here, and none is named on the page.

- Go down a level into a segment that carries at least half its parent's change, in the direction
  of the change. Where several do (segments pulling the other way can leave more than one over
  half), go into the largest; the others stay rows of the table.
- The volume floor: a segment under 5% of its parent's volume in both periods joins one "Other"
  row, which keeps the level adding up, and is never descended into. A segment carrying at least
  half its parent's change is never floored.
- On a ratio lever the floor reads the numerator as well as the volume: a segment joins "Other"
  only when it is under 5% of its parent's volume and under 5% of its parent's numerator in both
  periods. A segment with orders and no visits (Radio, Retail, modelled re-attribution rows)
  keeps its own row, its rate reading "No data" and its volume 0. Its contribution is still
  defined, and "New" and "Stopped" follow its numerator there, not its volume.
- Stop at three levels, or when the Source holds no finer dimension. Say which in the Drivers
  block, and name the finer dimension in the Notes.
- With no segment carrying half the change, stop at that level: the change is spread, and the
  table shows how.
- A level whose parent holds one segment is collapsed: it gets no table, says in one line which
  segment it is, and the descent continues below it. A dimension with no values on the parent's
  rows is skipped instead: nothing is read and no line is written; where every dimension a step
  offers is skipped, the Source holds no finer dimension and the Drill-down stops there. A
  collapsed or skipped level does not count toward the three.
- Each stop, collapse and "Other" row is worded on the page as `references/diagnosis-layout.md`
  sets out; the page never names a floor, a cap or a share.

Rank each table by contribution, the largest in the direction of the change first and segments
pulling the other way after them. The "Other" row is always last, whatever its figure. Round as
`references/contribution.md` does: Contributions so the rows add exactly, shares and relative
changes to its one precision each.

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
| platform ROAS tree: spend, impressions, CPM (spend and impressions ranked together), click-through, platform conversion, order value | campaign → ad set or ad group → ad |
| margin % | product category → product → discount |
| cost per visit (spend and visits ranked together, `SKILL.md` step 5) | the path of spend and visits: channel → campaign → landing page, ad group or ad |
| any lever with no fixed path | the dimensions the source holds, ranked by contribution |

**Where each dimension is held.** A path reads a dimension only from the Source below; where a
Source does not hold it, the Drill-down stops above it. Confirm each column in `list_tables`.

| Dimension | Growth Brain | Without one |
|---|---|---|
| channel | `<client>-channel_reporting`; for a lever counted from `<client>-orders` (the CM3 tree's customers and orders), that mart's own channel column, where `list_tables` shows one | GA4 sessions by default channel group |
| campaign | `<client>-channel_reporting`; for a lever counted from `<client>-orders`, that mart's own campaign column, where `list_tables` shows one | the Google Ads or Meta Ads campaign report |
| ad group or ad set | `<client>-channel_reporting`, or the platform's own mart on the platform ROAS tree | the platform's connector, else its ad group or ad set report (`references/exports.md`) |
| landing page, ad | `<client>-channel_reporting`, or the platform's own mart for an ad on the platform ROAS tree | a connector that reads it; no export holds them |
| discount, new against repeat, order-level flags, order category | `<client>-orders` | none (`references/exports.md`: the customer-type export feeds levers only) |
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
  session → engaged and engaged → checkout in both periods from `<client>-ecommerce_funnel`, the
  funnel mart of the dimensions table above, and name the stage that moved furthest in the
  direction of the change. Sessions from `<client>-channel_reporting` are not stages, so that
  mart never feeds this check. This check is one small table and does not count as a level.
  Then run the channel path for the lever itself. Where the roster lists no funnel mart or it
  does not cover both periods (a revenue tree whose sessions come from channel reporting alone),
  skip the check with the funnel line of `references/diagnosis-layout.md`. When no channel
  carries half the change, suspect a site-wide fault (checkout, payments, a key product page)
  and say so in the Drivers block.

**Order value (store trees).**

- Discount first, from the orders mart, whatever the tree's Source (an order-mix level, above).
  The level's segments are discounted orders and orders at full price. An order is discounted
  when the orders mart's own discounted-order flag says so; where `list_tables` shows no such
  flag, when it carries a discount code. Use the one rule `list_tables` supports, the same in both
  periods; where the mart holds neither, the Drill-down stops above this level. Beside the segments show
  the discount rate (the share of orders discounted) and the discount depth (the discount over
  pre-discount revenue, on discounted orders), in both periods.
- This yes/no level follows the volume floor like any other: when its smaller segment is under
  the floor in both periods and carries under half the change, it joins "Other", and the level
  is collapsed to the larger segment. The descent continues inside that segment, and the discount
  rate and depth stand under the collapse line. A smaller segment that carries at least half the
  change keeps its own row.
- Then order mix, inside the segment carried, read from the orders mart and never from
  `<client>-order_items`: new against repeat (the mart's own flag for an order from a customer
  with no earlier order) and the mart's other order-level flag or type columns. Take the
  dimension by Choosing among dimensions.
- Then product category: the orders mart's order category column, which is order-level and so
  adds to order-level revenue. A product category held only on `<client>-order_items` is not
  read here, because it splits order lines and does not add to order revenue; with no order
  category column, the Drill-down stops above this level.

**Returning orders, repeat rate, active customers.** Repeat orders by channel, then CRM campaign
or flow, then cohort. A cohort is read only once it is mature for the horizon the lever uses: a
cohort younger than the horizon joins the "Other" row and is named in the Notes. When the source holds
no CRM campaign or flow, stop at the channel level.

**Platform ROAS tree.** Every lever takes the platform's own path: campaign, then ad set or ad
group, then ad, down to the finest level the Source holds. Order value is the platform's
conversion value per purchase, so it takes this path too, not the discount path. Read platform
figures only, never the store's.

**Mix shift.** Spend moving from campaigns that return less to campaigns that return more lifts
account ROAS with no campaign's own ROAS changing, and the reverse lowers it. The campaign level
shows it through the ratio rule above: the campaign that took the spend counts for more because
its share of the volume grew, while its own rate is flat or ran the other way (the line for such
a segment applies too). Where the campaign carrying the change is one whose own rate did not
move in the direction of the change, add the mix shift line of `references/diagnosis-layout.md`
to the Drivers block, after the evidence sentence. The recommendation's action is about the
budget split between the named campaigns, and its metric to watch is the receiving campaign's
own ROAS at its new spend.

**Margin %.** Product category, then product, then discount.

**Any other lever.** Read each dimension the source holds at one level, take the dimension by
Choosing among dimensions, and descend by the rule above.

## After the drill-down

### The Cause question

One question per Main driver, asked in one numbered round with the others, in plain words.
Open with the evidence in a sentence with its figures, then offer two or three likely causes,
the best fit for the evidence first, then "something else, or you don't know". The best fit is
the recommendation, and "Yes" accepts it. Offer causes
that fit the lever:

| Lever | Likely causes |
|---|---|
| visits, new customers, marketing spend | a budget, bid or campaign change; a campaign paused or ended; a seasonal or tracking change |
| conversion, engaged rate, add to basket, checkout start, purchase | a site or checkout change; a payments or shipping issue; a change in the traffic sent |
| order value | a promotion or price change; a change in the free-shipping minimum or bundles; a change in the product mix sold |
| returning orders, repeat rate, active customers | a flow or newsletter paused or changed; a promotion that pulled orders forward; a cohort ageing |
| margin % | a discount or price change; a supplier cost change; a change in the product mix sold |
| platform levers | a creative, audience or bidding change; a platform delivery change; for order value, a price or promotion change |

The table words each cause for a lever that fell. Where the lever rose, offer the same cause in
its rising form: a budget raised, a campaign launched, a flow switched on, a promotion started, a
fault fixed. The lever's own movement sets the form, not the Success KPI's: on a CAC tree,
conversion that rose takes the rising form though CAC fell.

"Don't know" sets that driver's Cause to "Not confirmed". Any other answer is the Cause, in
the user's words.

**Cause evidence.** Where a lever has zero levels (Shopify sessions with no channel), the
question may name in one sentence the landing pages whose sessions moved most. That is evidence
for the Cause, never a Drill-down level. An unattended run, which asks no question, names them
in the driver's evidence sentence in the Drivers block instead.

### Recommendations

Each Main driver gets 1 to 3 recommendations, ranked by the KPI at stake. The **segment the
Drill-down ended on** is the largest segment in the direction of the change at the last level
read.

- The first recommendation follows that segment. A driver with zero levels has no segment: its
  recommendations take the lever itself, each a different action on it, and its KPI at stake is
  the lever's whole Contribution.
- The second takes the next segment in the direction of the change at the same level.
- The third takes the one after that at the same level; where there is none, the largest
  segment in the direction of the change at the parent's level other than the one descended
  into. Where neither exists, the driver has fewer recommendations.
- A segment pulling against the change, and the "Other" row, get no recommendation of their own.

The **KPI at stake** is the Success KPI's change that the recommendation's segment carries: the
segment's share of the lever's change times the lever's Contribution, in the Success KPI's unit,
and never more than the Contribution of its nearest ancestor: the segment it sits in, taken as
that segment's share of the lever's change times the lever's Contribution (and itself held to the
lever's), or the lever at the first level. Segments pulling the other way inside that ancestor
can lift a segment's share of the lever's change past it. Where a recommendation spans segments,
use their sum, capped the same way. A capped figure is worded as
`references/diagnosis-layout.md` sets out, so the reader sees why it is smaller than the
segment's row in the table. State it as the change at stake, never as a forecast of what the
action recovers.

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

**On an improvement** (the Success KPI moved in its good direction, `references/lever-trees.md`),
phrase every action for an improvement: scale what drove it. A check-first action is verify,
then scale: the check that confirms what drove the improvement, then, on each answer, how to
scale it or why to hold it. On a decline, every action fixes what
drove it.

An Also large lever in step 5 gets one action line, check-first: the first level to open and what
to look for. An Offset that `SKILL.md` step 5 gives an action line, or the lever it gives that
line when there is no Main driver, gets the same line, phrased for that lever's own Contribution,
not the Success KPI's change: verify, then scale a lever that improved the Success KPI or fix one
that worsened it. Every other Offset gets no action.

Each line is worded from the rows under "The action lines" in `references/diagnosis-layout.md`.
Fill them so:

- **<dimension>**: the first dimension of the lever's path (Paths above).
- **<likely cause>**: the first cause listed for the lever in the Cause question's table, in its
  falling or rising form as the lever's own movement sets it.
- **<fix or scale>**: "scale" where the lever improved the Success KPI, "fix" where it worsened it.
