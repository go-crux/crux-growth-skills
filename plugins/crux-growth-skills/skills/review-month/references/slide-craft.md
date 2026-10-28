# Slide craft: how every slide of a Slidedoc is built

Step 5 of `SKILL.md` follows this file for every slide. It holds the rules of the craft and none of
the review's content, so it lifts whole into any deck skill that writes a Slidedoc. The look it
builds with (tokens, fonts, devices) is in `references/crux-brand.md`, and the page it builds on
(skeleton CSS and script, with a grid for each Layout) is in `references/deck-layout.md`.

## The Slidedoc

The deck is a **Slidedoc**: read on screen or in print with no presenter, so each slide explains
itself.

- Every content slide opens on an **Action title**: a full sentence that states the slide's
  takeaway with at least one figure, never the topic.
- One idea a slide. A second idea is a second slide.
- No animation and no transition. The body is readable at the sizes under **Type**.

## Anatomy of a data slide

A data slide (a stat slide or a chart slide) is built in this order, flowing from top left to
bottom right:

1. The **Action title**, across the top.
2. **One piece of evidence**, never two: a chart or a table, or a Stat row on a stat slide. It
   takes the left two-thirds.
3. The **Takeaway panel**, in the right third.
4. A source line under the evidence, then the footer.

## The Takeaway panel

Up to three short lines, about 35 words in all, in this order and each under its label:

1. **So what**: the second-order point, what the figure means for the business. Never a
   restatement of the Action title.
2. **Why**: the cause, only where the data or the Month context shows one. Else the line is left
   out, never guessed.
3. **Watch**: the one figure to track next month, with the level that matters.

The panel never repeats a Recommendation: actions stay on the cards.

## Layouts

Every slide maps to one of seven **Layouts**. Each has its fixed grid in the skeleton CSS of
`references/deck-layout.md`; a slide takes the grid and does not re-space it.

| Layout | Holds |
|---|---|
| cover | the brand or Crux name, the deck's name and the Current period |
| section divider | the Section's name, a one-sentence verdict, and the contents of the Section |
| stat slide | an Action title, a Stat row and a Takeaway panel |
| chart slide | an Action title, one chart and a Takeaway panel |
| table slide | an Action title and one table; **Appendix only** |
| cards slide | an Action title and up to three Recommendation cards |
| text slide | an Action title and text columns (Executive summary, Notes) |

A **Stat row** sets a slide's headline figures large, each with its MoM, YoY and budget deltas, in
place of a table. The table it replaces moves to the Appendix as a table slide.

## Busy tables

A table of more than about 6 rows or 5 columns is not shown on its main slide. It goes to an
Appendix table slide. Its main slide keeps one of:

- a chart of the figures that matter, or
- the top 5 rows, with the one row the Action title names highlighted, and a source line saying
  how many rows there are in all,

and always the Takeaway panel.

## Colour

- **Highlight colour** goes only on the bar, line, row or figure the Action title names. Every
  other mark is grey.
- A **category palette** of at most 5 colours is allowed only where categories must be told apart
  (the groups of a stacked bar). It is not a way to make a chart livelier.
- **Positive and negative colours** appear only on deltas (▲ or ▼ with a figure), never as a
  chart or table fill.
- Marks take their colour from a class or a token (`var(--cat-1)`), never a hex value, so a
  brand's values recolour every chart.

## Charts

- Bars compare categories; lines show trends over time.
- Never a pie. Parts of a whole are a stacked bar.
- Direct labels on the marks, with no legend wherever the labels fit.
- Horizontal gridlines only, in hairline grey; no axis lines except the baseline. The axis starts
  at zero for bars and is never distorted.
- A source line under every chart, naming where the figures were read and their basis.
- Each chart carries a `title` element stating its message in a sentence.

## Tables

- Figures right-aligned, in tabular numerals.
- Hairline rows between lines, with no grid borders and no cell fills except the highlighted row (and the shading of a cohort table).
- The row the Action title names is highlighted and every other row is muted.

## Type

| Element | Size |
|---|---|
| Action title | 28 to 32px in the serif, at most two lines |
| Stat figure | 48 to 56px |
| Body, Takeaway panel | at least 16px |
| Table | at least 14px |
| Footer and source line | 12px |

Text that does not fit is cut, never shrunk. Shorten the sentence, drop the row to the Appendix,
or drop the line.

## Chrome

- The footer "Built with Crux growth skills" sits on every slide at 12px, muted.
- The brand's name, or Crux's where the deck wears no brand of its own, appears only on the cover
  and the Notes.

## Quality check

Before the deck is handed over, check every slide against this list. A slide that fails any line is
fixed, never shipped.

- It has one piece of evidence (a data slide never two).
- A data slide has its Takeaway panel, of up to three lines and about 35 words.
- It uses one Highlight colour, on the mark its Action title names.
- Its type is at or above the minimums: Action title 28px, body and Takeaway panel 16px, table
  14px, footer and source line 12px.
- Nothing runs past the 1280×720 slide.
- It carries the footer.
