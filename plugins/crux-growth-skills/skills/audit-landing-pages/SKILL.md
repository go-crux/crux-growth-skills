---
name: audit-landing-pages
description: Landing page audit. Use when someone asks to improve or audit a landing page (they give its URL), which landing pages are underperforming, or what to test on a page.
---

# Landing page audit

Produce `landing-page-audit-<slug>.html` for one page: a scorecard of sixty checks across six
ingredients, prioritised findings, quick wins and an ICE-scored test backlog, with a Methodology page behind them, laid out as
`references/audit-layout.md` fixes it. Run the steps in order. The user sees only the chat
and the page, never this skill or its references: say what the page showed, in plain words with
its evidence, and never cite a file or a rule. The terms Find, Audit, Brand guardrails, Page
type, Benchmark, Revenue at stake, Orders at stake and Underperforming page are those of
`references/glossary.md`; use them as written.

## 1. Connect

Look for a connector named `<Client> - Growth Brain` that offers `list_tables`, `list_metrics`,
`search_examples` and `run_sql`. With several, use the one whose client name plainly matches the
domain of the URL the user gave or the brand they named, and say which in a line; ask which one
only when none match or more than one does. With none, say in one line that the Audit runs from
the page alone, and from a Shopify export where the user has one.

With a brain connected, a user who asks which landing pages are underperforming, or who gives
no URL, goes to step 2 (Find). A user who gives a URL goes to step 3 (Performance); a brain is
never asked for the export. Without a brain, a user who asks which pages are underperforming or
what to test goes to step 2, which asks for the export; a user who gives a URL goes to step 3
when the conversation already holds an export, otherwise to step 4.

**Done when** the run has named the connector it uses or said it runs without one, and has sent
the user to Find or holds one page URL; with several connectors, the run used the one matching the
URL's domain or the named brand without asking, or asked because none or several matched; and no
user with a brain connected was asked for the export.

## 2. Find

Runs when the user asked which pages are underperforming or gave no URL, with a brain or
without one; otherwise go to step 3. With a brain, follow Read and List; without one, follow
"Without a brain".

**Read.** Call `list_tables` once with no arguments, then once naming only
`<client>-channel_reporting` (`<client>` is the prefix the roster carries). If that mart is
missing, say in one line that the brain holds no traffic table to rank pages from, ask for the
URL and go to step 3. Open `references/find.sql`, put its CTEs (everything above its FIND line) ahead of its Find
query, compose `source` from the columns the second call returns and run it with `run_sql`. The file reduces
the brain's landing page to the store's own path, whether the brain holds a path or a URL with
its host. Where the brain's own instructions name the store's timezone, write every
`CURRENT_DATE()` as `CURRENT_DATE('<timezone>')`. The period is the last 90 complete days; for a period the user
names, change only the dates in `period`. Revenue is one total sales column (after discounts and
returns), chosen the same way on every brain: the column the brain's `revenue_per_session`
formula sums, as the second `list_tables` call shows it, so the revenue per visit agrees with
the brain's; where the mart publishes no such formula, its ex-tax total sales column; where it
carries a single total sales column, that one. Name the column, and from its description or name
say whether it includes tax and shipping; this is the revenue measure on the shortlist and in the
Audit's Performance footnote. Leave out test orders wherever the mart flags them. Type no date,
Page type, threshold or Benchmark by hand: the file computes them.

**List.** Write to the chat, with no file:

- Above the list: the period, the revenue measure (the column's name, and whether it includes
  tax and shipping), the site's total visits and the site's revenue per visit.
- Up to 10 Underperforming pages, largest Revenue at stake first, each with its page, Page type,
  visits, conversion, revenue per visit, Benchmark revenue per visit and Revenue at stake. Say
  in a line that the Benchmark is what the page's visits would earn at the site's rate for the
  same Page type and channel.
- With fewer than 10 Underperforming pages, list those found and say how many there are. With
  none, say so and ask for the URL of the page to audit.
- One line that checkout, cart, account, Non-sale pages (named by the glossary's examples) and
  visits with no store page (another host, "(not set)", a modelled re-attribution label) are
  left out of the list and counted in the site's visits.

End by asking which page to audit, recommending the first; "yes" accepts it. The chosen page's
path is the page to audit: take the store's own domain (the one `find.sql` ranked) from the
brain's instructions or the conversation, and ask for it when neither names one.

**Done when** (with a brain) the period and the revenue measure are named, with the one column
chosen by the rule above and whether it includes tax and shipping; the site's total visits for the
period are shown and equal the sum of `total_sessions` over the period from
`<client>-channel_reporting`; at most 10 pages are listed, largest Revenue at stake first, and
every one carries page, Page type, visits, conversion, revenue per visit, Benchmark revenue per
visit and Revenue at stake; a short list says how many were found; and the user was asked which
page to audit with the first recommended.

**Without a brain.** Open `references/shopify-export.md`, give the user its four steps for
exporting one Shopify report and ask for the file. A user with no file to give gets one line
asking for the URL of the page to audit, and goes to step 4. From the file, apply that
reference's rules and write to the chat, with no file:

- Above the list: the period (the date range the file covers), the site's total sessions and the
  site's conversion, named as sessions that completed checkout over sessions.
- Up to 10 Underperforming pages, largest Orders at stake first, each with its page, Page type,
  sessions, conversion, Benchmark conversion and Orders at stake. Say in a line that the
  Benchmark is the site's conversion for the same Page type.
- With fewer than 10 Underperforming pages, list those found and say how many there are. With
  none, say so and ask for the URL of the page to audit.
- One line that checkout, cart, account and Non-sale pages (named by the glossary's examples)
  are left out of the list and counted in the site's sessions.
- One line: a Growth Brain adds revenue and traffic mix (gocrux.io/contact).

End by asking which page to audit, recommending the first; "yes" accepts it. The chosen page's
path is the page to audit; take the store's domain from the conversation and ask for it when it
is not there.

**Done when** (without a brain) the user was given the four export steps or asked for the URL;
the period and the site's sessions are shown and equal the sum of the file's sessions; at most
10 pages are listed, largest Orders at stake first, each with page, Page type, sessions,
conversion, Benchmark conversion and Orders at stake; a short list says how many were found; the
Growth Brain line is on the shortlist once; and the user was asked which page to audit with the
first recommended.

## 3. Performance

Runs when the run holds a page URL (given, or chosen in step 2) and either step 1 found a brain,
or there is no brain and the conversation holds a Shopify export; otherwise go to step 4, where
the Performance heading reads "Not available". A Non-sale page is checked first, brain or not;
then, without a brain, follow "From the export" below and skip the rest of this step.

**A Non-sale page.** Reduce the URL to its path as **Match** sets out. Where `find.sql`'s
`not_online_sale` rule matches it, the page is a Non-sale page: hold that, tell the user in one
line that online figures do not measure it, and go straight to step 4.

**Match.** Reduce the URL to its path the way `find.sql` reduces the brain's landing page: drop
the scheme and host, cut the query string and any fragment, and drop a trailing slash (the home
page stays `/`). The URL's domain is taken as the store's own domain, the one `find.sql` keeps.
Put that path in `references/audit.sql` and in `funnel.sql`'s `target`; the funnel's landing page is
reduced by the same rule.

**Read.** Unless step 2 already did, call `list_tables` once with no arguments, then once naming
only `<client>-channel_reporting`. Open `references/find.sql` and `references/audit.sql`, put find.sql's CTEs
(everything above its FIND line) ahead of audit.sql's query, set the path in that query, compose
`source` as Find did and run the two together with `run_sql`, with the
period, timezone and revenue column Find used (where step 2 did not run, choose the column by
step 2's rule). It returns the page's visits, conversion, revenue per visit, Benchmark revenue
per visit, Revenue at stake and its top 3 channels' share of visits, from the same CTEs as the
shortlist. With no row, or no traffic table, say in one line that the brain holds no visits to
the path in the period, and go to step 4: Performance reads "Not available" and the audit reads
the page only.

**Funnel.** When the roster lists `<client>-ecommerce_funnel`, call `list_tables` naming only
it, then open `references/performance.md` and follow it for the funnel steps, mobile against
desktop, the Leaking step and the footnote dates. When the roster does not list it, say in one
line that the brain holds no funnel table, so the page shows no funnel steps or device split and
no Leaking step orders the findings.

Tell the user in two sentences: the page's visits, conversion and Revenue at stake, then its
Leaking step with its shortfall, or that it has none.

**From the export.** Open `references/shopify-export.md` and match the page's path to the file.
Hold its sessions, conversion, Benchmark conversion and Orders at stake, and the light funnel:
cart rate, checkout reach rate and checkout completion rate, each against the same Page type.
Tell the user in two sentences: the page's sessions, conversion and Orders at stake, then the
funnel rate furthest below its Page type's. With no match, say so in one line; Performance reads
"Not available" and the audit reads the page only.

**Done when** (for a Non-sale page) it went to step 4 before any query or export match, and the
user was told in one line that online figures do not measure the page.

**Done when** (from the export) the path is matched, or the one-line no-match reason is said;
sessions, conversion, Benchmark conversion and Orders at stake are held from
`references/shopify-export.md`; each funnel rate whose columns the file holds is held beside its
Page type's, and each one dropped for a missing column is named; and the user has heard the
page's gap.

**Done when** (with a brain) the path is matched, or the one-line no-match reason is said;
visits, conversion, revenue per visit, Benchmark revenue per visit, Revenue at stake and the top
3 channels' share of visits are held from `references/audit.sql`, with the revenue column and whether it
includes tax and shipping held for the footnote, and with no Benchmark or Revenue at stake
computed anywhere else; the funnel steps, mobile against desktop, the Leaking step and the
funnel's first and last day are held, or the missing funnel is said in one line; each funnel
rate is a sum over a sum; the page headlines the conversion from the traffic table, and the funnel's
purchase rate is footnoted as counted on the funnel's own sessions and dates; and the user has heard the Leaking step or that there is none.

## 4. Guardrails

Open `references/guardrails.md` and run it before any scoring, so no recommendation breaches
what the brand will not do.

- With `brand-guardrails.md` in the working folder or the conversation's project files, show it
  in two lines and ask "Still right?". Do not ask the three questions again. Changes go back
  into the file.
- Without it, infer the Brand guardrails from the page and the site, then ask one round of
  three questions: levers off the table, claims, who the page is for. Each carries the inferred
  answer as its recommendation; "yes" accepts it and "skip" leaves it unconfirmed.
- Offer to save the answers as `brand-guardrails.md`: in the working folder where one persists,
  otherwise as a download. Never write it into the plugin folder.

**Done when** each of the three (levers, claims, audience) is confirmed, answered or marked
skipped; a run with the file present asked "Still right?" and not the three questions; the save
was offered or the file was left unchanged; and the unconfirmed guardrails are listed for the
Audit to mark.

## 5. Audit

**Establish.** Read the Page type from the URL's path, query string cut, by the glossary's
**Page type** rule: a product reached through a collection
(`/collections/<collection>/products/<handle>`) is a product. For a path the rule does not
type, take the closest type and say which. Open `references/page-architecture.md` and read
"Emphasis by Page type" for it. Take mobile as the device priority unless the user says
otherwise. Once you have read the page, name the single conversion goal its primary CTA serves.
Where the user has not stated it and the page has no primary CTA or several that compete, ask
one question with your recommended goal; "yes" accepts it. A path `find.sql`'s
`not_online_sale` rule matches is a Non-sale page, whose goal is not an online purchase (finding
a stockist, getting in touch, an answer).

**A Non-sale page.** Online conversion and revenue do not measure its goal, so Performance opens
on that, naming the goal; the findings go structural first; and every **Read as** says the
change is read on the page's own goal, as `references/templates.md` sets it.

**Read.** Choose by what the session offers.

- With a browser tool that works, render the page at mobile width first (about 390 px), scroll it end to
  end, then render it at desktop width. Note the first screen, what sticks, any popup on
  arrival and how it loads.
- Without one, fetch the HTML and assess structure and copy. Mark every check tagged *(needs a
  render)* in `references/ingredients.md` as *unassessed*, and say in one line, in the chat and
  in the page's masthead, that mobile screenshots of the first screen and the buy area would
  settle them.
- Where the browser tool is present but errors (not connected, or it fails to load the page),
  fetch the HTML as if there were no browser tool, and say in the chat and in the page's masthead
  that the browser tool failed and the page was read from its HTML.
- Read every screenshot the user gives. A screenshot settles only what it shows.
- When the page will not load (a login, an error), ask for mobile screenshots or the page's
  text, and read those the same way.

**Score.** Open `references/ingredients.md` and mark every check of all six ingredients: met,
not met, n/a or *unassessed*. Give each n/a and each *unassessed* a reason in a few words. Count
met over assessed for each ingredient, take its band, and total the six. Open the deep dive for
an ingredient when you write its findings: `references/offer-architecture.md` for the offer,
`references/proof-types.md` for trust, `references/page-architecture.md` for user-friendliness.
Open `references/examples.md` once if you want to calibrate what "met" looks like or the
standard for a finding.

**Write.** Open `references/audit-layout.md` and `references/templates.md`. Work in this order:

1. **Findings.** Four to eight. Where step 3 found a Leaking step, the findings it points to
   come first (`references/performance.md` says which), structural first within them; otherwise
   structural first. All sixty checks are still scored, and the leak never skips one. Each names
   its failed check numbers and one of trust, understanding or fit, labels its evidence
   "Heuristic" unless the user supplied evidence (a finding the Leaking step points to names the
   step and its shortfall instead), and ends on a Do. Open `references/diagnostics.md` for the objection inventory
   (section 2) and the leverage order (section 5), and build the inventory from the page and any
   evidence the user gave.
2. **Quick wins.** The changes to ship without a test, each naming the checks it settles.
3. **Hypotheses.** One for each finding, numbered to match, scored with ICE and ranked in the
   backlog table. For a Non-sale page, each row's **Read as** says the change is read on the
   page's own goal. Otherwise, where step 3 returned the page's visits and conversion, each row's
   **Read as** cell is the test, sequential read or ship call from the sample-size table and the
   fixed lift rule in `references/diagnostics.md` section 4, with the export's sessions and conversion where
   it was the source. Months sit on Test and Sequential read only, and a Ship call gives its
   reason. With no brain and no export it reads "Test or ship: needs traffic figures", and with a
   brain or an export that found no traffic for the page, "Test or ship: no traffic found for
   this page".
4. **Guardrail check.** Go over the page and every Do, quick win and hypothesis drafted so far
   against the Brand guardrails as `references/guardrails.md` part 4 sets out. A lever the brand keeps off the table that is
   already on the page is a quick win. A best practice the guardrails block is replaced with the
   on-brand alternative. A recommendation resting on an unconfirmed guardrail is marked as an
   assumption.
5. **The page.** Write `landing-page-audit-<slug>.html` to the working folder: the audit
   page with the five headings in order, each opening with its one-line Summary, and the
   Methodology page behind the masthead's link. **Performance** is filled as the layout sets it for what step 3 returned.

Tell the user where the page is, give the total and the weakest ingredient in one sentence,
name the top finding and the Leaking step where there is one, and say which checks are *unassessed* and what would settle them.

**Done when** the page type, the goal and the device priority are on the page; the masthead
says how the page was read, including a browser tool that failed; all sixty checks carry a mark, each n/a and *unassessed* with its
reason, and each check tagged *(needs a render)* is *unassessed* wherever only HTML was read;
every off-brand lever already on the page is a quick win; no Do breaches a guardrail; every
recommendation resting on an unconfirmed guardrail carries the assumption mark in its finding or
quick win and in its backlog row, and the masthead lists the unconfirmed guardrails; the
scorecard shows six counts with bands and a total; every finding names its failed check
numbers and trust, understanding or fit and ends on a Do; every not-met check appears in a
finding or a quick win; every finding has a hypothesis with ICE or a quick win covering it;
for a Non-sale page, Performance says online figures do not measure its goal and every Read as
says the change is read on that goal; for any other page, every backlog row carries its call from
the page's traffic and the lift rule, with months on
no Ship call and the footnote naming the lift rule and the table or the formula, or reads
"Test or ship: needs traffic figures" only where there was neither a brain nor an export, or
"no traffic found for this page" where the brain or the export held none; the findings follow
the Leaking step's order where there is one, with all sixty checks scored; the page has
Performance, Scorecard, Findings, Quick wins and Test backlog in that order, each with a one-line
Summary and an empty one carrying its reason; the Methodology page opens only from the masthead's
link, with the fixed copy and the Conversion Rate Experts credit with its link; the file name follows the slug rule in the layout; and
the user has the page's path.
