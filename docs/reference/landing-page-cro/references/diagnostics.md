<!-- Source: the private CRO audit skill this one adapts, captured verbatim 2026-10-21 (commit 5c782a4) for PRD192. Brand-specific lines removed; otherwise unedited. This is source material for the build, not the skill: the skill lives in plugins/crux-growth-skills/skills/audit-landing-pages/. -->

# Diagnostics — evidence, objections and measurement

"Diagnose, don't guess" needs a method. This file covers where visitor evidence
comes from, how to build the objection inventory a page must answer, what to
instrument, and how to decide honestly whether a change can be tested or should
just be shipped.

---

## 1. Evidence sources

Ask what exists before scoring. Every source below turns a heuristic into a
grounded finding, and most brands already have several sitting unused.

**Voice of customer**

- Post-purchase survey — especially a "what nearly stopped you buying?" question,
  which is the single highest-yield CRO input there is.
- Cancellation and refund reasons — the objections that were not answered well
  enough, in the customer's own words.
- Support tickets and pre-sales enquiries — every repeated question is a question
  the page failed to answer.
- Customer interviews and post-onboarding calls.
- Review mining: your own reviews for the language that converts, your own
  one- and two-star reviews for the objections to pre-empt, and **competitors'**
  one-star reviews for the category-wide fears your page can address directly.
- On-page polls and exit surveys.
- Social comments and ad comments, where objections are stated bluntly.

**Behavioural**

- Session recordings and heatmaps: where attention stops, what gets tapped that
  isn't a link, where rage-clicks cluster.
- Scroll-depth by section: which modules are actually reached.
- Funnel drop-off: page → view offer → add to cart → checkout start → purchase.
- Site search terms: what people cannot find.
- Quiz and finder answers, which double as segmentation data.

**Acquisition**

- Search query reports and ad copy: what was promised before the click. Compare
  against the hero to test scent.
- Landing-page performance split by source, device and campaign — a page can be
  fine for one source and broken for another.

**Label every finding.** *Evidenced* (name the source) or *heuristic* (a
well-founded prior, to be validated). A backlog where everything is asserted with
equal confidence cannot be prioritised.

---

## 2. Building the objection inventory

A page's job is to answer objections before they are voiced. You cannot do that
without the list.

**Method:**

1. **Harvest.** Pull raw objections from: your one- and two-star reviews,
   competitor one-star reviews, cancellation reasons, pre-sales questions, ad
   comments, and the "what nearly stopped you" survey field.
2. **Cluster.** Group into distinct doubts, in the customer's phrasing, not yours.
   Typically five to nine survive clustering.
3. **Rank** by frequency × severity. Severity means: would this doubt alone stop
   the purchase?
4. **Locate.** For each objection, find where on the page it is answered, and how
   far that is from where the doubt arises. Objections answered a screen away from
   their trigger, or only in a footer FAQ, count as unanswered.
5. **Match.** For each unanswered objection, choose the proof type that resolves
   it (`proof-types.md`) or the offer mechanic that removes it
   (`offer-architecture.md`).

The output is a small table — objection, frequency, where answered, gap — and it
usually generates the highest-ICE hypotheses on the page.

**The categories worth checking every time:** does it work, will it work for me
specifically, is it worth the price, what's in it, how much effort is it, what if
it doesn't work, am I locked in, when does it arrive, and can I trust this company.

---

## 3. What to instrument

If the page is under-measured, say so — it is itself a finding, and often the
first one worth fixing.

**Minimum useful instrumentation:**

- Conversion rate and add-to-cart rate, split by device and traffic source.
- CTA clicks **by position**, so you learn which block does the persuading.
- Scroll depth at each major section boundary.
- Accordion and tab opens — a heavily-opened accordion is a question that should
  be on the page, not behind a click.
- Variant and plan selection distribution — tells you whether the recommendation
  is being followed.
- Form field-level drop-off.
- Quiz or finder start and completion rates.
- Video play and completion.
- Site search from the page.

**Read them as a pair, always.** Add-to-cart rate rising while conversion falls
means the page is over-promising and checkout is correcting it. Scroll depth
rising while conversion is flat means the page is interesting but not persuasive.

---

## 4. Test or ship? The sample-size reality

Most pages do not have the traffic to detect the changes people want to test.
Establish this before promising an A/B read.

**Rule of thumb** for a two-arm test, 95% confidence, 80% power:

```
n per arm ≈ 16 × p × (1 − p) ÷ (p × r)²
```

where `p` is the baseline conversion rate and `r` is the **relative** lift you
want to detect (0.20 for a 20% improvement).

### Visitors needed **per arm**

| Baseline CVR | Detect +10% | +20% | +30% | +50% |
|---|---|---|---|---|
| 1% | 158,000 | 40,000 | 18,000 | 6,300 |
| 2% | 78,000 | 20,000 | 8,700 | 3,100 |
| 3% | 52,000 | 13,000 | 5,700 | 2,100 |
| 5% | 30,000 | 7,600 | 3,400 | 1,200 |

Double these for total traffic across both arms. A page at 2% conversion getting
10,000 sessions a month needs roughly four months to detect a 20% lift, and will
never detect a 10% one.

**How to use this in a backlog.** For each hypothesis, state which of these it is:

- **Testable** — the expected effect is large enough and the traffic sufficient to
  read within a sensible window. Run the A/B.
- **Sequential read** — traffic is too thin for a clean split but the change is
  big enough to show in a before/after window. Run it as a clean-window
  before/after, hold everything else constant, and state the confounders
  (seasonality, campaign changes, promotions) up front.
- **Ship on judgement** — the change is obviously correct (a broken link, a
  missing guarantee, a brand-constraint breach) or too small to ever detect.
  Shipping it is right; calling it a test is not.

Never present a plan that implies a clean statistical read the traffic cannot
support. Saying "we cannot measure this one, and we should do it anyway because
X" is a better answer than a fabricated confidence interval.

**Related pitfalls worth naming when they apply:**

- Peeking at results and stopping when significance first appears inflates the
  false-positive rate substantially. Fix the sample size in advance, or use a
  sequential testing method designed for continuous monitoring.
- Running many simultaneous tests on the same page multiplies false positives and
  makes interaction effects unreadable.
- Testing on a metric further down the funnel than the change (measuring
  purchases when the change should move add-to-cart) costs power for no gain —
  though the downstream metric is still the one that decides whether to keep it.
- Short windows that miss the full purchase cycle understate considered purchases.

---

## 5. Where the leverage usually is

When evidence is thin and you must prioritise on priors, this is the rough order
of expected effect size for ecommerce landing pages:

1. **The offer itself** — what is being sold, at what terms. Larger than any
   presentation change.
2. **The value proposition and hero** — what the page claims and to whom.
3. **Message-to-traffic match** — segmented pages or heroes versus one page for
   everyone.
4. **The offer's presentation** — unit reframing, value itemisation, risk
   reversal placement, plan defaults.
5. **Proof matched to the specific objection**, placed at the doubt.
6. **Argument order and page structure.**
7. **Friction removal** — fields, taps, steps, load time.
8. **Module-level copy and design tweaks.**
9. **Button colours, microcopy variants, image swaps.**

A backlog whose top five items all live at 8 and 9 is a backlog that will not
move the number, whatever the ICE scores say.
