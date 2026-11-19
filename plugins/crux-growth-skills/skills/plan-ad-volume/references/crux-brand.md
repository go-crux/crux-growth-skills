# The Crux brand: the look of the Creative deep dive

The page is always Crux-branded, on the Crux editorial system: paper and ink, one signal-blue
Highlight colour, hairline rules and square corners. The brand's name sits in the heading and the
page wears no other colours, fonts or logo of the brand's own. `references/page-layout.md` carries
the page's CSS and says where each token is used.

## The Crux tokens

The page's `:root` holds these values.

| Role | Token | Value | Use |
|---|---|---|---|
| Paper | `--paper` | `#FFFFFF` | the page ground |
| Paper greys | `--paper-2`, `--paper-3` | `#F5F6F7`, `#EDEFF1` | tinted grounds, the slider's track |
| Ink | `--ink-1` | `#0E1215` | titles, figures, the strong rule |
| Greys | `--ink-2` | `#3A4046` | body text |
| | `--ink-3` | `#5A6169` | labels, muted text |
| | `--ink-4` | `#8A9099` | axis text, footer, source lines |
| Highlight colour | `--signal` | `#0F4C81` | the one mark a section names: the score, the slider's thumb; the rule above each section |
| | `--signal-tint` | `#E7EEF4` | the highlighted table row |
| Rules | `--line` | `#C9CDD1` | hairlines, baseline |
| | `--line-soft` | `#E2E5E8` | row and gridlines |
| | `--line-strong` | `#0E1215` | the heavy rule above a block |
| Category palette | `--cat-1` | `#6E93B4` | first category; never the Highlight colour, so a series does not wear it beside the highlighted mark |
| | `--cat-2` | `#0E1215` | second category |
| | `--cat-3` | `#9AA1A8` | the base grey every unhighlighted mark wears |
| | `--cat-4` | `#D3DCE4` | fourth category |
| | `--cat-5` | `#5A6169` | fifth category |
| Deltas | `--positive` | `#1E6E45` | a favourable delta |
| | `--negative` | `#A4271C` | an unfavourable delta |
| Score bars | `--score-low` | `#C0392B` | a Creative score bar whose sub-score is under 35 |
| | `--score-mid` | `#D9A21B` | a bar whose sub-score is 35 to 65 inclusive |
| | `--score-high` | `#2E8B57` | a bar whose sub-score is over 65 |
| Display font | `--display` | `"Newsreader",Georgia,"Times New Roman",serif` | the heading, section titles, figures |
| Body font | `--body` | `"Libre Franklin",system-ui,-apple-system,"Segoe UI",Helvetica,Arial,sans-serif` | everything else |

Chart marks read these tokens through classes, never a hex value: `s-hi` takes `--signal`, `s-base`
takes `--cat-3`. A further category mark sets `style="fill:var(--cat-N)"`.

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

- Paper and ink with one signal-blue Highlight colour; everything else grey.
- Hairline rules, no boxes and square corners.
- The display serif for the heading, section titles and large figures, in tabular lining numerals;
  the sans for the rest.
- A small-caps label (the eyebrow) above each section's title, in `--ink-3`.
- A 4px Highlight rule across the top of each section.
- A heading of the brand's name under a heavy rule, with the page's name above it as an eyebrow and
  the date beneath.
- Economist-style charts: direct labels, horizontal hairline gridlines, no legend where a label can
  sit on the mark.
- A highlighted table row in `--signal-tint` with the rest muted.
- The footer "Built with Crux growth skills", at the foot of the page.

## What never changes

- The tokens above, the two stacks and the devices.
- `--score-low`, `--score-mid` and `--score-high`, the Creative score bars' colours, which are the Crux daily
  email's bar colours, so every page reads alike. The page has no dark mode, so each token has one value.
- The page's requests: the one Google Fonts stylesheet, and no image, no script file and no other
  call.
