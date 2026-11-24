# Initiatives layout

What step 6 writes on an Initiatives row, so two quarters and two brands read the same. The page body is fixed by `initiative-contract.md`. Terms are in `growth-system-glossary.md` and `glossary.md`. Properties are those of Initiatives in `notion-schema.md`.

## An Initiatives row

| Property | Written as |
|---|---|
| `Initiative` | the workstream in a short phrase, such as "Win back first-time buyers by email"; the join key for a re-run, so it is never reworded without the user's yes |
| `Objective` | the relation to the one Objective it serves |
| `Key result` | one sentence stating the outcome and its baseline: "Lift the second-order rate from 18% to 22%" |
| `Target` | the number the Key result aims at, as a number: `22` |
| `Target unit` | what `Target` counts: `%`, `orders a month`, `£ per order` |
| `Target date` | the day the Key result is read. Recommend the last day of the quarter (31 March, 30 June, 30 September, 31 December); a Carried Initiative keeps its date until the user moves it |
| `Quarter` | the quarter, as `2027 Q1`, reusing an existing option; a Carried row keeps its earlier quarters and gains this one |
| `Why` | one or two sentences: the Weakest step it answers, the evidence, what it unlocks. Never a restatement of the Key result; a reason nothing grounds is a Named gap |
| `Owned by` | a person who is a member of the Notion workspace; a name that matches nobody is reported and left blank |
| `Status` | On track on a new row. An existing row's `Status` is the team's live state: this skill never proposes a change to it, except Done for a closed row |

`Why` of a row closed as a Dropped Initiative keeps its text and gains one line at the end: `Dropped <quarter>: <reason>`.

## What a Changed row compares

The fields a proposal can change on a row: `Initiative`, `Objective`, `Key result`, `Target`, `Target unit`, `Target date`, `Quarter`, `Why`, `Owned by`. A blank field the proposal fills is written on the yes. A field the row already carries and the proposal states differently waits, shown as what it says now and what it would say.

## The page body

The six sections of `initiative-contract.md`, in its order, drafted from:

- **Overview**: the row, dated with the run's date.
- **Outcome**: the Key result and the Objective's `Why`, made countable.
- **Plan**: the Candidate Initiatives and Weakest-step work the Strategy map names, as Plan rows reading `Not filed`.
- **Constraints**: the Active Decisions and Learnings from the context load that bind every Project here.
- **Open questions**: each Named gap the grill left open, with an owner.
- **Sources**: the Objective, the Strategy map section, the cited Learnings, Insights and Issues, and any plan document the user handed over.
