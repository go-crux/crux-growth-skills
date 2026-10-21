<!-- Source: the private CRO audit skill this one adapts, captured verbatim 2026-10-21 (commit 5c782a4) for PRD192. Brand-specific lines removed; otherwise unedited. This is source material for the build, not the skill: the skill lives in plugins/crux-growth-skills/skills/audit-landing-pages/. -->

# Page architecture

Structure decides how much of the argument gets read. This file covers the
structural patterns that recur across pages that convert at scale, the standard
section order, per-page-type emphasis, and the mobile specifics.

---

## The CTA system

The primary action is not a button. It is a system running the length of the page.

**One action, one wording.** Every instance of the primary CTA uses identical
words. Repeating one phrase down a page compounds; three different phrasings for
the same action read as three different actions and dilute all of them.

**Cadence.** Place the CTA after each block that could complete the argument for
someone: after the hero, after the reasons-to-buy, after the proof, after the
offer, after the FAQ. A visitor convinced at any point should never have to scroll
to find how to act. On a long page this typically means six to nine placements.

**Persistence.** Anything longer than about three screens needs a persistent
route to action — a sticky buy bar, a docked button, or a sticky buy box on
desktop. Without it, conviction decays during the scroll back up.

**Hierarchy.** One primary style, used only for the primary action. Secondary
actions (size guide, quiz, learn more) get a visually subordinate treatment.
Two buttons of equal weight is a choice the visitor did not ask to make.

**Label.** The CTA states what the visitor gets or does, not a system verb. It can
also carry the risk reversal, which is the cheapest place on the page to put it.

---

## Anchor navigation

Long single-product pages carry a compact in-page nav — typically sticky, four or
five items, the last of which is the CTA.

- Names the sections in visitor language: why, benefits, reviews, how it works.
- Gives a scanner a map of what the page contains, which raises the chance they
  scroll at all.
- Lets a researcher jump straight to their blocking question and back to the CTA.
- Replaces site navigation on a dedicated LP: it keeps the visitor moving within
  the page rather than out of it.

---

## Progressive disclosure

Two audiences read the same page: the scanner who wants thirty seconds and the
researcher who wants everything. Serve both by keeping depth on the page but
collapsed.

- Accordions for detail: full specification, ingredients, delivery, care,
  subscription management.
- Tabs for parallel variants: flavours, scents, sizes, nutritional data per
  option.
- "More details" for component-level breakdowns inside a kit.
- The summary line is written to work alone; opening it is optional.

The failure mode in both directions: a page that hides everything behind clicks
reads as thin, and a page that shows everything reads as a wall. The test is
whether the page still makes a complete argument with every accordion closed.

---

## Standard section order

Not a rule, but the order most high-performing pages converge on. Deviations
should be deliberate.

1. **Announcement or offer bar** — the standing offer, shipping threshold, or
   guarantee. One line.
2. **Hero** — category, outcome headline, translating subhead, primary CTA,
   credibility chips.
3. **Credibility strip** — three or four proof chips, or a press quote row.
4. **Benefit or spec strip** — three to six scannable claims.
5. **Reasons to buy** — enumerated, each a distinct argument.
6. **Mechanism** — how it works, in named parts.
7. **Composition** — what's inside or included, with the why for each.
8. **The offer** — buy box, plan choice, what's included, value reconciliation,
   risk reversal.
9. **Proof** — reviews, press, experts, in the mix the objections call for.
10. **Objection handling / FAQ** — the doubts, not the logistics.
11. **Founder or brand story** — who is behind this and why.
12. **Final CTA** — with the risk reversal restated.
13. **Secondary conversion** — email capture, quiz, notify-me for the not-ready.

The two most common ordering faults: the offer arriving before the argument has
been made, and proof arriving after the decision point rather than before it.

---

## Buy-box composition

The buy box is the highest-value real estate on the page. A complete one contains:

- Product name and a one-line descriptor.
- Rating and review count, linked to the reviews.
- Price, with the unit reframe alongside.
- Plan choice, with one option recommended and pre-selected, and each plan's
  benefits itemised.
- Variant choice, signposted with bestseller / recommended tags.
- Quantity, where it matters.
- The primary CTA.
- Risk reversal, immediately below — as a badge row or a single line.
- Delivery expectation and the shipping threshold gap.
- Accordions for delivery detail, returns, and subscription management.

Everything in that list should be reachable without a page change. A modal that
navigates away and loses state costs more conversions than the information gains.

---

## Per-page-type emphasis

**PDP-as-landing-page.** A product page carrying paid traffic. Weight the buy box,
variant signposting and the offer. Watch for the classic leak: full site
navigation and a mega-menu sending expensive traffic sideways into the catalogue.
Consider suppressing or simplifying navigation for paid sessions.

**Dedicated / advertorial LP.** Single product, single argument, no site
navigation. Weight the argument order, the anchor nav, and CTA cadence. The page
must be self-sufficient: every objection answered inside it, because there is
nowhere else to go.

**Offer / bundle LP.** The offer is the headline. Weight value stacking,
reason-why, and the reconciliation arithmetic. The risk is that the offer is
loud and the product argument is missing entirely — a visitor who does not want
the thing is not persuaded by a discount on it.

**Lead-capture / waitlist page.** The ask is an email. Weight friction and the
value exchange: state exactly what they get and when, ask for one field, and do
not pitch a purchase the visitor cannot yet make. Proof still matters; the offer
mechanics mostly do not.

**Quiz / finder funnel.** The entry page sells the diagnosis, not the product.
Weight perceived effort ("six questions, one minute"), the payoff (what they get
at the end), and completion rate as the primary metric. Question count and
question order matter more than any copy on the entry page.

---

## Mobile specifics

Assume mobile-first unless told otherwise, and check these separately from desktop:

- The first screen on a mid-size phone: what is actually visible above the fold,
  including any announcement bar and any cookie banner. Frequently the CTA is not.
- Sticky elements stacking: announcement bar plus sticky nav plus sticky buy bar
  can consume a third of the viewport.
- Tap targets and spacing on variant selectors and quantity steppers.
- Horizontal carousels that hide items with no scroll affordance.
- Accordion labels long enough to be understood without opening.
- Interstitials and popups on arrival, which suppress mobile conversion harder
  than they suppress email capture gains.
- Load and stability: image dimensions declared, hero media not render-blocking,
  no shift as fonts and reviews widgets load.

---

## Structural leaks to check for

- Full navigation on a page bought traffic lands on.
- A hero carousel: measured engagement past the first slide is close to zero, and
  the rotation costs the first slide its read.
- Cross-sells placed above the offer, competing with the decision.
- Reviews widgets that load late and shift the layout under a tapping thumb.
- Multiple email-capture surfaces competing with the purchase CTA.
- A footer mega-menu on a dedicated LP, undoing the point of having no navigation.
- Any link out to a policy page that does not return the visitor to their place.
