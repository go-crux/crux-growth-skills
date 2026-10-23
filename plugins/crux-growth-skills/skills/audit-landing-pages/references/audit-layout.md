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
- How the page was read: rendered at mobile width, fetched HTML only (naming a browser tool
  that failed, where it did), and any screenshots the user gave.
- Which checks are unassessed and the input that would settle them, in one line.
- The Brand guardrails: confirmed, taken from the user's file, or the ones left unconfirmed.
- The traffic source and awareness stage where the user named them; otherwise "Traffic source
  not given".

## The six headings

Six headings, always present, always in this order, with these words:

1. **Performance**
2. **Scorecard**
3. **Findings**
4. **Quick wins**
5. **Test backlog**
6. **Methodology**

Each opens with a one-line **Summary** before anything else under it: one sentence of plain
prose saying what the section holds and its key takeaway, with its figure (for example "14 of
52 assessed checks met; the offer is the weakest ingredient at 0 of 7"). A heading with
nothing under it stays on the page, and its Summary gives the reason. Methodology is the one
exception: its Summary is fixed copy and carries no figure.

### 1. Performance

Five cases.

**A Non-sale page.** This case holds whatever the run had, a brain, an export or neither. The
Summary is that one line: "Online figures do not measure this page: its goal is <the goal>, not
an online purchase." Nothing else sits under the heading.

**Neither a brain nor an export.** The heading reads **Not available**, and its Summary is that one line:
"Not available: a Shopify 'Sessions by landing page' export or a Growth Brain
(gocrux.io/contact) would add visits, conversion and the funnel." Nothing else sits under the
heading.

**A Shopify export, no brain, and the page matched.** The Summary gives the page's sessions,
conversion and Orders at stake in one sentence. Under it, in this order:

1. **The page's figures**, one table: sessions, conversion, Benchmark conversion and Orders at
   stake, with the export's date range and "sessions that completed checkout over sessions"
   named above it. A page ahead of its Benchmark shows its Orders at stake as a negative and says
   so in a few words.
2. **The light funnel**, one table: cart rate, checkout reach rate and checkout completion rate
   for the page, the same Page type and the relative gap, per `references/shopify-export.md`.
   A rate dropped for a missing column is replaced by one line saying which.
3. **The footnote**: each rate is summed over summed, the export carries no channel, revenue or
   device, and a Growth Brain adds revenue, traffic mix and the full funnel (gocrux.io/contact).

**A brain or an export, and the page has no match** (no visits to its path in the traffic table or
the file, or the brain holds no traffic table). The Summary reads "Not available: " with that reason in one sentence, and
the audit reads the page only. Nothing else sits under the heading.

**A brain, and the page matched.** The Summary gives the page's visits, conversion and Revenue at
stake in one sentence, and names the Leaking step where there is one. Under it, in this order:

1. **The page's figures**, one table: visits, conversion, revenue per visit, Benchmark revenue per
   visit and Revenue at stake, with the period's dates and the revenue column named above it. A
   page ahead of its Benchmark shows its Revenue at stake as a negative and says so in a few words.
   The page's conversion here, orders over visits, is the page's one headline conversion.
2. **The top 3 channels**, each with its share of the page's visits.
3. **Mobile against desktop**: the session purchase conversion rate on each device, beside the
   same Page type's.
4. **The funnel**, one table: each rate in `references/performance.md` for the page, the same
   Page type and the relative gap, with the Leaking step marked.
5. **The footnote**: the revenue column and whether it includes tax and shipping, as the column
   shows it ("revenue is total sales ex tax, after discounts and returns" or "... inc tax, ..."),
   the days the funnel covers, that each rate is summed over summed, and the conversion note
   `references/performance.md` sets out.

A part the brain cannot give is replaced by one line saying why, never dropped silently: without
a funnel table, one line stands for both the device split and the funnel ("The brain holds no
funnel table, so the device split and funnel steps are not shown"), and with no funnel rows for
the page, one line says so.

### 2. Scorecard

Summary: checks met over checks assessed in total, and the weakest ingredient. Under it, in
this order, as `references/templates.md` sets them out:

1. The scorecard table, six ingredient rows and a total row.
2. The line naming the input that would settle each unassessed check.
3. The check list: all sixty checks, grouped under their ingredient, each with its number,
   its lead phrase and its mark (Met, Not met, n/a, Unassessed).

### 3. Findings

Summary: how many findings, and which ingredient carries the most failed checks. Under it, the
findings F1, F2, F3 in order, as `references/templates.md` sets them out.
The order is the Leaking step's where Performance names one (structural first within each group),
otherwise structural first, and the Summary says which. Each names its failed checks and one of
trust, understanding or fit, and ends on a **Do**. With
no failed check the heading reads "No findings", with the Summary saying every assessed check
is met.

### 4. Quick wins

Summary: how many, and what they settle. Under it, the quick wins Q1, Q2, Q3, each naming the
checks it settles. With none, the Summary says why (for example "No quick wins: every failed
check needs a test").

### 5. Test backlog

Summary: how many hypotheses and the top-ranked one by name. Under it, in this order: the
hypothesis blocks H1, H2, H3 numbered to match their findings, the ranked table, then the
sequencing line, then the backlog footnote. The table's **Read as** column carries each row's
call as `references/templates.md` sets it (for a Non-sale page, the read on the page's own
goal), and reads "Test or ship: needs traffic figures" only
where the audit had neither a brain nor an export. The footnote names the lift rule and whether
the table or the formula was used, and is left out where no row carries a call from traffic.

### 6. Methodology

How the audit was made, for a reader who arrives cold. The copy is fixed: write it as given here,
the same on every audit, so it never restates this page's results. It restates rules from
`references/ingredients.md`, `references/templates.md` and `references/diagnostics.md`: when one
of those changes, change this copy with it. Summary: "How the audit works: sixty checks across
six ingredients, what each one looks for and why it matters." Under it, in this order:

1. **How the audit works**, a numbered list:
   1. We read the page as a visitor sees it, on a phone first where we can render it and from its
      HTML where we cannot, alongside its visits and orders where a Growth Brain or a Shopify
      export holds them.
   2. We score it against sixty checks, ten for each ingredient. Each check is Met, Not met, n/a
      or Unassessed, and an ingredient's score is the checks met over the checks met or not met.
   3. Every failed check becomes a finding or a quick win. Where the figures show the Leaking
      step, the funnel step where the page loses most against similar pages, the findings that
      bear on that step come first.
   4. Each finding that is not a quick win becomes a test idea, ranked by ICE: impact, confidence
      and ease, each out of 5. Where the page sells online and its traffic is known, each one says
      whether to run a test, take a sequential read (before against after), or ship the change.
2. **The six ingredients**, one table, columns Ingredient, What we check and Why it matters:

   | Ingredient | What we check | Why it matters |
   |---|---|---|
   | Makes the benefits clear | In the first screen, a visitor knows what is on offer, what it does for them and why it beats what they use now, told as outcomes rather than features. | Visitors decide in seconds whether a page is for them. If they cannot see the benefit, they read no further. |
   | Has an irresistible offer | Everything the visitor gets, what they pay, the terms, the risk they carry and any bonus. | A good product still loses on a weak offer. The offer is what makes yes easy and no feel like leaving value behind. |
   | Is trustworthy | Proof matched to each doubt a visitor brings: reviews, guarantees, credentials and evidence that the claims are true. | Doubt is among the reasons shoppers give most often for not buying, so this ingredient often has the most to gain. |
   | Is written well | Copy that is concrete, specific and easy to scan, in the order of an argument, with each objection answered where it comes up. | Visitors skim. Vague or muddled copy leaves the question that stops a purchase unanswered. |
   | Is user-friendly | A page that is easy to understand, easy to find your way round and quick to act on, on the device people use. | Every moment of friction, doubt or delay before the one action loses some of the people who came to buy. |
   | Gives people what they want | The page matches what this visitor came for: their intent, who they are, how ready they are to buy and the next step they will take. | A clear, trustworthy, well-built page still loses when it answers a question this visitor was not asking. |

3. **The lens**, one line: "Across all six, we read the page against how ready its visitors are
   to buy, from not yet knowing they have the problem to ready to buy today. It shapes the
   findings and is not scored."
4. **The credit**, one paragraph, with the address as a link to
   `https://conversion-rate-experts.com/`: "The six ingredients are adapted from Conversion Rate
   Experts' ingredients of a winning website, set out in their book *Making Websites Win*
   (conversion-rate-experts.com). The sixty checks and their wording, the scoring and the test
   backlog are Crux's own, and any fault in them is ours."
