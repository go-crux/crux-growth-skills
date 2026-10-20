# Writing a Crux plugin skill

The standard every skill in `skills/` is held to, and the checklist `/code-review` reviews a skill
against. It follows the workspace `writing-for-agents` skill; run that skill when it is available,
and treat this file as its binding summary for this repo.

A skill is a document a client's agent runs on the client's own data, with nobody from Crux in
the room. Each run should take the same **process**, so the founder gets a comparable result
whoever runs it and whichever brain it reads.

## Shape

```
skills/<name>/
  SKILL.md          frontmatter + the steps, in order
  references/       material only some runs reach, each file behind a pointer in a step
```

- **Name** the skill for what the founder walks away with, verb first: `plan-black-friday`.
- **Steps in `SKILL.md`, reference behind pointers.** Keep inline whatever every run needs.
  Material only some runs reach, such as an optional mart, a fallback, or a branch for one
  verdict, goes in `references/` behind a one-line pointer that states when to open it.
  `SKILL.md` stays the thin orchestrator.
- **Every step ends on a completion criterion that is checkable and exhaustive**: "every target
  carries a verdict", "the days sum exactly to each month". A criterion such as "analysis done"
  invites the agent to stop early.
- **Fixed output structure.** A skill that produces a page fixes its headings in a reference
  file, so two clients' results compare and an empty heading stays visible ("Not agreed").
- **Fixed calculations live once.** Date windows, bands and thresholds are stated in one place
  (a `references/*.sql` CTE, a single rule in the step) and every query reuses it.

## Frontmatter and invocation

```yaml
---
name: <name>
description: <leading word first; one trigger per distinct case the skill handles>
---
```

- **Model-invoked by default.** A founder asks in plain words ("help me plan Black Friday"), so
  the agent must be able to reach the skill on its own. The founder can still type `/<name>`.
- **The description is a pointer**, loaded in every session the plugin is installed in. Lead with
  the word the founder would use, give one trigger per distinct case, and leave out identity
  the body already carries.
- Use `disable-model-invocation: true` only for a skill a person should start deliberately.

## Language

- **Leading words.** Use the `GLOSSARY.md` terms verbatim and repeat them as tokens; give each
  meaning one home. Prefer a word the model already knows (the growth equation, a cohort, a lift)
  to a coined one, and define a coined one in the glossary.
- **Positive instructions.** State the behaviour wanted ("compare 2025 with 2024"). A prohibition
  stays only as a hard guardrail, paired with its positive.
- **Prune.** Cut every sentence the model already follows by default, and every line that no
  longer bears on the run.

## The brain

- **By contract only (mcp_brain ADR-0026).** Name the tools (`list_tables`, `list_metrics`,
  `search_examples`, `run_sql`) and the marts by module (`<client>-channel_reporting`), and read the
  columns from `list_tables` on every run. Restate none of them: the brain is the source of truth
  and a copy goes stale.
- **Cache what a lookup cannot give**, such as a trap the contract does not confess, which row a
  plan sits on, or a history start date. Each cached fact carries the reason it is there.
- **Ask for the tables a step needs and no more.** `list_tables` with no arguments returns the
  roster. Calling it again with every table in the roster costs the founder the whole contract.
- **No brain, no run.** A skill that needs a Growth Brain checks for the connector first, and
  without one says so in a line and stops before any query.
- **A missing mart drops its part with one line**, so one client's narrower warehouse narrows the
  page rather than breaking the run.
- **Read only.** A skill writes nothing the brain cannot write. A plan the founder wants loaded
  somewhere (a budget sheet, a schedule) is a hand-off to Crux, named on the page.

## The founder's page

- **Crux house style**: British English, no em dashes, outcome before mechanism, and relative
  percentage changes (2.0% to 1.8% is "−10%").
- **Comparisons are like for like.** Compare periods measured on the same basis. Where a source
  changed mid-history, compare on either side of the change, and put the method in one
  footnote rather than callouts across the page.
- **Every finding ends on an action**: a finding without a next step is trivia (the Crux
  analysis framework).
- **An interview inside a skill** runs in numbered rounds, one recommendation per question. "Yes"
  accepts it, and "just write it" accepts every remaining one. The founder answers before the
  next round.

## Public repo

Examples, test fixtures and worked figures use **invented brands and round numbers**. A real
client's name, figure or table contents never appears in a skill or a reference file.

## Testing a skill

There is no automated suite: a skill is proven by **dry runs on real brains**.

1. Start a session with the checkout loaded: `claude --plugin-dir ~/code/crux/crux-plugin`, with
   the client's Growth Brain connector available in that session.
2. Run the skill end to end as the founder would, to its final output.
3. Check the PRD's acceptance criteria, especially the totals that should tie to the brain
   (an order count for a date window, a plan's monthly sum).
4. Run each dry run on a client's own brain and record or share it only with that client.

Run `claude plugin validate .` after any manifest change. `claude plugin eval` can run scored
cases from `evals/` once a skill is worth regression-testing; none exist yet.
