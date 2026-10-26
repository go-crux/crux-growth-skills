# Performance diagnosis: page layout

The Performance diagnosis is one self-contained HTML file, written to the working folder as
`performance-diagnosis-<kpi>-<period>.html`. It is a single page with inline CSS and no script
that fetches anything: the page makes no network request (no web font, no library, no image by
URL). Crux house style: British English, no em dashes, outcome before mechanism, relative
percentage changes (2.0% to 1.8% is "−10%"), and every relative change and share column shown to the precision `references/contribution.md` sets under Rounding. Money carries the currency the Source's figures are
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
   recommendation of the drilled Main driver with the largest Contribution in the direction of
   the change. The chat repeats this
   action as its top recommendation. Never a caveat (those go in Notes).
2. **The change**: the Success KPI, the Current period and the Comparison period as dates, the
   Success KPI in each and its relative change, and for each lever the Source it was read from
   (the brain's mart, a connector or the user's file, in plain words). A lever that reads "No
   data" names the Source it would need. Name the revenue measure and the
   margin rung where the tree uses them.

   Then **the counts**, written once: a table of every count and amount the tree's ratios are
   built from, as the Catalogue of `references/lever-trees.md` lists them for the tree, one row
   each in the order the Catalogue gives, with a Comparison period column and a Current period
   column. Each cell is the figure the Levers were computed from, so a reader can rebuild the
   Success KPI from the page alone and tie visits, orders and revenue to their own reporting. A
   count two Levers share has one row. A count that reads "No data" shows that in its cells. A
   count that can be fractional (Google Ads purchases) shows to one decimal; every other count
   shows to the unit; an amount rounds as `references/contribution.md` rounds a money KPI.
3. **Levers**: a table, one row per lever in tree order. Columns, in this order: lever (with V or
   E), Comparison period, Current period, change, Contribution, role (Main driver, Also
   large, Offset or blank), the roles as `SKILL.md` step 5 defines them. A lever with no role
   has a blank role cell and no line. A cost pair ranked together (`SKILL.md` step 5) shows the
   pair's role on both rows with the pair's name, written "Main driver (cost per visit)" or
   "Offset (CPM)". Add a "Not split" row where a lever reads "No data", and a total row that adds
   exactly to the Success KPI's change. Under the table, one line for each Offset and each Also
   large lever, with its figure, and the line for a cost pair that takes no role, in the wording
   **Plain wording** gives; the action for an Also large lever, or an Offset `SKILL.md` step 5
   gives an action line, is written once, under Recommendations. Then the waterfall.

   **Waterfall**: an inline SVG from the Comparison period's Success KPI to the Current period's.
   The first and last bars are the two Success KPI values, each from zero. Between them,
   one floating bar per lever in tree order (and "Not split" last, grey, if present), each
   starting where the running total stands and ending at it plus the lever's Contribution. Use
   one colour for an increase, another for a decrease, a neutral one for the two totals, and
   label every bar with its name and figure. Extend the scale to include any negative running
   total. Give the SVG a `title` stating the change in a sentence.
4. **Drivers**: one block per drilled Main driver, headed by its lever and its Contribution.
   - One sentence of evidence with its figures. Where the driver's change straddles a change of
     source, or on a Platform ROAS page the campaign level shows spend moving between
     campaigns, the line **Plain wording** gives for each follows it.
   - For a conversion or new-customer conversion lever, the stage table first (session →
     engaged, engaged → checkout, in both periods), and a line naming a suspected site-wide
     fault where no channel carries half the change.
   - One table per Drill-down level, in order, each headed by the dimension it reads (and, for
     a level inside a segment, that segment). Columns, in this order: segment, Comparison
     period, Current period, Contribution, share of the parent's change, Current period volume,
     share of the parent's volume (the parent is the lever at the first level). For a count or
     amount lever, drop the Current period volume column: the Current period column already is
     it. Rows run from the largest Contribution in the direction of the change to the largest
     against it, then the "Other" row, always last, for segments under the volume floor, worded
     as **Plain wording** sets out. Where the lever is a ratio, show the rate in both periods in
     the two period columns, the denominator as the volume, and the Contribution in the Success
     KPI's unit. A new or stopped segment reads "New" or "Stopped" in its empty period's cell.
     For the discount level of order value, show the discount rate and the discount depth in both
     periods under the table, or under the collapse line where the level has no table. Under a
     table, where they apply, the line naming the other dimensions read at that level, and the
     line for a segment whose rate moved one way while its Contribution ran the other, in the
     wording **Plain wording** gives.
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
   Contribution; capped at the Contribution of the segment it sits in, or of the lever at the
   first level, in the wording **Plain wording** gives),
   the **Metric to watch**, and **How to validate** (Test, Watch next period or
   Ship). Then, for each lever that is Also large or an Offset `SKILL.md` step 5 gives an
   action line, its one check-first action line under its own name: the only place that action
   is written. With no Main driver, the heading reads "None: there is no Main driver to act on.",
   followed by the one action line step 5 then gives.
7. **Notes**: every caveat in one place, and no caveat anywhere else. Include, where they apply:
   - the basis: the revenue measure, the margin rung and whether the figure is CM3 or "CM1 less
     marketing", that flagged test orders are left out, and, with a Growth Brain, the timezone each
     Source was read in (one line when they match, else one naming each), in the wording
     **Plain wording** gives, with each caveat the Basis rule in `SKILL.md` asks the Notes to
     carry;
   - on a margin tree, the share of revenue from orders not fully costed (and that margin,
     revenue and order counts leave them out, where the mart flags them), that margin % may
     differ from the brain's published rate, and, for CM3, that the check is arithmetic only
     where it is, these three in the wording **Plain wording** gives;
   - the periods' lengths when they differ in days, and that volumes then differ with them;
   - a change of source between the periods (such as the GA4 raw event stream replacing an
     earlier feed) and which levers move with it, so the reader does not mistake the change of
     source for a change in the business, in the wording **Plain wording** gives;
   - cancelled orders, whether the Source includes them, excludes them or does not say;
   - modelled re-attribution rows and their coverage, zero coverage included;
   - a currency no Source states;
   - on a run with a Growth Brain, connectors in the session that were not read;
   - a Drill-down that stopped because the source holds no finer dimension, and which dimension
     would let it go further;
   - a Drill-down level read from your orders while its lever's total comes from another
     Source, in the wording **Plain wording** gives;
   - cohorts too young for the horizon, counted in the "Other" row of their level;
   - an unattended run, which Growth Brain it read where several were connected, and any period
     resolved from "this month" or the like to the last complete one, with its dates;
   - a partial split: which levers read "No data" and why, and that the rest of the change is
     shown as "Not split", including a lever whose export the user chose not to give;
   - a run without a Growth Brain: which connectors and files were read, that each lever reads
     one Source across both periods, and the timezone each Source reports in (one line when they
     match, else one naming each), in the wording **Plain wording** gives;
   - a connector that refused a read, and where its levers were read from instead; or, when it
     refused the first read or its account list did not load, that no lever was taken from it,
     in the wording **Plain wording** gives;
   - a connector account that could not be told to be the brand's, skipped on an unattended run,
     in the wording **Plain wording** gives;
   - marketing spend covering only the platforms read, on a run without a Growth Brain whose tree
     holds marketing spend summed across platforms (CAC, MER / ROAS), and on no other page: a
     Platform ROAS page reads one platform's own spend;
   - an order count read from a Source with no test-order flag, with the result of checking it
     against your orders where a Growth Brain holds them; never on a Platform ROAS page, whose
     purchases are the platform's, not store orders;
   - a platform export or connector that does not say which conversion actions it counts;
   - these last three in the wording **Plain wording** gives;
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
| Drill-down cell for a segment with no volume in that period | New (Comparison period cell), Stopped (Current period cell) |
| Under the Levers table, a cost pair that takes no role | <Spend> moved <KPI> by <figure> and <visits or impressions> by <figure>; read together as <cost per visit or CPM> they moved it by <figure>, too little to drive the change. |
| Under a Drill-down table, the other dimensions read at that level | Also read at this level: <dimensions>. <Chosen dimension> shows most of the change in one place. |
| Under a Drill-down table, a ratio segment whose rate moved one way and Contribution the other | <Segment>'s <lever> <rose or fell>, yet it <lowered or raised> <lever> overall: it carried a <smaller or larger> share of your <volume> than before. |
| Drivers block, after the evidence sentence, where the driver's change straddles a change of source | Part of this change may come from the change in how <measure> is recorded on <date>, not from the business. |
| Drivers block, after the evidence sentence, on a Platform ROAS page where the campaign carrying the change is one whose own rate did not move in the direction of the change | Spend moved <towards or away from> <campaign>, which returns <more or less> per unit of spend than your other campaigns, so <KPI> <rose or fell> without a matching change in any campaign's own <ROAS>. |
| Recommendations, KPI at stake capped at the lever's Contribution (first level) | <figure>, all of <lever>'s change: <segment> moved it by <figure> on its own, and other <dimension, plural> pulled the other way. |
| Recommendations, KPI at stake capped at the Contribution of the segment it sits in (second or third level) | <figure>, all of <parent segment>'s change in <lever>: <segment> moved it by <figure> on its own, and other <dimension, plural> pulled the other way. |

**The Drill-down's closing line**, one per driver, by the reason it stopped:

| Reason | Wording |
|---|---|
| No segment carries half the change | The change is spread across <dimension>, no one dominates. |
| Three levels read | This is as far as the diagnosis goes: <segment> is specific enough to act on. |
| The Source holds no finer dimension | This is as fine as your data goes: <Source> has no view by <next dimension>. |
| A level's parent holds one segment (a line in place of that level's table) | All of <parent> sits in one <dimension>, <segment>, so there is nothing to split. |
| A yes/no level (discounted or full price) whose smaller segment joined "Other" (a line in place of that level's table) | Nearly all of <parent> sits in one <dimension>, <segment>; the rest is too small to read on its own. |
| Channels do not carry the change, on a conversion lever | No one channel carries this change, so the cause may be on the whole site: check checkout, payments and key product pages first. |
| The funnel steps cannot be read, on a conversion lever | Not checked: your data holds no view of the steps between a visit and an order. |
| Zero levels | Could not be sliced further: your data holds no finer view of this lever. |

**Before the Lever tree**, in the chat only, ahead of the tree `SKILL.md` step 3 asks the user to
confirm:

| Where | Wording |
|---|---|
| Lead-in to the tree | Here's how I'll diagnose this. <Success KPI> is built from a few levers that multiply or add up to it, so I'll work out how much of the change from <Comparison period> to <Current period> each lever caused, then dig into the biggest one to find where it moved and what to do about it. First, check the levers below are the right ones for your business. |

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
| a connector read directly (Shopify, GA4, Google Ads, Meta Ads) | your <platform> account |

**Notes lines**

| Caveat | Wording |
|---|---|
| Orders not fully costed, left out of margin, revenue and order counts | <share> of revenue in the Current period (<share> in the Comparison period) is from orders not fully costed, so margin, revenue and order counts leave them out. |
| Margin %, on a margin tree | Margin % is order margin divided by revenue on the orders counted here, dated by order. The margin rate your Growth Brain publishes may divide by a different revenue, so the two can differ. |
| CM3 with no separate figure to check it against | CM3 is built from your orders' margin and your ad spend, so the levers add up to it by construction; no separate CM3 figure was available to check it against. |
| A level read from the orders while the lever's total comes from another Source | The split of <lever> by <dimension> comes from your orders, while its total comes from <Source in plain words>. |
| An order count from an export with no test-order flag, on a run without a Growth Brain (never a Platform ROAS page) | <Source> carries no test-order flag, so any test orders are counted. |
| An order count with no test-order flag, checked against your orders, matching | <Source> carries no test-order flag; its order count matches your orders with test orders left out. |
| The same, not matching | <Source> carries no test-order flag; its order count is <n> above your orders with test orders left out, so up to <n> test orders may be counted. |
| Cancelled orders, the Source says they are left out | Cancelled orders are left out, as <Source> records them. |
| Cancelled orders, the Source says they are counted | Cancelled orders are counted, as <Source> records them. |
| Cancelled orders, the Source does not say | <Source> does not say whether cancelled orders are counted, so orders are as it records them. |
| Modelled re-attribution rows in the periods | <share> of <measure> in the Current period (<share> in the Comparison period) is modelled re-attribution, kept in the totals and shown in "Other" below channel. |
| No modelled re-attribution rows in the periods | None of these figures is modelled re-attribution: every channel is as your data recorded it. |
| A change of source between or inside the periods | <Measure> is recorded by <later source> from <date> and by <earlier source> before it, so part of the change in <levers> may be the change of source. |
| A currency no Source states, confirmed by the user | <Source> does not say which currency it reports in; amounts are in <currency>, as you confirmed. |
| A currency no Source states, on an unattended run | <Source> does not say which currency it reports in, so amounts are shown without a symbol. |
| Connectors in the session not read, on a Growth Brain run | <Connectors> were connected but not read: your Growth Brain holds what they would have given. |
| A partial split | <Levers> could not be read (<reason>), so <figure> of the change is shown as "Not split". |
| An export the user chose not to give | You chose not to give <report name>, so <levers> read "No data". |
| Marketing spend summed across platforms (CAC, MER / ROAS), on a run without a Growth Brain | Marketing spend covers <platforms> only, the same in both periods. |
| The timezone, with a Growth Brain that names one | Days are read in <timezone>. |
| The timezone, where the Growth Brain says only that dates are the store's own | Days are your store's own, as your Growth Brain records them. |
| The timezone, where a Source's dates are UTC | Days are read in UTC. |
| The timezone, on a run without a Growth Brain | Days follow the timezone <Source> reports in, <timezone>. Where neither it nor a connector for that platform names one: <Source> does not say which timezone it reports in, so days may be cut differently from your store's. |
| The timezone, where Sources are dated in different timezones | Days are read in <timezone> for <Source in plain words> and in <timezone> for <Source in plain words>, the same in both periods, so a day at the edge of a period can fall differently between the two. |
| Conversion actions in a platform export that does not say which it counts | <Source> does not say which conversion actions it counts, so platform conversions are every action it holds. |
| Conversions from the Google Ads connector read with no purchase filter | <Source> could not be limited to purchases, so platform conversions are every primary conversion action. |
| A connector refused a read after a lever was assigned to it, and a lever moved | <Source> refused to share its figures, so <levers> were read from <next Source in plain words>, or read "No data" where nothing else holds them. |
| A connector refused a read after a lever was assigned to it, and no lever moved | <Source> refused a read, so nothing was read from it. |
| A connector refused the first read, before any lever was assigned a Source | <Source> refused a first read, so no lever was taken from it. |
| A connector's list of accounts did not load, so no account was read | <Platform> did not load its list of accounts, so no lever was taken from it. |
| A connector account that could not be told to be the brand's, on an unattended run | <Platform> lists an account that could not be told to be yours, so it was not read. |

## The Brain line

Said once on the page, as the last line of the Notes, and once in the chat, on a run without a
Growth Brain; never on a run with one. A stopped run has no page and says it in the chat only.
Its words are fixed: "A Growth Brain adds margin (CM3), one source for every lever, and the
drill-down by channel, product and cohort. Get one at gocrux.io/contact."
