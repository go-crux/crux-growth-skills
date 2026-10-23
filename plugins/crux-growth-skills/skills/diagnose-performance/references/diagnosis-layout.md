# Performance diagnosis: page layout

The Performance diagnosis is one self-contained HTML file, written to the working folder as
`performance-diagnosis-<kpi>-<period>.html`. It is a single page with inline CSS and no script
that fetches anything: the page makes no network request (no web font, no library, no image by
URL). Crux house style: British English, no em dashes, outcome before mechanism, relative
percentage changes (2.0% to 1.8% is "−10%"). Money carries the currency the brain's figures are
in, with its own symbol, never an assumed one.

The reader may arrive cold, with no idea how the page was made. Speak of "your data", never of a
table, a file or a rule. Every heading below is always present, in this order, as a level-two
heading. A heading with nothing to show stays visible with one line saying why; a cell holds a
figure or "No data", never a bare "n/a".

## The headings

1. **Summary**: two to four sentences of plain prose, written last, from the page's own figures:
   the change (the Success KPI in both periods and its relative change), the Main driver(s) with
   their Contributions, and the top action. Until Recommendations is filled, the top action is
   the one thing to check first about the Main driver. Never a caveat (those go in Notes).
2. **The change**: the Success KPI, the Current period and the Comparison period as dates, the
   Success KPI in each and its relative change, and for each lever the source it was read from
   (the brain's mart, in plain words such as "your orders"). Name the revenue measure and the
   margin rung where the tree uses them.
3. **Levers**: a table, one row per lever in tree order. Columns, in this order: lever (with V or
   E), Comparison period, Current period, change, Contribution, role (Main driver, Over the
   threshold, Offset or blank). Add a "Not split" row where a lever reads "No data", and a total
   row that adds exactly to the Success KPI's change. Under the table, one line for each Offset
   and each lever over the threshold, with its figure; an over-threshold lever also gets a
   one-line action. Then the waterfall.

   **Waterfall**: an inline SVG from the Comparison period's Success KPI to the Current period's.
   The first and last bars are the two Success KPI values, each from the baseline. Between them,
   one floating bar per lever in tree order (and "Not split" last, grey, if present), each
   starting where the running total stands and ending at it plus the lever's Contribution. Use
   one colour for an increase, another for a decrease, a neutral one for the two totals, and
   label every bar with its name and figure. Extend the scale to include any negative running
   total. Give the SVG a `title` stating the change in a sentence.
4. **Drivers**: for each Main driver, what the Drill-down found. Until the Drill-down is part of
   the skill, this heading reads: "Not drilled: the drill-down into the Main driver is not part
   of this version of the diagnosis."
5. **Cause**: what happened in the business behind each drilled Main driver, as the user
   confirmed it. Until then, this heading reads: "Not confirmed: with no drill-down there is no
   cause to confirm."
6. **Recommendations**: actions from the Drivers and the Cause, each ending on an action. Until
   then, this heading reads: "None yet: recommendations follow the drill-down, which is not part
   of this version of the diagnosis."
7. **Notes**: every caveat in one place, and no caveat anywhere else. Include, where they apply:
   - the basis: the revenue measure, the margin rung and whether the figure is CM3 or "CM1 less
     marketing", that flagged test orders are left out, and the store's timezone;
   - the periods' lengths when they differ in days, and that volumes then differ with them;
   - a change of source between the periods (such as the GA4 raw event stream replacing an
     earlier feed) and which levers move with it, so the reader does not mistake the change of
     source for a change in the business;
   - a partial split: which levers read "No data" and why, and that the rest of the change is
     shown as "Not split";
   - the method in one line: Contributions split the change by each lever's share of it, so they
     add exactly to the Success KPI's change;
   - that figures are rounded so the rows add exactly to the change.

The three placeholder lines above are the only reasons those headings carry in this version.
