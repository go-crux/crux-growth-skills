---
name: audit-landing-pages
description: Landing page audit that works with or without a Growth Brain. Use when someone asks to improve or audit a landing page (they give its URL), which landing pages are underperforming, or what to test on a page.
---

# Landing page audit

Produce `landing-page-audit-<slug>.html` for one page: a scorecard of sixty checks across six
ingredients, prioritised findings, quick wins and an ICE-scored test backlog, laid out as
`references/audit-layout.md` fixes it. Run the three steps in order. The user sees only the chat
and the page, never this skill or its references: say what the page showed, in plain words with
its evidence, and never cite a file or a rule. The terms Find, Audit, Brand guardrails, Page
type, Benchmark, Revenue at stake, Orders at stake and Underperforming page are those of
`references/glossary.md`; use them as written.

## 1. Connect

Look for a connector named `<Client> - Growth Brain` that offers `list_tables`, `list_metrics`,
`search_examples` and `run_sql`. With several, ask which one. With none, say in one line that
the Audit runs from the page alone. With or without a brain, go on to step 2.

Ask for the URL of the page to audit when the user has not given one. A user who asks which
landing pages are underperforming or what to test gets the same reply: ranking pages needs the
brand's traffic figures, which this Audit does not read, so name the page to audit.

<!-- HOOK: Find (rank the brand's pages so the user picks one) and brain Performance (the page's
own figures) slot in here, between Connect and Guardrails. Until they exist, go straight to
Guardrails. -->

**Done when** the run has named the connector it uses or said it runs without one, and holds
one page URL.

## 2. Guardrails

Open `references/guardrails.md` and run it before any scoring, so no recommendation breaches
what the brand will not do.

- With `brand-guardrails.md` in the working folder or the conversation's project files, show it
  in two lines and ask "Still right?". Do not ask the three questions again.
- Without it, infer the Brand guardrails from the page and the site, then ask one round of
  three questions: levers off the table, claims, who the page is for. Each carries the inferred
  answer as its recommendation; "yes" accepts it and "skip" leaves it unconfirmed.
- Offer to save the answers as `brand-guardrails.md`: in the working folder where one persists,
  otherwise as a download. Never write it into the plugin folder.

**Done when** each of the three (levers, claims, audience) is confirmed, answered or marked
skipped; a run with the file present asked "Still right?" and not the three questions; the save
was offered or the file was left unchanged; and the unconfirmed guardrails are listed for the
Audit to mark.

## 3. Audit

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
4. **Guardrail check.** Go over the page and every Do, quick win and hypothesis you have drafted against the Brand guardrails as
   `references/guardrails.md` part 4 sets out. A lever the brand keeps off the table that is
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
