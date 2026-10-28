# The Crux brand: the default look of a deck, and the roles a brand may change

A deck wears the Crux editorial system unless the intake resolved a brand of its own
(`references/intake.md`, Brand). A brand changes only the roles under **What a brand changes**;
everything else is fixed. The page that carries these values is the skeleton in
`references/deck-layout.md`, and the rules for using them are in `references/slide-craft.md`.

## The Crux tokens

The skeleton's `:root` holds these values. They are the Crux defaults, and a brand's values replace
them role by role.

| Role | Token | Crux value | Use |
|---|---|---|---|
| Paper | `--paper` | `#FFFFFF` | the slide and page ground |
| Paper greys | `--paper-2`, `--paper-3` | `#F5F6F7`, `#EDEFF1` | tinted grounds |
| Ink | `--ink-1` | `#0E1215` | titles, figures, the strong rule |
| Greys | `--ink-2` | `#3A4046` | body text |
| | `--ink-3` | `#5A6169` | labels, muted text |
| | `--ink-4` | `#8A9099` | axis text, footer, source lines |
| Highlight colour | `--signal` | `#0F4C81` | the one mark the Action title names; the panel rule; the cover bar |
| | `--signal-tint` | `#E7EEF4` | the highlighted table row |
| Rules | `--line` | `#C9CDD1` | hairlines, baseline |
| | `--line-soft` | `#E2E5E8` | row and gridlines |
| | `--line-strong` | `#0E1215` | the heavy rule above a block |
| Category palette | `--cat-1` | `#6E93B4` | first category; never the Highlight colour, so a stacked series does not wear it beside the highlighted mark |
| | `--cat-2` | `#0E1215` | second category |
| | `--cat-3` | `#9AA1A8` | the base grey every unhighlighted mark wears |
| | `--cat-4` | `#D3DCE4` | fourth category |
| | `--cat-5` | `#5A6169` | fifth category |
| Deltas | `--positive` | `#1E6E45` | a favourable delta |
| | `--negative` | `#A4271C` | an unfavourable delta |
| Display font | `--display` | `Georgia,"Times New Roman",serif` | Action titles, figures, the cover |
| Body font | `--body` | `system-ui,-apple-system,"Segoe UI",Helvetica,Arial,sans-serif` | everything else |

Chart marks read these tokens through classes, never a hex value: `s-hi` takes `--signal`, `s-base`
takes `--cat-3`. A further category mark sets `style="fill:var(--cat-N)"`.

**Fonts.** The page makes no network request and loads no font file, so both stacks are system
fonts: a serif for titles and figures and the system sans for body. Georgia is the first choice and
the stack falls back to the next installed serif.

## The devices

What makes a deck read as Crux's, each set in the skeleton CSS:

- Paper and ink with one signal-blue Highlight colour; everything else grey.
- Hairline rules, no boxes and square corners.
- A serif for Action titles and large figures, in tabular lining numerals; a sans for the rest.
- A small-caps label (the eyebrow) above each title, in `--ink-3`.
- A 4px Highlight rule across the top of the evidence, and a hairline down the left of the
  Takeaway panel.
- A cover with the Highlight bar running edge to edge across the top, the brand's name in 72px serif
  under a heavy rule, with the deck's name above it as an eyebrow and the month beneath.
- Economist-style charts: direct labels, horizontal hairline gridlines, a source line beneath.
- A highlighted table row in `--signal-tint` with the rest muted.

## What a brand changes

A brand's guidelines can set these roles and no others:

| Role | Tokens it sets |
|---|---|
| Paper | `--paper`, and the paper greys with it where the guidelines list them |
| Ink | `--ink-1` |
| Highlight colour | `--signal` and `--signal-tint` (the Highlight colour at about 10% on paper) |
| Greys | `--ink-2` to `--ink-4` and the rules `--line` and `--line-soft`, in the order the guidelines list them, darkest first |
| Category palette (up to 5) | `--cat-1`, `--cat-2`, `--cat-4` and `--cat-5` take the guidelines' colours after the Highlight colour, in the order listed, and `--cat-1` never takes the Highlight colour's own value; `--cat-3` takes the guidelines' mid grey, else keeps its Crux value, because every unhighlighted mark wears it |
| The two font stacks | `--display` and `--body` |
| The cover's name | the brand's name as the guidelines write it, else as the intake resolved it |

A role the guidelines leave out keeps its Crux value. A brand's ink or Highlight colour that would
sit on its paper at a contrast below 4.5 to 1 keeps its Crux value. A brand web font that needs a
file or a fetch is not used: the stack takes the system stack the guidelines name for it, else the
Crux stack.

## What a brand never changes

- The seven Layouts and their grids.
- The type sizes, and every rule in `references/slide-craft.md`.
- The `--positive` and `--negative` delta colours, so every deck reads alike.
- The footer "Built with Crux growth skills" and its place.
- The page: no network request, no image, no font file.
