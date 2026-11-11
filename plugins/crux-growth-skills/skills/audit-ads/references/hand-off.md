<!-- Two copies of this file must match: docs/reference/hand-off.md (the source) and each action skill's references/hand-off.md. Edit the source, then copy it over. Check from the repo root: diff docs/reference/hand-off.md plugins/crux-growth-skills/skills/audit-ads/references/hand-off.md -->

# Hand-off and Mode

The rules every action skill closes its run on. After the page is written, the run closes in the
chat with the Hand-off, then the Next run, in that order. The terms Recommendation, Hand-off,
Handover file, Next run and Mode are the repo's shared terms; use them as written. The skill's own
`SKILL.md` fixes what is specific to it: which Mode its Recommendations carry, the Next run bands,
and the Handover file's name.

## Mode

Every Recommendation carries one Mode, which says how it should go live.

- **Switch**: make the change and watch its metric. Always for new ads and formats.
- **Split test**: run the change in the platform's own A/B tool. For strategic paid changes, flow
  and campaign changes and landing pages, and only where the traffic reads a result.
- **Holdout**: switch the activity off for a geography, or the brand off for a period, to measure
  what it adds on top of what would have happened anyway. For incrementality.

A skill gives each Recommendation the Mode its own `SKILL.md` names and no other. Where traffic is
too thin for a Split test to read, the Recommendation is a Switch.

## Hand-off

Ask one question: what does the user want to do with the Recommendations? Offer three choices and
recommend the first where a connector to the platform is in the session, else the second ("yes"
accepts the recommendation):

1. **Implement now.** Make the changes, by whatever route the user and the agent settle on. Where
   a connector to the platform is in the session, the agent makes them: list the changes it will
   make, in the page's ranked order, and make them once the user confirms. Otherwise the user makes
   them in the platform, starting from the ranked Recommendations as the page writes them, with
   whatever help they ask for. Say which to do first either way.
2. **Save to the Handover file.** Write every Recommendation the user names, or all of them, to the
   Handover file, as below: to act on later, or to pass to a teammate who will.
3. **Leave them.** Close with the page and nothing saved.

The user may split the Recommendations between the choices ("do the first two now, save the
rest"). The choice is confirmed once; "just save them" takes the recommendation.

**Done when** the user has answered and each Recommendation they named is made, handed over, saved
or left.

## Handover file

A markdown file holding every Recommendation the user saved, self-contained enough that a later
session with no memory of this run, or a teammate who never saw the page, can act on it. The skill never reads it back. Its name is fixed
in the skill's `SKILL.md`. Save it to the working folder; where none persists (a chat), hand it
over as a download.

It opens with the skill, the brand, the date, the window read and the source (the Growth Brain
connector's name, or the export or connector used). Then one section per saved Recommendation, in
the page's ranked order, each carrying all seven of these, none left out:

- **Recommendation**: the action and what it acts on, in the words of the page.
- **Lever**: the lever it moves.
- **Size**: in money or KPI terms, as the page gives it.
- **Evidence**: the figures behind it, as the page gives them.
- **Confidence**: High, Medium or Low.
- **Metric to watch**: the figure to read after the change, and against what.
- **Mode**: Switch, Split test or Holdout, with its one-line meaning.

**Done when** the file holds one section per saved Recommendation, each with all seven fields.

## Next run

The close after the Hand-off, in two parts.

1. **When to run again.** The skill's `SKILL.md` fixes the bands, scaled to the brand's data volume.
   Say the interval and the date it falls on. Where a band is a low-volume one, add the caveat
   that each read is noisy at that volume.
2. **The prompt to paste.** One line the user pastes into a new session to start the next run. It
   names the skill as a slash command and the source this run used, so it works with nothing else
   to hand.

Where a calendar connector is in the session, offer to add the date as an event with the prompt in
its description, and create it only if the user says yes. Without one, give the date and the
prompt in the chat.

**Done when** the chat holds the interval, its date, the prompt and, where it applies, the
low-volume caveat.
