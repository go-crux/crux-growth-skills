<!-- Source: the private CRO audit skill this one adapts, captured verbatim 2026-10-21 (commit 5c782a4) for PRD192. Brand-specific lines removed; otherwise unedited. This is source material for the build, not the skill: the skill lives in plugins/crux-growth-skills/skills/audit-landing-pages/. -->

---
description: >-
  Audit, score and improve ecommerce landing pages and product pages against an
  objective, checklist-backed conversion framework, and turn the gaps into a
  prioritised, ICE-scored test backlog. Brand-neutral: it loads the brand's own
  guardrails from a pluggable brand-constraints file so it never recommends a
  lever that is off-brand for that client. Use this skill whenever the task
  involves reviewing, scoring, critiquing, improving or pressure-testing a
  landing page, product page, offer page, quiz funnel or lead-capture page — or
  generating test ideas, hypotheses or an experiment backlog for one — even if
  the user does not say "CRO" or "conversion". Triggers include "review this
  page", "how do I improve this landing page", "what should we test", "give me
  test ideas", "audit this LP", "critique this page", "is this page any good",
  "why isn't this converting". Pair with the brand's own design and copy skills
  when producing or rewriting on-page assets.
---

# Landing Page CRO

An objective diagnostic for ecommerce landing and product pages. Two modes:

- **Critique mode** — score a page against a checklist-backed framework, return a
  scorecard plus prioritised findings.
- **Hypothesis mode** — turn the gaps into an ICE-scored, testable backlog.

The framework spine is adapted from Conversion Rate Experts' *Making Websites Win*
("the ingredients of a winning website"), then made **evaluable**: every ingredient
resolves to a list of observable checks, so two people scoring the same page land
in the same place. The checks are derived from teardowns of pages that convert at
scale (HexClad, Huel, Jones Road, Purdy & Figg — see `references/examples.md`).

**Brand-neutral by design.** Everything client-specific lives in one file. Nothing
in the core framework assumes a particular brand, category or price point.

## Operating principles

1. **A winning page does what your best salesperson does.** It opens with the
   benefit, earns trust, answers the objection before it is voiced, and asks for
   the action. Judge the page as a conversation, not a layout.

2. **Score against checks, not vibes.** Every ingredient in
   `references/ingredients.md` is a list of binary, observable checks. Score by
   counting what is met. "The hero is weak" is not a finding; "the hero fails
   checks 2, 3 and 5 — no outcome in the headline, no point of difference, no
   quantified claim" is.

3. **Visitors abandon for three reasons:** they don't trust you, they don't
   understand you, or they can't find something that suits them. Every finding
   should name which one it maps to. It sharpens the fix and stops the backlog
   filling up with unrelated micro-tweaks.

4. **Diagnose, don't guess.** The strongest findings are grounded in visitor
   evidence, not heuristics. Ask what evidence exists before scoring, and label
   every claim as *evidenced* or *heuristic*. `references/diagnostics.md` lists
   the evidence sources worth asking for and how to mine them.

5. **Match the message to the visitor's readiness.** A cold visitor from a
   prospecting ad needs a different opening than a warm click from a CRM email.
   The same page loses by saying too much too soon, or too little too late.

6. **Big swings over button colours.** Prioritise the value proposition, the offer
   architecture, the hero and the order of the argument over micro-tweaks. Most
   sites do not have the traffic to detect a small effect —
   `references/diagnostics.md` has the sample-size table that proves it for the
   page in front of you.

7. **Generic best practice loses to brand fit.** A lever that works generically
   can still be wrong for this brand. Load the brand constraints before
   recommending anything.

## The six ingredients

Each is a lens for both modes. Brief here; the full observable checks, scoring
bands, failure modes and what-good-looks-like are in `references/ingredients.md`
— **read it before running either mode**.

1. **Makes the benefits clear.** Does the first screen say what this is, what it
   does for the visitor, and why it beats their current alternative?
2. **Has an irresistible offer.** Is the offer (price, unit framing, what's
   included, terms, risk reversal, bonuses) architected so yes is easy and no
   feels like leaving value behind? Deep dive: `references/offer-architecture.md`.
3. **Is trustworthy.** Does the page earn belief fast enough to survive a sceptic,
   using the *right kinds* of proof? Deep dive: `references/proof-types.md`.
4. **Is written well.** Is the copy concrete, scannable, ordered as an argument,
   with objections answered where they arise?
5. **Is user-friendly.** Can a visitor, on mobile, understand, find and do the one
   thing with minimum friction? Deep dive: `references/page-architecture.md`.
6. **Gives people what they want.** Does the page match what *this* visitor came
   for — their segment, their stage, the next step they're willing to take?

## Page types

The checks are weighted differently by page type. Establish which one you are
looking at before scoring; `references/page-architecture.md` has the per-type
emphasis.

- **PDP-as-landing-page** — a product page carrying paid traffic. Buy box and
  variant choice architecture carry the most weight.
- **Dedicated / advertorial LP** — single product, single argument, no site
  navigation. Argument order and anchor navigation carry the most weight.
- **Offer / bundle LP** — the offer is the headline. Value stacking and reason-why
  carry the most weight.
- **Lead-capture / waitlist page** — the ask is an email, not a sale. Friction and
  the value exchange carry the most weight.
- **Quiz / finder funnel** — the page sells the *diagnosis*, not the product.
  Perceived effort and payoff carry the most weight.

## Brand constraints (these override generic advice)

Before recommending anything, load the brand constraints for the brand in scope:

1. Look for `references/brand-constraints.<brand>.md` in this skill.
2. If none exists, look for a brand guidelines skill or document in the project
   (e.g. a `*-brand-copy` / `*-brand-design` skill, a `BRAND.md`).
3. If neither exists, run the short interview in
   `references/brand-constraints.template.md` — it takes one exchange — and offer
   to save the answers as a new `brand-constraints.<brand>.md`.

Constraints cover: banned conversion levers, approved and blocked claims, price
and discount policy, competitor-naming policy, testimonial and social-proof
policy, copy register, colour and design rules, and regulatory limits. A
recommendation that breaches them is invalid, however well it would perform. When
a generic best practice is blocked, say so explicitly and give the on-brand
alternative.


## Audience segments

A finding or hypothesis is incomplete until it names which audience segment it
applies to. Establish the segments from the brand constraints file, the project's
ICP documentation, or by asking. Do not invent them.

If a page serves multiple segments with tagged variants (UTM/CRM hero swaps and
similar), check the variant actually matches the segment the traffic is tagged as.

---

## Mode A — Critique

Use when the user wants a page reviewed, scored, audited or improved.

1. **Establish context first.** Confirm, or ask in one tight batch: the page type;
   the audience segment and traffic source; the single conversion goal; the funnel
   stage (pre-launch capture vs live sale); device priority (assume mobile-first
   unless told otherwise); baseline conversion rate and monthly sessions if known;
   and what visitor evidence exists. Do not critique a page blind to its intended
   audience — the same page is right for one segment and wrong for another.
2. **Load the brand constraints** (see above).
3. **Read `references/ingredients.md`**, plus the deep-dive file for any ingredient
   you expect to be central.
4. **Score each ingredient** by running its checks and counting what is met. Record
   which checks failed — they become the findings. Bands are in the reference.
5. **Run the constraint check** — flag any off-brand lever already on the page.
6. **Write the output** per `references/templates.md` → "Critique output":
   scorecard with checks-met counts, then prioritised findings (structural first,
   each mapped to trust / understanding / fit), then quick wins.
7. **Offer to take the top findings into Hypothesis mode.**

Keep it specific. "The hero benefit is abstract" is useless. "The hero leads with
the technology name before the visitor knows what it does for them — a visitor
scanning for relief gets no benefit in the first screen" is a finding.

## Mode B — Hypothesis generation

Use when the user wants test ideas, hypotheses or an experiment backlog.

1. **Source the gaps** — from a Mode A critique if one exists, otherwise run the
   ingredient scan first. Every failed check is a candidate hypothesis.
2. **Ground each in evidence** where possible, and label the rest as heuristic.
3. **Write each as a structured hypothesis**, never a bare idea. Format in
   `references/templates.md` → "Hypothesis format": observation → change →
   expected effect and mechanism → ingredient and abandonment reason → segment →
   how it's measured.
4. **Score with ICE** (Impact, Confidence, Ease, each 1–5, total /15). Guidance in
   the reference. Sort by score.
5. **Sanity-check the statistics.** Use the sample-size table in
   `references/diagnostics.md` against the page's actual traffic and baseline
   conversion rate. Say plainly which hypotheses can be tested, which need a
   sequential read, and which should just be shipped on judgement. Never imply a
   clean A/B read is available when the traffic cannot support it.
6. **Keep every proposal inside the brand constraints.** A hypothesis that
   recommends a blocked lever is invalid — rework it.

---

## Inputs

Accept whatever the user provides and flex depth accordingly:

- **URL** — browse the page and assess the live experience, including mobile. If
  browser tooling is unavailable, fetch the HTML and assess structure and copy,
  and say that rendered experience, speed and interaction were not assessed.
- **Screenshots** — assess what is visible; note where a verdict needs what isn't.
- **HTML / code** — read structure, copy and order; flag that rendered experience
  and performance still matter.
- **Pasted copy or a wireframe** — critique the argument, message and offer; flag
  that visual and usability ingredients are only partly assessable.

Always state which ingredients you could assess fully and which only partially.

## Reference files

Read `ingredients.md` for either mode. Read the rest on demand.

- `references/ingredients.md` — the six ingredients as observable checks, with
  scoring bands, failure modes and diagnostic questions. **Always read.**
- `references/offer-architecture.md` — offer mechanics: unit-price reframing,
  value stacking, plan choice architecture, risk reversal, bonuses, thresholds,
  reason-why. Read when the offer is in scope.
- `references/proof-types.md` — the proof taxonomy, which proof answers which
  objection, and how to spot proof that isn't doing any work.
- `references/page-architecture.md` — structural patterns (CTA cadence, anchor
  navigation, progressive disclosure, buy-box composition), per-page-type
  emphasis, and mobile specifics.
- `references/diagnostics.md` — evidence sources, the objection-inventory method,
  what to instrument, and the sample-size table for deciding test vs ship.
- `references/templates.md` — exact output formats for the scorecard, the
  narrative and the ICE-scored backlog.
- `references/examples.md` — teardowns of four high-converting pages showing each
  pattern in the wild, plus a worked critique and hypothesis set.
- `references/brand-constraints.template.md` — the shape of a constraints file and
  the interview that fills it.
