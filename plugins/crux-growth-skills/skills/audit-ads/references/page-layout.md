# Audit page layout

A Meta ad audit is one HTML file, self-contained bar its web fonts, `meta-ad-audit-<date>.html` (`<date>` is today as
`YYYY-MM-DD`), written to the working folder, with inline CSS and one small inline script (the
sorting below). It is always Crux-branded as `references/crux-brand.md` sets out, whatever the
brand: never ask the user about a brand's own colours, fonts or logo, and never apply them. It makes no
network request beyond that file's Google Fonts stylesheet and the font files it serves: the
script makes none. Crux house style:
British English, no em dashes, outcome before mechanism, relative percentage changes (2.0% to 1.8%
is "−10%"). Money is in the account's currency, rounded to whole units; CAC to two decimals.

**The masthead** sits above the first section, under a heavy rule: an eyebrow, "Meta ad audit",
then one heading, the brand's name, and under it one small line, the date (today). The brand's
name sits in the heading and nowhere else carries a brand's own styling. Then one two-column table,
a label on the left and its text on the right, one row per label, in this order:

| Label | Text |
|---|---|
| Window | The 60 complete days read, first to last date; the 5-day current window's dates; the 7-day Reported window's dates. |
| Source | The Source the run used: the Growth Brain connector's name, the Meta connector's name, or "Ads Manager export" with the file's name. |
| Measure | With a Growth Brain: "CAC: spend over new customers, counted from your own first orders." Otherwise: "CAC: Meta spend over the purchases Meta reports for the ad. Platform-attributed: it counts every purchase Meta claims." |
| Reported ads | How many ads are on the page, and the share of the last 7 days' spend they hold, outside the awareness and lead campaigns. |

**Four headings**, always present, always in this order, with these words. A heading with nothing
under it stays on the page, with one line saying why. Each section sits under a 4px signal-blue rule,
with its number as an eyebrow ("Section 1") and its heading as the title. A footer closes
the page: "Built with Crux growth skills".

## 1. Summary

Three or four sentences of plain prose, then one table. Where the Judged spend share is below
50%, one sentence comes first and opens the section: the method cannot judge most of the account's
spend yet, as only <share>% of the last 7 days' spend is in ads past the Eligibility floors and the
rest is still Ramping.

- The sentences: how many Reported ads were judged and how many are Ramping; the Recommendations
  by action, with the sum of the Pause and Refresh sizes in a month (a Fatigued ad's Pause and
  Refresh both count, as they are two sizes); the Recommendation to do first, with its ad and
  size; and, where any Pause is held, how many wait on a Refresh.
- The table, **Status**, **Ads**, **7-day spend**, one row per status in the method's order (Low
  efficiency, Fatigued, Fatiguing, Improving, Winner, Healthy, Ramping), with a row for every
  status even at 0.

## 2. Recommendations

One line above the table: "Lever: new customers, through CAC. Mode: Switch for every
Recommendation (make the change, then watch the metric)." Then one table, ranked as `SKILL.md`
ranks it (Pause and Refresh by size, then Iterate by CAC gap), with these columns:

| Column | Holds |
|---|---|
| Action | Pause, Refresh or Iterate (a Winner's Iterate is labelled "Iterate (winner)"), then on a second line the evidence: the ad's 5-day CAC against the reference it is measured on (the blend, or its Peak CAC), and the run of days where one applies. A held Pause, only ever a Fatigued ad's, reads "Pause once the Refresh is live"; a Pause that leaves its ad set with no ad past Ramping says so. A Refresh on a flexible or dynamic creative ad reads "Refresh: add new assets to the ad". |
| Ad | The ad's name. |
| Ad set | The ad set's name, with its campaign beneath. |
| Status | The ad's status. |
| Size | Pause and Refresh: money a month. Iterate: "CAC <gap>% below the blend, <share>% of spend". |
| Confidence | High, Medium or Low. |
| Metric to watch | Pause: the ad set's CAC over the next 7 days. Refresh and Iterate: the new ad's CAC after Ramping against the source ad's Peak CAC, with that figure. |

The first row, the Recommendation to do first, is the highlighted row (`class="hi"`); the highlight
moves with that row when the table is sorted. With no Recommendation, the table is replaced by one line: "No Recommendations: every Reported ad
is Healthy, Improving or Ramping."

An evidence line reads like "5-day CAC 42 against a Peak CAC of 24, 50% or more worse on each of
the last 3 days" or "5-day CAC 18, 40% below the blend of 30". It names the ad and its numbers,
never the creative to make.

## 3. Every ad

One line saying how many Reported ads, and that Ramping ads carry no verdict. Then one table of
every Reported ad, ranked by 7-day spend, highest first, with these columns:

| Column | Holds |
|---|---|
| Ad | The ad's name. |
| Ad set | The ad set's name, with its campaign beneath. |
| Status | The ad's status. A Ramping ad adds "<spend> spent so far" beneath. |
| 7-day spend | Spend over the last 7 days. |
| 5-day CAC | The ad's CAC over the current window; "No new customers" where it has none. |
| Peak CAC | The ad's Peak CAC; a dash where it has none. |
| Blend | The Account blend the ad is judged against (the retargeting blend for those campaigns). |

## 4. Notes and Method

In this order:

1. **The method**, the text of `references/method.md` word for word.
2. **This run**, a short list:
   - the campaigns confirmed as retargeting or existing-customer, by name, or "None";
   - the campaigns left out as awareness, by name with their spend over the last 7 days, or
     "None";
   - the campaigns left out as lead campaigns, by name with their spend over the last 7 days, or
     "None";
   - with a Growth Brain, that ads are grouped by their Meta ad id, and that rows with no ad (an
     Unknown ad id, which takes in unrendered templates) are left out of judging;
   - without one, that CAC is platform-attributed, that ads are grouped by Ad ID, that an ad's age
     and life spend are counted from the 60 days read, and the timezone the days follow or that
     none was named;
   - an unattended run: that nobody confirmed the retargeting, awareness or lead campaigns, so the proposed ones were
     used, and, above 300 Reported ads, that the run went on without the question to proceed;
   - the flexible or dynamic creative ads, by name, each judged as one unit with no split by asset,
     and that their Refresh is to add new assets; omitted where there are none;
   - which Fatigued ads' Pauses were held to keep 3 live ads in an ad set, by ad set, and that a
     Low efficiency Pause is never held;
   - that sizes are run-rated from 5 days and are estimates, with the confidence beside each.
3. **The Brain line**, on a run whose Source is not a Growth Brain and whose session holds none: the
   last line of Notes and Method, in these words and no others: "With a Growth Brain, this judges
   every ad on a single attribution source rather than every purchase Meta claims." A run with a
   Growth Brain connected carries no Brain line, whichever Source it fell to.

## The page's CSS

Use this skeleton, unchanged, as the page's `<head>` and the frame of its body, filling the
`…`. Every colour and font on the page comes from these tokens, never a hex value in the body. A
status cell carries `class="st-good"` (Winner, Improving) or `class="st-bad"` (Low efficiency,
Fatigued), and the others none. Figure columns carry `class="num"` on their header and every cell; the evidence line under an
Action sits in a `<span class="sub">`, and the campaign under an ad set in a
`<span class="sub camp">`.

```html
<!doctype html>
<html lang="en-GB">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Meta ad audit · …brand… · …date…</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Newsreader:wght@400;500;600&family=Libre+Franklin:wght@400;500;600&display=swap">
<style>
:root{
  --paper:#FFFFFF;--paper-2:#F5F6F7;--paper-3:#EDEFF1;
  --ink-1:#0E1215;--ink-2:#3A4046;--ink-3:#5A6169;--ink-4:#8A9099;
  --signal:#0F4C81;--signal-tint:#E7EEF4;
  --line:#C9CDD1;--line-soft:#E2E5E8;--line-strong:#0E1215;
  --positive:#1E6E45;--negative:#A4271C;
  --display:"Newsreader",Georgia,"Times New Roman",serif;
  --body:"Libre Franklin",system-ui,-apple-system,"Segoe UI",Helvetica,Arial,sans-serif;
}
*{box-sizing:border-box;border-radius:0}
body{margin:0;background:var(--paper);color:var(--ink-2);font:15px/1.55 var(--body)}
main{max-width:1120px;margin:0 auto;padding:40px 16px 24px}
.eyebrow{font:600 12px/1.2 var(--body);letter-spacing:.08em;text-transform:uppercase;color:var(--ink-3);margin:0 0 6px}
header.mast{border-top:3px solid var(--line-strong);padding-top:16px;margin-bottom:32px}
header.mast h1{font:500 40px/1.1 var(--display);color:var(--ink-1);margin:0}
header.mast .date{color:var(--ink-3);margin:6px 0 20px}
header.mast table th{background:var(--paper-2);width:9em}
section{border-top:4px solid var(--signal);padding-top:14px;margin:0 0 40px}
section h2{font:500 26px/1.2 var(--display);color:var(--ink-1);margin:0 0 12px}
p{max-width:72ch}
.table-wrap{overflow-x:auto}
table{width:100%;border-collapse:collapse;font-variant-numeric:tabular-nums lining-nums;font-size:14px}
th{font:600 11px/1.3 var(--body);letter-spacing:.06em;text-transform:uppercase;color:var(--ink-3);text-align:left;padding:8px 10px;border-bottom:1px solid var(--line);background:var(--paper-2);white-space:nowrap}
th[data-dir="asc"]::after{content:" ▲"}th[data-dir="desc"]::after{content:" ▼"}
td{padding:9px 10px;border-bottom:1px solid var(--line-soft);vertical-align:top;color:var(--ink-2)}
td.num,th.num{text-align:right}
td .sub{display:block;font-size:12px;color:var(--ink-3)}
td .sub.camp{color:var(--ink-4)}
tr.hi td{background:var(--signal-tint);-webkit-print-color-adjust:exact;print-color-adjust:exact}
.st-good{color:var(--positive);font-weight:600}
.st-bad{color:var(--negative);font-weight:600}
footer{max-width:1120px;margin:0 auto;padding:16px;border-top:1px solid var(--line);color:var(--ink-4);font-size:12px}
@media print{main{padding-top:0}.table-wrap{overflow:visible}th[data-dir]::after{content:none}}
</style>
</head>
<body>
<main>
<header class="mast">
  <p class="eyebrow">Meta ad audit</p>
  <h1>…brand…</h1>
  <p class="date">…date…</p>
  <div class="table-wrap"><table>…Window, Source, Measure, Reported ads…</table></div>
</header>
<section><p class="eyebrow">Section 1</p><h2>Summary</h2>…</section>
<section><p class="eyebrow">Section 2</p><h2>Recommendations</h2>…</section>
<section><p class="eyebrow">Section 3</p><h2>Every ad</h2>…</section>
<section><p class="eyebrow">Section 4</p><h2>Notes and Method</h2>…</section>
</main>
<footer>Built with Crux growth skills</footer>
…the sorting script…
</body>
</html>
```

The Summary, Recommendations and Every ad tables each carry a `<thead>` and a `<tbody>`, or the
sorting script cannot reach them. The masthead's table does not sort: it has no `<thead>`, its labels are a `<th>` at the start of
each row, and the sorting script below sorts only by headers inside a `<thead>`. Wrap
every table in `<div class="table-wrap">` so a wide table scrolls on a phone and the page does not.

## Sorting

Every header of the Summary, Recommendations and Every ad tables sorts its table. Give each `<th>` in every `<thead>` a click that sorts that table's
rows by the column, ascending then descending on a second click, numbers as numbers and money,
percentages and CAC by their value: put the value in a `data-sort` attribute on each cell, and sort
a missing value last. A table with a ranked order is written in that order, so the page reads
correctly where a viewer does not run the script. Use this script, unchanged, as the page's only
script:

```html
<script>
document.querySelectorAll("table").forEach(function (table) {
  table.querySelectorAll("thead th").forEach(function (th, col) {
    th.style.cursor = "pointer";
    th.addEventListener("click", function () {
      var dir = th.dataset.dir === "asc" ? "desc" : "asc";
      table.querySelectorAll("thead th").forEach(function (other) { delete other.dataset.dir; });
      th.dataset.dir = dir;
      var body = table.tBodies[0];
      var rows = Array.prototype.slice.call(body.rows);
      function key(row) {
        var cell = row.cells[col];
        var raw = cell.dataset.sort !== undefined ? cell.dataset.sort : cell.textContent.trim();
        return raw === "" ? null : raw;
      }
      rows.sort(function (a, b) {
        var x = key(a), y = key(b);
        if (x === null && y === null) return 0;
        if (x === null) return 1;
        if (y === null) return -1;
        var nx = parseFloat(x), ny = parseFloat(y);
        var order = (!isNaN(nx) && !isNaN(ny)) ? nx - ny : String(x).localeCompare(String(y));
        return dir === "asc" ? order : -order;
      });
      rows.forEach(function (row) { body.appendChild(row); });
    });
  });
});
</script>
```
