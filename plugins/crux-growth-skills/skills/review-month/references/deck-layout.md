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
holds a figure, "No data" (the Source holds nothing for it), "New" (the comparison figure is
zero) or "Not comparable" (a Brain warning rules the comparison out), never a bare "n/a"; the cohort table and `last-actions` name their own empty cells.

## The slide list

Slide ids are stable names for the build; a slide's position follows the order below, so a dropped
conditional slide moves the later ones up. A **Focus question** adds one slide directly after its
Section's divider, with an Action title of its own.

| Id | Slide | Layout | Evidence | Share toggle | Built |
|---|---|---|---|---|---|
| `cover` | Cover | cover | brand name, "Monthly performance review", the Current period as "March 2026" | no | here |
| `exec-summary` | Executive summary | text slide | four headline figures with their deltas, three numbered takeaways | no | here |
| `last-actions` | Last month's actions | cards slide | table of actions | no | here |
| `trading-divider` | Trading | section divider | verdict, contents | no | here |
| `trading-kpi` | Trading KPIs | stat slide | Stat row of four | no | here |
| `trading-revenue` | Revenue, new vs returning | chart slide | stacked columns, 24 months | yes | here |
| `trading-customers` | Customer base | chart slide | columns above and below the axis, 24 months | no | here |
| `trading-markets` | Markets (conditional) | chart slide | ranked bars, top 5 markets | no | here |
| `trading-recs` | Trading Recommendations | cards slide | up to three cards | no | here |
| `acq-divider` | Acquisition | section divider | verdict, contents | no | here |
| `acq-blended` | Blended conversion and CAC | chart slide | two small line charts, 24 months | no | here |
| `acq-channels` | Channel mix | chart slide | horizontal bars of new orders, top 5 channels and the Unknown row, CAC on each | no | here |
| `acq-paid-organic` | Paid vs organic | chart slide | stacked columns, 12 months | yes | here |
| `acq-campaigns` | Top campaigns, one slide per connected ad platform | chart slide | horizontal bars, top 5 campaigns, CAC on each | no | here |
| `acq-ltv-channel` | LTV by acquisition channel | chart slide | ranked horizontal bars, the all-customer LTV marked | no | here |
| `acq-recs` | Acquisition Recommendations | cards slide | up to three cards | no | here |
| `ret-divider` | Retention & LTV | section divider | verdict, contents | no | here |
| `ret-cohort` | Cohort retention | chart slide | retention curves of the 6 latest cohorts, the rolling average in bold | no | here |
| `ret-ltv` | Cohort LTV against the average | chart slide | two cumulative lines: the latest cohort and the rolling average | no | here |
| `ret-subscriptions` | Subscription mix (conditional) | chart slide | stacked columns, 24 months | no | here |
| `ret-recs` | Retention & LTV Recommendations | cards slide | up to three cards | no | here |
| `aov-divider` | Order value & product | section divider | verdict, contents | no | here |
| `aov-trend` | AOV, new / returning / blended | chart slide | three lines, 24 months | no | here |
| `aov-product` | Product and category mix | chart slide | horizontal bars of sales, top 5 categories | yes | here |
| `aov-discount` | Discount impact | chart slide | three small charts: discount rate line, discount depth columns, discounted vs full-price stacked columns | yes, on discounted vs full-price orders only | here |
| `aov-codes` | Discount codes (conditional) | chart slide | horizontal bars of orders, top 5 codes or code groups | no | here |
| `aov-recs` | Order value & product Recommendations | cards slide | up to three cards | no | here |
| `next-month` | Next month | cards slide | top three cards across Sections | no | here |
| `app-trading-kpi` | Appendix: Trading KPIs | table slide | the full KPI table | no | here |
| `app-trading-markets` | Appendix: Markets (conditional) | table slide | every market | no | here |
| `app-acq-channels` | Appendix: Channel mix | table slide | every channel, with spend and CAC | no | here |
| `app-acq-campaigns` | Appendix: Top campaigns, one slide per connected ad platform | table slide | the platform's top 10 campaigns | no | here |
| `app-acq-ltv-channel` | Appendix: LTV by acquisition channel | table slide | every channel's LTV | no | here |
| `app-ret-cohort` | Appendix: Cohort retention | table slide | shaded table, 12 cohorts by months 0 to 12 | no | here |
| `app-ret-ltv` | Appendix: Cohort LTV | table slide | LTV per customer of 12 cohorts, months 0 to 12 | no | here |
| `app-aov-product` | Appendix: Product and category mix | table slide | every category | no | here |
| `app-aov-codes` | Appendix: Discount codes (conditional) | table slide | the top 10 codes or code groups | no | here |
| `app-ltv-category` | Appendix: LTV by order category | table slide | ranked table | no | here, brain only |
| `app-ltv-type` | Appendix: LTV by order type | table slide | ranked table | no | here, brain only |
| `app-line-items` | Appendix: line items | table slide | table | no | here, brain only |
| `notes` | Notes | text slide | Sources, definitions, caveats | no | here |

The Appendix table slides stand in the order of the main slides they come from (`app-trading-kpi`
and `app-trading-markets` for Trading, then `app-acq-channels`, `app-acq-campaigns` and
`app-acq-ltv-channel`, `app-ret-cohort` and `app-ret-ltv`, `app-aov-product` and `app-aov-codes`),
ahead of the slides that are Appendix only. Each is a Brain slot when its main slide is, and
`app-trading-markets` and `app-aov-codes` are dropped when `trading-markets` and `aov-codes` are.
`app-acq-campaigns` repeats once for each platform `acq-campaigns` does, in the same order. Every
chart slide above whose table moved to the Appendix says so in its source line.

**Focus slides.** Each Focus question the intake settled adds one slide, `focus-1` and `focus-2`,
directly after its Section's divider, in the order the questions were given; its `data-section` is
that Section's. A run with no Focus question has none. The Focus slide is a chart slide and carries no Share toggle.

"Built: here" means this file specifies the slide in full below. On a Growth Brain it is built
from the brain, and where a mart the slide reads is missing from the roster it is written as its
Brain slot (**Brain slot wording** below). On the ad account and Shopify connectors or CSV exports
it is built where **Slides without a Growth Brain** below says that Source fills it, and written as
its Brain slot where it does not. "Here, brain only" is a slide no other Source fills: it is a
Brain slot on every run without a Growth Brain, whatever the connectors hold (ADR-0002). An
Appendix table slide with no "brain only" is built wherever its main slide is.
`last-actions` is built on every Source, since it reads the previous review and not a Growth
Brain. The campaigns slide and its Appendix slide repeat once per connected ad platform.

## Rules every slide follows

**Action title.** Every content slide (all but `cover`, the dividers and `notes`) opens on one:
a full sentence with at least one figure from the slide, at most two lines at the title size
(about 110 characters), stating the takeaway, never the topic. The one exception is
`last-actions` when no previous review was found, whose title names the missing month instead. Write each title last, from the
slide's own figures: "Revenue rose 8% to £1.2m as returning customers carried the month", not
"Revenue trend". A title states what the figures show and no cause the Month context or the data
does not support.

**Takeaway panel.** Every data slide (a stat slide or a chart slide) carries one in its right third,
as `references/slide-craft.md` sets out: up to three lines under the labels **So what**, **Why** and
**Watch**, about 35 words in all, written last from the slide's own figures. Its So what never
restates the Action title; its Why is left out where neither the data nor the Month context shows a
cause, and draws on the Month context where one bears on the slide; its Watch names one figure and
the level that matters. It states no Recommendation. A table slide, a divider, a cards slide, a text
slide and a Brain slot carry none.

**Month context.** Where the intake settled a Month context that bears on a slide's figures (a
promotion on the revenue slides, a stockout on a category, a tracking change on traffic and
channels), the slide carries it in place of any guessed cause. A stat or chart slide puts it in the
Why of its Takeaway panel, in the user's words trimmed to a clause and followed by "(your note)"; any
other slide carries it as one line beneath its content, "You told us: `<the user's words, trimmed to
one sentence>`.". The Executive summary's takeaways use it the same way. A slide it does not bear on
carries no such line.

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

"gocrux.io/contact" links to https://gocrux.io/contact. A slot takes the Layout of the slide it
stands in for (a chart slide's slot is a chart slide's, an Appendix table slide's a table
slide's) and keeps that Layout's header, the Action title above all. It replaces the Layout's
evidence with the fixed line in a muted panel (`.slot`) filling the evidence area, and carries no
Takeaway panel and no source line; its footer is the same as any slide's. Each of the two lines is
fixed, and the second belongs only to a run with a Growth Brain.

**Conditional slides** (`trading-markets` and its `app-trading-markets`, `ret-subscriptions`, `aov-codes` and its `app-aov-codes`) exist only when the
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
views as inline SVG (the % view is each column or stacked bar rescaled to a whole of 100%, labelled with
its percentages; on `aov-product`'s ranked bars it is each bar's share of the whole, the bars adding
up to 100%) and the script shows one. Only the four charts marked "yes" carry it: never a
rate (conversion, CAC, AOV, discount rate, LTV) and never the customer base. A printed page shows
the view on screen.

**Comparison columns.** Every table slide, and the table of `last-actions`, carries these columns in
this order: this month, last month, MoM %, same month last year, YoY %. Add budget and v budget %
(after YoY %) only where the Source holds a budget, on the rows it holds one for; a Source with no
budget carries no budget column. A **Stat row** figure carries the same deltas beneath it as
labelled lines: MoM, YoY and, only where the Source holds a budget, v budget; a Source with no
budget carries no v budget line. A chart slide carries no side table: its figures sit in its Action
title, its labels and its Takeaway panel. A budget figure is read as `references/sources.md`
(Budget) sets out, which also says when it reads "No data"; v budget % is not the figure against
the budget unless the two bases match, and the Budget basis caveat says so where they do not. The
Current period supplies "this month"; the Comparison periods are as `references/sources.md` sets
out. Every % change is relative: a rate that moves from 2.0% to 1.8% reads "−10%". A year-ago
figure the Source does not reach reads "No data". Where a Brain warning (`references/sources.md`,
Brain warnings) says a Comparison period's figure is not comparable with the Current period's (for
example attribution changed mid-month), every delta against that Comparison period on that figure (a
table cell, a Stat row line, a bar's change) reads "Not comparable", with no ▲ or ▼ and no colour,
and no Action title or Recommendation rests on it. Show a change to the nearest whole % at 10% or
more and to one decimal below it. A delta carries ▲ or ▼ and is coloured: the up colour for a rise,
the down colour for a fall, neutral for no change. A marketing spend figure is always neutral,
since spend rising is neither good nor bad alone. A CAC figure is coloured by whether the move is
good: a fall takes the up colour and a rise the down colour, with ▲ or ▼ still showing the
direction. A slide that states its own columns below (`app-trading-markets`, `app-acq-channels`,
`app-acq-campaigns`, `app-acq-ltv-channel`, `app-ret-cohort`, `app-ret-ltv`, the LTV Appendix
slides, `app-line-items`, `app-aov-product`, `app-aov-codes`) uses those: it holds too many
measures for five columns each, or reads a cohort window rather than a month.

**Busy tables.** No main slide holds a table of more than about 6 rows or 5 columns: the full table
of `acq-channels`, `acq-campaigns`, `acq-ltv-channel`, `ret-cohort`, `ret-ltv`, `aov-product` and
`aov-codes` (as `trading-kpi` and `trading-markets` do before them) moves whole to its Appendix
table slide, `app-<slide id>`, and the chart slide keeps the one piece of evidence its section sets
out, with the Takeaway panel. Every other chart slide holds no table. The source line of that chart slide says so ("The full channel table is in the Appendix.")
and, where the chart shows the top 5 of more, how many there are in all.

**Appendix table slides.** Each is a table slide (`.slide.table-slide` with `table.kpi`, and
`dense` on a table of more than 9 rows), built from the same figures as its main slide so the two
agree to the digit. Its Action title is a sentence of its own about the whole table, with a figure
(how many rows there are and what the main slide's rows carry, or the range the table spans), never
the main slide's title again. The row the main slide's Action title names is the highlighted row. It
carries no Takeaway panel, a source line, and the comparison columns or its own stated below.

**Trend charts.** Show 24 months ending with the Current period, or as far back as the Source
goes (the Notes say when the history starts). The Current period's column or point is marked.
Label axes with the unit and currency, and each chart with a `title` element stating its message
in a sentence. **No dual axes**: two measures on different scales are two small charts side by
side.

**Recommendation card.** A card has, on its face, a short title, one evidence figure and the
action; in a footer, the metric to watch and how to validate it: Test, Watch next month or Ship.
A Section's Recommendations slide holds up to three cards, ranked by revenue at stake: the revenue
the action could plausibly recover in a month, worked from the Section's own figures as that
Section's spec sets out. A card is sized on the move it makes, its own segment's gap and never a
larger gap that segment sits in. No card is sized on a delta that reads "Not comparable" (Comparison
columns). A
move of 10% or more on a headline figure may carry one extra line on its card, "To see why it
moved, run the diagnose-performance skill for `<month>` against `<comparison month>`."; the
review itself never drills. Where the evidence supports no action, the slide carries one line
saying the Section held and the figure that shows it. A Recommendation is an action, never a
finding alone.

## Page mechanics

Inline CSS, inline SVG charts and a few lines of inline script (slide bar, arrow keys, Share
toggle, fit to the window). The page makes no network request: no web font (the fonts are the
system stacks of `references/crux-brand.md`), library, image by URL or fetch. A brand's look changes
the values of the roles `references/crux-brand.md` lists and nothing else. It prints one slide per
page, and on screen it centres the slide in the window, fills the page with paper and runs the
cover's Highlight bar edge to edge.

Write the page to this skeleton, filling the slides and keeping the CSS and script as given. The CSS
holds one grid for each Layout of `references/slide-craft.md`: `.cover` (cover), `.divider` (section
divider), `.grid` with `.statrow` (stat slide), `.grid` with `.evidence` and `.takeaway` (chart
slide), `table.kpi` (with `dense` on a long table) on a `.slide.table-slide` (table slide), `.cards` (cards slide) and, on a
`.slide.text`, `.focus`, `.exfigs`, `.points` or `.notes` (text slide). `table-slide`, `cards-slide`
and `text` only name the Layout and carry no rule of their own. Build each slide from the grid of its Layout
and set no layout of your own.

```html
<!doctype html><html lang="en-GB"><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Monthly performance review, March 2026</title>
<style>
:root{
--paper:#FFFFFF;--paper-2:#F5F6F7;--paper-3:#EDEFF1;
--ink-1:#0E1215;--ink-2:#3A4046;--ink-3:#5A6169;--ink-4:#8A9099;
--signal:#0F4C81;--signal-tint:#E7EEF4;
--line:#C9CDD1;--line-soft:#E2E5E8;--line-strong:#0E1215;
--cat-1:#0F4C81;--cat-2:#0E1215;--cat-3:#9AA1A8;--cat-4:#6E93B4;--cat-5:#D3DCE4;
--positive:#1E6E45;--negative:#A4271C;
--display:Georgia,"Times New Roman",serif;
--body:system-ui,-apple-system,"Segoe UI",Helvetica,Arial,sans-serif}
*{box-sizing:border-box}
body{margin:0;font-family:var(--body);color:var(--ink-2);background:var(--paper)}
@media screen{html,body{height:100%;overflow:hidden}.slide.cover{overflow:visible}.slide .cover-bar{left:-4000px;right:-4000px}}
p,h1,h2,h3,ol,dl,dd{margin:0}
.bar{height:40px;display:flex;gap:4px;align-items:center;padding:0 12px;background:var(--paper);border-bottom:1px solid var(--line)}
.bar button{border:0;border-bottom:2px solid transparent;background:none;padding:6px 10px;cursor:pointer;color:var(--ink-3);font:inherit;font-size:13px}
.bar button.on{color:var(--ink-1);font-weight:700;border-bottom-color:var(--signal)}
.stage{transform-origin:top left;transform:translate(var(--x,0px),var(--y,0px)) scale(var(--k,1))}
.slide{display:none;width:1280px;height:720px;padding:52px 64px 64px;background:var(--paper);flex-direction:column;position:relative;overflow:hidden}
.slide.on{display:flex}
.slide footer{position:absolute;left:64px;bottom:22px;font-size:12px}
.slide footer a{color:var(--ink-4);text-decoration:none}
.slide .pg{position:absolute;right:64px;bottom:22px;font-size:12px;color:var(--ink-4);font-variant-numeric:tabular-nums}
.eyebrow{font-size:13px;font-weight:700;text-transform:uppercase;letter-spacing:.14em;color:var(--ink-3)}
header{margin-bottom:28px}
header .eyebrow{margin-bottom:10px}
h2{font-family:var(--display);font-weight:400;font-size:30px;line-height:1.22;color:var(--ink-1);max-width:1100px;display:-webkit-box;-webkit-line-clamp:2;-webkit-box-orient:vertical;overflow:hidden}
.fig{font-family:var(--display);color:var(--ink-1);font-variant-numeric:tabular-nums lining-nums;line-height:1}
.d{font-variant-numeric:tabular-nums;white-space:nowrap}
.d.pos,.pos{color:var(--positive);fill:var(--positive)}.d.neg,.neg{color:var(--negative);fill:var(--negative)}.d.flat{color:var(--ink-3)}
.source{font-size:12px;color:var(--ink-4);margin-top:12px;line-height:1.4}
/* data slide: evidence left two-thirds, Takeaway panel right third */
.grid{display:grid;grid-template-columns:2fr 1fr;gap:48px;flex:1;min-height:0}
.evidence{min-width:0;min-height:0;display:flex;flex-direction:column}
.panel{border-top:4px solid var(--signal);padding-top:16px;min-height:0;overflow:hidden}
.takeaway{border-left:1px solid var(--line);padding-left:28px;display:flex;flex-direction:column;gap:22px}
.takeaway p{font-size:16px;line-height:1.45;color:var(--ink-2)}
.takeaway b{display:block;font-size:13px;font-weight:700;text-transform:uppercase;letter-spacing:.14em;color:var(--ink-3);margin-bottom:6px}
.takeaway p:first-child{color:var(--ink-1)}
/* charts */
svg{display:block;overflow:visible;font-family:var(--body)}
svg .ax{font-size:12px;fill:var(--ink-4)}svg .ax.cur{fill:var(--ink-1);font-weight:700}
svg .lab{font-size:14px;fill:var(--ink-3)}svg .lab.hi,svg .hi{fill:var(--signal)}svg .strong{font-weight:700;fill:var(--ink-1)}svg .lab.hi.strong,svg .hi.strong{fill:var(--signal)}
svg .s-hi{fill:var(--cat-1)}svg .s-base{fill:var(--cat-3)}svg .g{stroke:var(--line-soft)}svg .g-base{stroke:var(--line)}svg .g-mark{stroke:var(--ink-1)}
svg .l-hi{fill:none;stroke:var(--cat-1);stroke-width:3}svg .l-base{fill:none;stroke:var(--cat-3);stroke-width:2}svg .l-ink{fill:none;stroke:var(--ink-1);stroke-width:3}
svg .hd{font-size:13px;font-weight:700;letter-spacing:.14em;text-transform:uppercase;fill:var(--ink-3)}
svg .row{font-size:16px;fill:var(--ink-2);font-variant-numeric:tabular-nums}svg .row.muted{fill:var(--ink-4)}svg .row.pos{fill:var(--positive)}svg .row.neg{fill:var(--negative)}
.multi{display:flex;gap:32px}.multi>div{flex:1;min-width:0}
.chart-head{display:flex;justify-content:space-between;align-items:baseline;margin-bottom:6px}
.chart-title{font-size:16px;color:var(--ink-3)}
.toggle{display:flex;gap:0;border:1px solid var(--line)}
.toggle button{font:inherit;font-size:12px;border:0;background:var(--paper);color:var(--ink-3);padding:5px 10px;cursor:pointer}
.toggle button+button{border-left:1px solid var(--line)}
.chart[data-view=absolute] [data-view-set=absolute],.chart[data-view=share] [data-view-set=share]{background:var(--ink-1);color:var(--paper)}
.chart[data-view=absolute] .v-share,.chart[data-view=share] .v-absolute{display:none}
/* stat row */
.statrow{display:grid;grid-template-columns:repeat(4,1fr)}
.stat{padding:12px 20px 12px;border-left:1px solid var(--line-soft)}
.stat:first-child{padding-left:0;border-left:0}
.stat .fig{font-size:56px;margin:18px 0 28px}
.stat.hi .fig{color:var(--signal)}
.stat dl{display:grid;grid-template-columns:auto 1fr;gap:14px 12px;font-size:16px;align-items:baseline}
.stat dt{color:var(--ink-4);font-size:13px}
.stat dd{text-align:right}
/* executive summary */
.focus{border-left:4px solid var(--signal);padding:12px 18px;margin-bottom:26px}
.focus .eyebrow{color:var(--signal);margin-bottom:4px}
.focus p{font-size:16px;line-height:1.45;color:var(--ink-2)}.focus b{color:var(--ink-1)}
.exfigs{display:grid;grid-template-columns:repeat(4,1fr);border-top:1px solid var(--line-strong);border-bottom:1px solid var(--line);padding:16px 0 18px;margin-bottom:24px}
.exfig{padding-left:20px;border-left:1px solid var(--line-soft)}.exfig:first-child{padding-left:0;border-left:0}
.exfig .fig{font-size:48px;margin:10px 0 10px}.exfig.hi .fig{color:var(--signal)}
.exfig .ds{font-size:16px;color:var(--ink-3)}
.points{list-style:none;padding:0;display:grid;grid-template-columns:repeat(3,1fr);gap:32px;counter-reset:pt}
.points li{counter-increment:pt;position:relative;padding-left:40px}
.points li::before{content:counter(pt);position:absolute;left:0;top:-4px;font-family:var(--display);font-size:30px;color:var(--signal);line-height:1}
.points .eyebrow{margin-bottom:6px}
.points p:last-child{font-size:16px;line-height:1.45}
/* cover */
.cover{padding:0}
.cover-bar{position:absolute;top:0;left:0;right:0;height:8px;background:var(--signal)}
.cover-body{position:absolute;left:96px;right:96px;top:250px;border-top:1px solid var(--line-strong);padding-top:22px}
.cover h1{font-family:var(--display);font-weight:400;font-size:72px;line-height:1.05;color:var(--ink-1);margin:18px 0 18px}
.cover .period{font-family:var(--display);font-size:30px;color:var(--ink-2)}
.cover-meta{position:absolute;left:96px;bottom:64px;font-size:16px;color:var(--ink-3)}
.cover footer{left:96px}
/* section divider */
.divider{padding-top:72px}
.divider-head{border-top:1px solid var(--line-strong);padding-top:20px;margin-bottom:34px}
.divider-name{font-size:56px;margin:12px 0 14px;-webkit-line-clamp:1}
.verdict{font-family:var(--display);font-size:22px;line-height:1.35;color:var(--ink-2);max-width:900px}
.contents{list-style:none;padding:0;counter-reset:c;max-width:980px}
.contents li{counter-increment:c;font-size:16px;line-height:1.3;color:var(--ink-2);padding:9px 0 9px 44px;border-top:1px solid var(--line-soft);position:relative;white-space:nowrap;overflow:hidden;text-overflow:clip}
.contents li:last-child{border-bottom:1px solid var(--line-soft)}
.contents li::before{content:counter(c,decimal-leading-zero);position:absolute;left:0;color:var(--ink-4);font-size:13px;font-weight:700;letter-spacing:.08em;top:11px}
/* cards slide: three columns under hairlines, no boxes */
.cards{display:grid;grid-template-columns:repeat(3,1fr);gap:40px;flex:1;min-height:0}
.card{border-top:1px solid var(--line-strong);padding-top:14px;display:flex;flex-direction:column;min-height:0;overflow:hidden}
.card h3{font-family:var(--display);font-weight:400;font-size:24px;line-height:1.2;color:var(--ink-1);margin:10px 0 16px}
.card .fig{font-size:48px;color:var(--signal)}
.card .fignote{font-size:16px;color:var(--ink-3);margin:8px 0 16px}
.card .act{font-size:16px;line-height:1.45;color:var(--ink-2)}
.card-foot{margin-top:auto;border-top:1px solid var(--line);padding-top:12px;font-size:16px;color:var(--ink-3);display:grid;gap:4px}
.card-foot b{font-size:13px;font-weight:700;text-transform:uppercase;letter-spacing:.14em;margin-right:6px}
.card-foot .stake{font-size:16px;color:var(--ink-1);font-weight:600}
/* table slide */
table.kpi{width:100%;border-collapse:collapse;font-size:15px;font-variant-numeric:tabular-nums}
.kpi th,.kpi td{padding:11px 12px;text-align:right;border-bottom:1px solid var(--line-soft);white-space:nowrap}
.kpi th[scope=row],.kpi thead th:first-child{text-align:left;padding-left:12px}
.kpi thead th{font-size:14px;font-weight:700;text-transform:uppercase;letter-spacing:.1em;color:var(--ink-3);border-bottom:1px solid var(--line-strong);padding-top:4px}
.kpi tbody th{font-weight:400}
.kpi tbody tr{color:var(--ink-3)}
.kpi tbody tr.hi{background:var(--signal-tint);color:var(--ink-1)}
.kpi tbody tr.hi th{font-weight:700;color:var(--signal)}
.kpi thead th[colspan]{text-align:center}
.kpi.dense{font-size:14px}.kpi.dense th,.kpi.dense td{padding:5px 8px}.kpi.dense thead th{padding-top:2px;letter-spacing:.04em}
.kpi td.h1{background:color-mix(in srgb,var(--signal) 10%,var(--paper))}.kpi td.h2{background:color-mix(in srgb,var(--signal) 22%,var(--paper))}.kpi td.h3{background:color-mix(in srgb,var(--signal) 36%,var(--paper))}
.kpi td.h4{background:color-mix(in srgb,var(--signal) 55%,var(--paper));color:var(--paper)}.kpi td.h5{background:var(--signal);color:var(--paper)}
/* Brain slot: the fixed line in a muted panel where the evidence would stand */
.slot{flex:1;background:var(--paper-2);display:flex;align-items:center;padding:0 56px;font-size:20px;line-height:1.45;color:var(--ink-3)}
.grid>.slot{grid-column:1/-1}
/* notes */
.notes{display:grid;grid-template-columns:repeat(3,1fr);gap:40px}
.notes section{border-top:1px solid var(--line-strong);padding-top:14px}
.notes section .eyebrow{margin-bottom:12px}
.notes section p:not(.eyebrow){font-size:16px;line-height:1.45;margin-bottom:10px}
.notes b{color:var(--ink-1)}
.notes-crux{margin-top:auto;font-size:14px;color:var(--ink-3);border-top:1px solid var(--line);padding-top:12px}
.notes-crux a{color:var(--signal)}
@page{size:1280px 720px;margin:0}
@media print{body{background:none;-webkit-print-color-adjust:exact;print-color-adjust:exact}.bar{display:none}.stage{transform:none}.slide{display:flex;break-after:page}.slide:last-child{break-after:auto}}
</style>
<nav class="bar"></nav>
<div class="stage">
<section class="slide cover" id="cover" data-section="Summary"><div class="cover-bar"></div><div class="cover-body"><p class="eyebrow">Monthly performance review</p><h1>…Brand name…</h1><p class="period">March 2026</p></div><p class="cover-meta">…Source line…</p><footer><a href="https://gocrux.io">Built with Crux growth skills</a></footer></section>
<section class="slide" id="trading-revenue" data-section="Trading"><header><p class="eyebrow">Trading</p><h2>…Action title…</h2></header><div class="grid"><div class="evidence"><div class="panel">…one chart, table or Stat row…</div><p class="source">Source: …</p></div><aside class="takeaway"><p><b>So what</b>…</p><p><b>Why</b>…</p><p><b>Watch</b>…</p></aside></div><footer><a href="https://gocrux.io">Built with Crux growth skills</a></footer><span class="pg">4 / 9</span></section>
</div>
<script>
const S=[...document.querySelectorAll('.slide')],B=document.querySelector('.bar');let i=0;
[...new Set(S.map(s=>s.dataset.section))].forEach(n=>{const b=document.createElement('button');b.textContent=n;b.onclick=()=>go(S.findIndex(s=>s.dataset.section===n));B.append(b)});
function go(n){i=Math.max(0,Math.min(S.length-1,n));S.forEach((s,k)=>s.classList.toggle('on',k===i));[...B.children].forEach(b=>b.classList.toggle('on',b.textContent===S[i].dataset.section))}
function fit(){const r=document.documentElement.style,h=innerHeight-40,k=Math.min(innerWidth/1280,h/720);r.setProperty('--k',k);r.setProperty('--x',(innerWidth-1280*k)/2+'px');r.setProperty('--y',(h-720*k)/2+'px')}
onkeydown=e=>{if(e.key==='ArrowRight'||e.key==='PageDown')go(i+1);if(e.key==='ArrowLeft'||e.key==='PageUp')go(i-1)};
document.querySelectorAll('.chart [data-view-set]').forEach(b=>b.onclick=()=>b.closest('.chart').dataset.view=b.dataset.viewSet);
onresize=fit;fit();go(0);
</script></html>
```

Each slide's `data-section` is its Section's name (`Summary` for `cover`, `exec-summary` and
`last-actions`; `Next month`; `Appendix`; `Notes`), which builds the slide bar. The `pg` span is the
slide's number and the deck's count, "4 / 9". A Share toggle chart is `<div class="panel chart"
data-view="absolute">` holding a `chart-head` with the two buttons in a `toggle`
(`data-view-set="absolute"`, `data-view-set="share"`), the absolute SVG as `class="v-absolute"` and
the % SVG as `class="v-share"`. A chart's marks take their colour from the classes of the CSS above
(`s-hi` for the Highlight colour, `s-base` for grey, `style="fill:var(--cat-N)"` for a further
category), so a brand's roles recolour the charts too.

**Colour names in the slide specs below.** The "up colour" and "down colour" are `--positive` and
`--negative`, the "muted colour" is `--ink-3`, the Highlight colour is `--signal`, and "series N" is the category palette's `--cat-N`, used as `references/slide-craft.md`
sets out: the Highlight colour on the mark the Action title names and grey on the rest, a category
colour only where categories must be told apart.

**Markup of the other Layouts.** The chart slide is the `trading-revenue` section of the skeleton.
Each of the others takes its `<header>` (eyebrow and `<h2>` Action title) and footer from it:

- **Stat slide**: the chart slide's `.grid`, with `<div class="panel"><div class="statrow">` four
  `<div class="stat">` in the `.evidence` column, the first `stat hi`. A stat is
  `<p class="eyebrow">Revenue</p><p class="fig">£420k</p><dl><dt>MoM</dt><dd><span class="d pos">▲ +7.7%</span></dd>…</dl>`,
  one `dt`/`dd` pair for each delta; `d pos`, `d neg` or `d flat` is the delta's colour.
- **Section divider**: `<section class="slide divider">` with no `<header>`: `<div class="divider-head">`
  holding `<p class="eyebrow">Section 2 of 4</p>`, `<h2 class="divider-name">Acquisition</h2>` and
  `<p class="verdict">`, then `<ol class="contents">` with one `<li>` for each slide title.
- **Text slide** (`exec-summary`): `<section class="slide text">` with its `<header>`, then the
  `<div class="focus">` of the Focus questions (`<p class="eyebrow">You asked</p><p><b>question</b> answer</p>`,
  one for each, only where the intake set any), `<div class="exfigs">` of four
  `<div class="exfig">` (the first `exfig hi`; `<p class="eyebrow">`, `<p class="fig">`,
  `<p class="ds">` holding the deltas) and `<ol class="points">` of three `<li>` (`<p class="eyebrow">`
  Section name, then `<p>` the takeaway). `notes` takes `<section class="slide text">` with
  `<div class="notes">` of its three `<section>`.
- **Table slide**: `<section class="slide table-slide">` with its `<header>`, then
  `<div class="panel"><table class="kpi">` (`<th scope="col">` headings, `<th scope="row">` row labels,
  deltas as `<span class="d pos">`) and the source line. The row the Action title names is
  `<tr class="hi">`.
- **Cards slide**: `<section class="slide cards-slide">` with its `<header>`, then `<div class="cards">`
  of up to three `<article class="card">`: `<p class="eyebrow">01</p><h3>`title`</h3><p class="fig">`
  evidence figure`</p><p class="fignote">`what it measures`</p><p class="act">`action`</p>` and
  `<div class="card-foot"><p class="stake">`£18k a month at stake`</p><p><b>Watch</b> …</p><p><b>Validate</b> …</p></div>`.
  `last-actions` takes the same slide with its table in place of the cards.

**Brain slot markup.** A slot is its slide's `<header>` with the Action title, then
`<div class="slot"><p>`the fixed line`</p></div>` in the place of the evidence: inside the `.grid`
as `<div class="evidence slot">` for a stat or chart slide (it spans the grid, so the Takeaway
panel's column is empty), and directly under the header for a table slide. It has no source line, no
Takeaway panel and no Share toggle.

**Chart recipes.** Charts are inline SVG in the `.evidence` column, 736 wide, with marks coloured by
the classes of the CSS above and sized from the figures, never from a hex value.

- **Ranked bars** (`acq-channels`, `acq-campaigns`, `acq-ltv-channel`, `aov-product`, `aov-codes`):
  `viewBox="0 0 736 H"` with H = 34 + 58 for each row, so six rows are 382 high. A header line of
  `hd` text at y 14 names the bars' measure at x 150 and each right-hand figure above its column
  (right-aligned at x 642 and x 736). Each row is 58 high with a hairline (`g`) under it: its label
  in `row` at x 0 (`row hi strong` on the highlighted row), a 26-high bar from x 150 (`s-hi` on the
  highlighted bar, `s-base` on the rest), the longest bar 360 long and the others scaled from zero, its value in `row`
  8 beyond the bar's end, and its right-hand figures in `row` (deltas `row pos` or `row neg`, "No
  data" and "New" `row muted`). The bars carry no axis.
- **Lines** (`acq-blended`, `ret-cohort`, `ret-ltv`, `aov-trend`, `aov-discount`): a `<polyline>`
  for each series, `l-hi` for the Highlight colour, `l-base` for grey, `l-ink` for a bold reference
  line, a dashed grey line with `stroke-dasharray="6 4"`. Four horizontal gridlines (`g`) and a
  baseline (`g-base`), axis labels in `ax` (the Current period's `ax cur`), a month label at every
  third month, the unit and currency on the top gridline's label. The Current period is a circle of
  radius 5 (`s-hi` or `s-base`) with its figure beside it in `lab`; a line's name sits at its right end in `lab`
  (`lab hi strong` on the highlighted line).
- **Columns** (`aov-discount`, `acq-paid-organic`, `ret-subscriptions`): one rect for each month,
  stacked from the baseline for a stacked chart, as `trading-revenue` draws them; the Current
  period's month label is `ax cur`.
- **Small charts side by side** (`acq-blended`, `aov-discount`): a `<div class="multi">` holding one
  `<div>` for each chart, each with a `<p class="chart-title">` stating its measure and its own SVG
  and axis. On `aov-discount` the third chart's `<div>` is the `chart` element with `data-view`, carrying the Share toggle in its `chart-head`; the other two carry none.

**Brand tokens.** Where `references/intake.md` resolved a brand of this brand's own, write its
values over the skeleton's `:root` for the roles of `references/crux-brand.md` (What a brand
changes) and over nothing else: paper to `--paper`, ink to `--ink-1`, the Highlight colour to
`--signal`, `--cat-1` and `--signal-tint` (also the cohort shading), the greys to `--ink-2` to
`--ink-4` and the rule greys, the category palette to `--cat-2`, `--cat-4` and `--cat-5` (and `--cat-3`, the base grey of every
unhighlighted mark, only when the guidelines name a mid grey), the two stacks to `--display` and
`--body`, and the brand's name to the cover. Every other value stays as given. The page loads no font file, image or style sheet, so a brand web font is
never fetched and its fallback stack is what shows.

## Slides built here

### Cover and Executive summary

**Cover**: the Cover layout, with "Monthly performance review" as its eyebrow, the brand's name
(`references/intake.md`, Brand) and the Current period as month and year. No title rule applies.

**Dividers**: a section divider, stat-free, holding the Section's name large; the eyebrow "Section 2 of 4"
(its place among Trading, Acquisition, Retention & LTV and Order value & product); the Section's
one-line **verdict**; and the Section's slides as a contents list. No title rule applies.
- **Verdict**: one sentence with a figure, the Section in a line, written last from the Section's
  own slides ("New customers slipped 4.5% to 2,100 as paid social grew dearer; search held its
  cost."). Where the Month context bears on it, it is used as the Action title rule uses it.
  Where every slide of the Section is a Brain slot, the verdict is "This Section's slides need data
  your Source does not hold. A Growth Brain provides it: gocrux.io/contact." On a run with a Growth
  Brain: "This Section's slides need data your Growth Brain does not hold."
- **Contents**: the Action title of every slide of the Section, in order, its Focus slide and its
  Recommendations slide included, one line each (a Brain slot's title is the line it keeps). The
  Appendix slides are not listed.

**Executive summary**: a text slide that a founder reads at a glance, in this order.
1. **You asked**, for each Focus question, in order, only where the intake set any: one block
   with the question in the user's words and one sentence answering it from the Focus slide's own
   figures, ahead of everything below.
2. **Four headline figures**, the four of the Stat row of `trading-kpi` in the same order and on
   the same basis, each with its MoM and YoY change and, where the Source holds a budget for it, its
   v budget, coloured as the comparison rule sets out. Where `trading-kpi` is a Brain slot, each
   reads "No data" and carries no deltas.
3. **Three numbered takeaways**, one each from Acquisition, Retention & LTV, and Order value &
   product, in that order, each headed by its Section's name and written as one sentence with a
   figure, from the Section's own slides: the largest move on a Section's headline figure (for
   Acquisition, new customers or blended CAC; for Retention & LTV, the retention at month 1 of the
   latest cohort to reach it against the rolling average; for Order value & product, the blended
   average order value or the discount rate), with the Month context in place of any cause the
   figures do not show. Where the cause is not known, the sentence says so and never guesses one. A
   Section whose slides are all Brain slots takes its divider's verdict in the takeaway's place.

Action title: the Current period's revenue and its MoM change with the largest move behind it, as
`trading-kpi`'s. The Next month cards stay on `next-month`; the Executive summary lists none.

### Last month's actions (`last-actions`)

Built on every Source, from the previous review's actions the intake settled (up to three, the
cards of its Next month slide), after the Executive summary. A cards slide whose body is a table
with one row for each action, at a smaller type size, columns in this order:

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
3. **Evidence**: one chart, in the left two-thirds, taken from a slide of its Section that holds
   the figures the question needs, drawn as that slide draws it (24 months with the Current period
   marked for a trend; the top 5 rows of a busy table) and without the Share toggle. Where the
   question needs a figure no slide of its Section holds, one extra query from the Source gives it.
4. **Takeaway panel**, in the right third: So what is what the answer means for the business, Why
   the cause, Watch the one figure that shows whether the answer's action worked. The action
   itself stays on the Section's Recommendations.
5. **Month context**: the line of that rule, where one bears on the question.

A question the Source cannot answer is written as a Brain slot: its title is "`<the question>`,
answered from your data" and its data is "the data your question needs". The Focus slide's Section
keeps its Recommendations slide as before.

### Trading KPIs (`trading-kpi`)

A stat slide: a **Stat row** of four figures in the left two-thirds and the Takeaway panel in the
right. The four, in this order, the first in the Highlight colour:

1. **Revenue**, on the Revenue basis of `references/sources.md` (the label is the name the brain
   gives it, ex VAT where that file says so)
2. **New customers**, which is the New orders figure of the KPI table, labelled as the brain names
   it
3. **MER**, as `references/sources.md` sets it, labelled with its basis where the brain defines it
   ("MER, on `<the brain's revenue name>`")
4. **The Margin rung's %** of revenue, labelled with the rung's own name (the rung
   `references/sources.md` chooses by its dating, and the lower rung's name where the brain says
   the two are equal), on a Growth Brain that holds a margin rung; else **Orders**

Each figure carries beneath it, as labelled lines, its MoM change, its YoY change and, where the
Source holds a budget for it, its v budget, coloured as the comparison rule sets out. Rates (MER,
margin %) change as relative %. The source line says the full table is in the Appendix.

The figures are read as `app-trading-kpi` reads them, so the two slides agree to the digit.

Action title: the Current period's revenue and its MoM change, with the move behind it: the
largest among orders, order value and returning orders, or the gap to budget where the Source holds
a budget ("Revenue rose 8%
to £1.2m as returning orders grew 13%, but finished 6.7% short of the £1.3m budget"). Where the
Budget basis differs from the Revenue basis, the gap is written on the Budget basis ("Revenue rose
8% to £1.2m, but gross sales finished 20% short of budget").

### Appendix: Trading KPIs (`app-trading-kpi`)

A table slide holding the full KPI table, one row per figure in this order, with the comparison
columns and, where the Source holds a budget, the budget columns:

1. Revenue, on the Revenue basis (the label is the name the brain gives it, ex VAT where
   `references/sources.md` says so)
2. Orders
3. New orders
4. Returning orders
5. Average order value, as `references/sources.md` sets it (Order value & product)
6. Marketing spend
7. MER, as `trading-kpi` sets it

On a Growth Brain that holds a margin rung, add two rows after MER: the rung's money figure and
its % of revenue, labelled with the margin rung's own name, as `trading-kpi` names it. Revenue
leads: margin rows add to the table and never replace a row. Rates (MER, margin %) change as
relative % per the comparison rule. Revenue is the highlighted row.

Action title: the Current period's revenue, its YoY change and, where the Source holds a budget,
its gap to budget ("Revenue of £420k was 17% up on last September but 6.7% short of the £450k
budget"), written on the Budget basis where it differs from the Revenue basis, as `trading-kpi`'s;
without a budget, its MoM change and its YoY change.

### Revenue, new vs returning (`trading-revenue`)

A chart slide. Stacked columns, one per month for 24 months: revenue from new customers' orders
and from returning customers' orders, summing to revenue, with the Share toggle. The series the
Action title names takes the Highlight colour and the other is grey; each is labelled directly at
the Current period's column, which also carries the month's total. No table sits beside it. Action
title: which of the two moved the total and by how much ("New-customer revenue fell 6% to £480k
while returning-customer revenue grew 17% to £720k"). The Takeaway panel's So what is the mix: the
returning customers' share of revenue against a year ago.

### Customer base (`trading-customers`)

A chart slide. Columns, one per month for 24 months, no Share toggle. Active, new, reactivated and lapsed are the
brain's definitions, labelled as it names them, with the glossary's where it defines none, which
`references/sources.md` reads from the Customers mart or the orders mart. Above the axis, stacked:
**active customers carried over** (active at the month's end, neither new nor reactivated), **new**
and **reactivated** (ordered in the month, not new, and not active at the previous month's end),
summing to the active customer base at the month's end. Below the axis, one column: **lapsed** (on
the glossary's definition, customers whose 12 months since their last order ended in the month). The Current period is
marked. The carried-over series is grey and the other three take the category palette, since the
groups must be told apart; each is labelled directly at the Current period's column with its
count. No table sits beside it. Action title: the size of the active base and the net movement ("The active
customer base grew 3% to 41k as 2,100 new and 600 reactivated customers outran 1,400 lapsing").

### Markets (`trading-markets`, conditional)

A chart slide. Ranked horizontal bars of revenue in the Current period for the top 5 markets, the
market the Action title names in the Highlight colour and the rest grey. Each bar is labelled with
its revenue, and beside it the market's MoM and YoY change in the delta colours. A market is the
order's shipping country. Where the business has more than 5 markets, the source line says how many
there are in all and what the others brought together; every market is in `app-trading-markets`.
Action title: the market share and the market that moved most ("The UK delivered 78% of revenue,
while the US grew 22% to £180k").

### Appendix: Markets (`app-trading-markets`, conditional)

A table slide with one row for each market, ranked by revenue in the Current period, up to 8, then
**Other markets** for every market beyond the eighth (omitted when there are 8 or fewer) and a
**Total** row equal to Revenue on `app-trading-kpi`. It states its own columns: Market; **revenue**
with the comparison columns; **orders**, **new orders** and **average order value**, each with this
month and MoM %. The market the Action title names is the highlighted row. Action title: the number
of markets and the share of revenue the top 5 carry ("Five of 12 markets carried 96% of revenue; the
other seven brought £18k").

### Trading Recommendations (`trading-recs`)

Up to three Recommendation cards drawn from the Trading slides above, ranked by revenue at
stake, worked one of three ways and the card says which. **Budget gap**: revenue below budget on
the Budget basis (`references/sources.md`, Budget), acted on through one **lever**: new customer
orders, returning customer orders or AOV. The lever is the one furthest below its budget, in
revenue, where the budget mart holds a budget for those measures (its own lever split); else the
one with the largest relative fall against last month, on `trading-revenue` and `aov-trend`. The
card is sized as that lever's share of the shortfall: for an orders lever, its orders below the
budget (or below last month, where there is no split) times that group's Current period revenue per
order; for AOV, the Current period's orders times the AOV below the budget (or below last month),
and never more than the shortfall against budget. The card's title and evidence are written on the
Budget basis, never as a Revenue shortfall where the bases differ ("Gross sales finished 20% short
of budget"), and the card names the Budget basis, the lever and how it was picked ("by the
budget's own split" or "by its fall against last month"). A
Source with no budget has no budget gap. **Market or
customer-type fall**: a market (`trading-markets`) or a customer type (new or returning, on
`trading-revenue`) whose revenue fell, sized as its revenue fall against the same month last year,
or against last month where the Source holds no figure for last year. **AOV fall**: average order
value below the comparison, sized as the Current period's orders times the fall in average order
value, against the same comparison month. A card sized against last year or last month says which.
Action title: the count and the combined revenue at stake with the lead action ("Three
actions are worth about £90k a month, led by recovering new-customer orders").

### Blended conversion and CAC (`acq-blended`)

A chart slide. Two small line charts side by side, 24 months, one measure each and no dual axis, each
on its own axis with the Current period marked and labelled: **CAC** in the Highlight colour and
**new-customer conversion** in grey. Conversion and CAC are the brain's definitions where
`list_metrics` defines them; otherwise conversion is new orders ÷ visits and CAC is blended, all
connected ad spend over all new orders. No table sits beneath: traffic, marketing spend and new
orders reach the slide as the Action title's and the Takeaway panel's figures. Traffic is named for
what the brain's conversion divides by ("users" where it is per user, else "visits"). Action title:
the CAC move with the conversion move behind it ("Blended CAC rose 12% to £34 as new-customer
conversion fell 9% to 1.0%"). The Takeaway panel's Why names the traffic move where traffic moved
("Visits fell 9% to 61k").

### Channel mix (`acq-channels`)

A chart slide. Horizontal bars of the Current period's new orders, ranked, for the top 5 channels by
new orders (ties by higher spend, then by channel name in alphabetical order, named as the Source
names them), then the **Unknown row** in grey. Channels count here when they hold new orders in the
Current period, and the bars carry the whole numbers of the Appendix table, rounded as
`references/sources.md` sets out. The channel the Action title names takes the
Highlight colour and every other bar, the Unknown row's included, is grey. Each bar is labelled with
its new orders, and carries at its right two figures: its **CAC** this month and the CAC's MoM
change, coloured as the comparison rule sets out for CAC. A row with no spend, or no new orders,
reads "No data" in both. The Unknown row is its own row, never spread across the channels or merged
into one (not into Direct), and carries no spend, so it reads "No data" there too. The source line
says how many channels there are in all and what the channels beyond the top 5 brought together
("Top 5 of 8 channels, plus the new orders with no known channel; the other 3 channels brought 40
more."), and that the full table is in the Appendix. A platform's own reported conversions never
enter these figures. Action title: the channel with the most new orders, its CAC and the Unknown
share ("Paid search led with 1,100 of 3,100 new orders at a £31 CAC, and 9% of new orders have no
known channel"); or, where another channel's CAC moved most, that channel's ("Paid social's CAC rose
22% to £52, the steepest of the top five channels, as its new orders fell 15% to 450").

### Appendix: Channel mix (`app-acq-channels`)

A table slide of the Current period's new orders by channel, with these columns in this order:
Channel; **new orders** with this month, last month, MoM %, same month last year and YoY %;
**spend** with this month and MoM %; **CAC** with this month and MoM %. No budget columns. Rows, in
this order:

1. Up to ten channels, ranked by new orders in the Current period, ties by higher spend, then by
   channel name in alphabetical order, named as the Source names them. The tie-break decides which
   channel takes the last place of the ten, so the same data always gives the same table, and the
   first five are the bars of `acq-channels`. A channel with new orders only in last month or the
   same month last year takes a row of its own, below those with Current period new orders and
   ranked on last month's, then the year-ago, new orders, only while the ten places have room.
2. **Other channels**, when any channel holding new orders in any period shown is not named above:
   every such channel, in each period, so each period's column adds to its Total.
3. The **Unknown row**: the new orders no channel claims, as `acq-channels` shows it. It carries no
   spend, so its spend and CAC cells read "No data".
4. **Total**: the Total row's new orders equal New orders on `app-trading-kpi` and its spend equals
   Marketing spend there, in every period shown; its CAC is the blended CAC.

The channel rows, Other channels and the Unknown row add up to the Total row's new orders in every
period shown, to the digit, on the same basis as the channel CAC: the brain's, modelled channel credit
included, rounded to whole numbers as `references/sources.md` sets out (New orders by channel). A row's CAC is its spend ÷ its new orders before rounding; a row
with no spend, or no new orders, reads "No data" in its spend or CAC cells. The channel the
`acq-channels` title names is the highlighted row. Action title: the number of channels, the share of
new orders the top five carry and the Unknown share ("Eight channels brought 3,100 new orders, the
top five 87% of them, and 9% have no known channel").

### Paid vs organic (`acq-paid-organic`)

A **paid** channel is one the Source's channel grouping marks paid, else one that carries ad spend
in the Current period; an **organic** channel is every other named channel; the Unknown row stays
its own third group. The Current period's classification applies to every month shown, so the
series compare like for like.

A chart slide. Stacked columns of new orders, one per month for the 12 months ending with the
Current period (marked): paid series 1, organic series 2, Unknown series 4, each labelled directly at
the Current period's column, with the Share toggle: absolute shows new orders, "% of total" rescales
each column to 100% and labels each group's percentage, so the paid share's 12-month path reads
straight off the % view. No table sits beside it: the paid, organic and Unknown figures are the
labels and the Takeaway panel's. Action title: the paid share and how it moved ("Paid channels
brought 58% of new orders, a share 12% above last month's, with 7% from no known channel").

### Top campaigns (`acq-campaigns`)

One slide for each ad platform with spend in the Current period. A chart slide of horizontal bars of
new orders for the platform's top 5 named campaigns, ranked on new orders, ties by higher spend,
and, below them in grey, a **"No campaign"** row when the platform holds orders or spend not tied to
a named campaign, carrying those new orders (`references/sources.md`, Campaigns, says what lands
there). Only named campaigns are ranked. The campaign the Action title
names, the lead campaign, takes the Highlight colour and every other bar is grey. Each bar is
labelled with its new orders, and carries at its right its **CAC** this month and the CAC's MoM
change as `acq-channels` does ("New" in the change cell for a campaign that did not run last month,
"No data" in both where the Source cannot give them). New orders are the new orders the Source
attributes to the campaign, never the platform's own reported conversions. The source line says how
many named campaigns the platform ran, that the top ten are in the Appendix, and that campaign rows
are measured new orders tied to the platform, so they can differ from the platform's channel row on
the Channel mix where that row is modelled. Action title, one per slide: the share of the platform's measured total of new orders the ranked
campaigns carry, with the lead campaign's CAC, counting named campaigns only, so the "No campaign"
row is never in the count though its orders are in the total ("Five Meta
campaigns delivered 71% of the platform's 3,100 new orders, led by one at a £28 CAC"; "Three Google
campaigns delivered 64% of the platform's 900 new orders" where the platform ran three).

### Appendix: Top campaigns (`app-acq-campaigns`)

One table slide for each ad platform, in the order of `acq-campaigns`, a table of the platform's ten
named campaigns with the most new orders, ranked on that, ties by higher spend. Columns: Campaign;
**spend** with this month and MoM %; **impressions**; **clicks**; **CTR** (clicks ÷ impressions);
**new orders** with this month and MoM %; **CAC** with this month and MoM %. A campaign that did not
run last month reads "New" in its MoM cells; there is no year-ago column, as campaigns rarely last a
year. Beneath the ranking, in this order: the **"No campaign"** row, when the platform holds orders or
spend not tied to a named campaign, carrying that spend and those new orders, impressions and
clicks; then a last row, "All `<platform>` campaigns", carrying the platform's measured totals so
the rows above read against their whole. A figure the Source cannot give reads "No data". The lead
campaign of `acq-campaigns` is the highlighted row. Action title: the share of the platform's new orders the ranked campaigns carry,
counting named campaigns only, against the platform's measured total ("Ten Meta campaigns delivered
82% of the platform's 3,100 new orders"; "Four Google campaigns delivered 64% of the platform's 900 new orders" where the platform
ran four). Impressions and clicks are joined from the platform's mart on the campaign identifier
where both marts carry one, else on the campaign name; a name match puts the Campaign match by name
caveat in the Notes; the name is matched as `references/sources.md` (Campaigns, Name join) sets out,
and a campaign that still fails reads "No data" for impressions and clicks.

### LTV by acquisition channel (`acq-ltv-channel`)

A chart slide. Ranked horizontal bars, highest first, of **12-month LTV** for the 5 acquisition
channels with the highest, then the one with the lowest as a sixth bar where more than six hold
customers, so the Action title's best and worst channel are always drawn. The best channel takes
the Highlight colour and every other bar is grey. A hairline rule down the chart at the all-customer
LTV (`g-mark`), labelled "All customers" with its figure, marks the average. Each bar is labelled
with its LTV, and carries at its right its customer count in the muted colour. Bars, axis and
labels name the brain's LTV measure ("12-month margin per customer" where its LTV is margin), with
the **LTV window** in the source line, which says that every channel is in the Appendix. A channel's
customers are those whose first order the Source places on that channel; customers it places on none
are an Unknown group, never spread, drawn in the Appendix only. Action title: the best and worst
channel's LTV and the gap ("Email-won customers are worth £210 in their first year, 2.4 times the
£88 of customers won on paid social"; add the measure's name where it is not revenue, "£210 of
margin").

**LTV window.** The LTV slides here and in the Appendix read customers whose first order fell in the
12 months ending with the same month a year before the Current period, so every customer has 12
months behind them. A customer's **12-month LTV** is their cumulative value through the end of the
12th calendar month after their first-order month, first order included: the brain's LTV measure
(margin where it defines LTV as margin) on the brain's own grain, else revenue on the revenue basis
of `app-trading-kpi`; a group's LTV is the sum over its customers divided by their number. The comparison is
the 12 months ending a year earlier, on the same definition; a window the history does not reach
reads "No data". A group of fewer than 30 customers joins one "Other" group, so no ranking rests on a
handful of customers. The Notes state the LTV definition used.

### Appendix: LTV by acquisition channel (`app-acq-ltv-channel`)

A table slide: one row for each acquisition channel, highest 12-month LTV first, then the Other and
Unknown groups, then an all-customer row, with the columns Channel; customers; 12-month LTV; the same
figure a year earlier; change %. This slide has no this month or last month column, since LTV is read
on a cohort window. The best channel is the highlighted row. Action title: the number of channels
and the spread of their LTV ("Eight channels' first-year LTV ran from £88 to £210 around a £140
average across 9,600 customers"; add the measure's name where it is not revenue).

### Acquisition Recommendations (`acq-recs`)

Up to three Recommendation cards drawn from the Acquisition slides, ranked by revenue at stake,
worked one of three ways and the card says which. **CAC gap**: a paid channel whose CAC sits above the
reference CAC, sized as the new orders its spend would buy at the reference CAC, less the new orders it
delivered, times the Current period's new-customer order value (new-customer revenue ÷ new orders on
`trading-revenue`). The reference CAC is the brain's CAC target where it holds one (a metric, or
the budget mart's budget for CAC), else **paid CAC**: paid channels' spend ÷ paid channels' new
orders, on the basis of the channel rows. Blended CAC is never the reference, since it includes
organic new orders that cost no spend and puts every paid channel above it. A channel at or below
the reference has no gap. **LTV gap**: a channel whose 12-month LTV sits below the all-customer figure,
sized as its Current period new orders times that gap per customer; where the brain's LTV is not
revenue, the gap is in that measure, so the card says so and its revenue at stake is worked on the
Revenue basis from the same customers. **Waste gap**: a paid channel or a named campaign with spend in
the Current period and 0 new orders, so its CAC reads "No data" and the CAC gap never reaches it,
sized as its Current period spend. The "No campaign" row is unallocated spend, never a waste gap,
and the Unknown row carries no spend. A campaign is read from the same campaign figures as
`acq-campaigns`, the whole list and not only the ranking. Action title: as `trading-recs`.

### Cohort retention (`ret-cohort`)

A **cohort** is the customers whose first order fell in one calendar month. A chart slide of
retention curves: one thin line for each of the 6 latest cohorts to have reached month 1 (the
Current period's cohort is at month 0 and is never drawn), by months since the first-order month, 1
to 6, each drawn as far as it has aged, of the **retention %**: the brain's retention measure where
`list_metrics` defines one, else the share of the cohort that ordered in that month. The cohort the
Action title names, the **latest cohort to have reached month 1**, takes the Highlight colour, the
other five are grey, and the **rolling average** is a bold line in ink (`l-ink`): for each age the
retained customers ÷ the customers of the 12 most recent cohorts to have reached it (those cohorts
can include ones older than the 6 drawn). The highlighted cohort (by its month) and the rolling
average are labelled directly at their line ends; the grey cohorts are labelled by month only where
the labels do not collide. The axis is in percent from zero. The source line says the table of 12
cohorts is in the Appendix. Action title: the latest cohort to have reached month 1, its month 1
retention against the rolling average's, the same comparison the Executive summary headlines ("The
latest cohort to reach month 1, March's, retained 21% of its customers, 8% above the rolling
average").

### Appendix: Cohort retention (`app-ret-cohort`)

A shaded table with one row for each of the last 12 monthly cohorts (the Current period's cohort
last), labelled by month, a Customers column with the cohort's size, then columns for months 0 to 12
after the first-order month, holding the retention % of `ret-cohort`. Month 0 is 100% by definition
and unshaded; months 1 to 12 are shaded on one scale across the whole table in five steps, the
cell's class `h1` at the lowest value to `h5` at the highest, the one exception to the rule that a
table has no cell fills. An age a cohort has not yet reached is left empty, an exception to the cell
rule, so the table reads as a staircase. A final row, **Rolling average**, holds the rolling average
of `ret-cohort` for each age. The Current period's cohort size equals New orders on `app-trading-kpi`
where the cohort mart counts every order and the glossary's New customer holds; a mart that counts
customers only carries the Cohort count caveat. No comparison columns: the rows compare the
cohorts. The row of the cohort `ret-cohort` names is the highlighted row. Action title: the range of
month 1 retention across the cohorts that have reached it ("Month 1 retention ran from 14% to 24%
across the last 11 cohorts, around a rolling average of 19%").

### Cohort LTV (`ret-ltv`)

A chart slide of two cumulative lines of **LTV per customer** (the brain's LTV measure, named on the
axis and in the title, "margin per customer" where it is margin; the glossary's revenue per customer
where the brain defines none) by months since first order, 0 to 12: the cohort the Action title
compares, in the Highlight colour, drawn as far as it has aged, and the **rolling average** of
`ret-cohort` (the 12 most recent cohorts to have reached each age, weighted by customers) in bold ink
(`l-ink`) to month 12. The cohort compared is the **latest cohort to have reached month 6**, else,
where none has, the latest to have reached the oldest age any of the last 12 cohorts has. Both lines
are labelled directly at their ends, and the gap between them at the compared age is marked with its
figure. Axes carry the currency and the month's age. The source line says every cohort's LTV is in the Appendix. Action
title: that cohort's cumulative LTV per customer against the average at the age compared ("By month
6, March's cohort has earned £62 of margin per customer, 9% below the £68 rolling average";
"revenue" for "margin" where the glossary's LTV holds).

### Appendix: Cohort LTV (`app-ret-ltv`)

A table slide of cumulative LTV per customer, in the same measure as `ret-ltv`, with one row for
each of the last 12 monthly cohorts (the Current period's cohort last), labelled by month, a
Customers column, then columns for months 0 to 12, an age a cohort has not reached left empty, and a
final **Rolling average** row. The cohort `ret-ltv` compares is the highlighted row. No comparison
columns. Action title: the spread of the cohorts' LTV at the age `ret-ltv` compares, around the
rolling average ("Six cohorts have reached month 6; their margin per customer ran from £51 to £79
around a £68 rolling average").

### Subscription mix (`ret-subscriptions`, conditional)

A chart slide. Stacked columns of new orders, one per month for 24 months, the Current period
marked: **subscription** new orders in the Highlight colour above **one-off** new orders in grey (a
new order is a customer's first order; a subscription order is one the Source flags as a
subscription). The Current period's column is labelled directly with its subscription orders and
the subscription share of new orders, so the share reads without a table. It carries no Share
toggle and no category palette. Action title: the share and its move ("Subscriptions made up 18% of
new orders, 29% above last month's 14%").

### Retention & LTV Recommendations (`ret-recs`)

Up to three Recommendation cards drawn from the Retention & LTV slides, ranked by revenue at stake,
worked as the Current period's new orders times the per-customer gap in cumulative LTV (converted to
revenue on the Revenue basis where the brain's LTV is not revenue) between the rolling average and the
cohort in question, at the oldest age that cohort has reached, counting only the part of the gap the
card's action acts on. Split the gap where it opens: its **month-0 part** is the gap in month-0
revenue per customer (the cohort's first orders were smaller), and its **later part** is the rest,
opening after month 0. Where the month-0 part is the larger, the card is a first-order card: its
action is on acquisition or first-order AOV (the entry offer, bundle or product, or the channel mix
that brought the cohort), sized on the month-0 part, and it is never a win-back email. Where the later
part is the larger, the card is a win-back or repeat-purchase card, sized on the later part. Action
title: as `trading-recs`.

### Next month (`next-month`)

The top three Recommendation cards across every Section that has them, ranked by revenue at stake,
each card as above with its Section named. Each of the three is a **distinct gap**. A card **sits
inside** another when its segment is part of the lever the other acts on:

| A card acting on | Segments that sit inside it |
|---|---|
| New customer orders (a Budget gap on that lever) | a customer-type fall on new customers; a channel's CAC gap or LTV gap; a first-order cohort card on `ret-recs` |
| Returning customer orders (a Budget gap on that lever) | a customer-type fall on returning customers; a win-back or repeat-purchase cohort card on `ret-recs` |
| AOV (a Budget gap on that lever, or an AOV fall) | an AOV slip; a category gap |
| A channel (a CAC gap or a Waste gap) | a campaign of that channel |

Two cards that size the same segment on the same measure are one gap. Where two cards are one gap or
one sits inside another, only the larger reaches Next month and the next distinct card, by revenue at
stake, takes its place. Every other pair is distinct, a market's fall, a discount card and a Waste gap
(sized in spend) included. Fewer than three distinct Recommendations exist: show those that do. Action title: the combined revenue at stake and the lead action. These three cards
are the actions next month's review checks.

### Appendix: LTV by order category and by order type (`app-ltv-category`, `app-ltv-type`)

Brain only. A table slide: one row for each group, highest 12-month LTV first, with the columns
Category or Type; customers; 12-month LTV; the same figure a year earlier; change %, on the LTV
window of `acq-ltv-channel`, grouped by the category (`app-ltv-category`) or the type
(`app-ltv-type`, for example subscription or one-off) of the customer's **first order**, as the
Source holds it on the order. An all-customer row closes the table and the best group's row is
highlighted. Customers with no category or type are an Unknown
row. Action title: the best and worst group's LTV and the gap, as `acq-ltv-channel`.

### Appendix: line items (`app-line-items`)

Brain only. A table of the 15 product and variant lines with the most revenue in the Current
period, ranked on that, ties by units. Columns: Product; Variant; **units** with this month and MoM
%; **revenue** with the comparison columns. Two last rows: "All other lines" and Total, the line
items' own total. A one-line footnote reads "Line-item revenue is read from your line items, so it
can differ from Revenue on the Trading KPIs, which is read from your orders." Action title: the
share of line-item revenue the 15 carry and the lead line ("Fifteen lines carried 58% of line-item
revenue, led by one at £96k").

### AOV, new / returning / blended (`aov-trend`)

A chart slide. Three lines, one per month for 24 months, on one axis since all three are order value
in the same currency: **blended** AOV (Average order value on `app-trading-kpi`, bold, in the
Highlight colour), **new-customer** AOV (new-customer revenue ÷ new orders, grey) and
**returning-customer** AOV (returning-customer revenue ÷ returning orders, grey and dashed). The
Current period is marked on each, and each line is labelled directly at its end with its name and
the Current period's figure. Revenue is on the basis of `app-trading-kpi` and the new and returning
split is that of `trading-revenue`, so the blended line equals Average order value on
`app-trading-kpi` in every month. No table sits beside it and no Share toggle: AOV is a rate. Action
title: the blended AOV and its move, with the customer type that moved it ("Average order value
rose 4% to £62, as new customers' orders reached £54 and returning customers' £68").

### Product and category mix (`aov-product`)

The grouping is the order's **category**.

**Category.** The category the Source holds on the order. Where the orders carry none and the order
items carry a product category, an order's category is that of its highest-revenue line (ties by the
line listed first), so every order sits in one category and the rows add up. Orders with no category
are the row **No category**, never spread. A Source with neither makes the slide a Brain slot, and
the Notes name it.

A chart slide. Horizontal bars of the Current period's sales (revenue on the basis of
`app-trading-kpi`) for the 5 categories with the most sales, then **Other categories** (when more
than five hold orders: every category not named above) and **No category** (when any order has none)
in grey, with the Share toggle: absolute shows each bar's sales in money, "% of total" sets each
bar to its share of the month's sales and labels the percentage, so the bars add up to 100%. The
lead category, the one the Action title leads with, takes the Highlight colour and every other bar is
grey. At each bar's right, in both views, sits the category's sales MoM change in the delta colours
("New" for a category that had no sales last month). The source line says how many categories there
are in all and that the full table is in the Appendix. Action title: the lead category's share of
sales and the category among the five that moved most ("Skincare carried 38% of sales, while
haircare grew 21% to £140k").

### Appendix: Product and category mix (`app-aov-product`)

A table slide of the categories ranked by sales in the Current period. Rows, in this order:

1. Up to ten categories; the first five are the bars of `aov-product`.
2. **Other categories**, when more than ten hold orders: every category not named above, in each
   period.
3. **No category**, when any order has none.
4. **Total**: orders equal Orders and sales equal Revenue on `app-trading-kpi`, new and returning
   orders equal theirs, and the rows above add up to it.

Columns, in this order: Category; **orders**, **new orders**, **returning orders**, **sales**
(revenue on the basis of `app-trading-kpi`) and **AOV** (sales ÷ orders), each with this month and
MoM %; **share of sales** (the row's sales ÷ the Total row's) with this month and MoM %. A category
that had no orders last month reads "New" in its MoM cells; a row with no orders reads "No data" in
its AOV cells. There is no year-ago column: the table holds too many measures. The lead category of
`aov-product` is the highlighted row. Action title: the number of categories and the share of sales
the top five carry ("Twelve categories took £420k, the top five 81% of it").

### Discount impact (`aov-discount`)

A **discounted order** is an order that carries a discount, as the Source holds it on the order. A
chart slide of three small charts side by side, 24 months, one measure each, none sharing an axis,
the Current period marked and labelled with its figure:

- **Discount rate** (discounted orders ÷ orders) as a line in the Highlight colour, in percent.
- **Discount depth** (discount given on discounted orders ÷ their value before discount) as columns,
  in percent, the Current period's column in the Highlight colour and the rest grey.
- **Discounted vs full-price orders** as stacked columns of order counts (discounted series 1,
  full-price series 3), **with the Share toggle**: absolute shows orders, "% of total" rescales each
  month to 100% and labels the percentages. The toggle sits on this chart only: the rate and the
  depth are rates and carry none.

No table sits beneath: the discount given (the money) and the order counts are the labels and the
Takeaway panel's. Where the Source defines either rate or depth in its own metrics, its definition
wins and the Notes state it. Action title: the discount rate and depth and how they moved ("Discounts
touched 31% of orders at an average depth of 18%, with the rate up 15% on last month").

### Discount codes (`aov-codes`, conditional)

A row is a **code group** where the Source's orders carry a code group column
(`references/sources.md`), so a month of single-use codes reads as a handful of groups; otherwise a
row is a code. An order counts under the group or code the Source holds on it, a code matched
ignoring case and spaces. A chart slide of horizontal bars of orders in the Current period for the
top 5 code groups, or codes, ranked by orders, ties by revenue. The row with the most orders, the
one the Action title names, takes the Highlight colour and every other bar is grey. Each bar is
labelled with its orders, and carries at its right its **depth** (discount given ÷ the orders' value
before discount) and its share of all orders in the month; a row for a free-shipping code, or whose
depth works out at 0%, reads "free shipping" in its depth cell, never 0%. The source line says how
many groups or codes were used and that the top ten are in the Appendix. A Source that holds
discounts but no code on the order writes the slide as a Brain slot, and the Notes name it. Action
title: the row with the most orders and its depth ("free shipping" in place of a depth for a
free-shipping row), with the share of orders that used a code ("One welcome code brought 1,200
orders at a 10% depth, and codes touched 24% of all orders").

### Appendix: Discount codes (`app-aov-codes`, conditional)

A table slide of the codes used in the Current period, ranked by orders, ties by revenue, a row
being a code group or a code as `aov-codes` has it. Rows, in this order:

1. Up to ten code groups, or codes; the first five are the bars of `aov-codes`.
2. **All other codes** (**All other code groups** on a grouped table), when more than ten were used:
   every group or code not named above, in each period.
3. **Total**: every order that carries a code, which the rows above add up to.

Columns, in this order: Code (Code group on a grouped table); **orders** with this month and MoM %;
**revenue** (on the basis of `app-trading-kpi`) with this month and MoM %; **discount given** with
this month and MoM %; **depth** with this month, "free shipping" as `aov-codes` has it; **share of
orders** (the row's orders ÷ all orders of the month). A row that was not used last month reads
"New" in its MoM cells; there is no year-ago column, as codes rarely last a year. The row
`aov-codes` names is the highlighted row. Action title: the number of codes or groups used and the
share of the code orders the top five carry ("Nineteen codes brought 4,100 orders, the top five 83%
of them").

### Order value & product Recommendations (`aov-recs`)

Up to three Recommendation cards drawn from the Order value & product slides, ranked by revenue at
stake, worked one of four ways and the card says which. **AOV slip**: new-customer or
returning-customer AOV below last month's, sized as that group's Current period orders times the
fall. **Category gap**: a category in `app-aov-product` whose AOV on single-category orders sits below the
average AOV of all single-category orders, sized as its Current period single-category orders times
that gap. A **single-category order** is an order whose lines all sit in one category
(`references/sources.md`, Order category); the blended AOV and a category's own AOV on
`app-aov-product` include multi-category baskets, so a category is never compared with them. A Source
that cannot tell which orders are single-category has no Category gap. **Discount creep**: a discount depth above last month's, sized
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
   customer, new-customer conversion and what it divides by, MER and the revenue it divides, active, lapsed, reactivated and the mart
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
| Cancelled orders | Cancelled orders are `<left out / counted / not stated>`, as your channel reporting counts them, so the figures here tie to it. |
| Returns | Returns are booked on the `<order / refund>` date, so the latest months' revenue can still change as returns arrive. Where the Revenue basis is before returns: Revenue is before returns, so it does not change as returns arrive; returns show in the margin rows (without margin rows, end at "arrive"). |
| Budget basis, where it differs from the Revenue basis | Budget is set on `<basis>`, so the budget column compares your `<basis>` against it, not the revenue above. |
| Orders not fully costed, where your orders flag them | `<n>` orders (`<share>` of revenue) include a product that has no cost yet. They are counted in every figure. With margin rows, add: Their `<rung>` % is taken to be the same as for your other orders. Where `<n>` is 1: 1 order (`<share>` of revenue) includes a product that has no cost yet. It is counted in every figure. With margin rows, add: Its `<rung>` % is taken to be the same as for your other orders. |
| Margin, with margin rows on a rung dated by order | `<Rung>` % is the margin rate your Growth Brain publishes, dated by order, and `<rung>` is that rate applied to all revenue, so it can differ from a `<rung>` your Growth Brain or a dashboard adds up order by order. Where your Growth Brain publishes no such rate on this revenue, `<rung>` % is `<rung>` divided by revenue on your fully costed orders, both `<before / after>` returns and `<ex / including>` shipping. |
| Mixed-dated margin, with margin rows on a rung dated partly by refund | Your `<plain name of the mart>` dates `<rung>` partly by refund, so `<rung>` % can swing from month to month with the timing of refunds. `<Rung>` is that % applied to all revenue, so it can differ from a `<rung>` your Growth Brain or a dashboard adds up order by order. |
| Equal rungs, where the brain says the chosen rung equals the one below | Your Growth Brain holds `<higher rung>` equal to `<lower rung>` (`<its reason in plain words>`), so the margin rows are labelled `<lower rung>`. |
| Thin costing, where the share of fully costed revenue falls sharply in the history shown | Costs are recorded from `<month>`, so margin before then, and year-on-year margin LTV, is not like for like. Where LTV is revenue, read: Costs are recorded from `<month>`, so margin before then is not like for like. |
| Cohort count, where the cohort mart counts customers | The cohorts count customers, leaving out guest orders, so a cohort can differ from the month's new orders. |
| Brain warning, one line for each | Your Growth Brain warns: `<the warning, trimmed to one sentence, with its date>`. |
| Campaign match by name, where a platform mart's campaigns are joined to channel reporting on the name | Campaigns are matched by name between your `<platform>` data and your channel reporting, so a renamed campaign can read "No data" for impressions and clicks. |
| History | The history starts in `<month>`, so trend charts are shorter than 24 months. |
| A missing source | `<Slides>` could not be built because your Growth Brain holds no `<plain name>`. |
| Modelled channels, where channel CAC reads modelled credit | Channels are credited as your Growth Brain models them, so a channel's new orders are its modelled credit and can differ from the orders your orders record against it. |
| Customer base, where the brain's active customer excludes one-order customers | Active customers exclude those with one order, as your Growth Brain defines them, so last month's active customers plus new and reactivated, less lapsed, will not equal this month's. |
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
| `trading-kpi`, `app-trading-kpi` | order rows or the sales over time report; spend rows and MER from the ad platforms read | no orders Source |
| `trading-revenue` | order rows by customer ID, else sales over time by customer type | no orders Source |
| `trading-customers` | order rows with customer IDs and history | no customer IDs, or the 12-month history limit leaves no month |
| `trading-markets`, `app-trading-markets` | order rows with a shipping country (conditional) | no order rows |
| `trading-recs` | the Trading slides built | all Trading slides are Brain slots |
| `acq-blended` | sessions over time for conversion; connected ad spend and new orders for CAC; each chart reads "No data" for what is not held | neither visits nor ad spend is held |
| `acq-channels`, `app-acq-channels` | order rows with UTM or referrer, spend from the ad platforms read (spend and CAC read "No data" for a channel with none) | no order row carries UTM or referrer |
| `acq-paid-organic` | the channel placement of `acq-channels` | `acq-channels` is a Brain slot |
| `acq-campaigns`, `app-acq-campaigns` | one slide of each for each connected ad platform whose campaign report is held and whose campaigns match Shopify new orders on UTM campaign | no ad platform report is held, or no campaign matches an order |
| `acq-ltv-channel`, `app-acq-ltv-channel` | order rows with customer IDs, history for the LTV window and UTM or referrer | any of the three is missing |
| `acq-recs` | the Acquisition slides built | all Acquisition slides are Brain slots |
| `ret-cohort`, `app-ret-cohort` | order rows with customer IDs and history | no customer IDs, or too little history for a cohort |
| `ret-ltv`, `app-ret-ltv` | as `ret-cohort` | as `ret-cohort` |
| `ret-subscriptions` | order rows with a subscription flag (conditional) | no order row carries a flag |
| `ret-recs` | the Retention & LTV slides built | all Retention & LTV slides are Brain slots |
| `aov-trend` | order rows by customer ID, else sales over time by customer type | no orders Source |
| `aov-product`, `app-aov-product` | order rows with a category, from the products file or connector | no order or no category |
| `aov-discount` | order rows with a discount amount | no discount column |
| `aov-codes`, `app-aov-codes` | order rows with a discount code (conditional) | discounts present, no code column |
| `aov-recs` | the Order value & product slides built | all of them are Brain slots |
| `app-ltv-category`, `app-ltv-type`, `app-line-items` | never | always |

`last-actions` reads each action's metric from the deck's own measures for the two months, and
"No data" where the Source cannot give it. Conditional slides follow the conditional rule above,
and a Section keeps its divider and its Recommendations slot whatever its slides.

Each slide of a pair above is a Brain slot when the Source cannot fill it, and a main slide that
is a Brain slot makes its Appendix slide one. Every Brain slot, a no-brain run's included, takes the
Layout of the slide it stands in for (**Brain slot markup** above).

The Brain slot of a slide the Source could not fill carries the fixed line below, whichever Source
was tried; the Brain line, once, closes the Notes (see Notes above) and the chat names the count.

## Brain slot wording

The title is the slide's Action title when it is a Brain slot, and the data fills the fixed line.
A slide built here uses these only when its Source cannot fill it.

| Id | Title | Data |
|---|---|---|
| `trading-kpi` | Revenue, new customers, MER and margin against last month, last year and budget | your orders, ad spend and budget |
| `app-trading-kpi` | Revenue, orders, new orders, spend and margin against last month, last year and budget, in full | your orders, ad spend and budget |
| `trading-revenue` | Revenue from new and returning customers, month by month for 24 months | your orders by customer type |
| `trading-customers` | The active customer base each month, with new, reactivated and lapsed customers | your customers' order history |
| `trading-markets` | Revenue for the top five markets, with how each moved | your orders by market |
| `app-trading-markets` | Revenue, orders and order value for every market | your orders by market |
| `trading-recs` | Up to three Trading actions, each with its evidence and how to validate it | the Trading slides' data |
| `acq-blended` | Blended CAC and new-customer conversion, month by month for 24 months | your traffic, orders and ad spend by month |
| `acq-channels` | New orders and CAC for the top five channels, with the new orders no channel claims | your orders and ad spend by channel |
| `app-acq-channels` | New orders, spend and CAC for every channel, against last month and last year | your orders and ad spend by channel |
| `acq-paid-organic` | The paid and organic share of new orders over the last 12 months | your orders by channel |
| `acq-campaigns` | The top five campaigns on each connected ad platform, with their CAC | your ad platform campaign reports |
| `app-acq-campaigns` | The top 10 campaigns on each connected ad platform, with spend and CAC | your ad platform campaign reports |
| `acq-ltv-channel` | LTV by acquisition channel, ranked | your customers' order history by acquisition channel |
| `app-acq-ltv-channel` | LTV for every acquisition channel, against a year earlier | your customers' order history by acquisition channel |
| `acq-recs` | Up to three Acquisition actions, each with its evidence and how to validate it | the Acquisition slides' data |
| `ret-cohort` | How many of each of the six latest cohorts ordered again, month by month | your customers' order history by first-order month |
| `app-ret-cohort` | How many of each of the last 12 monthly cohorts ordered again, months 0 to 12 | your customers' order history by first-order month |
| `ret-ltv` | The latest cohort's cumulative LTV per customer against the average | your customers' order history by first-order month |
| `app-ret-ltv` | Each of the last 12 cohorts' cumulative LTV per customer, months 0 to 12 | your customers' order history by first-order month |
| `ret-subscriptions` | Subscription and one-off new orders over 24 months | your orders by subscription |
| `ret-recs` | Up to three Retention & LTV actions, each with its evidence and how to validate it | the Retention & LTV slides' data |
| `aov-trend` | Average order value for new, returning and all customers over 24 months | your orders by customer type |
| `aov-product` | The top five product categories by sales, against last month | your orders by product category |
| `app-aov-product` | Orders, sales and order value for every product category, against last month | your orders by product category |
| `aov-discount` | Discounted against full-price orders, with discount rate and depth | your orders with their discounts |
| `aov-codes` | Orders and discount depth for the top five discount codes | your orders by discount code |
| `app-aov-codes` | Orders, revenue and discount for the top 10 discount codes | your orders by discount code |
| `aov-recs` | Up to three Order value & product actions, each with its evidence and how to validate it | the Order value & product slides' data |
| `app-ltv-category` | LTV by the category of a customer's first order | your customers' order history by first-order category |
| `app-ltv-type` | LTV by the type of a customer's first order | your customers' order history by first-order type |
| `app-line-items` | Units and revenue by product and variant for the month | your order line items |

The `cover`, the dividers, `exec-summary`, `last-actions`, `next-month` and `notes` are never Brain slots. A
Section whose slides are all Brain slots keeps its divider and its Recommendations slot.
