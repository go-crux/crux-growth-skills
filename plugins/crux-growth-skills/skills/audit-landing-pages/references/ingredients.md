# The six ingredients: sixty observable checks

The checks are written so you can run them against a page and get the same answer twice. The
framework's credit is in the Methodology tab's copy, in `references/audit-layout.md`, and only
there.

## How to score

1. Run all ten checks of the ingredient. Every check ends as one of four marks:
   - **Met**: the page does it.
   - **Not met**: the page should do it and does not.
   - **n/a**: the check genuinely does not apply to this page (no recurring plan, so a check on
     plan framing has nothing to judge). "Hard to tell" is never n/a.
   - **Unassessed**: you cannot tell from what you were given. Say what input would settle it.
2. Checks tagged *(needs a render)* depend on how the page looks or behaves on a phone: where
   things sit in the first screen, what sticks, how it loads. Mark them **unassessed** when you
   have read the HTML only, and settle them from a render or from screenshots that show the
   answer. Benefits check 7 is tagged *(needs the traffic source)*: mark it **unassessed**
   unless the user named the ad, email or search query that sends visitors to the page.
3. Score = checks met ÷ checks assessed, where assessed means met plus not met. n/a and
   unassessed checks leave the count.

| Proportion met | Band |
|---|---|
| 85% or more | Strong |
| 60% to 84% | Adequate |
| 30% to 59% | Weak |
| Under 30% | Absent |

An ingredient with no assessed check reads "Not assessed". Report the band and the raw count
over the checks assessed (for example "Adequate: 6/10", or "Weak: 3/8, two unassessed"). The
failed checks are the findings: raise nothing outside them.

Ten checks per ingredient, sixty in all. A page scoring above 80% overall is near the ceiling
of what page structure alone can do. Further gains come from the offer and the traffic, not the
layout.

## Contents

1. Makes the benefits clear
2. Has an irresistible offer
3. Is trustworthy
4. Is written well
5. Is user-friendly
6. Gives people what they want
7. Awareness and readiness (a lens, not scored)

---

## 1. Makes the benefits clear

**What it means.** Within the first screen a visitor knows what is on offer, what it does for
*them*, and why it beats the alternative they use now, expressed as outcomes rather than
features or brand language.

### Checks

1. **Category is named.** A visitor can say what kind of thing this is from the first screen,
   in plain words, without prior knowledge of the brand.
2. **The headline names an outcome or a change**, not the brand, the technology or an
   abstraction.
3. **A point of difference against the visitor's current alternative is stated** somewhere in
   the first two screens.
4. **A subhead translates the mechanism into a benefit** in one or two sentences, rather than
   listing specs alone.
5. **At least one lead benefit is quantified** with a number, a time or a countable scope.
6. **A scannable benefit or spec strip appears within the first two screens**: three to six
   short claims a visitor can absorb without reading prose.
7. **The lead benefit continues the promise of the traffic source** (ad, email, search query),
   so the scent is unbroken. *(needs the traffic source)*
8. **Nothing in the first screen needs decoding**: no internal product names, sub-brand
   hierarchies or coined terms used before they are explained.
9. **The benefit is the visitor's, not the product's.** Claims are phrased around what changes
   for them, not what the product contains or does.
10. **The first screen makes a single argument.** It is not a carousel of competing
    propositions the visitor must choose between.

### Common failure modes

- Leading with the brand or the technology name before the visitor knows the benefit.
- Feature as benefit: a spec stated as if it self-evidently matters.
- A clever headline that wins on tone but says nothing a sceptic can act on.
- One generic hero shown to every segment, so it lands for none.
- A hero carousel rotating three propositions, none of which gets read.

### Diagnostic questions

- Five-second test: after one screen, can a visitor say what this is, what it does for them
  and why it is different?
- Would this headline still make sense with a competitor's logo on it? If yes, check 3 has
  failed.

---

## 2. Has an irresistible offer

**What it means.** The offer is the total of what the visitor gets, what they pay, the terms,
the risk they carry and any bonus, arranged so yes is easy and no feels like leaving value
behind. The product can be excellent and the offer still weak. Mechanics in
`offer-architecture.md`.

### Checks

1. **Price is reframed into the unit the visitor thinks in** where a unit exists: per serving,
   per use, per day, per wash. Not only the basket price.
2. **What is included is itemised**, component by component, not summarised as a category.
3. **Included components carry a stated individual worth**, and the arithmetic reconciles to
   the price paid, with the method explained.
4. **Any discount has a stated reason** (bundle, first order, seasonal, launch, subscription)
   rather than appearing arbitrary.
5. **Risk reversal is present and within one screen of the primary CTA**: guarantee, returns
   policy, warranty, trial, money-back.
6. **If there is a commitment, exit terms are stated at the decision point** in plain words
   ("cancel any time, no fees"), not only in the FAQ or footer.
7. **If there is a plan choice, one option is recommended and pre-selected**, with a stated
   reason for the recommendation.
8. **Recurring plans are framed as upside** (savings, flexibility, exclusives, early access)
   rather than as a concession the visitor tolerates.
9. **Bonuses and gifts carry a cash value**, so the visitor can price them.
10. **Thresholds are stated with the gap to close** ("spend £45 for free delivery"), not just
    the rule.

### Common failure modes

- The offer is just a price: no risk reversal, no bonus, no framing.
- Risk reversal exists but sits in the footer, so perceived risk stays high.
- Included value is real but never counted, so the visitor prices the headline item alone and
  finds it expensive.
- Subscription framed defensively ("you can cancel") rather than as the sensible default for a
  recurring need.
- Reaching for a discount or a countdown to manufacture urgency when surfacing existing value
  would do the same job without eroding margin or brand.

### Diagnostic questions

- At the point of decision, can the visitor see the full offer (price, terms, what is
  included, what happens if it does not work) without scrolling or clicking?
- What is the largest perceived risk here, and is it reversed on the page?
- Could this offer be stronger *without* discounting? Usually yes: itemise the value, reframe
  the unit, reverse the risk harder.

---

## 3. Is trustworthy

**What it means.** The page earns belief fast enough to survive a sceptic. Trust is the most
commonly cited reason for not buying, so this ingredient usually carries the most upside.
Different doubts need different *kinds* of proof; the taxonomy is in `proof-types.md`.

### Checks

1. **Volume proof appears with a real number** near the top: review count, customer count,
   units sold.
2. **At least one piece of third-party proof** the brand does not control: award, independent
   lab result, certification, press, retailer rating.
3. **Reviews are attributed and specific**: a name plus a location or verified status, and a
   concrete outcome rather than a generic compliment.
4. **At least one proof point addresses the page's hardest objection head-on**, rather than
   only praising the product.
5. **The mechanism is explained**: why it works, in named parts a sceptic can follow, not just
   asserted.
6. **Authority is a person or institution with relevant standing**, quoted on the specific
   benefit rather than lending a face.
7. **Numbers are specific rather than round and vague.** An exact review count beats
   "thousands"; a stated test protocol beats "clinically proven".
8. **Every superlative is bounded or evidenced.** No unfalsifiable claim stands alone as the
   only support for a benefit.
9. **Composition is transparent**: ingredients, materials, specs, dimensions or nutritional
   data available on the page.
10. **The seller is identifiable**: founders, story or a clear company identity, not an
    anonymous storefront.

### Common failure modes

- Adjective-led credibility ("advanced", "breakthrough") with no evidence behind it.
- Proof present but placed far from the doubt it answers.
- A wall of five-star reviews that all praise the same easy thing, none addressing the actual
  objection.
- Borrowed authority with no relevance: a celebrity unconnected to the category, or a badge
  nobody recognises.
- Trust asked for at the moment of action, with nothing earned earlier.

### Diagnostic questions

- For every claim on the page, is there proof a sceptic could check?
- Which proof types in `proof-types.md` are present, and which of the visitor's actual doubts
  is each answering?
- Is the proof specific, or atmospheric?

---

## 4. Is written well

**What it means.** Copy a visitor can read at a glance and be moved by: concrete, specific,
scannable, ordered as an argument, with objections answered where they arise rather than left
to fester.

### Checks

1. **Headings alone carry the argument.** Reading only the headings gives the full case.
2. **Claims are concrete and picturable**: they name a thing, a number or a situation the
   visitor recognises.
3. **The copy uses the visitor's words for the problem**, not internal or category jargon.
4. **Sections are labelled by what the visitor wants** ("What's included", "How to use",
   "What's inside"), not by internal naming.
5. **A numbered reasons-to-buy block exists**: an explicit, enumerated list of why this, rather
   than reasons scattered through prose.
6. **Objections are answered where they arise**, next to the claim or the price that triggers
   them, not quarantined in a footer FAQ.
7. **The FAQ answers doubts, not only logistics**, phrased in the visitor's own question form.
8. **Effort and time-to-value are stated explicitly**: how long it takes, how many steps, how
   soon they will notice something.
9. **Depth is available but not blocking.** Detail sits behind accordions, tabs or "more
   details" so scanners and researchers are both served.
10. **One voice runs throughout**: headings, body copy, microcopy and button labels read as
    the same brand, with consistent spelling and terms.

### Common failure modes

- Abstraction and hedging; filler adjectives doing the work numbers should do.
- Walls of text with no scannable hierarchy; the argument out of order.
- Objections ignored, or answered a full screen away from where they bite.
- A FAQ full of shipping and contact questions, doing no persuasion at all.
- Sections named after internal projects or product lines.

### Diagnostic questions

- Can the page be understood by scanning headings and first lines alone?
- Take the top three objections for this audience: where on the page is each answered, and is
  it near where the doubt arises?
- How long does the visitor think this will take to use? Is that stated, or left for them to
  fear?

---

## 5. Is user-friendly

**What it means.** A visitor can understand the page, find what they need and complete the one
action with minimum friction, doubt and delay, on the device they actually use. Structural
patterns in `page-architecture.md`.

### Checks

1. **There is exactly one primary action**, and every CTA for it uses the **same words**.
2. **The primary CTA is visible in the first screen on mobile.** *(needs a render)*
3. **The CTA repeats after each persuasive block**, so a visitor convinced at any point can act
   without scrolling to hunt.
4. **A persistent CTA exists** (sticky bar, sticky buy box or docked button) on pages longer
   than about three screens. *(needs a render)*
5. **Long pages carry in-page anchor navigation** to the main sections.
6. **Price, plan, variant and quantity choices all happen in one place**, without a page change
   or a modal round trip. *(needs a render)*
7. **Variant choice is signposted** (bestseller, most popular, recommended), so an undecided
   visitor is guided rather than left to a flat grid.
8. **Delivery, returns and cost information is reachable from the buy box** without leaving the
   page.
9. **The form asks the minimum** for the commitment being made, and says what happens next.
10. **The page loads fast and stays stable**: no layout shift, images sized, no render-blocking
    media, no interstitial covering the hero on arrival. *(needs a render)*

### Common failure modes

- More than one competing primary action, so the visitor must first choose what to do.
- CTA below the fold only, or styled as a secondary element.
- Full site navigation on a paid-traffic landing page, leaking visitors sideways.
- A popup covering the hero within seconds of arrival.
- Information not modular: the visitor cannot find the objection-handler and, once lost, never
  sees it.
- A form asking for data the business will not use, before the visitor has committed to
  anything.

### Diagnostic questions

- On mobile, is the one thing to do obvious within a second, and reachable without hunting?
- How many taps and fields to convert? Which can be removed or deferred?
- Where can a visitor accidentally leave this page, and is that exit worth it?

---

## 6. Gives people what they want

**What it means.** The page matches what *this* visitor came for: their intent, their segment,
their stage of readiness and the next step they are willing to take. A page can be clear,
trustworthy and well built and still lose because it answers a question this visitor was not
asking.

### Checks

1. **The page states who it is for** in the first screen, explicitly or by unmistakable
   implication.
2. **A decision-support tool exists for the "which one suits me" question**: quiz, finder,
   comparison table, "help me choose", shade or size matcher.
3. **Multiple use cases or occasions are named**, so different visitors can locate themselves
   in the page.
4. **Choice is bounded.** A recommended default or a curated shortlist exists rather than an
   undifferentiated grid.
5. **Depth is layered**: a thirty-second path and a ten-minute path both exist and both end at
   the CTA.
6. **A secondary conversion exists for the not-ready**: email capture with a stated incentive,
   quiz entry, referral, notify-me.
7. **Post-purchase anxieties are addressed on the page**: how to use it, how to care for it,
   when it arrives, how to change or cancel.
8. **The action asked for matches the visitor's readiness and the funnel stage.** No hard
   purchase ask to cold, pre-launch traffic.
9. **Objections specific to this audience are handled**, not a generic set.
10. **No qualified-but-different visitor hits a dead end.** Someone who wants a related
    variant, a different size or a gift has somewhere to go.

### Common failure modes

- One hero for every segment; the message is generic and fits none.
- Asking for the wrong commitment for the stage.
- Mismatch between the ad or email promise and the page: broken scent.
- Treating a discovery-mode browser as a high-intent searcher, or the reverse.
- A large range presented flat, with no guidance, so choice paralysis substitutes for a
  decision.

### Diagnostic questions

- Does the hero and lead benefit match the segment this traffic is tagged as?
- If a visitor is interested but unsure which version suits them, what does the page give them?
- What is the next step for a visitor who is interested but not ready today?

---

## 7. Awareness and readiness (a lens, not scored)

Run this lens across all six ingredients. The same page serves visitors at very different
stages, and the winning version meets each where they are.

**Stages:**

- **Unaware / problem-unaware**: does not think they have the problem. Needs the category
  reframed before any product pitch lands.
- **Problem-aware**: knows the issue, does not know the solution class. Needs education on what
  the fix looks like.
- **Solution-aware**: knows the category exists, sceptical it works. Needs category contrast
  and specific proof.
- **Product-aware**: knows this brand, weighing it up. Needs the offer, risk reversal and
  objection-handling.
- **Most-aware**: a warm click from an email or a retargeting ad. Needs the path to action with
  minimum friction, not the full pitch again.

**How to use it.**

- Name the stage the page is written for, from what the user said about the traffic or, failing
  that, from how the page opens.
- Check the page opens at the right altitude: too much pitch for a most-aware visitor wastes
  their patience; too little context for an unaware visitor loses them.
- A page that must serve a span of stages should order the argument so the ready can act
  immediately (CTA up top, repeated) while the sceptical can scroll into proof and
  objection-handling.
- A hypothesis that changes the *opening altitude*, such as a stripped most-aware variant for
  email traffic, is usually higher-impact than any single module tweak.
