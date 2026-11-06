---
name: audit-ads
description: Meta ad audit. Use when the user asks to audit their Meta ads, which ads to pause, which ads are fatigued, or what creative to refresh. Runs on the brand's Growth Brain, else a Meta connector, else one Ads Manager export.
---

# Meta ad audit

Judge every Meta ad on the last 60 complete days and produce `meta-ad-audit-<date>.html`: ranked
Recommendations (Pause, Refresh, Iterate) and every Reported ad with its status, laid out as
`references/page-layout.md` fixes it. Then close in the chat with the Hand-off and the Next run.
Run the steps in order. The user sees only the chat and the page, never this skill or its
references: say what the ads showed, in plain words with the figures, and never cite a file, a
rule or a query. The terms CAC, Account blend, Peak CAC, Eligibility floors, Ramping, Low
efficiency, Improving, Fatigued, Fatiguing, Winner, Healthy, Pause, Refresh, Iterate, Keep,
Minimum live ads, Reported ad, Source and Brain line are those of `references/glossary.md`, and
Recommendation, Lever, Mode, Hand-off, Handover file and Next run are the repo's shared terms; use
them as written.

## 1. Connect

Take the ad-by-day rows from the first of these Sources that holds them, and say which in a line:

1. **A Growth Brain**: a connector named `<Client> - Growth Brain` that offers `list_tables` and
   `run_sql`. With several, use the one whose client name plainly matches the brand the user
   named; ask which one only when none match or more than one does.
2. **A Meta connector** in the session, probed as `references/exports.md` sets out.
3. **One Ads Manager export** the user gives: a file already in the conversation counts, else ask
   for it in one message, with the steps of `references/exports.md` in plain words, and wait.

**Done when** the run names its Source, and for a Meta connector or an export holds the rows for
the last 60 complete days.

## 2. Read

**Without a Growth Brain**, read the rows as `references/exports.md` sets out and go to step 3.

**With a Growth Brain**, call `list_tables` once with no arguments, then once naming only
`<client>-meta_performance` (`<client>` is the prefix the roster carries). If that mart is missing, say in one line that the
brain holds no Meta ad table and take the next Source from step 1 (a brain is still connected, so
the page carries no Brain line). The mart is one row per day, campaign, ad set and ad. Read
its columns from the second call and take these, never assuming one: the date; the three name
keys (campaign, ad set and ad) and the three display names; spend; new orders; ad age; campaign
type; and the match status. Group by the name keys, never an ad id or a display name. A missing
column other than campaign type and match status: name it in one line and stop. Without campaign
type, the intake proposes retargeting campaigns from their names alone.

On a brain, four traps the descriptions do not confess. Spend sits on the serving date and new orders on the
order date, so read windows and never one day of spend against that day's orders. Use new orders
as the CAC denominator and never the purchases Meta claims, which are fractional and not the same
count. Never sum reach. Leave out rows with no ad (an ad named "Unknown", or an unrendered
template).

**Done when** every column above is named from the second call, or the run has stopped with a line
saying which is missing, or the rows are read from a connector or export and cover the 60 days.

## 3. Intake

Send one message, then wait for the reply:

1. One line saying you are about to judge every Meta ad on the last 60 complete days, and that
   this is how. Without a Growth Brain, add that CAC here is Meta's own cost per purchase.
2. The text of `references/method.md`, word for word.
3. The proposed retargeting and existing-customer campaigns: those whose campaign type is `RET`,
   plus those whose name contains retargeting, RT, remarketing, existing or retention, or reads
   as one of those. Find them with one `run_sql` query listing each campaign's key, name, type
   and spend over the last 7 days, for campaigns with spend in the last 60 complete days (without
   a Growth Brain, list them from the rows read, by name alone, as no campaign type is held). List
   the proposal by name with its recent spend, and ask the user to confirm it, add to it or
   remove from it. Recommend the proposal ("yes" accepts it). With no campaign that fits, say so
   and recommend none.

The answer is confirmed once. "Just run it" and "yes" take the proposal.

**Done when** the user has answered and the run holds the confirmed campaign keys, or none.

## 4. Judge

**Without a Growth Brain**, judge the rows in code as `references/exports.md` sets out: it ports
`references/fatigue.sql` and returns the same rows, so the rest of the run reads them alike.

**With a Growth Brain**, open `references/fatigue.sql`. Make its two edits: the mart's name and any
column names from step 2, and the confirmed campaign keys. Run it with `run_sql` as one statement;
the file computes the windows, the day-of-week index, every status, the sizes and the confidence, so type none of them
by hand. Where the brain's own instructions name the store's timezone, set it as the file says. A
query error: fix the column from step 2 and run again, and never invent one.

Either way, the result is one row per Reported ad, with its status, spend, CACs, blend,
`recommendation`, `size_pause`, `size_refresh`, `iterate_cac_gap`, `iterate_spend_share`, `confidence` and
`ad_set_live_ads` (the ad set's ads past Ramping).

**Done when** every row holds exactly one status, and the 7-day spend of the rows is the figure the
Summary will give.

## 5. Recommend

Turn each row into Recommendations by its status. Every Recommendation carries its lever (new
customers, through CAC), its size, its evidence, its confidence, its metric to watch and Mode
Switch, with no Split test and no Holdout. Name the ad and its evidence, never the creative to
make, and never a budget change.

| Status | Recommendation |
|---|---|
| Low efficiency | Pause, sized by `size_pause`. |
| Fatigued | Pause, sized by `size_pause`, and a Refresh beside it, sized by `size_refresh`. |
| Fatiguing | Refresh, sized by `size_refresh`: a new variation of the ad's concept. |
| Winner | Iterate: more variations of the concept, labelled a winner, sized as `iterate_cac_gap` and `iterate_spend_share`. |
| Healthy, Improving, Ramping | Keep, with no Recommendation. |

**The Minimum live ads guard.** A Pause never leaves an ad set with fewer than 3 live ads past
Ramping. For each ad set, take `ad_set_live_ads`, then go through its Pauses from the largest
size down: a Pause stands while the ad set would still hold 3 live ads past Ramping once it and
the Pauses already standing are made, and every other Pause in the set reads "Pause once the
Refresh is live", with its size unchanged. A Fatigued ad's Pause goes through the same count.

**Ranking.** List Pause and Refresh Recommendations by size in money a month, largest first, then
Iterate by CAC gap, largest first. There is no cap on how many.

**Metric to watch.** A Pause: the ad set's CAC over the next 7 days. A Refresh or an Iterate: the
new ad's CAC after Ramping against the source ad's Peak CAC, with that figure.

An evidence line reads like this (invented brand): "Harbour Roast, Summer Reel: 5-day CAC 42
against a Peak CAC of 24, 50% or more worse on each of the last 3 days."

**Done when** every Reported ad is either a Recommendation with all six parts (lever, size, evidence, confidence, metric to watch, Mode) or a Keep, every
ad set that lost a Pause to the guard shows the held wording, and the list is in ranked order.

## 6. Write the page

Write the page as `references/page-layout.md` fixes it: its four headings (Summary,
Recommendations, Every ad, Notes and Method), in order, with only Reported ads and every table
header sorting. Notes and Method carries `references/method.md` word for word, the same text the
intake sent, and no second wording of it. Save it as `meta-ad-audit-<date>.html` in the working
folder; where none persists (a chat), hand it over as a download. The masthead names the Source,
and a run whose Source is not a Growth Brain, with none connected, labels CAC platform-attributed
and ends Notes and Method on the Brain line, as the layout fixes them.

Then tell the user in the chat, in two or three sentences: where the page is, how many Pauses,
Refreshes and Iterates it holds with the money a month the Pauses and Refreshes add up to, and the
first Recommendation to do.

**Done when** the page holds the four headings, every Reported ad in Every ad and no other ad, and
the 7-day spend over its rows equals the Reported spend step 4 returned, and a run with no Growth
Brain connected holds the Brain line as its last line.

## 7. Hand-off

Open `references/hand-off.md` and close the chat with the Hand-off as it fixes it, offering the
page's Recommendations to implement now, to save or to leave. Every Mode is Switch. Give no platform
steps and make no change in Meta, whatever connectors the session holds. When the user saves, write
`meta-ad-audit-handover-<date>.md` as the reference fixes it, one section per saved Recommendation
with its lever, size, evidence, confidence, metric to watch and Mode, plus the Pause, Refresh or
Iterate and the ad it acts on.

**Done when** the user has answered and each Recommendation they named is handed over, saved with
all its fields, or left. With no Recommendation, say so in one line and go to step 8.

## 8. Next run

Take the average daily Meta spend over the last 7 complete days: one `run_sql` query summing spend
over every row of the mart for those days (ads that are not Reported ads and rows with no ad
included), divided by 7; without a Growth Brain, the same sum over the rows read. Pick the band:

| Average daily Meta spend | Run again |
|---|---|
| Above 4,000 | Daily |
| 1,000 to 4,000 | Every 3 days |
| Below 1,000 | Weekly, and say that at this spend each day's read is noisy |

Say the interval, the date it falls on, and the figure behind it. Give the prompt to paste as the
reference fixes it: `/audit-ads` for the brand's Meta ads on the connector named in step 1 (the
connector's name, as the source). Where the Source is an export, it asks for the brand's Meta ads
from a new Ads Manager export attached to that session. Where a calendar connector is in the session, offer the date as
an event carrying that prompt.

**Done when** the chat holds the band's interval, its date, the daily spend figure, the prompt
and, below 1,000 a day, the noisy-read caveat.
