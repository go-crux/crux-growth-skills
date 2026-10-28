# Intake: the questions, the brand and last month's review

Step 1 of `SKILL.md` runs this file. The user steers the review here: the deck wears their brand
where they have one, explains the month with what they say happened, leads with their Focus questions, and opens
on last month's actions. Everything the intake settles is used by the later steps and is never
asked again.

## Which run this is

A first message that names the month (a month, or "last month") **and** the Source (a Growth
Brain, the connectors, or exports, by name or by kind) is an **Unattended run**: a Claude routine
can send it on the 1st, with nobody there to answer. It follows the Unattended contract below and
no round. Any other first message is attended and follows the rounds.

## The rounds

Put the open questions in numbered rounds, each question with one recommendation (Month context
alone has none), and wait for the answers before the next round. "Yes" accepts the recommendation of
every question in the round, and "just write it" accepts every remaining one; either, with no Month
context given, settles it as nothing to add, and it is not asked again. An answer replaces that
question's recommendation. A question the first message already answers is stated as understood and
not asked. A round with nothing left to ask is skipped.

**Round 1**

1. **Month**: which month is being reviewed? Recommend the last complete calendar month by today's
   date, named ("March 2026").
2. **Source**: where is the data read from? Recommend the Growth Brain when the session holds one,
   else the ad account and Shopify connectors, else exports. With several Growth Brains, ask which,
   recommending the one the user named, else the first the session lists.

**Round 2**

3. **Brand**: whose colours and type does the deck wear? Resolve it first as **Brand** below
   sets out and recommend the result by name: this brand's own skill found in the session, or the
   Crux default with an invitation to give a brand file.
4. **Month context**: what happened in the month that the figures alone would not show: a
   promotion, a launch, a stockout, a tracking change? Ask it plainly, with no recommendation, and
   say that the more the user adds, the sharper the read. "Nothing to add" is one option the user
   can pick, and it leaves a cause the data does not show as "not yet known".

**Round 3**

5. **Focus questions**: up to two things the review should pull out ("why did new-customer
   conversion slip?"). Recommend none, so the deck runs in its usual order. For each one given,
   state the Section it will sit in: the Section of the lever it is about (new customers and
   traffic: Acquisition; repeat buying: Retention & LTV; order value, products and discounts: Order
   value & product; revenue, orders and customers: Trading). A third is not taken: ask the user to
   keep the two that matter most.
6. **Last month's review**: look for `monthly-performance-review-<previous YYYY-MM>.html` in the
   working folder first, then the conversation's project files, `<previous YYYY-MM>` being the
   month before the Current period. Found: recommend using it and say so. Not found: ask the user
   to give the file or paste its Next month actions, recommending "No previous review", which
   leaves out the check on last month's actions. The user can also give any earlier review; its
   own month is then the month the actions come from.

**Round 4** (only when a previous review or pasted actions are in hand)

7. One question for each of its actions, taken from its `next-month` slide (up to three): **was it
   done, and if not, why?** Recommend "Not updated": the deck then shows what its metric did and
   asks again at the end. An answer is Done, or Not done with the user's reason in their own words
   (trimmed to one line). A Not done with no reason reads "No reason given" on the slide.

**Done when** the Month, the Source (the one Growth Brain named where several), the Brand, the
Month context (or none), the Focus questions (none, one or two, each with its Section) and the
previous review's actions (each Done, Not done with its reason, or Not updated; or "no previous
review") are all settled, and the Source is stated to the user in one line.

## Brand

The deck wears the Crux default unless this brand has a look of its own. A brand changes the roles
`references/crux-brand.md` lists (What a brand changes) and nothing else. Resolve it in this order
and stop at the first that gives a result:

1. **A brand skill in the session for this brand.** Look through the skills and design systems the
   session offers for one whose name or description names this brand. With several for this brand,
   take the first the session lists. Read it for the roles below.
2. **A brand file the user gives** (a guidelines document, a style sheet, a design-system page).
   Read that one file or page for the same roles and follow no other link from it. A link to the
   brand's storefront or website is not guidelines: say so in one line and use the next step.
3. **The Crux default** in `references/crux-brand.md`.

Never borrow another company's brand skill, Crux's own included, and never scrape the brand's
website for its look. From a brand skill or file take only:

- **Colours**: ink and paper, the Highlight colour (the brand's main colour), the greys, and a
  category palette of up to five colours in the order the guidelines list them.
- **Type**: the stack of the guidelines' heading font and of its body font. A brand web font that
  needs a file or a network fetch is not used: the deck takes the system stack the guidelines name
  for it, else the Crux stack.
- **Name**: the brand's name as the guidelines write it, set as text on the cover. No logo image is
  used.

A role the brand leaves out keeps its Crux value, and so does a role that `references/crux-brand.md`
says to keep. The brand name on the cover is the guidelines' name for it, else the `<Client>` of the
Growth Brain connector's name, else the Shopify shop's name, else the user's answer ("Your brand" on
an Unattended run). The values are written into the page's CSS roles as `references/deck-layout.md`
sets out, so the page makes no network request.

## Last month's review

Read the previous review's `next-month` slide: each card's title, Section, evidence figure,
action and metric to watch. A pasted list is read the same way. A file with no `next-month` slide
counts as not found. Each action becomes one row of `last-actions` in `references/deck-layout.md`
with its status from Round 4, or Not updated where none was given; the Read step then reads what
each action's metric did.

## Unattended contract

An Unattended run asks the user nothing, at any step. Each choice is made as follows:

- **Month and Source**: as the message names them. Several Growth Brains: the one the message
  names, else the first the session lists, and the Notes say which one was read. A currency no
  Source states shows amounts with no symbol, and the Notes' Currency line takes its no-currency
  wording from `references/deck-layout.md`.
- **Focus questions**: none, so no Focus slides.
- **Month context**: none.
- **Brand**: a brand skill in the session for this brand, else the Crux default. No file or link is
  asked for.
- **Last month's actions**: if `monthly-performance-review-<previous YYYY-MM>.html` is in the
  working folder, each of its actions shows as Not updated with what its metric did; otherwise the
  slide says no previous review was found.
- **The end**: the chat closes on the Not updated prompt, as `SKILL.md` step 6 sets out.

**Done when** the run put no question to the user; the file holds no Focus slide; its brand is a
session brand skill's for this brand or the Crux default; the `last-actions` slide lists every
action of the previous file as Not updated with its metric movement, or says no previous review was found; the
Notes name the Growth Brain where several were connected; and the chat ends on the Not updated
prompt when any action is Not updated.
