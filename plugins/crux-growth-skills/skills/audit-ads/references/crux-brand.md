# The Crux brand: the look of the audit page

The page is always Crux-branded, on the Crux editorial system: paper and ink, one signal-blue
highlight colour, hairline rules and square corners. There is no option to wear the brand's own
look: the brand's name sits in the heading and the page wears no other colours, fonts or logo of
the brand's own. `references/page-layout.md` says where each token is used.

## The Crux tokens

The page's `:root` holds these values.

| Role | Token | Value | Use |
|---|---|---|---|
| Paper | `--paper` | `#FFFFFF` | the page ground |
| Paper greys | `--paper-2`, `--paper-3` | `#F5F6F7`, `#EDEFF1` | `--paper-2` grounds the table header row and the masthead table's label column; `--paper-3` is held for parity with the other Crux pages and unused here |
| Ink | `--ink-1` | `#0E1215` | the heading, section titles, the strong rule |
| Greys | `--ink-2` | `#3A4046` | body text |
| | `--ink-3` | `#5A6169` | labels, eyebrows, the evidence line under an Action, muted text |
| | `--ink-4` | `#8A9099` | the footer, the campaign under an ad set, source lines |
| Highlight colour | `--signal` | `#0F4C81` | the 4px rule above each section |
| | `--signal-tint` | `#E7EEF4` | the highlighted table row: the Recommendation to do first |
| Rules | `--line` | `#C9CDD1` | hairlines under each table header |
| | `--line-soft` | `#E2E5E8` | row lines |
| | `--line-strong` | `#0E1215` | the heavy rule above the heading |
| Deltas | `--positive` | `#1E6E45` | the statuses Winner and Improving |
| | `--negative` | `#A4271C` | the statuses Low efficiency and Fatigued |
| Display font | `--display` | `"Newsreader",Georgia,"Times New Roman",serif` | the heading and section titles |
| Body font | `--body` | `"Libre Franklin",system-ui,-apple-system,"Segoe UI",Helvetica,Arial,sans-serif` | everything else |

Fatiguing, Healthy and Ramping wear `--ink-2`, so only the statuses that call for a move carry a
colour. A status is coloured text, never a filled badge.

## Fonts

Newsreader (the display serif) and Libre Franklin (the body sans) load from Google Fonts: one
stylesheet link in the `<head>`, with `display=swap`, to `fonts.googleapis.com` (it serves the font
files from `fonts.gstatic.com`). Those are the page's only network requests. Each stack ends in a
system font, so a page opened offline, or one where the request is blocked, reads in Georgia and the
system sans with the same layout.

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Newsreader:wght@400;500;600&family=Libre+Franklin:wght@400;500;600&display=swap">
```

## The devices

What makes the page read as Crux's:

- Paper and ink with one signal-blue highlight colour; everything else grey, bar the two delta
  colours on a status.
- Hairline rules, no boxes, no shadows and square corners.
- The display serif for the heading and section titles; the sans for the rest, with tabular lining
  numerals in every table.
- An uppercase, letter-spaced label (the eyebrow) above each section's title, in `--ink-3`.
- A 4px signal-blue rule across the top of each section.
- A heading of the brand's name under a heavy rule, with the page's name above it as an eyebrow and
  the date beneath.
- Tables set on hairlines: figures right-aligned, text left-aligned, a header row in uppercase, letter-spaced labels.
- A highlighted table row in `--signal-tint` with the rest muted.
- The footer "Built with Crux growth skills", at the foot of the page.

## What never changes

- The tokens above, the two stacks and the devices, whatever the brand. The page has no dark mode,
  so each token has one value.
- The page's requests: the one Google Fonts stylesheet and the font files it serves, and no image, no script file and no other
  call.
