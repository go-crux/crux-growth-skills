# Glossary

The terms `SKILL.md` and the other references use, each with one meaning.

- **Find**: the mode that ranks the brand's Underperforming pages so the user picks which to audit: by Revenue at stake from the Growth Brain, or by Orders at stake from a Shopify export where no brain is connected. _Avoid_: discovery, scan.

- **Audit**: the mode that scores one landing page, given as a URL, against the six ingredients and turns the failed checks into findings and a test backlog, with the page's own performance beside it where a brain or a Shopify export holds it. Runs without a brain. _Avoid_: critique, review, teardown.

- **Brand guardrails**: what the brand will not do or say (levers off the table, regulated claims) and who the page is for, inferred from the live site and confirmed in one short round of questions, then kept in `brand-guardrails.md` for later runs. A recommendation that breaches one is invalid. _Avoid_: brand constraints, brand rules.

- **Page type**: what a landing page is, read from its Shopify path: product (`/products/`, or a product reached through a collection, `/collections/<collection>/products/<handle>`), collection (any other `/collections/` path), landing page (`/pages/`), blog (`/blogs/`) or home (`/`). Pages compare only within their type. _Avoid_: template, page category.

- **Benchmark**: what a page's visits would earn at the site's rate for the same Page type and channel, falling back to the Page type alone where a channel's cell is thin. From a Shopify export, which carries no channel, the Page type rate alone. _Avoid_: average, site average, baseline.

- **Revenue at stake**: a page's visits times the gap between its Benchmark revenue per visit and its own, from a Growth Brain. What Find ranks on. Revenue is one total sales column, named with its tax basis. _Avoid_: lost revenue, opportunity, potential.

- **Orders at stake**: the same gap in conversion rather than revenue, from a Shopify export where no brain is connected. _Avoid_: lost orders.

- **Underperforming page**: a page with at least 1% of the site's visits in the period and at least 20% below its Benchmark. Checkout, cart, account, Unknown and Non-sale pages are never ranked, and all of them stay in the site's visits. _Avoid_: weak page, problem page.

- **Non-sale page**: a page whose job is not an online sale (a store locator, stockists, contact, FAQ, careers or about page), matched by `find.sql`'s `not_online_sale` path list. Its goal is something else (finding a stockist, getting in touch, an answer), so online revenue does not measure it: Find never ranks it and no Benchmark counts it, though its visits stay in the site's; an Audit of one reads each change on the page's own goal. _Avoid_: utility page, non-commerce page.

- **Leaking step**: the funnel step where a page's rate falls furthest below the same Page type's, in relative terms, from a Growth Brain. It sets which findings come first; it never skips a check. _Avoid_: drop-off, bottleneck.

- **Page inventory**: the list of a page's sections, in order with their headings and positions, and of every embedded widget (a review app, an iframe, a form, a video) inside them, taken from the page's own markup before any screenshot. The Audit screenshots and reads every row, so nothing the page's text leaves out goes unscored. _Avoid_: page map, section list.
