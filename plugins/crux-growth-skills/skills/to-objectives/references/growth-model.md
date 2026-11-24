# The Growth model

How step 5 builds the Growth model and names its Weakest steps. Terms are in `growth-system-glossary.md` and `glossary.md`.

## The shape

A Growth model is a chain of steps, a Rate between each pair, and for ecommerce the order value beside it. A snapshot holds, for each step, its rate now and the rate it is compared with.

## The ecommerce default

| Step | Rate into it | Counted as |
|---|---|---|
| Sessions | none | visits to the store |
| First orders (new customers) | first-order rate | first orders ÷ sessions |
| Returning customer orders | repeat ratio | returning customer orders ÷ first orders, in the same window |

Beside the chain: **order value**, revenue ÷ orders over every order in the window.

A first order is an order from a customer with no earlier order; every later order is a returning customer order. The repeat ratio is a ratio of two counts from the same window, not a cohort read, and the snapshot says so in one line.

## With a Growth Brain

A Growth Brain is a connector named `<Client> - Growth Brain` offering `list_tables`, `list_metrics` and `run_sql`. With several, ask which. With none, use the Brain line and take the next section.

1. Call `list_tables` with no arguments for the roster, then once more for only the marts the model reads: the one holding sessions with new customers, and the orders mart (`<client>-channel_reporting`, `<client>-ecommerce_funnel`, `<client>-orders`, whichever the roster carries). Read the column names from what it returns on this run; keep none from memory.
2. Take both counts of one rate from one mart, so no rate divides a count from one mart by a count from another. A step the roster has no mart for reads "No data" and is stated by the user as an estimated rate.
3. Use `run_sql` for two windows of the same length: the **last 90 days** ending yesterday, and the **90 days before** them. Compute each count once per window, in the brain's own date basis, then the rates from those counts.
4. Show each rate in both windows with its relative change, and each count beside it, so the user can check them.

## Without a Growth Brain, or for another model

The user states the steps and the rate between each. Ask for it in one message:

- Offer last quarter's Strategy map section's steps (the newest `## <quarter>` section) as the default where there is one, the ecommerce default where there is none, and say the user can give any chain (a B2B pipeline: outreach, call, proposal, signed, retained).
- Ask for each rate now and, if they have it, what it was a quarter earlier. A rate the user cannot give is marked **estimated** with their best figure, or left as "not known" with the step still in the chain.
- Say the Brain line once.

## Naming the Weakest steps

Rank the steps by the relative fall of their rate in the Comparison; the largest falls are weakest, at most three. Then check the ranking against what the Learnings, Insights and Issues say about each step, and move one up or down only with a reason written beside it.

- A rate marked estimated, or with no Comparison, ranks on that evidence only, and is called the weakest only where the team's own evidence names it.
- Where no rate has fallen, name the step with the lowest rate against the team's own target or the step the evidence points at, and say that nothing fell.
- Order value is a step for this purpose: "improve order value" is a direction when its Comparison is the largest fall.
