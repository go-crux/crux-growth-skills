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
Minimum live ads, Reported ad, Judged spend share, Awareness campaign, Unattended run, Source and
Brain line are those of `references/glossary.md`, and Recommendation, Lever, Mode, Hand-off,
Handover file and Next run are the repo's shared terms; use them as written.

## Unattended run

A run is unattended when its message says so or says not to ask, or when it is a scheduled session
or routine: nobody is there to answer. It asks nothing at any step. Where a step would ask, it takes
that step's recommended answer, and only where a step recommends none (several Growth Brains and
none plainly the brand's, no export attached) does it stop with one line saying what it needed.
Step 3 sends no message and takes the proposed retargeting and awareness campaigns as confirmed,
step 7 asks no Hand-off question, and the page's Notes and Method says the run was unattended.

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
`<client>-meta_performance` (`<client>` is the prefix the roster carries). If that mart is missing,
say in one line that the brain holds no Meta ad table and take the next Source from step 1 (a brain
is still connected, so the page carries no Brain line). The mart is one row per day, campaign, ad
set and ad. Read its columns from the second call and take these, never assuming one: the date;
the ad id; the ad set id and the campaign id; the three display names (campaign, ad set and ad);
spend; new orders; ad age; and campaign type. Group by the ad id, never a display name: a rename
keeps the id, and two ads can share a name. Without an ad set id or a campaign id, that display
name stands in as its key. A missing column other than those two ids and campaign type: name it
in one line and stop. Without campaign type, the intake proposes retargeting campaigns from their
names alone.

On a brain, four traps the descriptions do not confess. Spend sits on the serving date and new
orders on the order date, so read windows and never one day of spend against that day's orders.
Use new orders as the CAC denominator and never the purchases Meta claims, which are fractional
and not the same count. Never sum reach. Leave out rows with no ad (an ad id of "Unknown", which takes in unrendered
templates).

**List the campaigns**, from either Source, before the account is sized. With a Growth Brain, one
`run_sql` query listing each campaign's key (its id, or its name without one), name, type and spend
over the last 7 days, for campaigns with spend in the last 60 complete days; without one, the same
list from the rows read, by name alone, as no campaign type is held. From it, propose two sets for
the intake:

- **Awareness campaigns**: those whose name contains awareness, reach, video views, VV, engagement
  or traffic, or reads as one of those, or, through a Meta connector, whose objective is not sales.
- **Retargeting and existing-customer campaigns**: those whose campaign type is `RET`, plus those
  whose name contains retargeting, RT, remarketing, existing or retention, or reads as one of
  those. A campaign proposed as awareness is not proposed here too.

**Size the account**, from either Source, before the intake. Eligibility reads no retargeting
campaign, so this needs none, but it leaves out the proposed awareness campaigns. With a Growth
Brain, open `references/fatigue.sql`, make its first edit (the mart's name and any column names from
the second call), leave the retargeting list empty, put the proposed awareness campaigns in its
third edit and run its account check in place of its final statement, as the file says. Without
one, take the same three figures from the ported rows, as `references/exports.md` sets out. They
are `reported_ads` (ads with 100 or more spent over the last 7 days), `account_spend_7d` (outside
the awareness campaigns) and `judged_spend_7d` (the part of it in ads past the Eligibility
floors). The Judged spend share is `judged_spend_7d` over `account_spend_7d`.

**Done when** every column above is named from the second call, or the run has stopped with a line
saying which is missing, or the rows are read from a connector or export and cover the 60 days, and
the run holds both proposed sets of campaigns, the Reported ad count and the Judged spend share.

## 3. Intake

Send one message, then wait for the reply:

1. Where the Judged spend share is below 50%, open the message with a sentence saying the method
   cannot judge most of the account's spend yet: only <share>% of the last 7 days' spend is in ads
   past the Eligibility floors, and the rest is in ads still Ramping.
2. The method in two sentences, in these words: "I'll judge every Meta ad by CAC, comparing each
   ad's recent CAC with its own best spell to catch fatigue, and with the other ads of its kind in
   the account to catch waste and spot winners, then recommend what to pause, refresh or iterate
   on. Ads too new or too small to judge get no verdict." Without a Growth Brain, follow them
   with one sentence saying CAC here is Meta's own cost per purchase. Then the offer, in these
   words: "Ask me about the method if you want the detail." The user runs this often, so the
   method stops there; `references/method.md` holds its windows and thresholds.
3. The proposed awareness campaigns, by name with their spend over the last 7 days: bought for
   awareness, reach or video views rather than purchases, so CAC is the wrong measure for them and
   the audit leaves them out. Ask the user to confirm the list, add to it or remove from it.
   Recommend the proposal. With no campaign that fits, say so and recommend none.
4. The proposed retargeting and existing-customer campaigns, by name with their spend over the last
   7 days, judged against their own blend. Ask the user to confirm it, add to it or remove from it.
   Recommend the proposal ("yes" accepts both proposals). With no campaign that fits, say so and
   recommend none.
5. Above 300 Reported ads, a warning that the run will be long and token-heavy: how many ads
   spent 100 or more over the last 7 days, that every ad is still judged, and that the page lists
   those Reported ads only. Ask whether to go on, and recommend going on.

The answer is confirmed once. "Just run it" and "yes" take the proposals and go on. If the user
declines to go on, say in one line that nothing was judged and stop.

When the user asks about the method, at this step or any later one, answer from
`references/method.md`, and only as much of it as the question needs.

An unattended run sends nothing: it takes the proposals and goes on, whatever the count of Reported
ads.

Where the reply changes the awareness campaigns, size the account again with the confirmed ones, as
step 2 does, before step 4. Where the new Judged spend share falls below 50%, say so in one line,
as item 1 would have.

**Done when** the user has answered (an unattended run needs no answer) and the run holds the
confirmed retargeting and awareness campaign keys, or the proposed ones for an unattended run, or
none, and an account check run on the awareness campaigns it holds.

## 4. Judge

**Without a Growth Brain**, judge the rows in code as `references/exports.md` sets out: it ports
`references/fatigue.sql` and returns the same rows, so the rest of the run reads them alike.

**With a Growth Brain**, open `references/fatigue.sql`. Make its three edits: the mart's name and
any column names from step 2, the confirmed retargeting campaign keys, and the confirmed awareness
campaign keys. Run it with `run_sql` as one statement; the file computes the windows, the day-of-week index, every status, the sizes and the confidence, so
type none of them by hand. Where the brain's own instructions name the store's timezone, set it as the file says. A
query error: fix the column from step 2 and run again, and never invent one.

Either way, the result is one row per Reported ad, with its status, spend, CACs, blend,
`recommendation`, `size_pause`, `size_refresh`, `iterate_cac_gap`, `iterate_spend_share`,
`confidence` and `ad_set_live_ads` (the ad set's ads past Ramping).

**Done when** every row holds exactly one status, the 7-day spend of the rows is the figure the
Summary will give, and the 7-day spend of the rows not Ramping equals the `judged_spend_7d` of the
last account check (step 2's, or step 3's where the reply changed the awareness campaigns).

## 5. Recommend

Turn each row into Recommendations by its status. Every Recommendation carries its lever (new
customers, through CAC), its size, its evidence, its confidence, its metric to watch and Mode
Switch, with no Split test and no Holdout. Name the ad and its evidence, never the creative to
make, and never a budget change.

| Status | Recommendation |
|---|---|
| Low efficiency | Pause, sized by `size_pause`. |
| Fatigued | Pause, sized by `size_pause`, and a Refresh beside it, sized by `size_refresh`. |
| Fatiguing | Refresh, sized by `size_refresh`: a new variation of the ad's concept (flexible or dynamic creative: add new assets). |
| Winner | Iterate: more variations of the concept, labelled a winner, sized as `iterate_cac_gap` and `iterate_spend_share`. |
| Healthy, Improving, Ramping | Keep, with no Recommendation. |

**Flexible or dynamic creative.** Meta reports such an ad as one ad, so judge it as one unit and
never split it by asset. No column marks it, so an ad counts as one when its name says flexible,
dynamic or DCO, or the user said so. Its Refresh, alone or beside a Pause, reads "add new assets to
the ad" rather than a new variation, with the same size and evidence.

**The Minimum live ads guard.** A Fatigued ad's Pause never leaves an ad set with fewer than 3 live
ads past Ramping; a Low efficiency Pause always stands, as a losing ad wastes spend however few ads
its set holds. For each ad set, take `ad_set_live_ads` and take off its Low efficiency Pauses. Then
go through its Fatigued Pauses from the largest size down: one stands while the ad set would still
hold 3 live ads past Ramping once it and the Pauses already standing are made, and every other
reads "Pause once the Refresh is live", with its size unchanged. Where the Pauses that stand leave
an ad set with no ad past Ramping, every one of those Pauses says so in its evidence.

**Ranking.** List Pause and Refresh Recommendations by size in money a month, largest first, then
Iterate by CAC gap, largest first. There is no cap on how many.

**Metric to watch.** A Pause: the ad set's CAC over the next 7 days. A Refresh or an Iterate: the
new ad's CAC after Ramping against the source ad's Peak CAC, with that figure.

An evidence line reads like this (invented brand): "Harbour Roast, Summer Reel: 5-day CAC 42
against a Peak CAC of 24, 50% or more worse on each of the last 3 days."

**Done when** every Reported ad is either a Recommendation with all six parts (lever, size,
evidence, confidence, metric to watch, Mode) or a Keep, every ad set that lost a Pause to the
guard shows the held wording on a Fatigued ad and on no Low efficiency ad, every Refresh on a
flexible or dynamic creative ad reads "add new assets", and the list is in ranked order.

## 6. Write the page

Write the page as `references/page-layout.md` fixes it: its four headings (Summary,
Recommendations, Every ad, Notes and Method), in order, with only Reported ads and every table
header sorting. Notes and Method carries `references/method.md` word for word, and no second
wording of it. Where the Judged spend share is below 50%, the Summary
opens with the same caveat as the intake. Save the page as `meta-ad-audit-<date>.html` in the working
folder; where none persists (a chat), hand it over as a download. The masthead names the Source,
and a run whose Source is not a Growth Brain, with none connected, labels CAC platform-attributed
and ends Notes and Method on the Brain line, as the layout fixes them.

Then tell the user in the chat, in two or three sentences: where the page is, how many Pauses,
Refreshes and Iterates it holds with the money a month the Pauses and Refreshes add up to, and the
first Recommendation to do.

**Done when** the page holds the four headings, every Reported ad in Every ad and no other ad, and
the 7-day spend over its rows equals the Reported spend step 4 returned, a Judged spend share below
50% opens the Summary with the caveat, an unattended run says so in Notes and Method, and a run
with no Growth Brain connected holds the Brain line as its last line.

## 7. Hand-off

Open `references/hand-off.md` and close the chat with the Hand-off as it fixes it, offering the
page's Recommendations to implement now, to save or to leave. Every Mode is Switch. Where a Meta
connector that can pause ads is in the session, implementing now means the agent makes the Pauses
in Meta once the user confirms them, leaving a held Pause until its Refresh is live. A Refresh or an
Iterate needs new creative the skill does not make, so it stays the user's to make, or to save.
When the user saves, write `meta-ad-audit-handover-<date>.md` as the reference fixes it, one
section per saved Recommendation with its lever, size, evidence, confidence, metric to watch and
Mode, plus the Pause, Refresh or Iterate and the ad it acts on.

An unattended run asks no Hand-off question: it lists the ranked Recommendations as the page gives
them, saves no Handover file, makes no change in Meta, and goes to step 8.

**Done when** the user has answered and each Recommendation they named is made, left for the user
to make, saved with all its fields, or left, or the unattended run has listed them. With no
Recommendation, say so in one line and go to step 8.

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
from a new Ads Manager export attached to that session. Where a calendar connector is in the
session, offer the date as an event carrying that prompt.

**Done when** the chat holds the band's interval, its date, the daily spend figure, the prompt
and, below 1,000 a day, the noisy-read caveat.
