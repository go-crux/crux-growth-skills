# Audit page layout

An Audit is one self-contained HTML file, `landing-page-audit-<slug>.html`, written to the
working folder. It is a single scrolling page with inline CSS and no script, and it makes no
network request. Crux house style: British English, no em dashes, outcome before mechanism,
relative percentage changes (2.0% to 1.8% is "−10%").

**The slug** is the page's path with the query string, fragment and outer slashes cut, any
remaining slash replaced by a hyphen, in lower case. `/pages/spring-sale?utm_source=x` gives
`pages-spring-sale`, `/products/mug-set` gives `products-mug-set`, and the home page `/` gives
`home`.

The reader may arrive cold, with no idea how the audit was made. Item formats (the scorecard,
a finding, a quick win, a hypothesis, the backlog table) are in `references/templates.md`;
this file fixes the page around them.

## The masthead

Above the first heading, no heading of its own: the title "Landing page audit", the page's
URL, and the context in short lines:

- Page type, the single conversion goal and the device priority (mobile first unless told
  otherwise).
- How the page was read: rendered at mobile width, fetched HTML only, and any screenshots the
  user gave.
- Which checks are unassessed and the input that would settle them, in one line.
- The traffic source and awareness stage where the user named them; otherwise "Traffic source
  not given".

## The five headings

Five headings, always present, always in this order, with these words:

1. **Performance**
2. **Scorecard**
3. **Findings**
4. **Quick wins**
5. **Test backlog**

Each opens with a one-line **Summary** before anything else under it: one sentence of plain
prose saying what the section holds and its key takeaway, with its figure (for example "14 of
52 assessed checks met; the offer is the weakest ingredient at 0 of 7"). A heading with
nothing under it stays on the page, and its Summary gives the reason.

<!-- HOOK: Performance. A source of the page's own figures (visits, conversion, the funnel)
fills this heading's table in place of the "Not available" line. Add Brand guardrails to the
masthead and the Findings checks the same way. -->

### 1. Performance

With no traffic figures this heading reads **Not available**, and its Summary is that one line:
"Not available: a Shopify 'Sessions by landing page' export or a Growth Brain
(gocrux.io/contact) would add visits, conversion and the funnel." Where a Growth Brain is
connected in the session, the line instead reads "Not available: this audit reads the page
only, so visits, conversion and the funnel are not part of it." Nothing else sits under the
heading.

### 2. Scorecard

Summary: checks met over checks assessed in total, and the weakest ingredient. Under it, in
this order, as `references/templates.md` sets them out:

1. The scorecard table, six ingredient rows and a total row.
2. The line naming the input that would settle each unassessed check.
3. The check list: all sixty checks, grouped under their ingredient, each with its number,
   its lead phrase and its mark (Met, Not met, n/a, Unassessed).

### 3. Findings

Summary: how many findings, and which ingredient carries the most failed checks. Under it, the
findings F1, F2, F3 in order, structural first, as `references/templates.md` sets them out.
Each names its failed checks and one of trust, understanding or fit, and ends on a **Do**. With
no failed check the heading reads "No findings", with the Summary saying every assessed check
is met.

### 4. Quick wins

Summary: how many, and what they settle. Under it, the quick wins Q1, Q2, Q3, each naming the
checks it settles. With none, the Summary says why (for example "No quick wins: every failed
check needs a test").

### 5. Test backlog

Summary: how many hypotheses and the top-ranked one by name. Under it, in this order: the
hypothesis blocks H1, H2, H3 numbered to match their findings, the ranked table, then the
sequencing line. The table's **Read as** column reads "Test or ship: needs traffic figures" in
every row.
