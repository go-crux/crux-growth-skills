<!-- Source: the private CRO audit skill this one adapts, captured verbatim 2026-10-21 (commit 5c782a4) for PRD192. Brand-specific lines removed; otherwise unedited. This is source material for the build, not the skill: the skill lives in plugins/crux-growth-skills/skills/audit-landing-pages/. -->

# Examples

Two parts:

1. **Teardowns** of four pages that convert at scale, showing the checks and
   mechanics in the wild. Use these for calibration — this is what "met" looks
   like.
2. **A worked critique and hypothesis set** on an illustrative page, showing the
   expected output standard and tone.

The teardowns describe pages as observed at time of writing. Live pages change,
including through their own testing; treat the patterns as durable and the
specifics as a snapshot.

---

# Part 1 — Teardowns

## HexClad — 13pc Hybrid Cookware Set (PDP-as-landing-page, high ticket)

**Shape.** A product page for a £749 bundle, carrying paid traffic.

**What it does well**

- **Value stacking with published arithmetic.** £749 against £1,148 "set value",
  save £399, 35% savings — and an expandable breakdown showing Set Value, Set
  Savings, You Pay, Total Savings, plus a footnote defining set value as the
  combined individual prices if bought separately. The method is stated, so the
  saving is checkable rather than asserted. This is the reference implementation
  of value stacking (`offer-architecture.md` §2).
- **Risk reversal as a badge row under the buy button.** Lifetime Warranty · Free
  Shipping · 30-Day Return Guarantee. Three fears removed at the moment of
  decision, not in the footer.
- **What's-included itemisation at component level.** Seven pieces, each with its
  own use-case copy ("sauces, reductions, or single servings of protein"), flat
  bottom diameter, height, weight. Specificity justifies a £749 price and lets a
  visitor check the set covers their kitchen.
- **Third-party lab results as an objection-killer.** The category's live fear is
  "forever chemicals". The page answers it with a results table — PFOS, PTFE,
  PFOA, PFAS, PFNA and others, each Passed / Non-Detect, attributed to a
  third-party lab, with a plain-language scale line about the detection limit.
  This is the strongest form of third-party proof (`proof-types.md` §3): it
  invites checking.
- **Mechanism proof in named parts.** Hybrid technology explained as hexagonal
  steel peaks plus nonstick valleys, with the coating named (TerraBond™) and the
  technology described as patented. A sceptic can follow why it behaves
  differently from a normal pan.
- **Relevant authority, quoted on the mechanism.** A multi-Michelin-starred chef
  quoted specifically on sear and cleanup — the two things the pan claims — rather
  than lending a face.
- **Volume proof at multiple altitudes.** 5,882 reviews on this product, over
  50,000 five-star reviews brand-wide, over a million home chefs.
- **Post-purchase anxiety handled on page.** Seasoning, heat guidance, cleaning,
  and the full warranty exclusions. Reduces both hesitation and returns.
- **Occasion-led opening copy.** "Want to make a fluffy omelette? Need to sear a
  steak for a cosy dinner for two? Feeding 40 for a special feast?" — three
  use cases so different households locate themselves.

**What it risks**

- Full mega-navigation with the entire catalogue on a page bought traffic lands
  on: the classic PDP-as-LP leak (`page-architecture.md`).
- Cross-sells with their own add-to-basket buttons, competing with the primary
  action.
- The mechanism explainer sits well below the offer, so the sceptic decides
  before the strongest argument arrives.

---

## Huel — Black Edition (PDP-as-landing-page, subscription-first)

**Shape.** A product page for a subscription-first consumable with a large
variant range.

**What it does well**

- **Unit-price reframing as the headline price.** "From £1.79 per meal" shown
  alongside £30.50 per bag, with the denominator stated ("from 17 meals"). Moves
  the comparison from bag-price to meal-price, which the product wins
  (`offer-architecture.md` §1).
- **Plan choice architecture, done fully.** Flexible Plan versus One-Time, the
  subscription flagged "most customers choose this" and pre-selected, both prices
  and both unit prices shown side by side, and the subscription's advantages
  itemised: 10% off recurring orders, skip or reschedule anytime, cancel anytime
  with no fees, free t-shirt, free shaker. The one-time option remains genuinely
  available.
- **Bonuses with cash values.** Shaker "£10 FREE", classic t-shirt "£20 FREE".
  £30 of priced value attached to a £30.50 purchase.
- **Threshold with the gap stated in the buy box.** "Spend £45 to get free
  delivery within 2 working days."
- **Category reframe without naming a competitor.** "This is a meal. Not another
  protein shake." One line that repositions the entire competitive set.
- **A scannable proof strip.** 40g protein · 26 vitamins and minerals · 100%
  nutritionally complete · 8g+ fibre · no artificial sweeteners · £1.79 per meal.
- **Signposted variant choice.** Ten-plus flavours, tagged New, Bestseller, Our
  favourite, plus a Bestseller Trio and a Selection Box for the undecided —
  choice paralysis handled with merchandising rather than reduction.
- **Layered proof types.** Press quotes, named athletes and public figures quoted
  on their own use case, verified customer reviews with names, an in-house
  nutrition team, and ingredient-by-ingredient explanation of what each component
  does.
- **Risk reversal on the subjective risk.** "Taste guaranteed — love it or your
  money back" reverses the fear specific to this category: not that it won't work,
  but that it will be unpleasant.
- **Logistics answered inside the buy box.** Delivery costs, delivery times,
  tracking, regional variations — all in accordions, none requiring a page change.
- **FAQ in search-query phrasing.** "How do you make a meal replacement shake with
  protein powder?" — doubles as objection handling and organic capture.
- **Secondary conversion for the not-ready.** £10 off the first order for an email
  address, a referral scheme, and a points balance shown on the product.

**What it risks**

- Announcement-bar messaging repeated many times over, and a deep mega-menu, on a
  page that should be funnelling.
- Enough offer mechanics running at once (subscription discount, gifts, referral,
  points, email discount, shipping threshold) that the actual price becomes work
  to establish.

---

## Jones Road — Miracle Balm (dedicated / advertorial LP)

**Shape.** A single-product landing page with no site navigation. The cleanest
example of the dedicated-LP form.

**What it does well**

- **Anchor navigation as the nav.** A sticky four-item bar — Why Miracle Balm ·
  Benefits · Reviews · Try Miracle Balm — where the fourth item is the CTA. The
  visitor gets a map of the page and a permanent route to action, and no route off
  the page.
- **Three credibility chips in the hero.** Allure Best of Beauty Winner · Created
  by Bobbi Brown · Over 71K 5-Star Reviews. Third-party validation, founder
  authority and volume proof, before the first scroll.
- **A headline that names the outcome, not the product.** "Meet the secret to
  no-makeup makeup" with a subhead translating the mechanism ("a wash of
  soft-focus moisture to perfect and enhance skin") into what it does.
- **Enumerated reasons to buy.** "5 Reasons to Try Miracle Balm", numbered 01–05,
  each a genuinely distinct argument: skincare-plus-makeup, versatility,
  ingredients, award, founder. Not five restatements of one point.
- **Effort framing as a section heading.** "60 seconds. Done." followed by three
  steps — break the seal, warm it, tap it on. The fear that a new product means a
  new routine is removed explicitly.
- **The FAQ answers doubts, and one is the hostile one.** "How do I prevent it
  from feeling greasy on the skin?" — the objection that appears in this
  category's negative reviews, answered on the page rather than left to be
  discovered after purchase.
- **Fit handled with a tool.** Two FAQ entries — "How do I know if it's right for
  me?" and "What shade is best for me?" — both route to a shade quiz. The "can't
  find something that suits me" abandonment reason gets an instrument, not copy.
- **One CTA, one wording, everywhere.** "Try Miracle Balm", repeated identically
  down the page and in the sticky bar.
- **Payment and delivery reassurance beside the price.** Pay over time · free
  shipping over $55 · free and easy returns.
- **Ingredient transparency with function.** Three oils, each with what it does
  and why it is in the formula.

**What it risks**

- Volume proof cited at two different figures in different modules (71K in the
  hero, 84,913 elsewhere). Inconsistent numbers undercut the specificity that
  makes them work.
- No mechanism proof beyond ingredient description — light for a sceptical
  visitor, though the category tolerates it better than most.

---

## Purdy & Figg — Summer Starter Kit (offer LP, subscription acquisition)

**Shape.** An offer-led landing page acquiring subscription customers through a
discounted first box.

**What it does well**

- **Offer in the first line, with a reason attached.** "Save £28 on Summer Starter
  Kits" alongside "limited edition summer scents out now". The discount has a
  rationale — a seasonal edition — so it reads as a commercial decision rather
  than a struggling product (`offer-architecture.md` §3).
- **Value stacking, itemised and reconciled.** Three refills at "worth £8" each,
  plus "Glass Bottle for Life & Cloth (worth £19)" — £43 of stated worth for £15.
  The visitor can do the arithmetic themselves.
- **Risk reversal as the button label.** "TRY IT RISK FREE" with "30-day
  money-back guarantee" directly beneath, and "skip or cancel any time" stated in
  the plan description. The single cheapest placement of a guarantee on any page.
- **Membership sold as upside, not tolerated as a catch.** A dedicated "Why become
  a member?" block: full flexibility, 15% off every refill forever, member-only
  products, early access. The subscription is the reward.
- **Forward-looking reason to stay subscribed.** A seasonal roadmap — summer
  available now, spring, autumn and winter scents with their windows. The
  subscription has a future the visitor can look forward to, which is a retention
  mechanic doing acquisition work.
- **Process proof in numbers.** 7+ years of research and development · 200
  essential oils tested · patented formulation. Investment made countable.
- **Reviews attributed by name and town.** "Roberta, Bath", "Krish, Manchester" —
  and one review does real objection work, describing use with a respiratory
  condition, which addresses the category's "harsh chemicals" fear far better than
  a claim would.
- **Competitive claim without naming a competitor.** "Outcleans the big brands",
  sitting in a four-chip benefit strip with "cleans over 14 surfaces", "100% pure
  essential oils", "tough toxin free formula".
- **One CTA phrase, repeated relentlessly.** "GET YOUR OFFER" appears at every
  decision point down the page.
- **Progressive disclosure for the enthusiast.** Full top/middle/base scent notes
  with descriptors, behind "Blend Details", so the scanner is not blocked and the
  browser gets depth.
- **Founder story with names and origin.** Two named founders, a Hertfordshire
  garage, a stated mission. Identifiable seller.
- **Objections answered concretely in the FAQ**, including how many sprays a
  bottle yields (about 230) and exactly how to change, pause or cancel.

**What it risks**

- Kit contents and the scent library are repeated in several near-identical
  blocks, lengthening the page without adding argument.
- "Limited edition" carries an implicit time pressure — fine here, but a brand
  whose constraints ban urgency would need this framed as seasonal availability
  rather than scarcity.

---

## What the four have in common

Every one of them, despite different categories, price points and page types:

1. Reframes or reconciles the price into something the visitor can judge — a unit
   price, or an itemised value stack with stated worth.
2. Places risk reversal within a screen of the primary CTA, often in the button
   itself.
3. Uses one CTA phrase, repeated identically, many times.
4. Carries at least four distinct proof types, including at least one the brand
   does not control.
5. States a point of difference against the category the visitor is coming from,
   usually without naming a competitor.
6. Explains effort and time-to-value explicitly.
7. Answers its own hardest objection somewhere on the page, in the visitor's
   words.
8. Keeps depth available behind progressive disclosure rather than choosing
   between scanners and researchers.
9. Names who is behind the product.
10. Gives the not-ready visitor something to do — a quiz, an email capture with a
    stated incentive, a referral.

A page missing five or more of these has structural upside available before any
copy or design work begins.

---

# Part 2 — Worked critique and hypothesis set

The page below is illustrative, not a real page. It bundles common, instructive
faults. Use it to calibrate output standard and tone, not as findings about
anything live. Brand constraints for the fictional brand: no countdowns or
scarcity devices, no discounting as the offer lever, no competitor names.

## The page

A launch-phase landing page taking search-ad traffic from high-intent,
solution-aware visitors who have tried and been disappointed by the category
before. Top to bottom:

- **Hero headline:** "Introducing CoreLayer Technology™ — the future of the
  category."
- **Hero subhead:** "Our advanced triple-active formula is here."
- **Hero CTA:** "Learn more" — a text link, below the fold on mobile.
- **Banner:** "Launch offer — ends Sunday", with a countdown timer.
- Three-part mechanism explainer, correctly built.
- The brand's one approved efficacy statistic, as small print beneath it.
- Pricing block: "£13.99/month". No mention of cancellation terms at the block.
- Generic FAQ: "Where do you ship?", "How do I contact you?"
- One hero, shown to every traffic segment regardless of tagging.

## Critique output

**Context.** Assessed: illustrative launch LP, dedicated-LP type, solution-aware
search traffic, launch phase with a subscribe goal, mobile-first. All six
ingredients assessable from the described page; live load speed and interaction
not assessed. Baseline conversion rate and session volume not supplied, so the
sequencing note below is directional.

**Scorecard**

| Ingredient | Checks met | Band | Justification |
|---|---|---|---|
| Makes the benefits clear | 2/10 | Absent | Hero leads with a technology name and an abstraction; no outcome, no quantified claim, no point of difference in the first screen. |
| Has an irresistible offer | 1/10 | Absent | A price with no unit reframe, no itemised inclusions, no risk reversal, no stated exit terms. |
| Is trustworthy | 4/10 | Weak | One approved statistic and a real mechanism exist, but the statistic is in small print and the hero over-claims. |
| Is written well | 3/10 | Weak | Abstract and adjective-led; objections unanswered; FAQ does no persuasion work. |
| Is user-friendly | 3/10 | Weak | Primary action is a vague text link below the fold; no repetition, no persistence. |
| Gives people what they want | 2/10 | Absent | One generic hero for every segment; no fit tool; no secondary conversion; scent from the search query is broken. |
| **Total** | **15/60** | | |

**Failed checks.** Benefits 2, 3, 4, 5, 6, 7, 8, 9 · Offer 1, 2, 3, 5, 6, 7, 8,
9, 10 (4 n/a) · Trust 1, 3, 4, 6, 7, 8 · Written 1, 2, 5, 6, 7, 8, 9 · Usability
1, 2, 3, 4, 5, 7, 9 (10 unassessed) · Fit 1, 2, 3, 5, 6, 7, 9.

**Constraint check — breach.** The countdown timer and "ends Sunday" are banned
scarcity devices for this brand. They ship out regardless of any test.

**Prioritised findings**

1. **The hero sells the technology, not the outcome** (benefits, checks 2/3/9 —
   understanding + fit). A solution-aware visitor arrives mid-scepticism, looking
   for something that finally works. "Introducing CoreLayer Technology™ — the
   future of the category" gives them no benefit and asks them to care about a new
   name before they know what it does. *Evidence:* heuristic, plus broken scent
   against the search query. *Direction:* lead with the outcome and the
   category-contrast argument, with the technology as the proof line beneath it.

2. **Banned scarcity device is actively costing trust** (constraint breach +
   trust). A countdown reads as discount behaviour — the register this audience is
   tired of, and a low-confidence signal from a premium product. *Direction:*
   remove it. Offer strength comes from proof and risk reversal.

3. **The offer is not made — only the price** (offer, checks 1/2/3/5/6). "£13.99
   per month" with no cancellation terms, nothing itemised, no risk reversal. The
   dominant objection for a disappointed buyer is "another one that won't work and
   I'll be stuck paying." *Direction:* surface exit terms at the CTA, itemise
   everything included with its worth, reframe to a per-use price, and frame the
   subscription as fitting a recurring need.

4. **The strongest proof is in small print** (trust, checks 1/7). The one approved
   efficacy statistic is the brand's best asset and it is a footnote, far from the
   decision. *Direction:* promote it to a proof module with its study context,
   placed immediately above the pricing block.

5. **The FAQ answers logistics, not doubts** (written, checks 6/7). Shipping and
   contact questions, while "how long until I notice a difference" and "can I use
   it alongside what I already use" go unanswered. *Direction:* rebuild from the
   objection inventory; answer each concretely, near where the doubt arises.

6. **One hero for every segment** (fit, checks 1/9). *Direction:* serve the
   tagged variant per traffic segment; the shared body can stay.

**Quick wins**

- Remove the countdown banner — a constraint breach, ships immediately.
- Replace "Learn more" with a single, repeated primary CTA visible in the first
  screen and repeated after each block.
- Add the cancellation terms beside the price.

**Handoff.** I can take findings 1–6 into ICE-scored hypotheses — below.

## Hypothesis set

> **H1 — Outcome-led hero for high-intent search traffic**
> **Observation:** hero fails benefits checks 2, 3 and 9 — technology name plus an
> abstraction, no outcome, no point of difference. Search traffic is
> solution-aware and sceptical. *Heuristic; validate against the quiz "primary
> concern" field and search query report.*
> **Change:** swap to an outcome headline carrying the category-contrast argument,
> with the technology demoted to the proof line beneath.
> **Expected effect:** higher hero-to-CTA click and overall conversion. The visitor
> sees their problem and a credible answer in the first screen.
> **Ingredient / reason:** benefits clear + fit / understanding.
> **Segment:** solution-aware search traffic first, then build the other variants.
> **Measure:** conversion rate. At launch volume, a sequential before/after read
> rather than a powered A/B.
> **ICE:** Impact 5 · Confidence 4 · Ease 4 · **Total 13**

> **H2 — Remove the countdown, add risk reversal at the CTA**
> **Observation:** constraint breach present; no exit terms at the decision point
> (offer checks 5 and 6). "Stuck paying" is the disappointed buyer's core fear.
> *Evidenced by cancellation-reason data.*
> **Change:** delete the countdown; add the cancellation terms and the included
> support programme beside the price and CTA.
> **Expected effect:** higher subscribe rate from the pricing block; less
> hesitation at the price.
> **Ingredient / reason:** offer + trust / trust.
> **Segment:** all.
> **Measure:** subscribe rate from the pricing block. Ship-on-judgement — the
> constraint fix ships regardless; the risk-reversal copy reads sequentially.
> **ICE:** Impact 4 · Confidence 4 · Ease 5 · **Total 13**

> **H3 — Itemise the offer and reframe the price per use**
> **Observation:** offer checks 1, 2 and 3 all fail — a bare monthly price with no
> inclusions counted. *Heuristic, plus support tickets asking what is included.*
> **Change:** itemise every component with its worth, reconcile to the price paid,
> and show a per-use figure alongside the monthly charge.
> **Expected effect:** higher add-to-cart, and higher subscription share of mix as
> the recurring plan's value becomes visible.
> **Ingredient / reason:** irresistible offer / understanding.
> **Segment:** all.
> **Measure:** add-to-cart rate and plan mix. Sequential read.
> **ICE:** Impact 4 · Confidence 4 · Ease 3 · **Total 11**

> **H4 — Rebuild the FAQ from the objection inventory**
> **Observation:** written checks 6 and 7 fail — the FAQ covers shipping and
> contact, not the doubts that block this audience. *Evidenced by pre-sales
> enquiries and one-star reviews across the category.*
> **Change:** replace with the ranked objections from the inventory, answered
> concretely, each placed near the claim that triggers it.
> **Expected effect:** higher conversion among visitors who scroll past the offer;
> fewer silent exits at the doubt stage.
> **Ingredient / reason:** written well + trust / trust + understanding.
> **Segment:** all.
> **Measure:** conversion among visitors reaching the FAQ. Ship-on-judgement.
> **ICE:** Impact 3 · Confidence 4 · Ease 4 · **Total 11**

> **H5 — Promote the efficacy statistic into a proof module at the decision**
> **Observation:** trust checks 1 and 7 fail — the only approved statistic sits in
> small print, far from the CTA, and this audience trusts numbers over adjectives.
> **Change:** build a proof module carrying the statistic with its study context,
> placed above the pricing block.
> **Expected effect:** higher conversion through reduced scepticism at the point
> of decision.
> **Ingredient / reason:** trustworthy / trust.
> **Segment:** all, strongest for the disappointed-buyer segment.
> **Measure:** conversion rate, sequential read; corroborate against the
> post-purchase "what convinced you" field.
> **ICE:** Impact 4 · Confidence 3 · Ease 3 · **Total 10**

**Ranked backlog**

| Rank | H | Name | Segment | Ingredient | Read as | ICE |
|---|---|---|---|---|---|---|
| 1 | H1 | Outcome-led hero | Search / solution-aware | Benefits + fit | Sequential | 13 |
| 1 | H2 | Remove countdown, add risk reversal | All | Offer + trust | Ship | 13 |
| 3 | H3 | Itemise offer, per-use price | All | Offer | Sequential | 11 |
| 3 | H4 | Objection-led FAQ | All | Written + trust | Ship | 11 |
| 5 | H5 | Promote the proof module | All | Trust | Sequential | 10 |

**Sequencing note.** H2's constraint fix ships immediately — it is a compliance
issue, not a test. Assuming a launch-scale page at roughly 2% conversion, the
sample-size table puts a detectable 20% relative lift at around 20,000 sessions
per arm, which this page will not reach in a sensible window. So: run H1 as a
clean sequential before/after — it is the biggest swing and worth a dedicated
window with campaigns held constant — ship H2 and H4 as judgement calls, and hold
H5 until the proof module is built. Validate H1 and H5 against the post-purchase
"what convinced you" field rather than relying on on-page metrics alone.
