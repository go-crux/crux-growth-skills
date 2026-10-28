# Writing a Crux plugin skill

The standard every skill in `plugins/crux-growth-skills/skills/` is held to, and the checklist `/code-review` reviews a skill
against. It follows the workspace `writing-for-agents` skill; run that skill when it is available,
and treat this file as its binding summary for this repo.

A skill is a document an agent runs on a brand's own data, with nobody from Crux in the room. The
brand may be a client with a Growth Brain or a prospect who installed the plugin from the README,
so a skill never assumes a Crux contact. Each run should take the same **process**, so whoever
runs it gets a comparable result from whichever brain it reads.

## Shape

```
plugins/crux-growth-skills/skills/<name>/
  SKILL.md          frontmatter + the steps, in order
  references/       material only some runs reach, each file behind a pointer in a step
```

- **Name** the skill for what the user walks away with, verb first: `plan-black-friday`.
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

- **Model-invoked by default.** Anyone at the brand (a founder, a head of growth, an ecommerce or marketing manager) asks in plain words ("help me plan Black Friday"), so
  the agent must be able to reach the skill on its own. They can still type `/<name>`.
- **The description is a pointer**, loaded in every session the plugin is installed in. Lead with
  the word that person would use, give one trigger per distinct case, and leave out identity
  the body already carries. Name that person "the user" in each trigger, never "someone":
  "Use when the user asks to …".
- Use `disable-model-invocation: true` only for a skill a person should start deliberately.

## Language

- **Leading words.** Use the skill's `references/glossary.md` terms verbatim and repeat them as tokens; give each
  meaning one home. Prefer a word the model already knows (the growth equation, a cohort, a lift)
  to a coined one, and define a coined one there. A skill is self-contained: it reads nothing outside its own folder, because that folder is all a client's agent reliably resolves (and all Codex reads).
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
  roster. Calling it again with every table in the roster costs the user the whole contract.
- **Brain optional by default (ADR-0001).** Most people who install the plugin have no Growth
  Brain, so design a skill to run without one wherever its craft holds on what the user can give
  (a URL, an export, their answers). The skill checks for the connector first; without one it
  runs the parts that need no data, and each part that needs the brain drops with one line
  saying what the brain would add, with a pointer to gocrux.io/contact.
- **A brain-only skill is the upsell.** Where no useful run is left without the brand's data,
  the skill says so in a line, points at gocrux.io/contact for a Growth Brain, and stops before
  any query. Its description says it needs a Growth Brain.
- **A missing mart drops its part with one line**, so one client's narrower warehouse narrows the
  page rather than breaking the run.
- **A file the user keeps** (answers worth reusing, such as `brand-guardrails.md`) lives with the
  user, never in the plugin folder, which an update replaces. Look for it in the working folder
  and the conversation's project files. Save it to the working folder where one persists (Claude
  Code, Cowork); in a chat, hand it over as a download with one line: add it to a Claude
  Project's files, or attach it next time.
- **Read only.** A skill writes nothing the brain cannot write. A plan the user wants loaded
  somewhere (a budget, a schedule) leaves as a file they load themselves; the page never
  promises that Crux will load it.

## The page the skill produces

- **Crux house style**: British English, no em dashes, outcome before mechanism, and relative
  percentage changes (2.0% to 1.8% is "−10%").
- **Comparisons are like for like.** Compare periods measured on the same basis. Where a source
  changed mid-history, compare on either side of the change, and put the method in one
  footnote rather than callouts across the page.
- **Every finding ends on an action**: a finding without a next step is trivia (the Crux
  analysis framework).
- **An interview inside a skill** runs in numbered rounds, one recommendation per question. "Yes"
  accepts it, and "just write it" accepts every remaining one. The user answers before the
  next round. The one exception is an open question for context only the user holds, where no
  default can stand in for the answer (`review-month`'s Month context: what happened in the month).
  Ask it plainly, with no recommendation, and offer "Nothing to add" as one option; a bare "yes"
  or "just write it" settles it as nothing to add, and it is not asked again.

## Public repo

Examples, test fixtures and worked figures use **invented brands and round numbers**. A real
client's name, figure or table contents never appears in a skill or a reference file.

## Testing a skill

There is no automated suite: a skill is proven by **dry runs on real brains**.

1. Load the branch's plugin with the client's Growth Brain connector available. The default is
   Claude Desktop, as a client runs it: zip `plugins/crux-growth-skills` from the integration
   branch (command in `CLAUDE.md`), turn off the installed `crux-growth-skills`, upload the zip
   (Customize → Plugins → Add → Upload plugin), and after testing delete the zip and turn the
   installed plugin back on. In Claude Code, start a session with
   `claude --plugin-dir ~/code/crux/growth-skills/plugins/crux-growth-skills` instead.
2. Run the skill end to end as a client user would, to its final output.
3. Check the PRD's acceptance criteria, especially the totals that should tie to the brain
   (an order count for a date window, a plan's monthly sum).
4. Run each dry run on a client's own brain and record or share it only with that client.
5. For a brain-optional skill, run it once more in a session with no Growth Brain connector, as
   a prospect would, and check every brain part drops with its one line.

Run `claude plugin validate .` and `claude plugin validate plugins/crux-growth-skills` after any manifest change. `claude plugin eval` can run scored
cases from `evals/` once a skill is worth regression-testing; none exist yet.
