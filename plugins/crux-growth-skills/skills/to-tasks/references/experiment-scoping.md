# Experiment scoping

How a Task of `Type` Experiment is scoped: the test is settled before it is scored, scored on ICE, written as a hypothesis and an experiment doc, and checked for claims. Any skill that cuts or runs an Experiment reads this one file. Terms are in `growth-system-glossary.md`; the properties are those of Tasks in `notion-schema.md`; the Task contract and the Dates rules are in `project-contract.md`.

An **Experiment** is a Task of `Type` Experiment (ADR-0020), cut under a Project. A Project may be a series of experiments; each is still a Task under it. It carries the experiment properties (`Hypothesis`, `Test KPI`, `Lever`, `Impact`, `Confidence`, `Ease`, the `ICE` formula, `Outcome`, `Learnings`) and the experiment doc in its body. Most Tasks are not Experiments and never open this file.

This file carries no fields or options (those are `notion-schema.md`'s) and no copy rules (a brand's own copy guidance, where it has any, is the authority).

**A scoped Experiment flags what it does not know.** A missing baseline, an unchecked claim and a variant nobody has chosen are each named in the doc, never filled with something plausible, because a plausible filler reads exactly like a measured value and nobody can tell them apart a month later. Scoping is not the act of leaving no blanks.

## What an Experiment's body is

An Experiment's body is the experiment doc (five sections, below), then `Done when` and `Blocked by` exactly as the Task contract in `project-contract.md` defines them. The doc stands in for `What to do`: the Description, Hypothesis, Control / Holdout and Experiment Plan say what is done, so a separate `What to do` would restate them. Seven second-level headings in all, each an explicit `heading_2` block, in this order:

`Description`, `Hypothesis`, `Control / Holdout`, `Experiment Plan`, `Results & Key Learnings`, `Done when`, `Blocked by`.

The `Hypothesis` and `Test KPI` in the doc are also written to the Task's properties, word for word.

## Scope the test before you score it

A rough idea is under-specified in ways that change what the test measures, and scoring or writing it up first fixes the ambiguity in place. Three decisions, resolved with the person who raised the idea, and only where the Project's `Approach`, `Outcome` and `Open questions` have not already answered them:

- **The variants, and what is held constant.** What is tested, against what. There may be an incumbent **control**, or a fresh head to head, which is the normal case on a surface with no baseline. Everything not being tested is held constant, and saying which things those are is the part that gets skipped.
- **The primary KPI.** The single metric the test is judged on. A full-funnel test can be read at the ad, at the page or across the whole funnel, and the choice trades a faster signal against a truer one. Pick one: a test judged on two metrics has no decision rule.
- **Baseline and power.** Either there is enough history to compute a sample size and a minimum detectable effect, or there is not. Where there is not, scope it as a **relative** test, judged by comparing variants against each other on a spend or conversion threshold, and flag it as one.

## ICE

Each of the three is scored 1 to 5 and written to `Impact`, `Confidence` and `Ease`. The `ICE` formula averages them, so never score one of them to reach a total already decided.

- **Impact.** If it wins, how far does it move the primary KPI? 5 = a step change; 3 = a useful lift; 1 = marginal.
- **Confidence.** How strong is the evidence that it will win? 5 = prior data, or proven elsewhere; 3 = a plausible mechanism; 1 = a hunch. A Learning behind the idea is what moves this: score from the Learnings the Project's `Why` cites, and cite the `ID` beside the score.
- **Ease.** How cheap and fast to ship and run? 5 = hours, no dependencies; 3 = a few days; 1 = a new build, or a dependency on someone outside the team.

## The hypothesis

One sentence: **If** [the change], **then** [the predicted effect on the primary KPI], **because** [the reasoning or the evidence].

The *because* carries the value and gets fudged. It adds the reasoning and never restates the *then* in other words. "Because more people will convert" is the *then* again; "because this audience wants social proof before committing, and we have three interviews saying so" is a reason, and it is what makes the result readable when the test loses.

- *If we move the testimonial block above the fold on the quiz landing page, then more visitors will start and complete the quiz, because on-site feedback says this audience wants social proof before committing.*
- *If we lead our cold-audience ads and the matching landing-page hero with a single, sharply distinct message angle, then one angle will drive a materially higher session to purchase rate than the others, because a cold audience converts on the angle that best matches its dominant buying motivation, and we do not yet know which that is.* (A head to head with no incumbent control.)

## The experiment doc

Five sections. `Results & Key Learnings` is a scaffold, because scoping happens before the test runs; it is filled in when the result is read.

```markdown
## Description
[The change, where it runs, and the decision it informs, in two or three sentences. For a variants
test, a table with one row per variant, and a line on what is held constant.]

| # | Variant | What changes |
| --- | --- | --- |
| A | … | … |

**Claims to substantiate before launch:**
- [Any efficacy, timeframe or offer claim that is not cleared yet. Omit the heading if there are
  none; never omit a claim to avoid writing the heading.]

## Hypothesis
If __, then __, because __.

## Control / Holdout
[Platform-handled, for example a 50/50 split test, or defined by hand. Where there is no incumbent
control, say so and say how the variants are compared instead: equal budget and targeting, winner on
the primary KPI.]

## Experiment Plan
- Test KPI: [the primary metric]
- Baseline: [value and the window it covers, or "none yet" and how one will be established]
- Sample size per week: [value, or "to confirm once live"]
- Minimum detectable effect: [value, or "relative: leading variant once each clears <threshold>"]
- Decision rule: [when the test is called, and what each outcome triggers]

## Results & Key Learnings
### Key takeaways
1. __
### Primary metric
[Primary KPI] by variant.
### Secondary metrics
By variant.
### Performance against hypothesis
Did the result support or refute it?
### Next steps
Iterate, roll out, or kill.
```

The `###` lines are `heading_3` blocks. Flag every unknown in the plan rather than filling it, and say how it will be established: a baseline, a sample size or an MDE that nobody measured is still sitting there when the test is called, by which point it is indistinguishable from one somebody took.

## The claims check

Where the brand has copy or claims guidance (a skill, a document, an approved list, a `brand-guardrails.md` in the working folder or the conversation's project files), every headline, hero line and claim written into the doc is checked against it. Where it has none, any efficacy, timeframe or offer claim is listed under *Claims to substantiate before launch* for a person to clear.

- **Where the intent is sound but the wording overclaims, reframe it** and keep the angle. The angle is usually right and the sentence is usually the problem.
- **Where the claim itself is not cleared**, soften it **and** list the original under *Claims to substantiate before launch*. Softening without listing it loses the fact that somebody wanted to make that claim.
- **Flag the tension rather than resolving it silently.** Quietly dropping a chosen angle and quietly shipping an uncleared claim are the two failures here, and they look identical from the outside.

The check runs over the doc as written rather than the idea as pitched, so a claim in the Description is as much a claim as one in an ad headline.

## Done when (an Experiment is scoped)

- `Impact`, `Confidence` and `Ease` are all set, and `ICE` reads back as their average.
- The hypothesis is one sentence in the three-part form, and its *because* would still be a reason if the *then* were deleted.
- All five doc sections have content, `Results & Key Learnings` is left as a scaffold, and every unknown in the plan is flagged rather than filled.
- Every claim in the doc has either cleared the brand's guidance or is listed under *Claims to substantiate before launch*.
- `Hypothesis`, `Test KPI` and `Lever` are set on the Task, `Hypothesis` and `Test KPI` matching the doc, and `Due` is the verdict date.
