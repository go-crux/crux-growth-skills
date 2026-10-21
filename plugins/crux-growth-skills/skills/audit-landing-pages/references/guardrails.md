# Brand guardrails

How the Audit learns what the brand will not do, checks it with the user once, and keeps it.
Work through the parts in order. The user's own file is `brand-guardrails.md`; its headings are
fixed under "The file" below.

## 1. Look for the file

Look for `brand-guardrails.md` in the working folder and in the conversation's project files.
Take it only when its title names the brand whose page is being audited; for another
brand's file, carry on as if none exists.

With the file, show it in two lines and ask "Still right?" Do not ask the three questions.

- Line one: the levers off the table and the claims rules.
- Line two: who the page is for.

"Yes" uses the file, and any line marked Unconfirmed becomes confirmed. A change goes into the
file, saved as part 5 sets out, and is read back in one line. "Skip" uses the file as it stands
and leaves Unconfirmed lines unconfirmed.

With no file, go to part 2.

## 2. Infer

Read the page and the site's home page (fetched HTML is enough), then work out four things.

- **Register:** plain, playful, clinical, premium or mass-value, from the copy.
- **Levers:** whether the site discounts, uses urgency devices (countdowns, "only X left",
  deadlines), names competitors or opens a popup. A lever in use is on the table. A lever the
  site shows no sign of is recommended as off the table, the cautious reading; the user
  confirms it or frees it.
- **Claims:** the figures and promises the page makes, and any that look regulated (health,
  safety, financial, environmental, "guaranteed", "clinically proven").
- **Audience:** who the copy speaks to and what it assumes they already know.

## 3. Ask one round of three questions

Ask all three together, numbered, each with the inferred answer as the recommendation. "Yes"
accepts a recommendation, "skip" leaves it unconfirmed, and "just write it" accepts every
remaining one. The user answers before the Audit goes on.

1. **Levers off the table.** "Is there anything a conversion consultant would usually suggest
   that you will not do: urgency, discounting, naming competitors, popups? I'd say <inferred>."
2. **Claims.** "Is there anything you may not claim, or any wording that is regulated, and are
   there approved figures I may quote? I'd say <inferred>."
3. **Who the page is for.** "Who is this page for? I'd say <inferred segments, one line on what
   each most needs to hear>."

## 4. Apply and mark

Run this as a pass over the findings, quick wins and hypotheses once they are drafted.

- **Check the page.** A lever the brand keeps off the table that is already on the page is
  flagged as a quick win.
- **Replace the blocked advice.** A best practice that would breach a guardrail is swapped for
  the on-brand alternative that does the same job: proof or a guarantee in place of urgency,
  added value in place of a discount, a category-level contrast in place of a named
  competitor, an inline prompt in place of a popup.
- **Quote only approved figures.** When the brand has approved figures, a recommendation cites
  no other.
- **Name the segment.** Where audiences are given, a finding says which one it serves.
- **Mark assumptions.** A finding, quick win or hypothesis whose direction rests on a
  guardrail the user skipped or has not confirmed ends on a line "Assumption: <the guardrail>
  is not confirmed", and its row in the Test backlog table carries "(assumption)" after the
  name. The masthead lists the guardrails that are unconfirmed, or says all are confirmed.

## 5. Save

Offer to save the answers, skipped ones included, as `brand-guardrails.md` so the next run
asks "Still right?" instead of the three questions.

- **Where a working folder persists** (Claude Code, Cowork), write the file there.
- **In a chat**, hand it over as a downloadable file with one line: add it to a Claude
  Project's files, or attach it next time.
- Never write it into the plugin folder, which an update replaces.

## The file

Write the file with exactly these headings, in this order. Mark any answer the user skipped
"Unconfirmed", so the next run can ask about it.

```
# Brand guardrails: <brand>

## Levers off the table
- <lever>: <why>
- <lever>: Unconfirmed, inferred from the site

## Claims
Approved figures: <exact wording and source, or "none given">
Blocked or regulated: <claim and what to say instead, or "none given">

## Who the page is for
- <segment>: <what it most needs to hear>
Register: <one line>
```

Where a section has no answer, write "None given" under it rather than leaving it empty.
