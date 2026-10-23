# Performance diagnosis: page layout

The Performance diagnosis is one self-contained HTML file, written to the working folder as
`performance-diagnosis-<kpi>-<period>.html`. It is a single page with inline CSS and no script
that fetches anything: the page makes no network request (no web font, no library, no image by
URL). Crux house style: British English, no em dashes, outcome before mechanism, relative
percentage changes (2.0% to 1.8% is "−10%"). Money carries the currency the Source's figures are
in, with its own symbol, never an assumed one.

The reader may arrive cold, with no idea how the page was made. Speak of "your data", never of a
table, a file, a rule, a threshold, a floor or a cap; name a Source as **Plain wording** below
lists it. Every heading below is always present, in this order, as a level-two
heading. A heading with nothing to show stays visible with one line saying why; a cell holds a
figure or "No data", never a bare "n/a".

**A stopped run writes no page.** When `SKILL.md` step 3 stops (the Success KPI itself cannot be
read in both periods, or no lever can), the chat gives the one line saying which Source is
missing in the words of **Plain wording** below, with the Brain line on a run without a Growth
Brain, and no file is written. A run whose
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
   E), Comparison period, Current period, change, Contribution, role (Main driver, Also
   large, Offset or blank), the roles as `SKILL.md` step 5 defines them. A lever with no role
   has a blank role cell and no line. Spend and visits ranked together as cost per visit show the
   pair's role on both rows, written "Main driver (cost per visit)". Add a "Not split" row where
   a lever reads "No data", and a total row that adds exactly to the Success KPI's change. Under
   the table, one line for each Offset and each Also large lever, with its figure; the
   action for an Also large lever is written once, under Recommendations. Then the
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
     "Other" row for segments under the volume floor, worded as **Plain wording** sets out. Where
     the lever is a ratio, show the rate in both periods in the two period columns, the
     denominator as the volume, and the Contribution in the Success KPI's unit. For the discount
     level of order value, show the discount rate and the discount depth in both periods under
     the table.
   - One closing line saying where the Drill-down stopped and why, in the wording **Plain
     wording** gives for that reason.

   A Main driver whose source holds no dimension for the lever's first level has zero levels.
   Its block keeps the heading, the evidence sentence and the zero-levels closing line of **Plain
   wording**, naming what is missing in plain words, and the Notes name the dimension that would
   let it go further. It still has its Cause and Recommendations. With no Main driver, the
   heading reads "Not drilled: there is no Main driver, because the Success KPI did not change
   or the levers your data could read all ran against the change."
5. **Cause**: for each drilled Main driver, headed by its lever, the user's answer in their
   words, or "Not confirmed". With no Main driver, it reads "Not confirmed: there is no Main
   driver to confirm a cause for."
6. **Recommendations**: for each drilled Main driver, headed by its lever, 1 to 3 recommendations
   in the order of the KPI at stake. Each carries, as labelled lines in this order: the
   **Hypothesis** ("if we X, the KPI moves because Y"), the **Action** (opening with the check
   where the Cause is "Not confirmed"), the **KPI at stake** (the change in the Success KPI that
   the segment carries, in its unit; for a driver with zero levels, the lever's whole
   Contribution), the **Metric to watch**, and **How to validate** (Test, Watch next period or
   Ship). Then, if any lever is Also large, its one check-first action line under its own
   name: the only place that action is written. With no Main driver, the heading reads "None:
   there is no Main driver to act on."
7. **Notes**: every caveat in one place, and no caveat anywhere else. Include, where they apply:
   - the basis: the revenue measure, the margin rung and whether the figure is CM3 or "CM1 less
     marketing", that flagged test orders are left out, and, with a Growth Brain, the timezone the
     periods were read in (UTC where nothing named one), with each caveat the Basis rule in
     `SKILL.md` asks the Notes to carry;
   - the periods' lengths when they differ in days, and that volumes then differ with them;
   - a change of source between the periods (such as the GA4 raw event stream replacing an
     earlier feed) and which levers move with it, so the reader does not mistake the change of
     source for a change in the business;
   - a Drill-down that stopped because the source holds no finer dimension, and which dimension
     would let it go further;
   - a Drill-down level read from your orders while its lever's total comes from another
     Source, in the wording **Plain wording** gives;
   - cohorts too young for the horizon, counted in the "Other" row of their level;
   - an unattended run, and which Growth Brain it read where several were connected;
   - a partial split: which levers read "No data" and why, and that the rest of the change is
     shown as "Not split";
   - a run without a Growth Brain: which connectors and files were read, that each lever reads
     one Source across both periods, and the timezone the Source reports in, in the wording
     **Plain wording** gives;
   - a connector that refused a read, and where its levers were read from instead, in the
     wording **Plain wording** gives;
   - marketing spend covering only the platforms read, on a run without a Growth Brain whose tree
     holds spend as a lever (and no other run);
   - an export that carries no test-order flag, and a platform export or connector that does
     not say which conversion actions it counts, each in the wording **Plain wording** gives;
   - the method in one line: Contributions split the change by each lever's share of it, so they
     add exactly to the Success KPI's change;
   - that figures are rounded so the rows add exactly to the change.

   On a run without a Growth Brain, the Brain line closes the Notes, once.

## Plain wording

The page never cites a rule, a threshold, a floor, a cap or a table. Each line below is written
as given, with the angle brackets filled from the run, so two runs word the same thing the same
way. The lines above fix what to say; these fix how.

**Role and rows**

| Where | Wording |
|---|---|
| Levers table, role of a lever other than a Main driver, in the direction of the change, with at least half the largest Contribution | Also large |
| Drill-down row for segments too small to list | Other (smaller <dimension>), the dimension in the plural as the table's heading names it: "Other (smaller campaigns)", "Other (smaller channels)" |
| The same row on a cohort level, which also holds cohorts too young to read | Other (smaller or too-young cohorts) |

**The Drill-down's closing line**, one per driver, by the reason it stopped:

| Reason | Wording |
|---|---|
| No segment carries half the change | The change is spread across <dimension>, no one dominates. |
| Three levels read | This is as far as the diagnosis goes: <segment> is specific enough to act on. |
| The Source holds no finer dimension | This is as fine as your data goes: <Source> has no view by <next dimension>. |
| A level's parent holds one segment (a line in place of that level's table) | All of <parent> sits in one <dimension>, <segment>, so there is nothing to split. |
| Channels do not carry the change, on a conversion lever | No one channel carries this change, so the cause may be on the whole site: check checkout, payments and key product pages first. |
| The funnel steps cannot be read, on a conversion lever | Not checked: your data holds no view of the steps between a visit and an order. |
| Zero levels | Could not be sliced further: your data holds no finer view of this lever. |

**A stopped run**, in the chat only:

| Reason | Wording |
|---|---|
| The Success KPI cannot be read in both periods | I can't read <Success KPI> for both periods: I would need <Source in plain words>. |
| No lever can be read | I can't read any lever of <Success KPI>: I would need <Source in plain words>. |

**Sources**, by what was read; the page never names a mart, a file or a column:

| Read from | Plain name |
|---|---|
| `<client>-orders` | your orders |
| `<client>-channel_reporting` | your sales and ad spend by channel |
| `<client>-order_items` | your orders by product |
| `<client>-ecommerce_funnel` | your visit-to-order funnel |
| `<client>-ltv_retention` | your repeat-purchase cohorts |
| the CRM or email mart | your email and CRM sends |
| `<client>-meta_performance`, the Meta Ads campaign report | your Meta Ads campaigns |
| `<client>-google_ads_performance`, the Google Ads campaign report | your Google Ads campaigns |
| Shopify sales over time | your Shopify sales |
| Shopify sessions by landing page | your Shopify visits by landing page |
| GA4 sessions by default channel group | your GA4 traffic by channel |
| a file the user gave | the <report name> you gave |
| pasted figures | the figures you gave |

**Notes lines**

| Caveat | Wording |
|---|---|
| A level read from the orders while the lever's total comes from another Source | The split of <lever> by <dimension> comes from your orders, while its total comes from <Source in plain words>. |
| An export carries no test-order flag | <Source> carries no test-order flag, so any test orders are counted. |
| Marketing spend, on a run without a Growth Brain whose tree holds spend | Marketing spend covers <platforms> only, the same in both periods. |
| The timezone, on a run without a Growth Brain | Days follow the timezone <Source> reports in, <timezone>. Where it names none: <Source> does not say which timezone it reports in, so days may be cut differently from your store's. |
| Conversion actions in a platform export that does not say which it counts | <Source> does not say which conversion actions it counts, so platform conversions are every action it holds. |
| Conversions from the Google Ads connector read with no purchase filter | <Source> could not be limited to purchases, so platform conversions are every primary conversion action. |
| A connector refused a read | <Source> refused to share its figures, so <levers> were read from <next Source in plain words>, or read "No data" where nothing else holds them. |

## The Brain line

Said once on the page, as the last line of the Notes, and once in the chat, on a run without a
Growth Brain; never on a run with one. A stopped run has no page and says it in the chat only.
Its words are fixed: "A Growth Brain adds margin (CM3), one source for every lever, and the
drill-down by channel, product and cohort. Get one at gocrux.io/contact."
