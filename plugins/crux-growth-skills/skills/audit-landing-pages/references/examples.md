# Examples

Two parts:

1. **Four pages that convert at scale**, showing the checks and mechanics in the wild. Use them
   for calibration: this is what "met" looks like.
2. **A worked Audit** of an illustrative page, showing the output standard and tone.

The four pages are described as observed at the time of writing. Live pages change, including
through their own testing; treat the patterns as durable and the specifics as a snapshot.

---

# Part 1: four pages that convert at scale

## HexClad: 13pc Hybrid Cookware Set (product page, high ticket)

**Shape.** A product page for a £749 bundle, carrying paid traffic.

**What it does well**

- **Value stacking with published arithmetic.** £749 against £1,148 "set value", save £399, 35%
  savings, and an expandable breakdown showing Set Value, Set Savings, You Pay and Total
  Savings, plus a footnote defining set value as the combined individual prices if bought
  separately. The method is stated, so the saving is checkable rather than asserted. This is
  the reference implementation of value stacking (`offer-architecture.md` section 2).
- **Risk reversal as a badge row under the buy button.** Lifetime Warranty · Free Shipping ·
  30-Day Return Guarantee. Three fears removed at the moment of decision, not in the footer.
- **What's-included itemisation at component level.** Seven pieces, each with its own use-case
  copy ("sauces, reductions, or single servings of protein"), flat bottom diameter, height and
  weight. Specificity justifies a £749 price and lets a visitor check the set covers their
  kitchen.
- **Third-party lab results as an objection-killer.** The category's live fear is "forever
  chemicals". The page answers it with a results table (PFOS, PTFE, PFOA, PFAS, PFNA and
  others, each Passed or Non-Detect) attributed to a third-party lab, with a plain-language
  scale line about the detection limit. This is the strongest form of third-party proof
  (`proof-types.md` section 3): it invites checking.
- **Mechanism proof in named parts.** Hybrid technology explained as hexagonal steel peaks plus
  nonstick valleys, with the coating named (TerraBond™) and the technology described as
  patented. A sceptic can follow why it behaves differently from a normal pan.
- **Relevant authority, quoted on the mechanism.** A multi-Michelin-starred chef quoted
  specifically on sear and cleanup, the two things the pan claims, rather than lending a face.
- **Volume proof at multiple altitudes.** 5,882 reviews on this product, over 50,000 five-star
  reviews brand-wide, over a million home chefs.
- **Post-purchase anxiety handled on the page.** Seasoning, heat guidance, cleaning and the full
  warranty exclusions. Reduces both hesitation and returns.
- **Occasion-led opening copy.** "Want to make a fluffy omelette? Need to sear a steak for a
  cosy dinner for two? Feeding 40 for a special feast?" Three use cases so different households
  locate themselves.

**What it risks**

- Full mega-navigation with the entire catalogue on a page that bought traffic lands on: the
  classic product-page leak (`page-architecture.md`).
- Cross-sells with their own add-to-basket buttons, competing with the primary action.
- The mechanism explainer sits well below the offer, so the sceptic decides before the
  strongest argument arrives.

---

## Huel: Black Edition (product page, subscription first)

**Shape.** A product page for a subscription-first consumable with a large variant range.

**What it does well**

- **Unit-price reframing as the headline price.** "From £1.79 per meal" shown alongside £30.50
  per bag, with the denominator stated ("from 17 meals"). Moves the comparison from bag price to
  meal price, which the product wins (`offer-architecture.md` section 1).
- **Plan choice architecture, done fully.** Flexible Plan versus One-Time, the subscription
  flagged "most customers choose this" and pre-selected, both prices and both unit prices shown
  side by side, and the subscription's advantages itemised: 10% off recurring orders, skip or
  reschedule any time, cancel any time with no fees, free t-shirt, free shaker. The one-time
  option remains genuinely available.
- **Bonuses with cash values.** Shaker "£10 FREE", classic t-shirt "£20 FREE". £30 of priced
  value attached to a £30.50 purchase.
- **Threshold with the gap stated in the buy box.** "Spend £45 to get free delivery within 2
  working days."
- **Category reframe without naming a competitor.** "This is a meal. Not another protein
  shake." One line that repositions the entire competitive set.
- **A scannable proof strip.** 40g protein · 26 vitamins and minerals · 100% nutritionally
  complete · 8g+ fibre · no artificial sweeteners · £1.79 per meal.
- **Signposted variant choice.** Ten-plus flavours, tagged New, Bestseller and Our favourite,
  plus a Bestseller Trio and a Selection Box for the undecided. Choice paralysis handled with
  merchandising rather than reduction.
- **Layered proof types.** Press quotes, named athletes and public figures quoted on their own
  use case, verified customer reviews with names, an in-house nutrition team, and
  ingredient-by-ingredient explanation of what each component does.
- **Risk reversal on the subjective risk.** "Taste guaranteed: love it or your money back"
  reverses the fear specific to this category, not that it will not work but that it will be
  unpleasant.
- **Logistics answered inside the buy box.** Delivery costs, delivery times, tracking and
  regional variations, all in accordions, none requiring a page change.
- **FAQ in search-query phrasing.** "How do you make a meal replacement shake with protein
  powder?" doubles as objection handling and organic capture.
- **Secondary conversion for the not-ready.** £10 off the first order for an email address, a
  referral scheme, and a points balance shown on the product.

**What it risks**

- Announcement-bar messaging repeated many times over, and a deep mega-menu, on a page that
  should be funnelling.
- Enough offer mechanics running at once (subscription discount, gifts, referral, points, email
  discount, shipping threshold) that the actual price becomes work to establish.

---

## Jones Road: Miracle Balm (landing page, dedicated)

**Shape.** A single-product landing page with no site navigation. The cleanest example of the
dedicated form.

**What it does well**

- **Anchor navigation as the nav.** A sticky four-item bar (Why Miracle Balm · Benefits ·
  Reviews · Try Miracle Balm) where the fourth item is the CTA. The visitor gets a map of the
  page and a permanent route to action, and no route off the page.
- **Three credibility chips in the hero.** Allure Best of Beauty Winner · Created by Bobbi
  Brown · Over 71K 5-Star Reviews. Third-party validation, founder authority and volume proof,
  before the first scroll.
- **A headline that names the outcome, not the product.** "Meet the secret to no-makeup
  makeup", with a subhead translating the mechanism ("a wash of soft-focus moisture to perfect
  and enhance skin") into what it does.
- **Enumerated reasons to buy.** "5 Reasons to Try Miracle Balm", numbered 01 to 05, each a
  genuinely distinct argument: skincare plus makeup, versatility, ingredients, award, founder.
  Not five restatements of one point.
- **Effort framing as a section heading.** "60 seconds. Done." followed by three steps: break
  the seal, warm it, tap it on. The fear that a new product means a new routine is removed
  explicitly.
- **The FAQ answers doubts, and one is the hostile one.** "How do I prevent it from feeling
  greasy on the skin?" is the objection that appears in this category's negative reviews,
  answered on the page rather than left to be discovered after purchase.
- **Fit handled with a tool.** Two FAQ entries, "How do I know if it's right for me?" and "What
  shade is best for me?", both route to a shade quiz. The "can't find something that suits me"
  abandonment reason gets an instrument, not copy.
- **One CTA, one wording, everywhere.** "Try Miracle Balm", repeated identically down the page
  and in the sticky bar.
- **Payment and delivery reassurance beside the price.** Pay over time · free shipping over $55
  · free and easy returns.
- **Ingredient transparency with function.** Three oils, each with what it does and why it is in
  the formula.

**What it risks**

- Volume proof cited at two different figures in different modules (71K in the hero, 84,913
  elsewhere). Inconsistent numbers undercut the specificity that makes them work.
- No mechanism proof beyond ingredient description: light for a sceptical visitor, though the
  category tolerates it better than most.

---

## Purdy & Figg: Summer Starter Kit (landing page, offer led)

**Shape.** An offer-led landing page acquiring subscription customers through a discounted
first box.

**What it does well**

- **Offer in the first line, with a reason attached.** "Save £28 on Summer Starter Kits"
  alongside "limited edition summer scents out now". The discount has a rationale, a seasonal
  edition, so it reads as a commercial decision rather than a struggling product
  (`offer-architecture.md` section 3).
- **Value stacking, itemised and reconciled.** Three refills at "worth £8" each, plus "Glass
  Bottle for Life & Cloth (worth £19)": £43 of stated worth for £15. The visitor can do the
  arithmetic themselves.
- **Risk reversal as the button label.** "TRY IT RISK FREE" with "30-day money-back guarantee"
  directly beneath, and "skip or cancel any time" stated in the plan description. The cheapest
  placement of a guarantee on any page.
- **Membership sold as upside, not tolerated as a catch.** A dedicated "Why become a member?"
  block: full flexibility, 15% off every refill forever, member-only products, early access.
  The subscription is the reward.
- **Forward-looking reason to stay subscribed.** A seasonal roadmap: summer available now,
  spring, autumn and winter scents with their windows. The subscription has a future the visitor
  can look forward to, which is a retention mechanic doing acquisition work.
- **Process proof in numbers.** 7+ years of research and development · 200 essential oils
  tested · patented formulation. Investment made countable.
- **Reviews attributed by name and town.** "Roberta, Bath", "Krish, Manchester", and one review
  does real objection work, describing use with a respiratory condition, which addresses the
  category's "harsh chemicals" fear far better than a claim would.
- **Competitive claim without naming a competitor.** "Outcleans the big brands", in a four-chip
  benefit strip with "cleans over 14 surfaces", "100% pure essential oils" and "tough toxin free
  formula".
- **One CTA phrase, repeated relentlessly.** "GET YOUR OFFER" appears at every decision point
  down the page.
- **Progressive disclosure for the enthusiast.** Full top, middle and base scent notes with
  descriptors, behind "Blend Details", so the scanner is not blocked and the browser gets depth.
- **Founder story with names and origin.** Two named founders, a Hertfordshire garage, a stated
  mission. An identifiable seller.
- **Objections answered concretely in the FAQ**, including how many sprays a bottle yields
  (about 230) and exactly how to change, pause or cancel.

**What it risks**

- Kit contents and the scent library repeat in several near-identical blocks, lengthening the
  page without adding argument.
- "Limited edition" carries an implicit time pressure. It is fair here because the edition is a
  genuine seasonal one; the same device on a permanent product would be manufactured scarcity.

---

## What the four have in common

Every one of them, despite different categories, price points and Page types:

1. Reframes or reconciles the price into something the visitor can judge: a unit price, or an
   itemised value stack with stated worth.
2. Places risk reversal within a screen of the primary CTA, often in the button itself.
3. Uses one CTA phrase, repeated identically, many times.
4. Carries at least four distinct proof types, including at least one the brand does not
   control.
5. States a point of difference against the category the visitor is coming from, usually
   without naming a competitor.
6. Explains effort and time-to-value explicitly.
7. Answers its own hardest objection somewhere on the page, in the visitor's words.
8. Keeps depth available behind progressive disclosure rather than choosing between scanners and
   researchers.
9. Names who is behind the product.
10. Gives the not-ready visitor something to do: a quiz, an email capture with a stated
    incentive, a referral.

A page missing five or more of these has structural upside available before any copy or design
work begins.

---

# Part 2: a worked Audit

The page below is fictional. It bundles common, instructive faults. Use it to calibrate the
output standard and tone, not as findings about anything live. The Audit is shown in the order
of the page's headings, minus Performance, which reads "Not available" with no traffic figures,
and Methodology, whose copy is fixed in `references/audit-layout.md`.

## The page

A launch-phase landing page at `/pages/corelayer` taking search-ad traffic from high-intent,
solution-aware visitors who have tried and been disappointed by the category before. The HTML
was fetched, and the user pasted one mobile screenshot of the first screen. Top to bottom:

- **Hero headline:** "Introducing CoreLayer Technology™: the future of the category."
- **Hero subhead:** "Our advanced triple-active formula is here."
- **Hero CTA:** "Learn more", a text link, below the fold on mobile.
- **Banner:** "Launch offer, ends Sunday", with a countdown timer and no stated discount or
  reason.
- A three-part mechanism explainer, correctly built.
- One efficacy statistic from the brand's own study, in small print beneath it.
- Pricing block: "£13.99/month", "Subscribe" button, delivery and returns line beneath, email
  and card form. No cancellation terms.
- A generic FAQ: "Where do you ship?", "How do I contact you?"
- One hero, shown to every traffic segment.

## Context

Assessed: `/pages/corelayer`, Page type landing page (dedicated), goal subscribe, mobile first.
Search-ad traffic, solution-aware, ad text not given. Read from fetched HTML plus one mobile
screenshot of the first screen. The user also pasted a list of cancellation reasons. Four checks are unassessed: Benefits 7 (needs the ad text) and
User-friendly 4, 6 and 10 (need a render).

## Scorecard

| Ingredient | Checks met | Band | Justification |
|---|---|---|---|
| Makes the benefits clear | 2/9 | Absent | Hero leads with a technology name and an abstraction: no outcome, no quantified claim, no point of difference. |
| Has an irresistible offer | 0/7 | Absent | A price with no unit reframe, no itemised inclusions, no risk reversal, no stated exit terms. |
| Is trustworthy | 4/10 | Weak | A real mechanism and a specific statistic, but no third-party proof and the statistic is small print. |
| Is written well | 3/10 | Weak | Abstract and adjective-led; objections unanswered; the FAQ does no persuasion work. |
| Is user-friendly | 2/6 | Weak | The primary action is a vague text link below the fold, with no repetition. |
| Gives people what they want | 3/10 | Weak | One generic hero for every segment; no fit tool; no secondary conversion. |
| **Total** | **14/52** | | |

**Failed checks.** Benefits 2, 3, 4, 5, 6, 8, 9 · Offer 1, 2, 3, 4, 5, 6, 8 (7, 9 and 10 n/a)
· Trust 1, 2, 3, 4, 6, 8 · Written 1, 2, 5, 6, 7, 8, 9 · User-friendly 1, 2, 3, 5 (7 n/a) ·
Gives people what they want 1, 2, 3, 5, 6, 7, 9.

## Findings

**F1. The hero sells the technology, not the outcome.** Failed: Benefits 2, 3, 4, 9.
Understanding and fit. A solution-aware visitor arrives mid-scepticism, looking for something
that finally works. "Introducing CoreLayer Technology™: the future of the category" gives them
no benefit and asks them to care about a new name before they know what it does. *Evidence:*
heuristic. *Do:* lead with the outcome and the category-contrast argument, with the technology
as the proof line beneath it.

**F2. The offer is not made, only the price.** Failed: Offer 1, 2, 3, 4, 5, 6, 8. Trust. "£13.99
per month" with no cancellation terms, nothing itemised and no risk reversal, under a countdown
banner that names neither a saving nor a reason. The dominant objection for a disappointed buyer
is "another one that won't work and I'll be stuck paying". *Evidence:* heuristic. *Do:* state
the exit terms at the button, itemise everything included with its worth, show a per-use price
beside the monthly charge, and replace the countdown with the reason the launch price exists.

**F3. The strongest proof is small print, and none of it is independent.** Failed: Trust 1, 2,
4. Trust. The only statistic comes from the brand's own study and sits beneath the mechanism,
far from the price where the doubt bites. *Evidence:* heuristic. *Do:* promote the statistic
into a proof module with its study context above the pricing block, and add one piece of
third-party proof.

**F4. The FAQ answers logistics, not doubts.** Failed: Written 6, 7. Trust. Shipping and contact
questions, while "how long until I notice a difference" and "can I use it alongside what I
already use" go unanswered. *Evidence:* the cancellation reasons the user pasted. *Do:* rebuild it from the objection
inventory, answering each doubt concretely near the claim that triggers it.

**F5. One hero for every segment.** Failed: Fit 1, 3, 9. Fit. A first-time buyer and a visitor
who tried the category before read the same opening. *Evidence:* heuristic. *Do:* serve a
variant per ad group; the shared body can stay.

## Quick wins

- **Q1.** Remove the countdown and say what the launch offer is and why it exists (Offer 4).
- **Q2.** Replace "Learn more" and "Subscribe" with one primary CTA wording, visible in the first
  screen on mobile and repeated after each block (User-friendly 1, 2, 3).
- **Q3.** Add the cancellation terms beside the price (Offer 6).

## Test backlog

> **H1. Outcome-led hero for solution-aware search traffic**
> **Observation:** hero fails Benefits 2, 3, 4 and 9: technology name plus an abstraction, no
> outcome, no point of difference. Heuristic.
> **Change:** swap to an outcome headline carrying the category-contrast argument, with the
> technology demoted to the proof line beneath.
> **Expected effect:** higher hero-to-CTA click and overall conversion. The visitor sees their
> problem and a credible answer in the first screen.
> **Ingredient / reason:** benefits clear, understanding and fit.
> **Read as:** Test or ship: needs traffic figures.
> **ICE:** Impact 5 · Confidence 4 · Ease 4 · **Total 13**

> **H2. Make the offer: exit terms, itemised value, per-use price**
> **Observation:** Offer 1, 2, 3, 5 and 6 all fail: a bare monthly price with nothing counted and
> no risk reversal. Heuristic.
> **Change:** itemise every component with its worth, reconcile to the price paid, show a per-use
> figure beside the monthly charge, and state the exit terms at the button.
> **Expected effect:** higher subscribe rate from the pricing block, as the recurring plan's
> value becomes visible and "stuck paying" is removed.
> **Ingredient / reason:** irresistible offer, trust.
> **Read as:** Test or ship: needs traffic figures.
> **ICE:** Impact 5 · Confidence 4 · Ease 3 · **Total 12**

> **H3. Promote the statistic into a proof module at the decision**
> **Observation:** Trust 1, 2 and 4 fail: the only statistic sits in small print, far from the
> CTA, and this audience trusts numbers over adjectives. Heuristic.
> **Change:** build a proof module carrying the statistic with its study context above the
> pricing block, beside one independent proof point.
> **Expected effect:** higher conversion through reduced scepticism at the point of decision.
> **Ingredient / reason:** trustworthy, trust.
> **Read as:** Test or ship: needs traffic figures.
> **ICE:** Impact 4 · Confidence 3 · Ease 3 · **Total 10**

> **H4. Rebuild the FAQ from the objection inventory**
> **Observation:** Written 6 and 7 fail: the FAQ covers shipping and contact, not the doubts that
> block this audience. Evidenced by cancellation reasons the user pasted.
> **Change:** replace it with the ranked objections, answered concretely, each placed near the
> claim that triggers it.
> **Expected effect:** higher conversion among visitors who scroll past the offer; fewer silent
> exits at the doubt stage.
> **Ingredient / reason:** written well, trust and understanding.
> **Read as:** Test or ship: needs traffic figures.
> **ICE:** Impact 3 · Confidence 4 · Ease 4 · **Total 11**

> **H5. Hero variants per ad group**
> **Observation:** Fit 1, 3 and 9 fail: one hero for every segment. Heuristic.
> **Change:** build a hero variant for each ad group's intent and serve it by campaign tag.
> **Expected effect:** higher hero-to-CTA click from each tagged segment, as the opening matches
> what the visitor searched for.
> **Ingredient / reason:** gives people what they want, fit.
> **Read as:** Test or ship: needs traffic figures.
> **ICE:** Impact 4 · Confidence 3 · Ease 2 · **Total 9**

| Rank | H | Name | Ingredient | Reason | Read as | ICE |
|---|---|---|---|---|---|---|
| 1 | H1 | Outcome-led hero | Benefits | Understanding | Test or ship: needs traffic figures | 13 |
| 2 | H2 | Make the offer | Offer | Trust | Test or ship: needs traffic figures | 12 |
| 3 | H4 | Objection-led FAQ | Written | Trust | Test or ship: needs traffic figures | 11 |
| 4 | H3 | Proof module at the decision | Trust | Trust | Test or ship: needs traffic figures | 10 |
| 5 | H5 | Hero variants per ad group | Fit | Fit | Test or ship: needs traffic figures | 9 |

**Sequencing line.** Test or ship needs the page's visits and conversion rate. With them, each
row reads as a test, a sequential read or a ship.

*For calibration only:* had the page been converting at about 2% on 10,000 sessions a month, the
fixed lift rule and sample-size table in `diagnostics.md` would read H1 and H2 (Impact 5, +50%) as
Test at under a month, H3 and H5 (Impact 4, +30%) as Test at under two months, and H4 (Impact 3,
+20%) as a Sequential read of about 4 months, run as a before-and-after with campaigns held
constant. None would read Ship.
