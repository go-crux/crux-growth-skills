# Page capture

How step 5's **Read** covers the whole page: the Page inventory first, then one screenshot per
section, then every widget read. The inventory comes from the page's own markup, so a section
the screenshots skip, or a widget whose content sits in an iframe the page's text never shows,
is still on the list and gets read or named as *unassessed*.

## 1. The Page inventory

**With a browser tool that runs JavaScript in the page.** Open the page at mobile width (about
390 px), wait for it to settle, close any popup on arrival (after noting it), then run the script
below. It scrolls the page to the bottom and back so lazy sections and widgets load, then returns
the inventory as JSON. Where the tool returns before the scroll finishes (an empty or one-row
result), run it again.

```js
(async () => {
  const sleep = (ms) => new Promise((r) => setTimeout(r, ms));
  for (let y = 0; y < document.body.scrollHeight; y += Math.round(innerHeight * 0.8)) {
    scrollTo(0, y);
    await sleep(250);
  }
  scrollTo(0, 0);
  await sleep(500);

  const WIDGETS = [
    ['Trustpilot', '.trustpilot-widget'],
    ['Yotpo', '.yotpo, .yotpo-widget-instance, [data-yotpo-instance-id]'],
    ['Okendo', '[data-oke-widget], .okeReviews, [data-oke-reviews-widget]'],
    ['Judge.me', '.jdgm-widget, .jdgm-preview-badge'],
    ['Reviews.io', '.reviews-io, [data-reviewsio], .ruk_rating_snippet'],
    ['Stamped', '.stamped-main-widget, .stamped-product-reviews-badge, #stamped-main-widget'],
    ['Loox', '#looxReviews, .loox-rating'],
    ['Junip', 'junip-product-review, .junip-product-summary-widget, [data-junip]'],
    ['Klaviyo form', '.klaviyo-form, [class*="klaviyo-form-"]'],
    ['Video', 'video'],
  ];
  const absTop = (el) => Math.round(el.getBoundingClientRect().top + scrollY);
  const label = (el) => {
    const h = el.querySelector('h1, h2, h3, [role="heading"]');
    const text = (h ? h.innerText : el.innerText || '').replace(/\s+/g, ' ').trim();
    return text.slice(0, 70);
  };

  let sections = [...document.querySelectorAll('.shopify-section, main > section, main > div')];
  sections = sections.filter((el) => !sections.some((o) => o !== el && o.contains(el)));
  if (sections.length < 3) {
    let box = document.querySelector('main') || document.body;
    while (box.children.length === 1) box = box.children[0];
    sections = [...box.children];
  }
  const visible = (el) => el.getBoundingClientRect().height > 0;

  const rows = sections.filter(visible).map((el, i) => ({
    n: i + 1,
    id: el.id || el.className.toString().split(' ')[0] || el.tagName.toLowerCase(),
    top: absTop(el),
    height: Math.round(el.getBoundingClientRect().height),
    label: label(el),
    widgets: [],
  }));
  const rowFor = (el) => {
    const i = sections.filter(visible).findIndex((s) => s.contains(el));
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
        height: Math.round(el.getBoundingClientRect().height),
        detail: el.dataset.templateId ? 'template ' + el.dataset.templateId : '',
        iframe: frame ? frame.src.split('?')[0] : '',
        link: (el.querySelector('a[href]') || {}).href || '',
      });
    }
  }
  for (const f of document.querySelectorAll('iframe')) {
    if (widgets.some((w) => w.el.contains(f))) continue;
    const r = f.getBoundingClientRect();
    if (r.width < 50 || r.height < 30) continue;
    widgets.push({
      el: f,
      vendor: 'iframe ' + (new URL(f.src || 'about:blank', location.href).hostname || 'inline'),
      top: absTop(f),
      height: Math.round(r.height),
      detail: f.title || '',
      iframe: (f.src || '').split('?')[0],
      link: '',
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
    pageHeight: document.body.scrollHeight,
    sections: rows,
    widgetsOutsideSections: loose,
  }, null, 1);
})();
```

**With a browser tool that cannot run JavaScript.** Build the same list from the tool's page
structure (accessibility tree or element search): each top-level region of the main content in
order with its heading, and every iframe and every element whose class names a vendor in the
widget table below.

**Without a browser tool.** Build it from the fetched HTML: the `shopify-section` blocks (or the
`<section>` elements inside `<main>`) in source order with their first heading, and every
`<iframe>` and every marker in the widget table. A widget's container is usually in the HTML
even where its content loads later, so a marker found there means the widget is present.

Keep the inventory in the run's working notes: one row per section (number, label, top and
height in pixels) and its widgets (vendor, position, iframe source, link).

## 2. One screenshot per section

At mobile width, for each section in the inventory, in order: scroll to its `top` less the
height of any sticky header (`scrollTo(0, top - 100)` where the header is about 100 px), so the
header does not cover the section's opening, wait for it to settle, and take a screenshot. A section taller than the viewport takes
further screenshots, one viewport down each time, until its bottom is on screen. Tick the row.

Scroll by the inventory, never by a fixed amount down the page: that skips any section shorter
than the step. Then at desktop width, take one screenshot of the first screen and one of each
section holding the buy area or a widget.

## 3. Read every widget

Widget content inside an iframe is not in the page's text, so read it from the screenshot of its
section: the rating, the review count, the reviews shown and where it sits relative to the buy
area. Where the screenshot does not show it clearly (still loading, cut off), scroll to the
widget's own `top`, wait two seconds and take one more.

| Vendor | Marker in the markup | What the markup alone tells you |
|---|---|---|
| Trustpilot | `trustpilot-widget`, `data-businessunit-id`, `data-template-id` | the widget is present and links to `trustpilot.com/review/<domain>`, which shows the TrustScore and review count where the session can fetch it |
| Yotpo | `yotpo`, `data-yotpo-instance-id` | present; rating and count load by script |
| Okendo | `data-oke-widget`, `okeReviews` | present; the HTML often carries the rating and count in the widget's own markup |
| Judge.me | `jdgm-widget`, `jdgm-preview-badge` | present; the badge's `data-average-rating` and `data-number-of-reviews` carry the figures |
| Reviews.io | `reviews-io`, `data-reviewsio`, `ruk_rating_snippet` | present; figures load by script |
| Stamped | `stamped-main-widget`, `stamped-product-reviews-badge` | present; figures load by script |
| Loox | `looxReviews`, `loox-rating` | present; `data-raters` and `data-rating` often carry the figures |
| Junip | `junip-product-review`, `data-junip` | present; figures load by script |
| Klaviyo form | `klaviyo-form` | an email or SMS capture form sits there |
| Any other iframe | `<iframe src=...>` | its host names what it is (a video, a map, a quiz, a review app) |

A widget is evidence for the trust checks: a third-party review platform with its rating and
count meets volume proof and third-party proof where the screenshot or its source shows the
figures. A widget whose figures could not be read (HTML only, no source fetched) is present but
unread: the checks that hinge on its figures are *unassessed* with the reason "review widget
present, figures not readable from the HTML", never not met.

## 4. Coverage

Before scoring, go down the inventory. Every section has at least one mobile screenshot, or a
second attempt failed and it is named in the masthead as *unassessed* ("Section 7, 'Real
results', did not render in the browser"). Every widget is read from a screenshot or its source,
or is present but unread as above. Say the count in one line in the chat and in the masthead:
"Read 11 sections and 2 review widgets at mobile and desktop width."
