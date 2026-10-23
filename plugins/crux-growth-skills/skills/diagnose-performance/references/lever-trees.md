# Lever trees

A Lever tree has 3 to 5 levers, at least one volume (V) and one efficiency (E), and rebuilds the
Success KPI exactly. Fewer than three levers only where the arithmetic allows it, said in one
line. The user confirms the tree before any query.

Each lever is a ratio of counts from one source, taken so the product telescopes: every lever's
denominator is the next lever's numerator. That is what makes the rebuild exact. Compute the
rebuild in `run_sql` for both periods and compare it with the Success KPI read directly.

## Catalogue

| Success KPI | Levers | Rebuild |
|---|---|---|
| CM3 | new customers (V), returning orders (V), order value (E), margin % (E), marketing spend (V) | CM3 = (new + returning) × order value × margin % − spend |
| Revenue | visits (V), conversion (E), order value (E) | revenue = visits × (orders ÷ visits) × (revenue ÷ orders) |
| New customers | visits (V), new visitor share (E), new-customer conversion (E) | new customers = visits × (new visitors ÷ visits) × (new customers ÷ new visitors) |
| CAC | spend (V), visits (V), new-customer conversion (E) | CAC = spend ÷ (visits × (new customers ÷ visits)) |
| MER / ROAS | visits (V), spend (V), conversion (E), order value (E) | ROAS = visits × (orders ÷ visits) × (revenue ÷ orders) ÷ spend |
| Platform ROAS (one ad account) | spend (V), impressions (V), click-through (E), platform conversion (E), order value (E) | ROAS = impressions × (clicks ÷ impressions) × (purchases ÷ clicks) × (conversion value ÷ purchases) ÷ spend |
| Returning revenue | active customers (V), repeat rate (E), order value (E) | returning revenue = active customers × (returning orders ÷ active customers) × (returning revenue ÷ returning orders) |
| Conversion rate | engaged rate (E), add to basket (E), checkout start (E), purchase (E), with visits shown as V | conversion = (engaged ÷ visits) × (basket ÷ engaged) × (checkout ÷ basket) × (orders ÷ checkout) |

Each rebuild cancels to the Success KPI: in every row the inner denominators and numerators
cancel in turn, leaving the count the KPI is made of.

- **CM3.** Orders = new customers + returning orders, where a new customer is an order from a
  customer with no earlier order and returning orders are the rest. Order value = revenue ÷
  orders. Margin % = order margin ÷ revenue, with order margin on the rung the Basis rule in
  `SKILL.md` names. Then orders × order value × margin % = order margin, and CM3 = order margin −
  spend. Where the rung is not CM2, the figure and the page say "CM1 less marketing" in place of
  CM3.
- **Revenue** is the total sales measure (after discounts and returns), named on the page.
- **CAC and MER / ROAS.** Cost per visit is spend ÷ visits, so cost per visit is spend and visits
  read together: the tree lists spend and visits as separate levers because a tree holding cost
  per visit and spend cannot rebuild the KPI (spend cancels out of it). Say "cost per visit" in
  prose when spend and visits both moved.
- **Platform ROAS** reads spend, impressions, clicks, purchases and conversion value from the
  platform's own mart (`<client>-meta_performance`, `<client>-google_ads_performance`) when the
  roster lists it, platform-reported and not comparable with MER. CPM is spend and impressions
  read together, as above.
- **Returning revenue.** Active customers are customers with an earlier order who ordered in the
  period. Repeat rate is returning orders per active customer.
- **Conversion rate.** The four stage rates telescope to orders ÷ visits. Visits enter no
  product, so its Contribution is 0 and it is never a Main driver; it stays on the tree so the
  page shows whether traffic moved. The stage counts come from the funnel mart the roster lists
  (`<client>-ecommerce_funnel`); where it does not cover a period, that lever reads "No data".

## Any other KPI

Derive a tree to the same rule:

1. Write the Success KPI as a product, a quotient or a sum of measures the brain holds.
2. Break a product or quotient into 3 to 5 levers by inserting the ratio that links one count to
   the next, so each denominator cancels the next numerator.
3. Make at least one lever a count or an amount (V) and at least one a ratio (E).
4. Write the rebuild arithmetic as the catalogue does, and check it cancels to the KPI.

A KPI that is a sum (CM3 is one) keeps each term whole when it is a lever and splits a term that
is itself a product.
