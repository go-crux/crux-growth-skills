# Page capture

How step 5's **Read** covers the whole page. The Page inventory comes from the page's own
markup, so a section the screenshots would skip, or a widget whose content sits in an iframe the
page's text never shows, is still on the list and gets read or named.

## 1. The Page inventory

**With a browser tool that runs JavaScript in the page.** Open the page at mobile width (about
390 px), wait for it to settle, close any popup on arrival (after noting it), then run the script
below. It scrolls the page to the bottom and back so lazy sections and widgets load, then returns
the inventory as JSON. Where the tool hands back a Promise or `{}` rather than JSON, it does not
wait for scripts: scroll the page to the bottom and back with the tool's own scrolling, then run
the script with its two scroll lines (the `for` loop and the `scrollTo(0, 0)` after it) removed.

```js
(async () => {
  const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
  const page = document.scrollingElement || document.documentElement;
  for (let y = 0; y < page.scrollHeight; y += Math.round(innerHeight * 0.8)) {
    scrollTo(0, y);
    await sleep(250);
  }
  scrollTo(0, 0);
  await sleep(500);

  const WIDGETS = [
    ['Trustpilot', '.trustpilot-widget'],
    ['Reviews.io', '.reviews-io, [data-reviewsio], .ruk_rating_snippet'],
    ['Feefo', '.feefo-review-badge, [data-feefo-widget], feefo-widget'],
    ['Yotpo', '.yotpo, .yotpo-widget-instance, [data-yotpo-instance-id]'],
    ['Okendo', '[data-oke-widget], .okeReviews, [data-oke-reviews-widget]'],
    ['Judge.me', '.jdgm-widget, .jdgm-preview-badge'],
    ['Stamped', '.stamped-main-widget, .stamped-product-reviews-badge, #stamped-main-widget'],
    ['Loox', '#looxReviews, .loox-rating'],
    ['Junip', 'junip-product-review, .junip-product-summary-widget, [data-junip]'],
    ['Klaviyo form', '.klaviyo-form, [class*="klaviyo-form-"]'],
    ['Video', 'video[controls], video:not([autoplay])'],
  ];
  const absTop = (el) => Math.round(el.getBoundingClientRect().top + scrollY);
  const height = (el) => Math.round(el.getBoundingClientRect().height);
  const label = (el) => {
    const h = el.querySelector('h1, h2, h3, [role="heading"]');
    const text = (h ? h.innerText : el.innerText || '').replace(/\s+/g, ' ').trim();
    return text.slice(0, 70);
  };

  let sections = [...document.querySelectorAll('.shopify-section, main > section, main > div')];
  sections = sections.filter((el) => !sections.some((o) => o !== el && o.contains(el)));
  if (sections.length < 3) {
    let box = document.querySelector('main') || document.body;
    const blocks = (b) => [...b.children].filter((c) => !['SCRIPT', 'STYLE', 'NOSCRIPT', 'LINK'].includes(c.tagName));
    while (blocks(box).length === 1) box = blocks(box)[0];
    sections = blocks(box);
  }
  const footer = document.querySelector('footer');
  if (footer && !sections.some((s) => s.contains(footer) || footer.contains(s))) sections.push(footer);

  const rows = sections.map((el, i) => {
    if (!el.id) el.id = 'inventory-section-' + (i + 1);
    return {
      n: i + 1,
      id: el.id,
      top: absTop(el),
      height: height(el),
      label: label(el),
      widgets: [],
    };
  });
  const rowFor = (el) => {
    const i = sections.findIndex((s) => s.contains(el));
    return i < 0 ? null : rows[i];
  };

  const widgets = [];
  for (const [vendor, sel] of WIDGETS) {
    for (const el of document.querySelectorAll(sel)) {
      if (widgets.some((w) => w.el.contains(el))) continue;
      const frame = el.querySelector('iframe');
      widgets.push({
        el,
        vendor,
        top: absTop(el),
        height: height(el),
        detail: el.dataset.templateId ? 'template ' + el.dataset.templateId : '',
        iframe: frame ? (frame.src || frame.dataset.src || '').split('?')[0] : '',
      });
    }
  }
  for (const f of document.querySelectorAll('iframe')) {
    if (widgets.some((w) => w.el.contains(f))) continue;
    const src = f.src || f.dataset.src || '';
    const r = f.getBoundingClientRect();
    if (!src && (r.width < 50 || r.height < 30)) continue;
    if (src && r.width < 2 && r.height < 2 && !f.dataset.src) continue;
    widgets.push({
      el: f,
      vendor: 'iframe ' + (src ? new URL(src, location.href).hostname : 'inline'),
      top: absTop(f),
      height: Math.round(r.height),
      detail: f.title || '',
      iframe: src.split('?')[0],
    });
  }
  const loose = [];
  for (const w of widgets) {
    const { el, ...out } = w;
    const row = rowFor(el);
    (row ? row.widgets : loose).push(out);
  }

  return JSON.stringify({
    url: location.href,
    viewport: innerWidth + 'x' + innerHeight,
    pageHeight: page.scrollHeight,
    sections: rows,
    widgetsOutsideSections: loose,
  }, null, 1);
})();
```

A section with `height` 0 did not render: keep its row, since it is one coverage names.

**With a browser tool that cannot run JavaScript.** Build the same list from the tool's page
structure (accessibility tree or element search): each top-level region of the page in order
with its heading, and every iframe and every element whose class names a vendor in the widget
table below.

**Without a browser tool.** Build it from the fetched HTML: the `shopify-section` blocks, or
else the `<section>` elements, or else the top-level blocks inside `<main>` (or inside the single
wrapper under `<body>` on a page with no `<main>`), in source order with their first heading; and
every `<iframe>` and every marker in the widget table. A widget's container is usually in the
HTML even where its content loads later, so a marker found there means the widget is present.

Keep the inventory in the run's working notes: one row per section (number, id, label, top and
height in pixels) and its widgets (vendor, position, iframe source).

## 2. One screenshot per section

At mobile width, for each section in the inventory, in order: scroll it into view by its id
(`document.getElementById('<id>').scrollIntoView({block: 'start'})`, then
`scrollBy(0, -h)` where `h` is the height of any sticky header, so the header does not cover the
section's opening), wait for it to settle, and take a screenshot. A section taller than the
viewport takes further screenshots, one viewport down each time, until its bottom is on screen.
Tick the row.

Scroll by the inventory, never by a fixed amount down the page: that skips any section shorter
than the step. Then resize to desktop width, run the script again for desktop positions, and take
one screenshot of the first screen and one of each section holding the buy area or a widget.

## 3. Read every widget

Widget content inside an iframe is not in the page's text, so read it from the screenshot of its
section: the rating, the review count, the reviews shown and where it sits on the page. Where the
screenshot does not show it clearly (still loading, cut off), scroll to the widget, wait two
seconds and take one more.

| Vendor | Kind | Marker in the markup | What the markup alone tells you |
|---|---|---|---|
| Trustpilot | Independent platform | `trustpilot-widget`, `data-businessunit-id`, `data-template-id` | present; the brand's page at `trustpilot.com/review/<domain>` shows the TrustScore and review count |
| Reviews.io | Independent platform | `reviews-io`, `data-reviewsio`, `ruk_rating_snippet` | present; the brand's page at `reviews.io/company-reviews/store/<domain>` shows the figures |
| Feefo | Independent platform | `feefo-review-badge`, `data-feefo-widget` | present; figures load by script |
| Yotpo | Review app on the brand's site | `yotpo`, `data-yotpo-instance-id` | present; figures load by script |
| Okendo | Review app on the brand's site | `data-oke-widget`, `okeReviews` | present; the widget's own markup often carries the rating and count |
| Judge.me | Review app on the brand's site | `jdgm-widget`, `jdgm-preview-badge` | present; `data-average-rating` and `data-number-of-reviews` carry the figures |
| Stamped | Review app on the brand's site | `stamped-main-widget`, `stamped-product-reviews-badge` | present; figures load by script |
| Loox | Review app on the brand's site | `looxReviews`, `loox-rating` | present; `data-raters` and `data-rating` often carry the figures |
| Junip | Review app on the brand's site | `junip-product-review`, `data-junip` | present; figures load by script |
| Klaviyo form | Capture form | `klaviyo-form` | an email or SMS capture form sits there |
| Any other iframe | By its host | `<iframe src=...>` | its host names what it is (a video, a map, a quiz, a review app) |

A widget's figures are read from its screenshot, from figures its markup carries, or from the
platform's public page named in the table where the session can fetch it. They are evidence for
the trust checks as `references/ingredients.md` words them: a review count is volume proof, met
by its position on the page; only an independent platform is proof the brand does not control,
since a review app on the brand's site is one the brand runs. A widget whose figures could not be
read is present but unread: each check that hinges on its figures is *unassessed* with the
reason "review widget present, figures not read", never not met.

## 4. Coverage

Before scoring, go down the inventory. Where a browser rendered the page, every section has at
least one mobile screenshot, or a second attempt failed and the section is unread. Where only the
HTML was read, every section is read from its markup and none has a screenshot. Every widget is
read, or is present but unread as above.

Give the masthead's **How it was read** the counts and any unread section by number and label,
and say the same in one line in the chat: "Read 11 sections and 2 review widgets, with
screenshots at mobile and desktop width; section 7, 'Real results', did not render." From HTML
only: "Read 11 sections and 2 review widgets from the HTML; the widgets' figures were not read."
