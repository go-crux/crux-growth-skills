# Item templates

The shape of each item on the audit page. `audit-layout.md` fixes the page's headings and what
goes under each; this file fixes the items. Write in British English with no em dashes.

---

## Scorecard

One row per ingredient, with the raw count over the checks assessed so the score is auditable:

| Ingredient | Checks met | Band | One-line justification |
|---|---|---|---|
| Makes the benefits clear | 6/10 | Adequate | … |
| Has an irresistible offer | 3/9 | Weak | … |
| Is trustworthy | … | … | … |
| Is written well | … | … | … |
| Is user-friendly | 4/6 | Adequate | Four checks need a render and read Unassessed. |
| Gives people what they want | … | … | … |
| **Total** | **__/__** | | |

The count is checks met over checks assessed (`ingredients.md` says how to count). An
ingredient with no assessed check reads "Not assessed" in the Band column. Under the table, one
line per ingredient with any check marked unassessed, naming the input that would settle it
(mobile screenshots, a browser render, the traffic source).

Under that, every check of every ingredient, so the reader can trace each finding to a check.
One line per check: its number, its bold lead phrase from `ingredients.md`, and its mark (Met,
Not met, n/a, Unassessed). Give a reason in a few words for each n/a and each Unassessed.

---

## Finding

Aim for four to eight findings, biggest structural issues first and small ones last. A page with
three real structural problems and three quick wins is a better audit than a checklist of
twenty trivia. Number them F1, F2, F3.

> **F[n]. [Short title of what is wrong]**
> **Failed checks:** the ingredient and check numbers, for example "Benefits 2, 3, 9".
> **Why it costs conversions:** one of **trust**, **understanding** or **fit**, with a sentence
> on how.
> **What:** the specific problem, with evidence from the page. Quote the headline, name the
> module. Never generic.
> **Evidence:** the source if the finding is grounded, else "Heuristic".
> **Do:** the direction of fix, in one or two sentences: what good looks like, as a move. The
> audit gives direction; replacement copy and design are the brand's own.

"The hero benefit is abstract" is useless. "The hero leads with the technology name before the
visitor knows what it does for them, so a visitor scanning for relief gets no benefit in the
first screen" is a finding.

---

## Quick win

A low-effort, low-risk change worth shipping without a test, such as a missing guarantee line,
a CTA that says something different in each place, or a broken link. One line each:

> **Q[n].** The change, where on the page, and the failed checks it settles ("Offer 5, 6").

---

## Hypothesis

Write one hypothesis for each finding, numbered to match (F3 becomes H3), in this structure.
Never a bare idea ("test a new headline"). A change so small or so obviously right that it
needs no test is a quick win instead, and its finding keeps its number with no hypothesis.

> **H[n]. [Short name]**
> **Observation:** what is wrong, with the failed check numbers, and the evidence (name the
> source, or "Heuristic").
> **Change:** the specific change to make.
> **Expected effect:** the metric you expect to move, the direction, a rough magnitude, and the
> mechanism: why it should work.
> **Ingredient / reason:** which of the six, and trust, understanding or fit.
> **Read as:** "Test or ship: needs traffic figures".
> **ICE:** Impact _/5 · Confidence _/5 · Ease _/5 · **Total _/15**

### ICE scoring

Score each dimension 1 to 5; the total is out of 15. Be consistent across a backlog, or the
ranking means nothing.

- **Impact**: how much the primary metric would move if the hypothesis is right. Anchor against
  the leverage order in `diagnostics.md` section 5: offer and value proposition changes score
  high, module tweaks score low. 5 = could meaningfully shift the headline conversion rate;
  1 = marginal.
- **Confidence**: how sure we are, based on evidence. 5 = directly supported by this brand's own
  visitor data; 4 = a strong external prior or a documented pattern; 3 = a sound heuristic;
  1 = a hunch. An audit of the page alone has no visitor data, so Confidence stays at 4 or
  below unless the user supplied evidence. Be honest: confidence is where wishful backlogs go
  wrong.
- **Ease**: how cheap and fast to build and ship, inversely with risk. 5 = a copy swap; 1 = new
  build, new assets or engineering. Factor in approvals and asset dependencies.

---

## Test backlog table

After the hypothesis blocks, a ranked summary table. Sort by ICE total, highest first; break a
tie with the higher Impact, then the lower H number. Rank 1, 2, 3 in that order.

| Rank | H | Name | Ingredient | Reason | Read as | ICE |
|---|---|---|---|---|---|---|
| 1 | H3 | … | Trust | Trust | Test or ship: needs traffic figures | 13 |
| 2 | … | … | … | … | Test or ship: needs traffic figures | … |

Under the table, one **sequencing line**: "Test or ship needs the page's visits and conversion
rate. With them, each row reads as a test, a sequential read or a ship."

---

## Tone

- Specific over generic. Tie every point to something on the page and to a check.
- Honest over flattering. A soft audit helps no one; say what is weak.
- Constructive: every problem comes with a direction, not just a verdict.
- Explicit about uncertainty. Separate what you observed, what you inferred and what you could
  not assess from the input you were given.
