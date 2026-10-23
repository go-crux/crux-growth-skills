<!-- Source: the private CRO audit skill this one adapts, captured verbatim 2026-10-21 (commit 5c782a4) for PRD192. Brand-specific lines removed; otherwise unedited. This is source material for the build, not the skill: the skill lives in plugins/crux-growth-skills/skills/audit-landing-pages/. -->

# Output templates

Exact formats for both modes. Follow these so output is consistent and travels
well as a handover artefact. Use the brand's language conventions from the
constraints file; default to UK English.

---

## Critique output

Structure the critique in this order.

### 1. Context line

One short paragraph stating what was assessed and against what:

- Page and URL.
- Page type (PDP-as-LP, dedicated LP, offer LP, lead capture, quiz entry).
- Audience segment and traffic source assumed.
- Funnel stage and the single conversion goal.
- Device priority.
- Baseline conversion rate and monthly sessions, if known.
- Which ingredients could be assessed fully, which partially, and why — given the
  input you had.

### 2. Scorecard

One row per ingredient, with the raw check count so the score is auditable:

| Ingredient | Checks met | Band | One-line justification |
|---|---|---|---|
| Makes the benefits clear | 6/10 | Adequate | … |
| Has an irresistible offer | 3/10 | Weak | … |
| Is trustworthy | … | … | … |
| Is written well | … | … | … |
| Is user-friendly | … | … | … |
| Gives people what they want | … | … | … |
| **Total** | **__/60** | | |

Then two lines:

- **Failed checks** — list them by ingredient and number, so the reader can trace
  every finding back to a check.
- **Constraint check** — any off-brand lever already on the page (banned urgency
  or discounting device, blocked claim, competitor name, unapproved statistic,
  register or colour breach), or "none found".

Mark any check you could not assess as *unassessed* rather than failing it, and
say what input would settle it.

### 3. Prioritised findings

Biggest structural issues first, quick wins last. Aim for four to eight. Resist
listing twenty trivia — a page with three real structural problems and three
quick wins is a better critique than a checklist.

For each finding:

- **What** — the specific problem, with evidence from the page. Quote the headline,
  name the module, cite the failed check numbers. Never generic.
- **Why it costs conversions** — map to one of: no trust / no understanding /
  wrong fit, and name the audience segment affected.
- **Evidence** — the source if it is grounded, or "heuristic" if it is a prior.
- **Direction of fix** — what good would look like, in one or two sentences.
  Describe the move; do not write final copy (that is the brand copy skill's job).

### 4. Quick wins

Low-effort, low-risk changes worth shipping without a test. Constraint breaches
always belong here — they ship regardless of any test.

### 5. Handoff

One line offering to convert the top findings into ICE-scored hypotheses (Mode B).

---

## Hypothesis format

Write every hypothesis in this structure — never a bare idea ("test a new
headline"). One block per hypothesis:

> **H[n] — [short name]**
> **Observation:** what's wrong, with the failed check number, and the evidence
> (name the source, or label as heuristic).
> **Change:** the specific change to make.
> **Expected effect:** the metric you expect to move, the direction, a rough
> magnitude, and the mechanism — why it should work.
> **Ingredient / reason:** which of the six, and trust / understanding / fit.
> **Segment:** which audience segment(s), or "all".
> **Measure:** primary metric, plus how it would be read — A/B, sequential read,
> or ship-on-judgement, per the sample-size table in `diagnostics.md`.
> **ICE:** Impact _/5 · Confidence _/5 · Ease _/5 · **Total _/15**

### ICE scoring guidance

Score each dimension 1–5; total out of 15. Be consistent across a backlog, or the
ranking means nothing.

- **Impact** — how much the primary metric would move if the hypothesis is right.
  Anchor against the leverage order in `diagnostics.md` §5: offer and value
  proposition changes score high, module tweaks score low. 5 = could meaningfully
  shift the headline conversion rate; 1 = marginal.
- **Confidence** — how sure we are, based on evidence. 5 = directly supported by
  this brand's own visitor data; 4 = supported by a strong external prior or a
  documented pattern; 3 = sound heuristic; 1 = a hunch. Be honest — confidence is
  where wishful backlogs go wrong.
- **Ease** — how cheap and fast to build and ship, inversely with risk. 5 = a copy
  swap; 1 = new build, new assets or engineering. Factor in brand or legal
  approval and any asset dependencies.

### Backlog presentation

After the individual blocks, a ranked summary table:

| Rank | H | Name | Segment | Ingredient | Read as | ICE |
|---|---|---|---|---|---|---|
| 1 | H3 | … | … | Trust | Sequential | 13 |
| 2 | … | … | … | … | … | … |

Then a **sequencing note** of one paragraph: which to run as formal tests, which
to read sequentially, and which to simply ship. Use the page's real traffic and
baseline against the sample-size table, and state the numbers. Flag any hypothesis
too small to reach significance and say so plainly rather than implying a clean
A/B read is available.

---

## Tone for both modes

- Specific over generic. Tie every point to something on the page and to a check.
- Honest over flattering. A soft critique helps no one; say what is weak.
- Constructive — every problem comes with a direction, not just a verdict.
- Inside the brand constraints — never recommend a blocked lever, even if it would
  work generically. When a generic best practice is blocked, say so and give the
  on-brand alternative.
- Explicit about uncertainty. Distinguish what you observed, what you inferred,
  and what you could not assess from the input you were given.
