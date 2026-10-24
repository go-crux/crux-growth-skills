# Contribution

A lever's Contribution is its share of the Success KPI's change between the Comparison period
(0) and the Current period (1), in the Success KPI's own unit. Contributions add exactly to the
change. Every tree uses this one rule. Compute it in `run_sql` from the two periods' lever
values; round for display as the last section says.

Let `L(a, b) = (b − a) ÷ ln(b ÷ a)`, with `L(a, a) = a`.

## The rule

1. **A product (or quotient) splits by log share.** Write the product being split (the Success
   KPI, or a term of a sum that is itself a product) as the levers multiplied together, a lever in a denominator counting with exponent −1 and a lever with exponent +1
   otherwise. Each lever's share of the KPI's `ln(current ÷ comparison)` is its exponent times its
   own `ln(current ÷ comparison)`, and its Contribution is that share times the KPI's change:

   `Contribution(x) = L(P0, P1) × exponent × ln(x1 ÷ x0)`, where P is the product being split

   This is P's change times `exponent × ln(x1 ÷ x0) ÷ ln(P1 ÷ P0)`. Written with `L`, it also
   holds when P is unchanged (every share is then of zero, so the Contributions still add to zero
   and the levers that offset one another show their figures).
2. **A sum splits by each term's own change.** For KPI = A − B, A's Contribution is A's change
   and B's is −B's change.
3. **A term inside a sum inherits its parent's Contribution in proportion to its own change.**
   For parent = a + b, the Contribution of `a` is the parent's Contribution times `Δa ÷ Δparent`,
   which is `Δa × Contribution(parent) ÷ Δparent`. Where the parent did not change, use
   `Δa × L(P0, P1) × exponent ÷ L(parent0, parent1)` for the product P the parent is a factor of,
   where exponent is the parent's exponent in P (+1 or −1): the same figure in its general form.

Rules 1 to 3 nest: split the KPI by rule 2 or 1, then split each term that is itself a sum or a
product by the same rules.

## No data

The log share needs every lever positive in both periods. A lever that is zero or missing in
either period reads "No data" and takes no Contribution. The levers that can be read keep the
figures the rule gives them. The part of the change the rule would have given the "No data" levers
shows as one more row, "Not split", so the rows still add exactly to the change. The page says
the split is partial.

## Roles

`SKILL.md` step 5 names the roles from these Contributions.

## Worked example (CM3)

An invented brand. CM3 = (new + returning) × order value × margin % − spend, as the CM3 tree
writes it.

| | Comparison period | Current period | Change |
|---|---|---|---|
| New customers | 4,000 | 3,000 | −25% |
| Returning orders | 6,000 | 6,300 | +5% |
| Orders | 10,000 | 9,300 | −7% |
| Order value | £50 | £52 | +4% |
| Revenue | £500,000 | £483,600 | −3.3% |
| Margin % | 40% | 38% | −5% |
| Order margin | £200,000 | £183,768 | −8.1% |
| Marketing spend | £120,000 | £125,000 | +4.2% |
| CM3 | £80,000 | £58,768 | −26.5% |

CM3 changes by −£21,232.

1. CM3 is a sum: order margin's Contribution is its own change, −£16,232, and spend's is −£5,000.
2. Order margin is a product of orders, order value and margin %.
   `L = (183,768 − 200,000) ÷ ln(183,768 ÷ 200,000) = 191,769.52`.
   - Orders: `191,769.52 × ln(9,300 ÷ 10,000) = −13,916.85`
   - Order value: `191,769.52 × ln(52 ÷ 50) = +7,521.34`
   - Margin %: `191,769.52 × ln(38 ÷ 40) = −9,836.49`
   These three add to −16,232.00.
3. Orders is a sum of new customers and returning orders, and orders changed by −700. New
   customers: `−13,916.85 × (−1,000 ÷ −700) = −19,881.21`. Returning orders:
   `−13,916.85 × (300 ÷ −700) = +5,964.36`. These add to −13,916.85.

Rounded to the pound so the shown rows add exactly to the shown change:

| Lever | Contribution |
|---|---|
| New customers | −£19,881 |
| Returning orders | +£5,964 |
| Order value | +£7,521 |
| Margin % | −£9,836 |
| Marketing spend | −£5,000 |
| **Sum** | **−£21,232** |

The roles: the change is a fall, so the levers with a negative Contribution run with it, spend
included (its own change is a rise, its Contribution a fall). New customers (−£19,881) is the Main
driver. Half of it is £9,940.60, so margin % at −£9,836 falls just under and is not a second Main
driver, and spend at −£5,000 is smaller still; both take no role and are listed without a line.
Returning orders and order value pull the other way and are Offsets.

## Rounding

Round the Success KPI and each Contribution to the nearest unit of the KPI's display precision.
The rounded change is the rounded Current period figure less the rounded Comparison period
figure. Where the rounded Contributions (the "Not split" row included) do not add to it, close
the gap one unit at a time: each unit goes to the row whose rounding moved it furthest from its
exact figure, in the direction that closes the gap, and no row moves twice. Distance is measured
the same way for a negative figure as for a positive one (−£19,881.21 rounded to −£19,881 moved
by 0.21). Relative changes are computed from the unrounded figures. The display precision
follows the kind of KPI:

- **A money KPI** (CM3, revenue, spend) rounds to whole currency units, as the worked
  example does.
- **A money KPI per customer or per order** (CAC, order value) rounds to whole currency units
  too, or to one decimal (£38.4) where whole units would show any lever's Contribution as 0 or ±1.
- **A ratio KPI** (MER, ROAS) rounds to two decimals, shown as a plain multiple (3.52).
- **A rate KPI** (conversion rate) rounds to one decimal place of a percentage (2.4%).

The waterfall and the Levers table use these rounded figures.
