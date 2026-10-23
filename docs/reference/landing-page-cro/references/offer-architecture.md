<!-- Source: the private CRO audit skill this one adapts, captured verbatim 2026-10-21 (commit 5c782a4) for PRD192. Brand-specific lines removed; otherwise unedited. This is source material for the build, not the skill: the skill lives in plugins/crux-growth-skills/skills/audit-landing-pages/. -->

# Offer architecture

The offer is not the price. It is the whole shape of the deal: what the visitor
gets, how the cost is expressed, what they commit to, what they risk, and what
comes free. Most pages that "need a discount" actually need the offer architected.

Every mechanic below is observable in the wild — see `examples.md` for who does
what. Apply them only within the brand's constraints file: a brand may block
discounting, urgency, or specific price displays entirely, and the mechanics that
survive that are still the majority of this list.

---

## 1. Unit-price reframing

State the price in the unit the visitor mentally budgets in, alongside the amount
they will actually be charged.

- Per serving, per meal, per use, per wash, per day, per night.
- Works because it moves the comparison from *"is £30 a lot for a bag?"* to *"is
  £1.79 a lot for a meal?"* — a comparison the product wins.
- Always show both numbers. The unit price alone reads as concealment.
- Requires an honest denominator. State it ("from 17 meals"), or the reframe
  collapses the first time someone checks.

**Failure mode.** A unit price with no stated basis, or a denominator chosen to
flatter (per-day pricing on an annual commitment shown before the annual figure).

---

## 2. Value stacking with itemised worth

List every component of the offer, give each a standalone worth, and reconcile the
total against the price paid.

- Itemise components, not categories: name each item and what it is for.
- Attach an individual worth to each.
- Show the arithmetic: total worth, saving, what you pay.
- **Explain how the worth is calculated.** A footnote that says the set value is
  the sum of the individual prices if bought separately is what makes the stack
  credible rather than invented.

This is the single most transferable offer mechanic. It works on bundles, kits,
starter packs and subscriptions, and it does not require discounting the headline
product — it reveals value that was already there.

**Failure mode.** Inflated or unsourced "worth" figures; a saving that does not
reconcile; comparing against a price nobody has ever paid.

---

## 3. Reason-why for the discount

If there is a discount, name why it exists.

- Bundle economics, first-order welcome, seasonal or limited edition, launch,
  subscription commitment, clearance.
- A discount with a reason reads as a deliberate commercial decision. A discount
  without one reads as either an inflated original price or a product that is not
  selling.
- The reason also bounds the discount, so it does not train the audience to wait.

**Failure mode.** A permanent "sale" with no rationale, which resets the perceived
real price to the discounted one and destroys the anchor.

---

## 4. Risk reversal, placed at the decision point

Name the thing the visitor is afraid of losing, and remove it — within one screen
of the CTA.

Forms, roughly in order of strength:

| Mechanic | Removes the fear that |
|---|---|
| Money-back guarantee with a window | it won't work for me |
| Free and easy returns | I'll be stuck with it |
| Lifetime or extended warranty | it will break and that's my problem |
| Cancel any time, no fees | I'm locked into a subscription |
| Skip or reschedule | I'll end up with too much of it |
| Try-before-you-buy or samples | I can't judge it from a photo |
| Price match | I'll find it cheaper tomorrow |

Placement matters more than wording. A guarantee in the footer is worth close to
nothing; the same guarantee as a badge row directly under the buy button, or as
the button label itself, does the work.

**Failure mode.** Risk reversal present but distant; or hedged with conditions
that reintroduce the fear it was meant to remove.

---

## 5. Plan choice architecture

When there is more than one way to buy, the page must make a recommendation.

- Present two or three options, no more.
- **Flag one as recommended, with a reason** — most customers choose this, best
  value, our pick — and pre-select it.
- Show each plan's price *and* its unit price side by side, so the comparison is
  one glance.
- Itemise what the recommended plan adds: the discount, the flexibility, the
  gifts, the exclusives.
- Make the non-recommended option genuinely available. A crippled alternative
  reads as a trap and costs trust.

**Failure mode.** Two plans presented neutrally, leaving the visitor to do
arithmetic; or a subscription pre-selected with no explanation, which reads as a
dark pattern.

---

## 6. Subscription framed as upside

A recurring plan is a commitment, and pages usually apologise for it. The pages
that convert sell it.

- Lead with what membership *gives*: standing discount, exclusive products, early
  access, flexibility.
- State the flexibility in plain, unhedged words at the decision point: skip,
  reschedule, cancel, no fees.
- Match the cadence to the consumption cycle and say so — a 90-day refill for a
  90-day product is logic, not a lock-in.
- Give the subscription a forward-looking reason to persist: a roadmap of what
  arrives next, a loyalty balance, a tier.

**Failure mode.** "You can cancel any time" as the only thing said about the
subscription — defensive framing that confirms the visitor's suspicion rather
than dispelling it.

---

## 7. Bonuses with a stated cash value

Gifts included with a purchase should be priced, not just named.

- "Free shaker" is a nice-to-have. "Free shaker, £10" is money left on the table
  if they don't buy.
- Bonuses work hardest when they remove a real adoption barrier — the accessory
  the product needs, the guide that makes it work, the tool that makes it easy.
- Scope the bonus to a segment where that is honest ("for new customers"), which
  makes it a reason to act now without inventing urgency.

**Failure mode.** Unvalued gifts, or gifts so obviously low-value that they
cheapen the main product.

---

## 8. Thresholds with the gap stated

Free-shipping and spend thresholds increase average order value only if the
visitor knows how close they are.

- State the rule *and* the gap: "add £12 for free delivery" beats "free delivery
  over £45".
- Put it where the decision happens: the buy box and the cart, not the header bar
  alone.
- Pair the threshold with a relevant, single-tap add-on at roughly the gap size.

**Failure mode.** A threshold announced in a header ticker that nobody reads,
with no running total anywhere.

---

## 9. What's-included itemisation

For kits, bundles and multi-part products, list every component with its own
description and specification.

- Each item gets a line on what it is *for*, not just its name.
- For physical goods, include dimensions, weights and capacities. Specificity
  justifies price and pre-empts returns.
- Behind progressive disclosure so it does not block the scanner.

This doubles as trust (composition transparency) and as fit (a visitor works out
whether the set covers their situation).

---

## 10. Anchoring that survives inspection

Every comparison price on the page should be one a visitor could verify.

- Anchor against the sum of individual prices, the previous price actually
  charged, or the cost of the alternative approach.
- Do not anchor against an RRP nobody honours, or a competitor's price you cannot
  evidence.
- Where the brand blocks discounting entirely, the anchor becomes *cost of the
  alternative* — what the visitor currently spends on the problem, or what the
  bundle of separate products would cost.

---

## Building a stronger offer without discounting

When the brand blocks price-cutting, work through this list in order. Most pages
have three or four of these available and unused:

1. Reframe the price into the visitor's unit.
2. Itemise what's included and price each part.
3. Surface value already being given away for free but never counted (support,
   guides, coaching, accessories, warranty).
4. Reverse the biggest risk harder, and move it next to the CTA.
5. Make the recommended plan explicit and pre-selected.
6. Turn the recurring plan's flexibility into a headline benefit.
7. Add a bonus that removes an adoption barrier, and price it.
8. Anchor against the cost of the alternative rather than a struck-through price.

Only after all eight are exhausted is a discount the highest-leverage move — and
by then it usually is not.
