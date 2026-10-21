---
name: audit-landing-pages
description: Landing page audit that works with or without a Growth Brain. Use when someone asks to improve or audit a landing page (they give its URL), which landing pages are underperforming, or what to test on a page.
---

# Landing page audit

Produce `landing-page-audit-<slug>.html` for one page: a scorecard of sixty checks across six
ingredients, prioritised findings, quick wins and an ICE-scored test backlog, laid out as
`references/audit-layout.md` fixes it. Run the steps in order. The user sees only the chat
and the page, never this skill or its references: say what the page showed, in plain words with
its evidence, and never cite a file or a rule. The terms Find, Audit, Brand guardrails, Page
type, Benchmark, Revenue at stake, Orders at stake and Underperforming page are those of
`references/glossary.md`; use them as written.

## 1. Connect

Look for a connector named `<Client> - Growth Brain` that offers `list_tables`, `list_metrics`,
`search_examples` and `run_sql`. With several, ask which one. With none, say in one line that
the Audit runs from the page alone.

With a brain connected, a user who asks which landing pages are underperforming, or who gives
no URL, goes to step 2 (Find). A user who gives a URL goes to step 3. Without a brain, a user who
asks which pages are underperforming or what to test gets one reply: ranking pages needs the
brand's traffic figures, which a Growth Brain (gocrux.io/contact) reads, so name the page to
audit and give its URL.

**Done when** the run has named the connector it uses or said it runs without one, and has sent
the user to Find or holds one page URL.

## 2. Find

Runs when step 1 found a brain and the user asked which pages are underperforming or gave no
URL; otherwise go to step 3.

**Read.** Call `list_tables` once with no arguments, then once naming only
`<client>-channel_reporting` (`<client>` is the prefix the roster carries). If that mart is
missing, say in one line that the brain holds no traffic table to rank pages from, ask for the
URL and go to step 3. Open `references/find.sql`, put its CTEs ahead of the query, compose
`source` from the columns the second call returns and run it with `run_sql`. Where the brain's
own instructions name the store's timezone, write every `CURRENT_DATE()` as
`CURRENT_DATE('<timezone>')`. The period is the last 90 complete days; for a period the user
names, change only the dates in `period`. Revenue is the mart's total sales measure (after
discounts and returns). Leave out test orders wherever the mart flags them. Type no date, Page
type, threshold or Benchmark by hand: the file computes them.

**List.** Write to the chat, with no file:

- Above the list: the period, the revenue measure by name, the site's total visits and the
  site's revenue per visit.
- Up to 10 Underperforming pages, largest Revenue at stake first, each with its page, Page type,
  visits, conversion, revenue per visit, Benchmark revenue per visit and Revenue at stake. Say
  in a line that the Benchmark is what the page's visits would earn at the site's rate for the
  same Page type and channel.
- With fewer than 10 Underperforming pages, list those found and say how many there are. With
  none, say so and ask for the URL of the page to audit.
- One line that checkout, cart, account and visits with no landing page are left out of the
  list and counted in the site's visits.

End by asking which page to audit, recommending the first; "yes" accepts it. The chosen page's
path is the page to audit: take the store's domain from the brain's instructions or the
conversation, and ask for it when neither names one.

**Done when** the period and the revenue measure are named; the site's total visits for the
period are shown and equal the sum of `total_sessions` over the period from
`<client>-channel_reporting`; at most 10 pages are listed, largest Revenue at stake first, and
every one carries page, Page type, visits, conversion, revenue per visit, Benchmark revenue per
visit and Revenue at stake; a short list says how many were found; and the user was asked which
page to audit with the first recommended.

<!-- HOOK: brain Performance (the page's own figures) slots in here, between Find and Guardrails.
Until it exists, go straight to Guardrails. -->

## 3. Guardrails

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

## 4. Audit

**Establish.** Read the Page type from the URL's path, query string cut: `/products/` product,
`/collections/` collection, `/pages/` landing page, `/blogs/` blog, `/` home. For any other
path, take the closest type and say which. Open `references/page-architecture.md` and read
"Emphasis by Page type" for it. Take mobile as the device priority unless the user says
otherwise. Once you have read the page, name the single conversion goal its primary CTA serves.
Where the user has not stated it and the page has no primary CTA or several that compete, ask
one question with your recommended goal; "yes" accepts it.

**Read.** Choose by what the session offers.

- With a browser tool, render the page at mobile width first (about 390 px), scroll it end to
  end, then render it at desktop width. Note the first screen, what sticks, any popup on
  arrival and how it loads.
- Without one, fetch the HTML and assess structure and copy. Mark every check tagged *(needs a
  render)* in `references/ingredients.md` as *unassessed*, and say in one line, in the chat and
  in the page's masthead, that mobile screenshots of the first screen and the buy area would
  settle them.
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

1. **Findings.** Four to eight, structural first. Each names its failed check numbers and one of
   trust, understanding or fit, labels its evidence "Heuristic" unless the user supplied
   evidence, and ends on a Do. Open `references/diagnostics.md` for the objection inventory
   (section 2) and the leverage order (section 5), and build the inventory from the page and any
   evidence the user gave.
2. **Quick wins.** The changes to ship without a test, each naming the checks it settles.
3. **Hypotheses.** One for each finding, numbered to match, scored with ICE and ranked in the
   backlog table. Every row's **Read as** cell reads "Test or ship: needs traffic figures".
4. **Guardrail check.** Go over the page and every Do, quick win and hypothesis drafted so far
   against the Brand guardrails as `references/guardrails.md` part 4 sets out. A lever the brand keeps off the table that is
   already on the page is a quick win. A best practice the guardrails block is replaced with the
   on-brand alternative. A recommendation resting on an unconfirmed guardrail is marked as an
   assumption.
5. **The page.** Write `landing-page-audit-<slug>.html` to the working folder with the five
   headings in order, each opening with its one-line Summary. **Performance** reads "Not
   available" with its one line.

Tell the user where the page is, give the total and the weakest ingredient in one sentence,
name the top finding, and say which checks are *unassessed* and what would settle them.

**Done when** the page type, the goal and the device priority are on the page; the masthead
says how the page was read; all sixty checks carry a mark, each n/a and *unassessed* with its
reason, and each check tagged *(needs a render)* is *unassessed* wherever only HTML was read;
every off-brand lever already on the page is a quick win; no Do breaches a guardrail; every
recommendation resting on an unconfirmed guardrail carries the assumption mark in its finding or
quick win and in its backlog row, and the masthead lists the unconfirmed guardrails; the
scorecard shows six counts with bands and a total; every finding names its failed check
numbers and trust, understanding or fit and ends on a Do; every not-met check appears in a
finding or a quick win; every finding has a hypothesis with ICE or a quick win covering it;
every backlog row reads "Test or ship: needs traffic figures"; the page has Performance,
Scorecard, Findings, Quick wins and Test backlog in that order, each with a one-line Summary
and an empty one carrying its reason; the file name follows the slug rule in the layout; and
the user has the page's path.
