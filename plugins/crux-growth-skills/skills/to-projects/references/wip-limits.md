# WIP limits

How many cards may be in flight at once, and what a skill does before it moves one past the cap. Terms are in `growth-system-glossary.md`; the properties are those of Projects and Tasks in `notion-schema.md`.

The rule serves the principle Stay agile: when evidence changes the plan quickly, work that is started and not finished is the thing that slows the team down, so the limits keep it visible. They are fixed defaults with no per-team setting, and they warn. They never block (ADR-0023).

## The two limits

| Limit | Counts | At most |
|---|---|---|
| Projects in flight | Projects whose `Status` is `Prioritised` or `In progress`, across the whole team | 4 |
| Tasks in flight, per person | Tasks whose `Status` is `In progress`, grouped by `Assigned to` | 4 for each person |

- A Task with `Runs as` Claude counts against the person in its `Assigned to`, who reviews what Claude builds. A Task with no `Assigned to` counts against nobody, and the warning for a move into `In progress` names it as unassigned.
- A Task at `Blocked` or `To review` is not in progress and is not counted. A Project at `Idea`, `Done` or `Archived` is not counted.
- **Ready** is a Task at `Not started`. Moving a Task into Ready changes neither count, so it needs no check.

## Before a move

Any skill about to move a card into one of these states makes the check first, whoever asked for the move:

- a Project into `Prioritised` or `In progress`;
- a Task into `In progress`, for its `Assigned to`.

1. **Count.** Query the data source with a filter for the states above (never a saved view). For a Task, filter on `Assigned to` too. Count the cards already there, plus any move already agreed earlier in the same run that has not been written yet.
2. **Compare.** The move passes a limit when the count after it would be more than the limit: a fifth Project, or a fifth Task for one person.
3. **Under the limit:** make the move without comment.
4. **Over the limit:** say so before writing anything, in one message that gives the count the move would make against the limit, and lists the cards already there (`ID`, title, `Status`; for Tasks, who they are assigned to). Ask whether to go ahead, worded so "yes" accepts it. Make the move only on the user's yes. On "no", or on silence, leave the card where it is and say so. Never refuse the move yourself, and never name another card to push out unless the user asks.

A skill that moves several cards in one run counts them together and puts them in one message.

## Dates on a move

A skill that moves a Task or Project into `In progress` sets `Started on` to today, and into `Done` sets `Done on`. A card moved by hand keeps them blank. `Prioritised` sets no date.
