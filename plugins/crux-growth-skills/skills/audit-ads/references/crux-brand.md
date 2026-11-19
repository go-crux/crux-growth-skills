# The Crux brand: the look of the audit page

The page is always Crux-branded, on the Crux editorial system: paper and ink, one signal-blue
Highlight colour, hairline rules and square corners. There is no option to wear the brand's own
look: the brand's name sits in the heading and the page wears no other colours, fonts or logo of
the brand's own. `references/page-layout.md` says where each token is used.

## The Crux tokens

The page's `:root` holds these values.

| Role | Token | Value | Use |
|---|---|---|---|
| Paper | `--paper` | `#FFFFFF` | the page ground |
| Paper greys | `--paper-2`, `--paper-3` | `#F5F6F7`, `#EDEFF1` | tinted grounds: the table header row, the masthead table's label column |
| Ink | `--ink-1` | `#0E1215` | titles, figures, the strong rule |
| Greys | `--ink-2` | `#3A4046` | body text |
| | `--ink-3` | `#5A6169` | labels, eyebrows, the evidence line under an Action, muted text |
| | `--ink-4` | `#8A9099` | the footer, the campaign under an ad set, source lines |
| Highlight colour | `--signal` | `#0F4C81` | the rule above each section; the Recommendation to do first |
| | `--signal-tint` | `#E7EEF4` | the highlighted table row: the Recommendation to do first |
| Rules | `--line` | `#C9CDD1` | hairlines under each table header |
| | `--line-soft` | `#E2E5E8` | row lines |
| | `--line-strong` | `#0E1215` | the heavy rule above the heading |
| Deltas | `--positive` | `#1E6E45` | the status Winner and Improving, and a CAC below the reference it is measured on |
| | `--negative` | `#A4271C` | the status Low efficiency and Fatigued, and a CAC above the reference it is measured on |
| Display font | `--display` | `"Newsreader",Georgia,"Times New Roman",serif` | the heading, section titles, the Summary's figures |
| Body font | `--body` | `"Libre Franklin",system-ui,-apple-system,"Segoe UI",Helvetica,Arial,sans-serif` | everything else |

Fatiguing, Healthy and Ramping wear `--ink-2`, so only the statuses that call for a move carry a
colour. A status is coloured text, never a filled badge.

## Fonts

Newsreader (the display serif) and Libre Franklin (the body sans) load from Google Fonts: one
stylesheet link in the `<head>`, with `display=swap`, to `fonts.googleapis.com` (it serves the font
files from `fonts.gstatic.com`). That is the page's only network request. Each stack ends in a
system font, so a page opened offline, or one where the request is blocked, reads in Georgia and the
system sans with the same layout.

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Newsreader:wght@400;500;600&family=Libre+Franklin:wght@400;500;600&display=swap">
```

## The devices

What makes the page read as Crux's:

- Paper and ink with one signal-blue Highlight colour; everything else grey, bar the two delta
  colours on a status.
- Hairline rules, no boxes, no shadows and square corners.
- The display serif for the heading, section titles and the Summary's figures, in tabular lining
  numerals; the sans for the rest, with tabular numerals in every table.
- A small-caps label (the eyebrow) above each section's title, in `--ink-3`.
- A 4px Highlight rule across the top of each section.
- A heading of the brand's name under a heavy rule, with the page's name above it as an eyebrow and
  the date beneath.
- Tables set on hairlines: figures right-aligned, text left-aligned, a header row in small caps.
- A highlighted table row in `--signal-tint` with the rest plain.
- The footer "Built with Crux growth skills", at the foot of the page.

## What never changes

- The tokens above, the two stacks and the devices, whatever the brand. The page has no dark mode,
  so each token has one value.
- The page's requests: the one Google Fonts stylesheet, and no image, no script file and no other
  call.
