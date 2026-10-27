# Lever trees

A Lever tree has 3 to 5 levers, at least one volume (V) and one efficiency (E), and rebuilds the
Success KPI exactly. Fewer than three levers only where the arithmetic allows it, said in one
line. The user confirms the tree before any query.

Each lever is a ratio of counts from one mart, taken so the product telescopes: every lever's
denominator is the next lever's numerator. That is what makes the rebuild exact. Compute the
rebuild in `run_sql` for both periods and compare it with the Success KPI read in its own query,
from the mart's total for the period, not from the lever queries' rows.

## One mart per tree

A tree's counts (visits, orders, customers) all come from one mart, so no ratio divides a count
from one mart by a count from another. Spend is an amount, read from `<client>-channel_reporting`
in every tree that holds it.

| Tree | Counts from |
|---|---|
| Revenue, New customers, CAC, MER / ROAS | `<client>-channel_reporting`, revenue included |
| CM3, Returning revenue | `<client>-orders`, revenue order-dated, over every order (`SKILL.md` Basis, Every order counts) |
| Platform ROAS | the platform's own mart or its connector or export |
| Conversion rate | `<client>-ecommerce_funnel` |

A mart the roster lacks makes its tree's levers read "No data", never a count borrowed from
another mart.

## Catalogue

| Success KPI | Good direction | Levers | Rebuild | Counts shown on the page |
|---|---|---|---|---|
| CM3 | higher | new customers (V), returning orders (V), order value (E), margin % (E), marketing spend (V) | CM3 = (new + returning) × order value × margin % − spend | new customers, returning orders, orders, revenue, order margin, spend |
| Revenue | higher | visits (V), conversion (E), order value (E) | revenue = visits × (orders ÷ visits) × (revenue ÷ orders) | visits, orders, revenue |
| New customers | higher | visits (V), new visitor share (E), new-customer conversion (E) | new customers = visits × (new visitors ÷ visits) × (new customers ÷ new visitors) | visits, new visitors, new customers |
| CAC | lower | spend (V), visits (V), new-customer conversion (E) | CAC = spend ÷ (visits × (new customers ÷ visits)) | spend, visits, new customers |
| MER / ROAS | higher | visits (V), spend (V), conversion (E), order value (E) | ROAS = visits × (orders ÷ visits) × (revenue ÷ orders) ÷ spend | visits, orders, revenue, spend |
| Platform ROAS (one ad account) | higher | spend (V), impressions (V), click-through (E), platform conversion (E), order value (E) | ROAS = impressions × (clicks ÷ impressions) × (purchases ÷ clicks) × (conversion value ÷ purchases) ÷ spend | spend (cost), impressions, clicks, purchases, conversion value |
| Returning revenue | higher | active customers (V), repeat rate (E), order value (E) | returning revenue = active customers × (returning orders ÷ active customers) × (returning revenue ÷ returning orders) | active customers, returning orders, returning revenue |
| Conversion rate | higher | engaged rate (E), add to basket (E), checkout start (E), purchase (E), with visits shown as V | conversion = (engaged ÷ visits) × (basket ÷ engaged) × (checkout ÷ basket) × (orders ÷ checkout) | visits, engaged visits, basket adds, checkout starts, orders |

The good direction is whether higher or lower is better for the Success KPI: lower for CAC, any
other cost per unit (cost per visit, CPM, cost per order) and any rate of loss (return rate,
refund rate, churn), higher for the rest. `SKILL.md` step 5 says what it decides.

Each rebuild cancels to the Success KPI: in every row the inner denominators and numerators
cancel in turn, leaving the count the KPI is made of.
New-customer conversion divides by the lever before it in its tree: new visitors in the New
customers tree, visits in the CAC tree. Name which on the page.

The last column is the page's table of counts (`references/diagnosis-layout.md`, The change): every
count and amount the levers' ratios divide, in both periods, each read from the source One mart per
tree sets for it. A count two levers share is listed once. The page's precision rule is in
`references/diagnosis-layout.md`.

- **CM3.** Orders = new customers + returning orders, where a new customer is an order from a
  customer with no earlier order and returning orders are the rest. Order value = revenue ÷
  orders. Margin % is the mart's margin-rate metric on the rung the Basis rule in
  `SKILL.md` names. Order counts and revenue read from the orders mart, order-dated, over every
  order (`SKILL.md` Basis, Every order counts), and order margin = margin % × revenue. Then
  orders × order value × margin % = order margin, and CM3 = order margin − spend. Where the rung is not CM2, the figure and the page
  say "CM1 less marketing" in place of CM3.
- **The CM3 check.** The rebuild and a total read from the lever queries' own sums both reduce
  to order margin and spend, so they tie by construction. The independent read is a CM3 column
  the orders mart carries itself, summed over the same rows and period, on the same cost lines
  (its descriptions say which), where every order in the period is fully costed; the 0.01% tie is
  made against that, and a gap sends the run back to its queries. Where the mart carries no such
  column, where its cost lines differ, where some orders are not fully costed, or where
  the figure is "CM1 less marketing", the CM3 check is arithmetic only: it shows the levers add
  up, and the Notes say so, in the wording `references/diagnosis-layout.md` gives.
- **Revenue** is total sales as `SKILL.md` Basis sets it out, named with its basis on the page.
  From Shopify sales over time it is net sales, named as such.
- **Revenue without visits.** Where no Source holds visits (no mart, connector or file in hand,
  and the user cannot or will not export sessions) and one Source holds both orders and revenue,
  the tree is orders (V) and order value (E): revenue = orders × (revenue ÷ orders). That is the
  fewer-than-three case, because two levers rebuild revenue exactly. The tree confirmation says
  in one line that visits had no Source, so conversion is not shown (an unattended run says it in
  the Notes). Both counts come from that one Source, in place of the Revenue row of the table
  above, and the page's counts are orders and revenue. A user who declines the sessions export
  after confirming sends the tree back through this rule, to be confirmed again.
- **CAC and MER / ROAS.** Cost per visit is spend ÷ visits, so cost per visit is spend and visits
  read together: the tree lists spend and visits as separate levers because a tree holding cost
  per visit and spend cannot rebuild the KPI (spend cancels out of it). Say "cost per visit" in
  prose when spend and visits both moved. Visits are sessions, not users, because users cannot
  be summed across rows; where the brain offers a user-based conversion metric, the Notes say it
  measures something else and is not this lever.
- **Platform ROAS** reads spend, impressions, clicks, purchases and conversion value from the
  platform's own mart (`<client>-meta_performance`, `<client>-google_ads_performance`) when the
  roster lists it, else from its connector or campaign export (`references/exports.md`),
  platform-reported and not comparable with MER. Its conversion value is the platform's own, as
  it reports it, and the page names it platform-reported. CPM is spend and impressions read
  together as a cost pair, as cost per visit is above; `SKILL.md` step 5 gives both pairs their
  role.
- **Returning revenue.** Active customers are customers with an earlier order who ordered in the
  period. Repeat rate is returning orders per active customer.
- **Conversion rate.** The four stage rates telescope to orders ÷ visits. Visits enter no
  product, so its Contribution is 0 and it is never a Main driver; it stays on the tree so the
  page shows whether traffic moved. The stage counts come from the funnel mart the roster lists
  (`<client>-ecommerce_funnel`); where it does not cover a period, that lever reads "No data".

## Any other KPI

Derive a tree to the same rule:

1. Write the Success KPI as a product, a quotient or a sum of measures the Source holds.
2. Break a product or quotient into 3 to 5 levers by inserting the ratio that links one count to
   the next, so each denominator cancels the next numerator.
3. Make at least one lever a count or an amount (V) and at least one a ratio (E).
4. Write the rebuild arithmetic as the catalogue does, and check it cancels to the KPI.
5. List every count and amount the levers' ratios divide, as the catalogue's last column does, for the page's table of counts.
6. Set the good direction by the rule under the catalogue; `SKILL.md` says when it is asked and
   when it is assumed.

A KPI that is a sum (CM3 is one) keeps each term whole when it is a lever and splits a term that
is itself a product.
