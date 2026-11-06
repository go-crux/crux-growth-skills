# Audit page layout

A Meta ad audit is one self-contained HTML file, `meta-ad-audit-<date>.html` (`<date>` is today as
`YYYY-MM-DD`), written to the working folder, with inline CSS and one small inline script (the
sorting below), and it makes no network request. Crux house style: British English, no em dashes,
outcome before mechanism, relative percentage changes (2.0% to 1.8% is "−10%"). Money is in the
account's currency, rounded to whole units; CAC to two decimals.

**The masthead** sits above the first heading, with no heading of its own: the title "Meta ad
audit", the brand, then one two-column table, a label on the left and its text on the right, one
row per label, in this order:

| Label | Text |
|---|---|
| Window | The 60 complete days read, first to last date; the 5-day current window's dates; the 7-day Reported window's dates. |
| Source | The Source the run used: the Growth Brain connector's name, the Meta connector's name, or "Ads Manager export" with the file's name. |
| Measure | With a Growth Brain: "CAC: spend over new customers, counted from your own first orders." Otherwise: "CAC: Meta spend over the purchases Meta reports for the ad. Platform-attributed: it counts every purchase Meta claims." |
| Reported ads | How many ads are on the page, and the share of the last 7 days' spend they hold. |

**Four headings**, always present, always in this order, with these words. A heading with nothing
under it stays on the page, with one line saying why.

## 1. Summary

Three or four sentences of plain prose, then one table.

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
| Action | Pause, Refresh or Iterate (a Winner's Iterate is labelled "Iterate (winner)"), then on a second line the evidence: the ad's 5-day CAC against the reference it is measured on (the blend, or its Peak CAC), and the run of days where one applies. A held Pause reads "Pause once the Refresh is live". |
| Ad | The ad's name. |
| Ad set | The ad set's name, with its campaign beneath. |
| Status | The ad's status. |
| Size | Pause and Refresh: money a month. Iterate: "CAC <gap>% below the blend, <share>% of spend". |
| Confidence | High, Medium or Low. |
| Metric to watch | Pause: the ad set's CAC over the next 7 days. Refresh and Iterate: the new ad's CAC after Ramping against the source ad's Peak CAC, with that figure. |

With no Recommendation, the table is replaced by one line: "No Recommendations: every Reported ad
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

1. **The method**, the text of `references/method.md` word for word, as it was sent at the intake.
2. **This run**, a short list:
   - the campaigns confirmed as retargeting or existing-customer, by name, or "None";
   - with a Growth Brain, that rows with no ad (an Unknown ad, or an unrendered template) are left
     out of judging;
   - without one, that CAC is platform-attributed, that ads are grouped by Ad ID, that an ad's age
     and life spend are counted from the 60 days read, and the timezone the days follow or that
     none was named;
   - which Pauses were held to keep 3 live ads in an ad set, by ad set;
   - that sizes are run-rated from 5 days and are estimates, with the confidence beside each.
3. **The Brain line**, on a run whose Source is not a Growth Brain and whose session holds none: the
   last line of Notes and Method, in these words and no others: "With a Growth Brain, this judges
   every ad on a single attribution source rather than every purchase Meta claims." A run with a
   Growth Brain connected carries no Brain line, whichever Source it fell to.

## Sorting

Every table header sorts its table. Give each `<th>` of every table a click that sorts that table's
rows by the column, ascending then descending on a second click, numbers as numbers and money,
percentages and CAC by their value: put the value in a `data-sort` attribute on each cell, and sort
a missing value last. A table with a ranked order is written in that order, so the page reads
correctly where a viewer does not run the script. Use this script, unchanged, as the page's only
script:

```html
<script>
document.querySelectorAll("table").forEach(function (table) {
  table.querySelectorAll("th").forEach(function (th, col) {
    th.style.cursor = "pointer";
    th.addEventListener("click", function () {
      var dir = th.dataset.dir === "asc" ? "desc" : "asc";
      table.querySelectorAll("th").forEach(function (other) { delete other.dataset.dir; });
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
