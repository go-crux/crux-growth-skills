# Performance diagnosis: page layout

The Performance diagnosis is one self-contained HTML file, written to the working folder as
`performance-diagnosis-<kpi>-<period>.html`. It is a single page with inline CSS and no script
that fetches anything: the page makes no network request (no web font, no library, no image by
URL). Crux house style: British English, no em dashes, outcome before mechanism, relative
percentage changes (2.0% to 1.8% is "−10%"). Money carries the currency the Source's figures are
in, with its own symbol, never an assumed one.

The reader may arrive cold, with no idea how the page was made. Speak of "your data", never of a
table, a file or a rule; name a Source in plain words ("your orders", "your Shopify sales", "your
Google Ads campaigns"). Every heading below is always present, in this order, as a level-two
heading. A heading with nothing to show stays visible with one line saying why; a cell holds a
figure or "No data", never a bare "n/a".

**A stopped run writes no page.** When `SKILL.md` step 3 stops (the Success KPI itself cannot be
read in both periods, or no lever can), the chat gives the one line saying which Source is
missing, with the Brain line on a run without a Growth Brain, and no file is written. A run whose
Success KPI can be read and that has at least one readable lever always writes the page, however
many levers read "No data".

## The headings

1. **Summary**: two to four sentences of plain prose, written last, from the page's own figures:
   the change (the Success KPI in both periods and its relative change), the Main driver(s) with
   their Contributions (an Offset may be named beside them), and the top action: the first
   recommendation of the drilled Main driver with the most KPI at stake. The chat repeats this
   action as its top recommendation. Never a caveat (those go in Notes).
2. **The change**: the Success KPI, the Current period and the Comparison period as dates, the
   Success KPI in each and its relative change, and for each lever the Source it was read from
   (the brain's mart, a connector or the user's file, in plain words). A lever that reads "No
   data" names the Source it would need. Name the revenue measure and the
   margin rung where the tree uses them.
3. **Levers**: a table, one row per lever in tree order. Columns, in this order: lever (with V or
   E), Comparison period, Current period, change, Contribution, role (Main driver, Over the
   threshold, Offset or blank), the roles as `SKILL.md` step 5 defines them. A lever with no role
   has a blank role cell and no line. Spend and visits ranked together as cost per visit show the
   pair's role on both rows, written "Main driver (cost per visit)". Add a "Not split" row where
   a lever reads "No data", and a total row that adds exactly to the Success KPI's change. Under
   the table, one line for each Offset and each lever over the threshold, with its figure; the
   action for an over-threshold lever is written once, under Recommendations. Then the
   waterfall.

   **Waterfall**: an inline SVG from the Comparison period's Success KPI to the Current period's.
   The first and last bars are the two Success KPI values, each from the baseline. Between them,
   one floating bar per lever in tree order (and "Not split" last, grey, if present), each
   starting where the running total stands and ending at it plus the lever's Contribution. Use
   one colour for an increase, another for a decrease, a neutral one for the two totals, and
   label every bar with its name and figure. Extend the scale to include any negative running
   total. Give the SVG a `title` stating the change in a sentence.
4. **Drivers**: one block per drilled Main driver, headed by its lever and its Contribution.
   - One sentence of evidence with its figures.
   - For a conversion or new-customer conversion lever, the stage table first (session →
     engaged, engaged → checkout, in both periods), and a line naming a suspected site-wide
     fault where no channel carries half the change.
   - One table per Drill-down level, in order, each headed by the dimension it reads (and, for
     a level inside a segment, that segment). Columns, in this order: segment, Comparison
     period, Current period, Contribution, share of the parent's change, Current period volume,
     share of the parent's volume (the parent is the lever at the first level). Rows run from
     the largest Contribution in the direction of the change to the largest against it, with an
     "Other" row for segments under the volume floor. Where the lever is a ratio, show the rate
     in both periods in the two period columns, the denominator as the volume, and the
     Contribution in the Success KPI's unit. For the discount level of order value, show the
     discount rate and the discount depth in both periods under the table.
   - One closing line saying where the Drill-down stopped and why, in plain words.

   A Main driver whose source holds no dimension for the lever's first level has zero levels.
   Its block keeps the heading, the evidence sentence and a closing line, "Could not be sliced
   further: your data holds no finer view of this lever." (naming what is missing in plain
   words), and the Notes name the dimension that would let it go further. It still has its Cause
   and Recommendations. With no Main driver, the heading reads "Not drilled: there is no Main
   driver, because the Success KPI did not change or the levers your data could read all ran
   against the change."
5. **Cause**: for each drilled Main driver, headed by its lever, the user's answer in their
   words, or "Not confirmed". With no Main driver, it reads "Not confirmed: there is no Main
   driver to confirm a cause for."
6. **Recommendations**: for each drilled Main driver, headed by its lever, 1 to 3 recommendations
   in the order of the KPI at stake. Each carries, as labelled lines in this order: the
   **Hypothesis** ("if we X, the KPI moves because Y"), the **Action** (opening with the check
   where the Cause is "Not confirmed"), the **KPI at stake** (the change in the Success KPI that
   the segment carries, in its unit; for a driver with zero levels, the lever's whole
   Contribution), the **Metric to watch**, and **How to validate** (Test, Watch next period or
   Ship). Then, if any lever is over the threshold, its one check-first action line under its own
   name: the only place that action is written. With no Main driver, the heading reads "None:
   there is no Main driver to act on."
7. **Notes**: every caveat in one place, and no caveat anywhere else. Include, where they apply:
   - the basis: the revenue measure, the margin rung and whether the figure is CM3 or "CM1 less
     marketing", that flagged test orders are left out, and the timezone the periods were read in
     (UTC where nothing named one), with each caveat the Basis rule in `SKILL.md` asks the Notes
     to carry;
   - the periods' lengths when they differ in days, and that volumes then differ with them;
   - a change of source between the periods (such as the GA4 raw event stream replacing an
     earlier feed) and which levers move with it, so the reader does not mistake the change of
     source for a change in the business;
   - a Drill-down that stopped because the source holds no finer dimension, and which dimension
     would let it go further;
   - cohorts too young for the horizon, counted in "Other";
   - an unattended run, and which Growth Brain it read where several were connected;
   - a partial split: which levers read "No data" and why, and that the rest of the change is
     shown as "Not split";
   - a run without a Growth Brain: which connectors and files were read, that each lever reads
     one Source across both periods, and that marketing spend covers only the platforms read;
   - the method in one line: Contributions split the change by each lever's share of it, so they
     add exactly to the Success KPI's change;
   - that figures are rounded so the rows add exactly to the change.

   On a run without a Growth Brain, the Brain line closes the Notes, once.

## The Brain line

Said once on the page, as the last line of the Notes, and once in the chat, on a run without a
Growth Brain; never on a run with one. A stopped run has no page and says it in the chat only.
Its words are fixed: "A Growth Brain adds margin (CM3), one source for every lever, and the
drill-down by channel, product and cohort. Get one at gocrux.io/contact."
