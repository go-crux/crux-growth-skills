# Monthly performance review: deck layout

The Monthly performance review is one self-contained HTML file, `monthly-performance-review-YYYY-MM.html`
(`YYYY-MM` is the Current period), written to the working folder. It is a deck of 16:9 slides, one
shown at a time. Every slide in **The slide list** below is always built, in that order, whatever
the Source: a slide the Source cannot fill is a Brain slot, never dropped (a slide marked
conditional is dropped only when the business has none). Two months' decks therefore compare slide
for slide.

Crux house style: British English, no em dashes, outcome before mechanism, relative percentage
changes (2.0% to 1.8% is "−10%"). Money carries the currency the Source's figures are in, with its
own symbol, never an assumed one, and shows compactly (£1.2m, £84k). The reader may arrive cold:
speak of "your orders", "your ad spend", never a table, a column, a rule or a threshold. A cell
holds a figure, "No data" (the Source holds nothing for it) or "New" (the comparison figure is
zero), never a bare "n/a"; the cohort table and `last-actions` name their own empty cells.

## The slide list

Slide ids are stable names for the build; a slide's position follows the order below, so a dropped
conditional slide moves the later ones up. A **Focus question** adds one slide directly after its
Section's divider, with an Action title of its own.

| Id | Slide | Chart | Share toggle | Built |
|---|---|---|---|---|
| `cover` | Cover | brand name, "Monthly performance review", the Current period as "March 2026" | no | here |
| `exec-summary` | Executive summary | three columns: Performance / Read / Actions | no | here |
| `last-actions` | Last month's actions | table of actions | no | here |
| `trading-divider` | Trading | divider | no | here |
| `trading-kpi` | Trading KPIs | KPI table | no | here |
| `trading-revenue` | Revenue, new vs returning | stacked columns, 24 months | yes | here |
| `trading-customers` | Customer base | columns above and below the axis, 24 months | no | here |
| `trading-markets` | Markets (conditional) | markets side by side | no | here |
| `trading-recs` | Trading Recommendations | up to three cards | no | here |
| `acq-divider` | Acquisition | divider | no | here |
| `acq-blended` | Blended traffic, conversion and CAC | small multiples, 24 months | no | here |
| `acq-channels` | Channel mix | table | no | here |
| `acq-paid-organic` | Paid vs organic | 100% bar now, 12-month line | yes | here |
| `acq-campaigns` | Top campaigns, one slide per connected ad platform | tables, top 10 | no | here |
| `acq-ltv-channel` | LTV by acquisition channel | ranked horizontal bars | no | here |
| `acq-recs` | Acquisition Recommendations | up to three cards | no | here |
| `ret-divider` | Retention & LTV | divider | no | here |
| `ret-cohort` | Cohort retention | shaded table, 12 cohorts by months 0 to 12 | no | here |
| `ret-ltv` | Cohort LTV against the average | cumulative lines, average in bold | no | here |
| `ret-subscriptions` | Subscription mix (conditional) | line, 24 months, with a small table | no | here |
| `ret-recs` | Retention & LTV Recommendations | up to three cards | no | here |
| `aov-divider` | Order value & product | divider | no | here |
| `aov-trend` | AOV, new / returning / blended | three lines, 24 months | no | here |
| `aov-product` | Product and category mix | table, and stacked columns of sales by category, 24 months | yes | here |
| `aov-discount` | Discount impact | small multiples: discount rate line, discount depth columns, discounted vs full-price orders | yes, on discounted vs full-price orders only | here |
| `aov-codes` | Discount codes (conditional) | table | no | here |
| `aov-recs` | Order value & product Recommendations | up to three cards | no | here |
| `next-month` | Next month | top three cards across Sections | no | here |
| `app-ltv-category` | Appendix: LTV by order category | ranked horizontal bars | no | here, brain only |
| `app-ltv-type` | Appendix: LTV by order type | ranked horizontal bars | no | here, brain only |
| `app-line-items` | Appendix: line items | table | no | here, brain only |
| `notes` | Notes | Sources, definitions, caveats | no | here |

**Focus slides.** Each Focus question the intake settled adds one slide, `focus-1` and `focus-2`,
directly after its Section's divider, in the order the questions were given; its `data-section` is
that Section's. A run with no Focus question has none. The Focus slide carries no Share toggle.

"Built: here" means this file specifies the slide in full below. On a Growth Brain it is built
from the brain, and where a mart the slide reads is missing from the roster it is written as its
Brain slot (**Brain slot wording** below). On the ad account and Shopify connectors or CSV exports
it is built where **Slides without a Growth Brain** below says that Source fills it, and written as
its Brain slot where it does not. "Here, brain only" is a slide no other Source fills: it is a
Brain slot on every run without a Growth Brain, whatever the connectors hold (ADR-0002).
`last-actions` is built on every Source, since it reads the previous review and not a Growth
Brain. The campaigns slide repeats once per connected ad platform.

## Rules every slide follows

**Action title.** Every content slide (all but `cover`, the dividers and `notes`) opens on one:
a full sentence with at least one figure from the slide, at most two lines at the title size
(about 110 characters), stating the takeaway, never the topic. The one exception is
`last-actions` when no previous review was found, whose title names the missing month instead. Write each title last, from the
slide's own figures: "Revenue rose 8% to £1.2m as returning customers carried the month", not
"Revenue trend". A title states what the figures show and no cause the Month context or the data
does not support.

**Month context.** Where the intake settled a Month context that bears on a slide's figures (a
promotion on the revenue slides, a stockout on a category, a tracking change on traffic and
channels), the slide carries it as one line beneath its content, "You told us: `<the user's words,
trimmed to one sentence>`.", in place of any guessed cause. The Executive summary's Read uses it the
same way. A slide it does not bear on carries no such line.

**Measure names.** On a Growth Brain, a slide's title, axis, column header, card and Action title name
each measure as the brain defines it, with its unit ("margin per customer" where the brain's LTV is
margin, "users" where its conversion is per user), as `references/sources.md` (Definitions and
basis) sets out. The wording below ("revenue per customer", "visits") is for a measure the brain
defines none for, and is replaced by the brain's name for it everywhere it appears.

**Brain slot.** A Brain slot keeps a title that says what the slide would show (it carries no
figure, since it holds none) and a body of one fixed line, written as given with the data filled
from the table below:

> This slide needs `<data>`. A Growth Brain provides it: gocrux.io/contact.

On a run with a Growth Brain the slot names what the brain lacks instead, a mart or a column on one:

> This slide needs `<data>`, and your Growth Brain holds no `<plain name>`.

"gocrux.io/contact" links to https://gocrux.io/contact. The slot is a muted panel; its footer is
the same as any slide's. Each of the two lines is fixed, and the second belongs only to a run with
a Growth Brain.

**Conditional slides** (`trading-markets`, `ret-subscriptions`, `aov-codes`) exist only when the
business has what they show: markets when more than one market holds orders in the Current period
or its Comparison period; subscription mix when the orders carry a subscription flag with at least
one subscription order in the Current period; discount codes when at least one order in the
Current period carries a code. A Source that holds none of it drops the slide, with no Brain slot
and no Notes line. A Source that cannot tell, for example because it has no orders, writes the
slide as a Brain slot.

**Footer.** Every slide carries, bottom left, the words "Built with Crux growth skills", linking
https://gocrux.io.

**Share toggle.** A chart marked "yes" in the slide list carries two buttons in its corner,
"Absolute" and "% of total", absolute by default, switching that chart only. The page holds both
views as inline SVG (the % view is each column or bar rescaled to a whole of 100%, labelled with
its percentages) and the script shows one. Only the four charts marked "yes" carry it: never a
rate (conversion, CAC, AOV, discount rate, LTV) and never the customer base. A printed page shows
the view on screen.

**Comparison columns.** Every table, and the small table beside a chart, carries these columns in
this order: this month, last month, MoM %, same month last year, YoY %. Add budget and v budget %
(after YoY %) only where the Source holds a budget, on the rows it holds one for; a Source with no
budget carries no budget column. A row's budget cells are read as `references/sources.md` (Budget)
sets out, which also says when they read "No data"; v budget % is not the row's this month figure
against the budget unless the two bases match, and the Budget basis caveat says so where they do
not. The Current period supplies "this month"; the Comparison periods
are as `references/sources.md` sets out. Every % change is relative: a rate that moves from 2.0%
to 1.8% reads "−10%". A year-ago figure the Source does not reach reads "No data". Show a change
to the nearest whole % at 10% or more and to one decimal below it. A delta cell carries ▲ or ▼
and is coloured: the up colour for a rise, the down colour for a fall, neutral for no change. A
marketing spend row is always neutral, since spend rising is neither good nor bad alone. A CAC
figure is coloured by whether the move is good: a fall takes the up colour and a rise the down
colour, with ▲ or ▼ still showing the direction. A slide that states its own columns below
(Channel mix, Top campaigns, Cohort retention, Cohort LTV, the LTV slides, Subscription mix,
Line items, Product and category mix, Discount codes) uses those: it holds too many measures for
five columns each, or reads a cohort window rather than a month.

**Trend charts.** Show 24 months ending with the Current period, or as far back as the Source
goes (the Notes say when the history starts). The Current period's column or point is marked.
Label axes with the unit and currency, and each chart with a `title` element stating its message
in a sentence. **No dual axes**: two measures on different scales are two small charts side by
side.

**Recommendation card.** A card has, on its face, a short title, one evidence figure and the
action; in a footer, the metric to watch and how to validate it: Test, Watch next month or Ship.
A Section's Recommendations slide holds up to three cards, ranked by revenue at stake: the revenue
a month of the gap the evidence figure shows is worth, worked from the section's own figures. A
move of 10% or more on a headline figure may carry one extra line on its card, "To see why it
moved, run the diagnose-performance skill for `<month>` against `<comparison month>`."; the
review itself never drills. Where the evidence supports no action, the slide carries one line
saying the Section held and the figure that shows it. A Recommendation is an action, never a
finding alone.

## Page mechanics

Inline CSS, inline SVG charts and a few lines of inline script (slide bar, arrow keys, Share
toggle). The page makes no network request: no web font (use the system stack), library, image
by URL or fetch. A brand's look changes the CSS values below and nothing else. It prints one slide per page.

Write the page to this skeleton, filling the slides and keeping the CSS and script as given:

```html
<!doctype html><html lang="en-GB"><meta charset="utf-8"><title>Monthly performance review, March 2026</title>
<style>
:root{--ink:#1b1f24;--muted:#6b7280;--paper:#fff;--line:#d9dde3;--accent:#2f5d8a;--up:#1b7f4b;--down:#b3261e;--s1:#2f5d8a;--s2:#8aa9c7;--s3:#c9a24b;--s4:#7a8793;--font:system-ui,-apple-system,"Segoe UI",Helvetica,Arial,sans-serif}
body{margin:0;font-family:var(--font);color:var(--ink);background:#eef0f3}
.bar{height:40px;display:flex;gap:4px;align-items:center;padding:0 12px;background:var(--paper);border-bottom:1px solid var(--line)}
.bar button{border:0;background:none;padding:6px 10px;cursor:pointer;color:var(--muted)}.bar button.on{color:var(--accent);font-weight:600}
.stage{transform-origin:top left;transform:scale(var(--k,1))}
.slide{display:none;width:1280px;height:720px;box-sizing:border-box;padding:48px 64px;background:var(--paper);flex-direction:column;position:relative}
.slide.on{display:flex}
.slide footer{position:absolute;left:64px;bottom:20px;font-size:12px}.slide footer a{color:var(--muted)}
.chart[data-view=absolute] .v-share,.chart[data-view=share] .v-absolute{display:none}
@page{size:1280px 720px;margin:0}
@media print{body{background:none;-webkit-print-color-adjust:exact;print-color-adjust:exact}.bar{display:none}.stage{transform:none}.slide{display:flex;page-break-after:always}}
</style>
<nav class="bar"></nav>
<div class="stage">
<section class="slide" id="trading-kpi" data-section="Trading"><h2>…Action title…</h2> … <footer><a href="https://gocrux.io">Built with Crux growth skills</a></footer></section>
</div>
<script>
const S=[...document.querySelectorAll('.slide')],B=document.querySelector('.bar');let i=0;
[...new Set(S.map(s=>s.dataset.section))].forEach(n=>{const b=document.createElement('button');b.textContent=n;b.onclick=()=>go(S.findIndex(s=>s.dataset.section===n));B.append(b)});
function go(n){i=Math.max(0,Math.min(S.length-1,n));S.forEach((s,k)=>s.classList.toggle('on',k===i));[...B.children].forEach(b=>b.classList.toggle('on',b.textContent===S[i].dataset.section))}
function fit(){document.documentElement.style.setProperty('--k',Math.min(innerWidth/1280,(innerHeight-40)/720))}
onkeydown=e=>{if(e.key==='ArrowRight'||e.key==='PageDown')go(i+1);if(e.key==='ArrowLeft'||e.key==='PageUp')go(i-1)};
document.querySelectorAll('.chart [data-view-set]').forEach(b=>b.onclick=()=>b.closest('.chart').dataset.view=b.dataset.viewSet);
onresize=fit;fit();go(0);
</script></html>
```

Each slide's `data-section` is its Section's name (`Summary` for `cover`, `exec-summary` and
`last-actions`; `Next month`; `Appendix`; `Notes`), which builds the slide bar. A Share toggle
chart is `<div class="chart" data-view="absolute">` holding the two buttons
(`data-view-set="absolute"`, `data-view-set="share"`), the absolute SVG as `class="v-absolute"`
and the % SVG as `class="v-share"`.

**Neutral default styling.** The skeleton's colours and system font stack are the default. A
brand changes only these roles: ink, paper, accent, the four series colours, the font stack and
the cover's logo text. Up and down colours stay green and red so every deck reads alike.

**Brand tokens.** Where `references/intake.md` resolved a brand, write its values over the
skeleton's custom properties, each role as the intake settled it and every other role as given:
ink to `--ink`, paper to `--paper`, accent to `--accent` (also the cohort shading), the four series
colours to `--s1` to `--s4` in the order the guidelines list them, and the stack to `--font`. The
cover shows the logo text as the brand name set in the accent colour. The page loads no font file,
image or style sheet, so a brand web font is never fetched and its fallback stack is what shows.

## Slides built here

### Cover and Executive summary

**Cover**: the brand name (the logo text, where the brand supplied one), "Monthly performance
review" and the Current period as month and year. No title rule applies.

**Dividers**: the Section's name large on a plain slide, with one line listing what the Section
holds ("Revenue, customers and markets"; "Traffic, channels, campaigns and customer value" for
Acquisition; "Cohorts, repeat buying and lifetime value" for Retention & LTV; "Order value,
products and discounts" for Order value & product). No title rule applies.

**Executive summary**: three columns headed **Performance**, **Read** and **Actions**.
- **Performance**: one line per Section that holds figures, in Section order, each with its
  headline figure and MoM and YoY change ("Trading: revenue £1.2m, +8% MoM, +14% YoY"). A Section
  whose slides are all Brain slots adds no line. The headline figure of Acquisition is new orders
  with blended CAC; of Retention & LTV, the retention at month 1 of the latest cohort to reach it
  against the rolling average (a cohort figure carries no MoM or YoY change); of Order value &
  product, the blended average order value with the discount rate.
- **Read**: two to four sentences saying what moved and by how much, from the Performance
  figures. Where the cause is not known, it says so ("the cause is not yet known"), and never
  guesses one; a Month context replaces that sentence when the user gave one.
- **Actions**: the three Recommendations of Next month, one line each (title and revenue at
  stake), the same three and no others.

**Focus questions lead the Executive summary.** For each Focus slide, in order, **Performance**
opens with one line headed "You asked: `<the question>`" holding the Focus slide's headline figure
with its MoM and YoY change where it has them, and **Read** opens with one sentence answering the
question from the same figures, ahead of the other lines and sentences and in addition to the two to
four.

### Last month's actions (`last-actions`)

Built on every Source, from the previous review's actions the intake settled (up to three, the
cards of its Next month slide), after the Executive summary. A table with one row for each action,
at a smaller type size, columns in this order:

- **Action**: the card's title, with its Section beneath in the muted colour.
- **Metric to watch**: the card's own words.
- **Last month**, **This month** and **Change %**: the metric read like for like. The deck's own
  measure of the same name (blended CAC is CAC on `acq-blended`, new-customer conversion likewise,
  and so on) gives both figures from the slides already read; a metric the deck has no measure for is
  read from the Source on the same basis for the two months. "Last month" is the previous review's
  Current period and "This month" the Current period. A metric the Source cannot give reads "No
  data" in all three cells. The change is a relative %, a delta cell as the comparison rule sets out.
- **Status**: **Done** in the up colour, **Not done** in the down colour, or **Not updated** in the
  muted colour. Not updated means the user has not said yet.
- **Why**: the user's reason beside a Not done ("No reason given" where they gave none); empty for
  Done and Not updated.

Action title: the count of Done against the actions and the metric that moved most, with its
change ("Two of February's three actions were done, and blended CAC fell 8% to £31"); where every
action is Not updated, the count of Not updated in its place ("None of February's three actions is
updated yet, and new-customer conversion, the metric that moved most, rose 9% to 1.2%"). The month
is the previous review's.

Two fixed cases keep the slide's place and replace the table with one line in a muted panel, with
a title of their own:

| Case | Title | Line |
|---|---|---|
| No previous review found, or the file holds no Next month slide | No previous review was found for `<previous month>` | No previous review was found, so there are no actions to check this month. |
| The previous review's Next month held no cards | `<Previous month>`'s review set no actions | The previous review set no actions, so there are none to check this month. |

The slide is never a Brain slot, and is never dropped.

### Focus slide (`focus-1`, `focus-2`)

One for each Focus question, directly after its Section's divider. It answers the question with
the Section's own figures. Its shape, top to bottom:

1. **You asked**: the question in the user's words, in the muted colour, one line.
2. **Action title**: the answer as a full sentence with a figure ("New-customer conversion slipped
   9% to 1.1% as traffic rose 14% and new orders held at 3,100").
3. **Evidence**: one chart or one small table, taken from a slide of its Section that holds the
   figures the question needs, drawn as that slide draws it (24 months with the Current period
   marked for a trend; the comparison columns for a table) and without the Share toggle. Where the
   question needs a figure no slide of its Section holds, one extra query from the Source gives it.
4. **Month context**: the line of that rule, where one bears on the question.
5. **What to do**: one sentence naming the action the answer points to, and the metric that
   shows it worked.

A question the Source cannot answer is written as a Brain slot: its title is "`<the question>`,
answered from your data" and its data is "the data your question needs". The Focus slide's Section
keeps its Recommendations slide as before.

### Trading KPIs (`trading-kpi`)

A KPI table, one row per figure in this order, with the comparison columns:

1. Revenue, on the Revenue basis of `references/sources.md` (the label is the name the brain gives it,
   ex VAT where that file says so)
2. Orders
3. New orders
4. Returning orders
5. Average order value, as `references/sources.md` sets it (Order value & product)
6. Marketing spend
7. MER (revenue ÷ marketing spend)

On a Growth Brain that holds a margin rung, add two rows after MER: the rung's money figure and
its % of revenue, labelled with the margin rung's own name (the rung `references/sources.md` chooses
by its dating, and the lower rung's name where the brain says the two are equal). Revenue leads: margin rows add to the table and never replace a row. Rates (MER,
margin %) change as relative % per the comparison rule.

Action title: the Current period's revenue and its MoM change, with the figure behind the largest
move among orders and order value ("Revenue rose 8% to £1.2m on 5% more orders and a 3% higher order
value").

### Revenue, new vs returning (`trading-revenue`)

Stacked columns, one per month for 24 months: revenue from new customers' orders (series 1) and
from returning customers' orders (series 2), summing to revenue, with the Share toggle. Beside
the chart, a small table of new, returning and total revenue with the comparison columns. Action
title: which of the two moved the total and by how much ("New-customer revenue fell 6% to £480k
while returning-customer revenue grew 17% to £720k").

### Customer base (`trading-customers`)

Columns, one per month for 24 months, no Share toggle. Active, new, reactivated and lapsed are the
brain's definitions, labelled as it names them, with the glossary's where it defines none, which
`references/sources.md` reads from the Customers mart or the orders mart. Above the axis, stacked:
**active customers carried over** (active at the month's end, neither new nor reactivated), **new**
and **reactivated** (ordered in the month, not new, and not active at the previous month's end),
summing to the active customer base at the month's end. Below the axis, one column: **lapsed** (on
the glossary's definition, customers whose 12 months since their last order ended in the month). The Current period is
marked. Beside the chart, a small table of active, new, reactivated and lapsed customers with the
comparison columns. Action title: the size of the active base and the net movement ("The active
customer base grew 3% to 41k as 2,100 new and 600 reactivated customers outran 1,400 lapsing").

### Markets (`trading-markets`, conditional)

Markets side by side as panels: the two markets with the most revenue in the Current period, then
one panel "Other markets" holding the rest (omitted when only two markets hold orders). A market
is the order's shipping country. Each panel is a table with rows revenue, orders, new orders and
average order value, and the comparison columns at a smaller type size; the row labels are shared
at the left. Action title: the market share and the market that moved most ("The UK delivered 78%
of revenue, while the US grew 22% to £180k").

### Trading Recommendations (`trading-recs`)

Up to three Recommendation cards drawn from the Trading slides above, ranked by revenue at
stake, worked one of three ways and the card says which. **Budget gap**: revenue below budget,
sized as the revenue shortfall against budget on the Budget basis (`references/sources.md`,
Budget), so the card names that basis; a Source with no budget has no budget gap. **Market or
customer-type fall**: a market (`trading-markets`) or a customer type (new or returning, on
`trading-revenue`) whose revenue fell, sized as its revenue fall against the same month last year,
or against last month where the Source holds no figure for last year. **AOV fall**: average order
value below the comparison, sized as the Current period's orders times the fall in average order
value, against the same comparison month. A card sized against last year or last month says which.
Action title: the count and the combined revenue at stake with the lead action ("Three
actions are worth about £90k a month, led by recovering new-customer orders").

### Blended traffic, conversion and CAC (`acq-blended`)

Three small charts side by side, 24 months, one measure each and no dual axis: **traffic** as
columns, **new-customer conversion** as a line, and **CAC** as a line, each on its own axis with the
Current period marked. Traffic is named for what the brain's conversion divides by ("users" where it
is per user, else "visits"). Conversion and CAC are the brain's definitions where `list_metrics`
defines them; otherwise conversion is new orders ÷ visits and CAC is blended, all connected ad spend
over all new orders. Beneath, one small table of traffic (under its name), new-customer conversion,
marketing spend, new orders and CAC with the comparison columns (conversion and CAC change as
relative %). Action title: the CAC move with the traffic or conversion move behind it ("Blended
CAC rose 12% to £34 as visits fell 9% and new-customer conversion held at 1.1%"; write "users" for
"visits" where the conversion is per user).

### Channel mix (`acq-channels`)

A table of the Current period's new orders by channel, at a smaller type size, with these columns
in this order: Channel; **new orders** with this month, last month, MoM %, same month last year
and YoY %; **spend** with this month and MoM %; **CAC** with this month and MoM %. No budget
columns. Rows, in this order:

1. Up to ten channels, ranked by new orders in the Current period, ties by higher spend, then by
   channel name in alphabetical order, named as the Source names them. The tie-break decides which
   channel takes the last place of the ten, so the same data always gives the same table.
2. **Other channels**, when more than ten hold new orders: every channel not named above, in each
   period.
3. The **Unknown row**: the new orders no channel claims. It is shown as a row of its own and is
   never spread across the channels or merged into one (not into Direct). It carries no spend, so
   its spend and CAC cells read "No data".
4. **Total**: the Total row's new orders equal New orders on `trading-kpi` and its spend equals
   Marketing spend there, in every period shown; its CAC is the blended CAC.

The channel rows, Other channels and the Unknown row add up to the Total row's new orders in every
period shown, on the same basis as the channel CAC: the brain's, modelled channel credit included
(`references/sources.md`, New orders by channel). A row's CAC is its spend ÷ its new orders; a row with no spend, or no new orders,
reads "No data" in its spend or CAC cells. A platform's own reported conversions never enter these
columns. Action title: the channel with the most new orders, its CAC and the Unknown share ("Paid
search led with 1,100 of 3,100 new orders at a £31 CAC, and 9% of new orders have no known
channel").

### Paid vs organic (`acq-paid-organic`)

A **paid** channel is one the Source's channel grouping marks paid, else one that carries ad spend
in the Current period; an **organic** channel is every other named channel; the Unknown row stays
its own third group. The Current period's classification applies to every month shown, so the
series compare like for like.

On the left, the Current period's new orders as one stacked bar (paid series 1, organic series 2,
Unknown series 4), with the Share toggle: absolute shows new orders, "% of total" rescales the bar
to 100% and labels each group's percentage. On the right, a 12-month line of the **paid share**
(paid new orders ÷ all new orders, the Unknown row in the whole), the Current period marked. The
line is a rate: it sits outside the toggle's chart and reads in percent whichever view is shown.
Beside them, a small table of paid, organic and Unknown new orders and the paid share, with the
comparison columns. Action title: the paid share and how it moved ("Paid channels brought 58% of
new orders, a share 12% above last month's, with 7% from no known channel").

### Top campaigns (`acq-campaigns`)

One slide for each ad platform with spend in the Current period, each a table of its ten named
campaigns with the most new orders, ranked on that, ties by higher spend. Only named campaigns are
ranked. Columns: Campaign; **spend** with
this month and MoM %; **impressions**; **clicks**; **CTR** (clicks ÷ impressions); **new orders**
with this month and MoM %; **CAC** with this month and MoM %. A campaign that did not run last
month reads "New" in its MoM cells; there is no year-ago column, as campaigns rarely last a year.
Beneath the ranking, in this order: a **"No campaign"** row, when the platform holds spend with no
campaign, carrying that spend and its new orders, impressions and clicks; then a last row, "All
`<platform>` campaigns", carrying the platform's totals so the rows above read against their whole.
New orders are the new orders the Source attributes to the campaign, never the
platform's own reported conversions, and a figure it cannot give reads "No data". Action title, one
per slide: the share of the platform's new orders the ranked campaigns carry, with the lead
campaign's CAC, counting named campaigns only, so the "No campaign" row is never in the count
("Ten Meta campaigns delivered 82% of the platform's 3,100 new orders, led by one at a £28 CAC";
"Four Google campaigns delivered 64% of the platform's 900 new orders" where the platform ran four).
Impressions and clicks are joined from the platform's mart on the campaign identifier where both
marts carry one, else on the campaign name; a name match puts the Campaign match by name caveat in
the Notes.

### LTV by acquisition channel (`acq-ltv-channel`)

Ranked horizontal bars, highest first, of **12-month LTV** for each acquisition channel, an all-customer
bar marked, the **LTV window** below. Bars, axis and column header name the brain's LTV measure
("12-month margin per customer" where its LTV is margin). Beside the bars a small table with the columns: Channel;
customers; 12-month LTV; the same figure a year earlier; change %. This slide has no this month or
last month column, since LTV is read on a cohort window. A channel's customers are those whose
first order the Source places on that channel; customers it places on none are an Unknown bar, never
spread. Action title: the best and worst channel's LTV and the gap ("Email-won customers are worth
£210 in their first year, 2.4 times the £88 of customers won on paid social"; add the measure's
name where it is not revenue, "£210 of margin").

**LTV window.** The LTV slides here and in the Appendix read customers whose first order fell in the
12 months ending with the same month a year before the Current period, so every customer has 12
months behind them. A customer's **12-month LTV** is their cumulative value through the end of the
12th calendar month after their first-order month, first order included: the brain's LTV measure
(margin where it defines LTV as margin) on the brain's own grain, else revenue on the revenue basis
of `trading-kpi`; a group's LTV is the sum over its customers divided by their number. The comparison is
the 12 months ending a year earlier, on the same definition; a window the history does not reach
reads "No data". A group of fewer than 30 customers joins one "Other" bar, so no ranking rests on a
handful of customers. The Notes state the LTV definition used.

### Acquisition Recommendations (`acq-recs`)

Up to three Recommendation cards drawn from the Acquisition slides, ranked by revenue at stake,
worked one of two ways and the card says which. **CAC gap**: a paid channel whose CAC sits above the
reference CAC, sized as the new orders its spend would buy at the reference CAC, less the new orders it
delivered, times the Current period's new-customer order value (new-customer revenue ÷ new orders on
`trading-revenue`). The reference CAC is the brain's CAC target where it holds one (a metric, or
the budget mart's budget for CAC), else **paid CAC**: paid channels' spend ÷ paid channels' new
orders, on the basis of the channel rows. Blended CAC is never the reference, since it includes
organic new orders that cost no spend and puts every paid channel above it. A channel at or below
the reference has no gap. **LTV gap**: a channel whose 12-month LTV sits below the all-customer figure,
sized as its Current period new orders times that gap per customer; where the brain's LTV is not
revenue, the gap is in that measure, so the card says so and its revenue at stake is worked on the
Revenue basis from the same customers. Action title: as `trading-recs`.

### Cohort retention (`ret-cohort`)

A **cohort** is the customers whose first order fell in one calendar month. A shaded table with one
row for each of the last 12 monthly cohorts (the Current period's cohort last), labelled by month,
a Customers column with the cohort's size, then columns for months 0 to 12 after the first-order
month, holding the **retention %**: the brain's retention measure where `list_metrics` defines one, else the
share of the cohort that ordered in that month. Month 0 is
100% by definition and unshaded; months 1 to 12 are shaded on one scale from the accent colour at
the lowest cell to its darkest at the highest. An age a cohort has not yet reached is left empty,
an exception to the cell rule, so the table reads as a staircase. A final row, **Rolling
average**, holds for each age the retained customers ÷ the customers of the 12 most recent
cohorts to have reached it (those cohorts can include ones older than the 12 shown). The Current
period's cohort size equals New orders on `trading-kpi` where the cohort mart counts every order
and the glossary's New customer holds; a mart that counts customers only carries the Cohort count
caveat.
No comparison columns: the rows compare the cohorts. Action title: the **latest cohort to have
reached month 1** (the Current period's cohort is at month 0, so it is never the one named), its
month 1 retention against the Rolling average row's month 1 cell, the same comparison the Executive
summary headlines ("The latest cohort to reach month 1, March's, retained 21% of its customers, 8%
above the rolling average").

### Cohort LTV (`ret-ltv`)

Cumulative lines of **LTV per customer** (the brain's LTV measure, named on the axis and in the
title, "margin per customer" where it is margin; the glossary's revenue per customer where the
brain defines none) by months since first order, 0 to 12, one thin line
for each of the last 12 cohorts, each drawn as far as it has aged: the three most recent in series 3
so the latest buying stands out, the rest in series 2, and the **rolling average** of the heatmap
slide (the 12 most recent cohorts to have reached each age, weighted by customers) in bold series 1.
Axes carry the currency and the month's age. Beside the chart, a small table of months 0, 3, 6 and
12 with the columns: Age; the latest cohort to have reached that age (named); rolling average;
difference %. Action title: the latest cohort's cumulative LTV per customer against the average
at the age shown ("By month 6 the latest cohort has earned £62 of margin per customer, 9% below
the £68 rolling average"; "revenue" for "margin" where the glossary's LTV holds).

### Subscription mix (`ret-subscriptions`, conditional)

A line, 24 months, of **new subscription orders as % of new orders** (a new order is a customer's
first order; a subscription order is one the Source flags as a subscription), the Current period
marked, no Share toggle. Beside it, a small table of new subscription orders, new orders and the
subscription share of new orders, with the comparison columns (the share changes as relative %).
Action title: the share and its move ("Subscriptions made up 18% of new orders, 29% above last
month's 14%").

### Retention & LTV Recommendations (`ret-recs`)

Up to three Recommendation cards drawn from the Retention & LTV slides, ranked by revenue at stake,
worked as the Current period's new orders times the per-customer gap in cumulative LTV (converted to revenue on the Revenue basis where the brain's LTV is not revenue) between
the rolling average and the cohort in question, at the oldest age that cohort has reached. Action
title: as `trading-recs`.

### Next month (`next-month`)

The top three Recommendation cards across every Section that has them, ranked by revenue at stake,
each card as above with its Section named. Each of the three is a **distinct gap**: where two cards
size the same gap, or one gap sits inside another (a market's fall inside the revenue shortfall
against budget, or an AOV fall inside a revenue gap), only the larger reaches Next month and the
next distinct card, by revenue at stake, takes its place. Cards sized on a different measure or a
different part of the business are distinct. Fewer than three distinct Recommendations exist: show
those that do. Action title: the combined revenue at stake and the lead action. These three cards
are the actions next month's review checks.

### Appendix: LTV by order category and by order type (`app-ltv-category`, `app-ltv-type`)

Brain only. Ranked horizontal bars, highest first, of 12-month LTV, an all-customer bar marked, on
the LTV window of `acq-ltv-channel`, grouped by the category (`app-ltv-category`) or the type
(`app-ltv-type`, for example subscription or one-off) of the customer's **first order**, as the
Source holds it on the order. Beside the bars the same small table as `acq-ltv-channel` with
Category or Type in place of Channel. Customers with no category or type are an Unknown bar. Action
title: the best and worst group's LTV and the gap, as `acq-ltv-channel`.

### Appendix: line items (`app-line-items`)

Brain only. A table of the 15 product and variant lines with the most revenue in the Current
period, ranked on that, ties by units. Columns: Product; Variant; **units** with this month and MoM
%; **revenue** with the comparison columns. Two last rows: "All other lines" and Total, the line
items' own total. A one-line footnote reads "Line-item revenue is read from your line items, so it
can differ from Revenue on the Trading KPIs, which is read from your orders." Action title: the
share of line-item revenue the 15 carry and the lead line ("Fifteen lines carried 58% of line-item
revenue, led by one at £96k").

### AOV, new / returning / blended (`aov-trend`)

Three lines, one per month for 24 months, on one axis since all three are order value in the same
currency: **blended** AOV (Average order value on `trading-kpi`, bold, series 1), **new-customer** AOV (new-customer
revenue ÷ new orders, series 3) and **returning-customer** AOV (returning-customer revenue ÷
returning orders, series 2), the Current period marked on each. Revenue is on the basis of
`trading-kpi` and the new and returning split is that of `trading-revenue`, so the blended line
equals Average order value on `trading-kpi` in every month. Beside the chart, a small table of the
three AOVs with the comparison columns (AOV changes as relative %). No Share toggle: AOV is a rate.
Action title: the blended AOV and its move, with the customer type that moved it ("Average order
value rose 4% to £62, as new customers' orders reached £54 and returning customers' £68").

### Product and category mix (`aov-product`)

A table above a chart; the grouping is the order's **category**.

**Category.** The category the Source holds on the order. Where the orders carry none and the order
items carry a product category, an order's category is that of its highest-revenue line (ties by the
line listed first), so every order sits in one category and the rows add up. Orders with no category
are the row **No category**, never spread. A Source with neither makes the slide a Brain slot, and
the Notes name it.

**Table**, at a smaller type size, ranked by orders in the Current period. Rows, in this order:

1. Up to six categories.
2. **Other categories**, when more than six hold orders: every category not named above, in each
   period.
3. **No category**, when any order has none.
4. **Total**: orders equal Orders and sales equal Revenue on `trading-kpi`, new and returning orders
   equal theirs, and the rows above add up to it.

Columns, in this order: Category; **orders**, **new orders**, **returning orders**, **sales** (revenue
on the basis of `trading-kpi`) and **AOV** (sales ÷ orders), each with this month and MoM %; **share of
sales** (the row's sales ÷ the Total row's) with this month and MoM %. A category that had no orders
last month reads "New" in its MoM cells; a row with no orders reads "No data" in its AOV cells. There
is no year-ago column: the table holds too many measures, and the chart carries the history.

**Chart**, below the table: stacked columns of sales by category, one per month for 24 months, the
Current period marked, the three categories with the most sales in the Current period as series 1
to 3 and every other category and No category as series 4, **with the Share toggle**: absolute shows
sales, "% of total" rescales each month to 100% and labels the percentages. The Current period's
classification applies to every month shown, so the months compare like for like, and each month's
columns add up to that month's revenue.

Action title: the lead category's share of sales and the category that moved most ("Skincare carried
38% of sales, while haircare grew 21% to £140k").

### Discount impact (`aov-discount`)

A **discounted order** is an order that carries a discount, as the Source holds it on the order.
Three small charts side by side, 24 months, one measure each, none sharing an axis, the Current
period marked:

- **Discount rate** (discounted orders ÷ orders) as a line, in percent.
- **Discount depth** (discount given on discounted orders ÷ their value before discount) as columns,
  in percent.
- **Discounted vs full-price orders** as stacked columns of order counts (full-price series 1,
  discounted series 3), **with the Share toggle**: absolute shows orders, "% of total" rescales each
  month to 100% and labels the percentages. The toggle sits on this chart only: the rate and the
  depth are rates and carry none.

Beneath, a small table with the rows discounted orders, full-price orders, discount rate, discount
depth and discount given (the money), with the comparison columns (the rate and the depth change as
relative %). Where the Source defines either rate or depth in its own metrics, its definition wins
and the Notes state it. Action title: the discount rate and depth and how they moved ("Discounts
touched 31% of orders at an average depth of 18%, with the rate up 15% on last month").

### Discount codes (`aov-codes`, conditional)

A table of the codes used in the Current period, at a smaller type size, ranked by orders, ties by
revenue. A row is a **code group** where the Source's orders carry a code group column
(`references/sources.md`), so a month of single-use codes reads as a handful of groups; otherwise a
row is a code. An order counts under the group or code the Source holds on it, a code matched
ignoring case and spaces. Rows, in this order:

1. Up to ten code groups, or codes.
2. **All other codes** (**All other code groups** on a grouped table), when more than ten were used:
   every group or code not named above, in each period.
3. **Total**: every order that carries a code, which the rows above add up to.

Columns, in this order: Code (Code group on a grouped table); **orders** with this month and MoM %;
**revenue** (on the basis of
`trading-kpi`) with this month and MoM %; **discount given** with this month and MoM %; **depth**
(discount given ÷ the orders' value before discount) with this month; **share of orders** (the row's
orders ÷ all orders of the month). A row for a free-shipping code, or whose depth works out at 0%,
reads "free shipping" in its depth cell, never 0%. A row that was not used last month reads "New" in
its MoM cells;
there is no year-ago column, as codes rarely last a year. A Source that holds discounts but no code
on the order writes the slide as a Brain slot, and the Notes name it. Action title: the row with the
most orders and its depth ("free shipping" in place of a depth for a free-shipping row), with the
share of orders that used a code ("One welcome code brought 1,200
orders at a 10% depth, and codes touched 24% of all orders").

### Order value & product Recommendations (`aov-recs`)

Up to three Recommendation cards drawn from the Order value & product slides, ranked by revenue at
stake, worked one of four ways and the card says which. **AOV slip**: new-customer or
returning-customer AOV below last month's, sized as that group's Current period orders times the
fall. **Category gap**: a category in the table whose AOV sits below the blended AOV, sized as its
Current period orders times the gap. **Discount creep**: a discount depth above last month's, sized
as the discount given in the Current period less what last month's depth would have given on the same
discounted orders' value. **Code depth**: a code whose depth sits above the depth of all codes,
sized the same way against the all-codes depth; a free-shipping row has no depth and is not sized.
Action title: as `trading-recs`.

### Notes (`notes`)

No Action title. Three headings, always present, in this order:

1. **Sources**: what was read from where, in plain words ("Revenue, orders and customers: your
   orders. Marketing spend: your sales and ad spend by channel. Budget: your budget."), led, when
   several Growth Brains were connected, by "Read from `<the Growth Brain's name>`.". Without a Growth Brain, each connector or
   file read and the figures it gave ("Orders and customers: your Shopify connector. Marketing
   spend: your Google Ads export."), and the platforms marketing spend covers.
2. **Definitions**: with a Growth Brain, one line saying the brain's own definitions are used, then
   the definition of each measure on the deck as that brain gives it (revenue and its basis, new
   customer, new-customer conversion and what it divides by, active, lapsed, reactivated and the mart
   they read, CAC overall and by channel, retention, LTV and its unit, the margin rung), a
   glossary definition marked as such where the brain defines none, the channels counted as paid, and where the deck holds a budget, the Budget basis. Revenue is stated as the
   Revenue basis under the brain's name for it, with the AOV metric it comes from or, where the
   brain defines none, that it is the brain's revenue metric. Without one, the glossary's definitions of New customer, CAC, Active customer,
   Lapsed customer, LTV and Unknown row, as written there.
3. **Caveats**: one line each, where it applies, in this wording:

| Caveat | Wording |
|---|---|
| Days | Days are read in `<timezone>`. Where the brain says only that dates are the store's own timezone: Days are read in your store's own timezone, as your orders record them. |
| Currency | Amounts are in `<currency>`. Where no Source states one: Amounts are in the currency your orders are recorded in. |
| Test orders | Test orders are left out. |
| Cancelled orders | Cancelled orders are `<left out / counted / not stated>`, as your orders record them. |
| Returns | Returns are booked on the `<order / refund>` date, so the latest months' revenue can still change as returns arrive. Where the Revenue basis is before returns: `<Revenue name>` is before returns, so the latest months can still change as returns arrive. |
| Budget basis, where it differs from the Revenue basis | Budget is set on `<basis>`, so the budget column compares your `<basis>` against it, not the revenue above. |
| Orders not fully costed, where your orders flag them | `<n>` orders (`<share>` of revenue) include a product that has no cost yet. They are counted in every figure. With margin rows, add: Their `<rung>` % is taken to be the same as for your other orders. Where `<n>` is 1: 1 order (`<share>` of revenue) includes a product that has no cost yet. It is counted in every figure. With margin rows, add: Its `<rung>` % is taken to be the same as for your other orders. |
| Margin, with margin rows on a rung dated by order | `<Rung>` % is the margin rate your Growth Brain publishes, dated by order, and `<rung>` is that rate applied to all revenue, so it can differ from a `<rung>` your Growth Brain or a dashboard adds up order by order. Where your Growth Brain publishes no such rate on this revenue, `<rung>` % is `<rung>` divided by revenue on your fully costed orders. |
| Mixed-dated margin, with margin rows on a rung dated partly by refund | Your `<plain name of the mart>` dates `<rung>` partly by refund, so `<rung>` % can swing from month to month with the timing of refunds. `<Rung>` is that % applied to all revenue, so it can differ from a `<rung>` your Growth Brain or a dashboard adds up order by order. |
| Equal rungs, where the brain says the chosen rung equals the one below | Your Growth Brain holds `<higher rung>` equal to `<lower rung>` (`<its reason in plain words>`), so the margin rows are labelled `<lower rung>`. |
| Thin costing, where the share of fully costed revenue falls sharply in the history shown | Costs are recorded from `<month>`, so margin before then, and year-on-year margin LTV, is not like for like. Where LTV is revenue, read: Costs are recorded from `<month>`, so margin before then is not like for like. |
| Cohort count, where the cohort mart counts customers | The cohorts count customers, leaving out guest orders, so a cohort can differ from the month's new orders. |
| Brain warning, one line for each | Your Growth Brain warns: `<the warning, trimmed to one sentence, with its date>`. |
| Campaign match by name, where a platform mart's campaigns are joined to channel reporting on the name | Campaigns are matched by name between your `<platform>` data and your channel reporting, so a renamed campaign can read "No data" for impressions and clicks. |
| History | The history starts in `<month>`, so trend charts are shorter than 24 months. |
| A missing source | `<Slides>` could not be built because your Growth Brain holds no `<plain name>`. |
| Modelled channels, where channel CAC reads modelled credit | Channels are credited as your Growth Brain models them, so a channel's new orders are its modelled credit and can differ from the orders your orders record against it. |
| Definition fallback, where a definition cannot be read | Your Growth Brain defines `<measure>` from `<plain name of the data>`, which this review cannot read, so `<measure>` is read as `<its plain glossary definition>` from your orders. |
| Channel total | The channels' new orders exceed your orders' new orders by `<n>`, so the Unknown row reads 0. |
| Tracking change | You told us `<the tracking change>`, so comparisons across it may not be like for like. |
| Spend platforms (no brain) | Marketing spend covers `<platforms>` only. |
| A connector not read (no brain) | Your `<platform>` `<connector / account>` was not read: `<it refused the read / it could not be told to be your brand's / it reports in a different currency>`. |
| Channel placement (no brain) | Channels are placed from the UTM and referrer data on your Shopify orders, so an order without them is in the Unknown row and a channel's CAC can read high. |
| Customer IDs (no brain) | `<share>` of orders carry no customer ID, so each counts as a new customer of its own. |
| Test orders in an export (no brain) | Your export does not flag test orders, so none are left out. |

The Thin costing caveat applies where margin is shown (margin rows or margin LTV) and the share of
fully costed revenue, read for each month of the 24-month series, is below half the Current period's
share in an earlier month; `<month>` is the first month whose share is at least half the Current
period's. The Cohort count caveat applies whenever the cohort mart is read and its Current period
cohort size does not equal New orders, or its description says it counts customers or does not say
it counts every order. A Brain warning is quoted whenever `references/sources.md` found one that
touches the Current period or a Comparison period, with no Month context needed.

The caveat for returns takes "order" for order rows and "refund" for the sales over time report. On a
run without a Growth Brain, the **Brain line** closes the Notes, once and in these words: "A
Growth Brain adds every view in this review from one source: channels and campaigns, cohorts, LTV
and margin. Get one at gocrux.io/contact." It is the last line of the Notes, said nowhere else on
the page (the Brain slots carry their own fixed line). A run with a Growth Brain never carries it.

## Slides without a Growth Brain

On the ad account and Shopify connectors or CSV exports, every slide of the slide list is still
built, in the same order: a slide its Source can fill is drawn as specified above, and the rest are
Brain slots. **Order rows** and **reports** are those of `references/sources.md`, Connectors and
exports, which also sets how each figure is read. A slide that is built but lacks one of its
figures shows "No data" in that cell or panel, and never a guess. No slide here carries budget
columns or margin rows, since no such Source holds either.

| Id | Filled without a brain by | Brain slot when |
|---|---|---|
| `trading-kpi` | order rows or the sales over time report; spend rows and MER from the ad platforms read | no orders Source |
| `trading-revenue` | order rows by customer ID, else sales over time by customer type | no orders Source |
| `trading-customers` | order rows with customer IDs and history | no customer IDs, or the 12-month history limit leaves no month |
| `trading-markets` | order rows with a shipping country (conditional) | no order rows |
| `trading-recs` | the Trading slides built | all Trading slides are Brain slots |
| `acq-blended` | sessions over time for traffic and conversion; connected ad spend and new orders for CAC; each panel reads "No data" for what is not held | neither visits nor ad spend is held |
| `acq-channels` | order rows with UTM or referrer, spend from the ad platforms read (spend and CAC read "No data" for a channel with none) | no order row carries UTM or referrer |
| `acq-paid-organic` | the channel placement of `acq-channels` | `acq-channels` is a Brain slot |
| `acq-campaigns` | one slide for each connected ad platform whose campaign report is held and whose campaigns match Shopify new orders on UTM campaign | no ad platform report is held, or no campaign matches an order |
| `acq-ltv-channel` | order rows with customer IDs, history for the LTV window and UTM or referrer | any of the three is missing |
| `acq-recs` | the Acquisition slides built | all Acquisition slides are Brain slots |
| `ret-cohort` | order rows with customer IDs and history | no customer IDs, or too little history for a cohort |
| `ret-ltv` | as `ret-cohort` | as `ret-cohort` |
| `ret-subscriptions` | order rows with a subscription flag (conditional) | no order row carries a flag |
| `ret-recs` | the Retention & LTV slides built | all Retention & LTV slides are Brain slots |
| `aov-trend` | order rows by customer ID, else sales over time by customer type | no orders Source |
| `aov-product` | order rows with a category, from the products file or connector | no order or no category |
| `aov-discount` | order rows with a discount amount | no discount column |
| `aov-codes` | order rows with a discount code (conditional) | discounts present, no code column |
| `aov-recs` | the Order value & product slides built | all of them are Brain slots |
| `app-ltv-category`, `app-ltv-type`, `app-line-items` | never | always |

`last-actions` reads each action's metric from the deck's own measures for the two months, and
"No data" where the Source cannot give it. Conditional slides follow the conditional rule above,
and a Section keeps its divider and its Recommendations slot whatever its slides.

The Brain slot of a slide the Source could not fill carries the fixed line below, whichever Source
was tried; the Brain line, once, closes the Notes (see Notes above) and the chat names the count.

## Brain slot wording

The title is the slide's Action title when it is a Brain slot, and the data fills the fixed line.
A slide built here uses these only when its Source cannot fill it.

| Id | Title | Data |
|---|---|---|
| `trading-kpi` | Revenue, orders, new orders, spend and margin against last month, last year and budget | your orders, ad spend and budget |
| `trading-revenue` | Revenue from new and returning customers, month by month for 24 months | your orders by customer type |
| `trading-customers` | The active customer base each month, with new, reactivated and lapsed customers | your customers' order history |
| `trading-markets` | Revenue, orders and order value for each market side by side | your orders by market |
| `trading-recs` | Up to three Trading actions, each with its evidence and how to validate it | the Trading slides' data |
| `acq-blended` | Traffic, new-customer conversion and CAC, month by month for 24 months | your traffic, orders and ad spend by month |
| `acq-channels` | New orders, spend and CAC by channel, against last month | your orders and ad spend by channel |
| `acq-paid-organic` | The paid and organic share of new orders, now and over the last 12 months | your orders by channel |
| `acq-campaigns` | The top 10 campaigns on each connected ad platform | your ad platform campaign reports |
| `acq-ltv-channel` | LTV by acquisition channel, ranked | your customers' order history by acquisition channel |
| `acq-recs` | Up to three Acquisition actions, each with its evidence and how to validate it | the Acquisition slides' data |
| `ret-cohort` | How many of each of the last 12 monthly cohorts ordered again, months 0 to 12 | your customers' order history by first-order month |
| `ret-ltv` | Each cohort's cumulative LTV per customer against the average | your customers' order history by first-order month |
| `ret-subscriptions` | The subscription share of new orders over 24 months | your orders by subscription |
| `ret-recs` | Up to three Retention & LTV actions, each with its evidence and how to validate it | the Retention & LTV slides' data |
| `aov-trend` | Average order value for new, returning and all customers over 24 months | your orders by customer type |
| `aov-product` | The product and category mix of revenue, against last month | your orders by product category |
| `aov-discount` | Discounted against full-price orders, with discount rate and depth | your orders with their discounts |
| `aov-codes` | Orders, revenue and discount by discount code | your orders by discount code |
| `aov-recs` | Up to three Order value & product actions, each with its evidence and how to validate it | the Order value & product slides' data |
| `app-ltv-category` | LTV by the category of a customer's first order | your customers' order history by first-order category |
| `app-ltv-type` | LTV by the type of a customer's first order | your customers' order history by first-order type |
| `app-line-items` | Units and revenue by product and variant for the month | your order line items |

The `cover`, the dividers, `exec-summary`, `last-actions`, `next-month` and `notes` are never Brain slots. A
Section whose slides are all Brain slots keeps its divider and its Recommendations slot.
