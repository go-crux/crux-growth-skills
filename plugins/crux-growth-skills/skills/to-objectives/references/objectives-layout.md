# Objectives layout

What step 8 writes, with its headings fixed so two quarters, and two brands, read the same and an empty heading stays visible. Terms are in `growth-system-glossary.md` and `glossary.md`. Properties are those of Objectives in `notion-schema.md`.

## An Objectives row

| Property | Written as |
|---|---|
| `Objective` | the direction in a short phrase, such as "Improve order value" |
| `Quarter` | the quarter, as `2027 Q1`, reusing an existing option; a carried row keeps its earlier quarters and gains this one |
| `Status` | Active |
| `Owned by` | a person who is a member of the Notion workspace; a name that matches nobody is reported and left blank |
| `Why` | one or two sentences: the Weakest step it answers and what the evidence says |

`Why` of a row closed as Dropped keeps its text and gains one line at the end: `Dropped <quarter>: <reason>`.

## An Objective's page body

Four second-level headings, in this order, written as explicit `heading_2` blocks with paragraph and bulleted-list blocks beneath. Each cites rows by `ID` and title.

1. `## Weak steps`: each Weakest step it answers, with its rate, its Comparison and whether either is estimated.
2. `## Learnings`: each `LRN-n` cited, with its `Evidence strength` and one line on what it means for this Objective.
3. `## Insights`: each `INS-n` cited, with one line on what customers say.
4. `## Issues`: each `ISS-n` cited, with one line on why it bears on this Objective.

A heading with nothing under it reads `None cited.` A context the user supplied in a cold start, with no row behind it, goes under the heading it bears on as "Supplied by the team: <one line>".

## The Strategy map section

One section per quarter, written at the top of the Strategy map page, above the newest existing section. Every older section stays as it is.

1. `## 2027 Q1`, an explicit `heading_2` block.
2. One paragraph naming the source: "From the Growth Brain: the last 90 days to <date> against the 90 before." or "Stated by the team, <date>." and, for the ecommerce default, the repeat ratio's line: "The repeat ratio is returning customer orders per first order in the same window."
3. The Growth model table, as a table block:

   | Step | Rate | Now | Comparison | Weakest |
   |---|---|---|---|---|

   One row per step of the chain, then one row for order value where the model has one. `Now` and `Comparison` carry the figures as the Comparison glossary entry sets them, with `estimated` after any estimated figure and "No data" where none exists. `Weakest` reads "Weakest" on each Weakest step and is empty on the rest.
4. One paragraph: `Weakest steps:` and each by name with its one-line reason.
5. A bold paragraph `Objectives`, then a bulleted list: one bullet per Active Objective on the quarter, carried ones included, as a mention of its row, with a nested bullet `Candidate Initiative: <title>, <one line on the step and the Key result it might own>` for each Candidate Initiative that would serve it. A quarter with no Candidate Initiative has no nested bullets.

A re-run for a quarter whose section already exists replaces that section's blocks only, on the user's confirmation in step 7, and leaves every other section as it is.
