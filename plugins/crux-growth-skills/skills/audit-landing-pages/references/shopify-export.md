# Find and Audit performance from a Shopify export

Opened only when no Growth Brain is connected: by Find, to rank pages, and by the Performance
step, when the user has already given the file. With a brain connected, never ask for the
export: `references/find.sql` reads the same traffic and more.

## The four steps

Give the user these four, in this order and in these words:

1. In Shopify admin, open Analytics, then Reports, then "Sessions by landing page".
2. Set the date range to the last 90 days.
3. Edit the metrics to add sessions with cart additions, sessions that reached checkout and
   sessions that completed checkout.
4. Export as CSV and drop the file into this chat.

## The columns

Read five columns and match their headers loosely, since Shopify's labels vary by report version
and language (for example "Landing page path", "Sessions", "Sessions with cart additions",
"Sessions that reached checkout", "Sessions that completed checkout"). Read the numbers as
counts, ignoring thousands separators.

| Column | Feeds |
|---|---|
| Landing page path | the page, its Page type |
| Sessions | every rate, the cut, the read-as call |
| Sessions with cart additions | cart rate |
| Sessions that reached checkout | checkout reach rate |
| Sessions that completed checkout | conversion, checkout completion rate |

Take each path with its query string and fragment cut and its trailing slash dropped (the home
page stays `/`), and add together the rows that then share a path. Where the file is a full URL,
take its path.

**A missing column.** Name it to the user, with this table's feed. Without the landing page path,
sessions or sessions that completed checkout, nothing can be ranked: ask for a re-export with the
column added. Without cart additions or sessions that reached checkout, carry on and drop the
funnel rates that need the missing column, saying which in one line; ask for a re-export only if
the user wants them.

## The rules

The Page type, the pages never ranked and the cut are those of `references/find.sql`, read from
its `page_type` and `cut` CTEs and not restated here. Apply them to the export's rows as to
`period_rows`: the site's sessions are the sum over every row, excluded pages included, and an
Underperforming page has at least `min_visit_share` of them and a conversion at least `min_gap`
below its Benchmark conversion.

**Conversion** is sessions that completed checkout over sessions, for a page, a Page type or the
site, always summed over summed.

**Benchmark conversion** is the site's conversion for the page's Page type, summed over every
ranked page of that type, the page itself included. The export has no channel, so there is no
traffic mix adjustment and no thin-cell fallback.

**Orders at stake** = sessions × (Benchmark conversion − the page's conversion). Round to whole
orders. A page ahead of its Benchmark shows a negative.

Compute with code where the session can run it; otherwise by hand, and check that the pages'
sessions plus the excluded pages' sessions equal the file's total.

## The light funnel

For the audited page, three rates, each beside the same Page type's rate (summed over every ranked
page of that type) and the relative gap:

| Rate | Numerator over denominator |
|---|---|
| Cart rate | sessions with cart additions over sessions |
| Checkout reach rate | sessions that reached checkout over sessions with cart additions |
| Checkout completion rate | sessions that completed checkout over sessions that reached checkout |

The export gives no Leaking step: that needs a Growth Brain, so the findings keep their usual
order.

## The read-as call

`references/diagnostics.md` section 4 takes the page's monthly visits and conversion. From the
export, monthly visits are the page's sessions × 30 ÷ the days in the date range (90 unless the
user set another), and conversion is the page's conversion above.

## The match for an Audit

Match the audited URL's path to a row by the rule under "The columns". With no match, say so in
one line and run the Audit without performance: Performance reads "Not available" with that
reason.
