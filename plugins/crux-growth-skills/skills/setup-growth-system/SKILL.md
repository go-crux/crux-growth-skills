---
name: setup-growth-system
description: Set up, repair or finish the growth system in the user's own Notion. Use when the user asks to set up, create or start a growth system, or to get a Notion workspace for planning and tracking growth work. Use when the user asks to repair, update or finish an existing growth system, such as after a deleted property or an interrupted setup. Needs a Notion connector; no Growth Brain needed.
---

# Set up the growth system

Leave the user with a complete growth system in their own Notion: a private Growth system page holding
seven databases, their views, a Strategy map page and a Settings page, with no sample rows. Where a
system already exists, add only what it is missing. The user answers one confirmation and no
questions, except which system to use when there are two. The skill writes only to the user's Notion
and never uses a Growth Brain (ADR-0001). The user sees only the chat and their Notion, never this
skill or its references: say what is being created in plain words, and never name a file,
a key or a tool.

The terms Growth system, Growth system page, Settings page, Schema version, Strategy map and the
rest are those of `references/growth-system-glossary.md`; Change list, Difference and Prefix fallback
are those of `references/glossary.md`. Use them as written. `references/notion-schema.md` is the one
home of the schema (every property, option, formula, relation and view), the Settings page block and
"Finding the system"; this skill states none of it again. Every Notion action here is a capability
(search, fetch a page or database, create a page, create a database, add a property, create a view,
update a page); use whichever tool in the session does it.

**One path for every run.** A build is a repair against an empty system. Step 3 compares the live
system with the schema and lists what is missing; step 4 asks for one yes and step 5 adds it. The same steps run whether
the list is everything, a single property or nothing.

**Additive only.** The run adds databases, properties, select options, views and pages. It never
renames, removes or retypes any of them, never creates, edits or deletes a row, and never writes a
page body the user may have edited. A removed select option blanks every row that held it, so
options are never removed or renamed.

## 1. Check the connector

Check that the session can search Notion and create pages, databases and views.

Without it, stop and create nothing. Tell the user in plain words that the growth system runs on
their own Notion, and how to add it: in their app's connector settings, add the Notion connector,
sign in, give it access to the workspace, then ask again. Name no tool.

**Done when** the session can do all four, or the skill has stopped with that message and made no Notion call that writes.

## 2. Find the system

Search Notion for the exact title `Growth system settings`, the first move of "Finding the system"
in `references/notion-schema.md`. Count only pages with that exact title.

- **None:** there is no system. Go to step 3 with every item missing.
- **More than one:** list them (title, parent page, last edited) and ask which is the team's;
  accept a pasted link instead. Use that one for the rest of the run and leave the others alone.
- **One:** use it.

Read the chosen Settings page's block. Fetch the Growth system page it names (`growth_system_page`,
or the Settings page's parent where the block lacks the line). When that page no longer exists, stop
and say so: the system lived under it, so ask the user to restore it from Notion's trash and run
setup again. Create nothing.

When `schema_version` is higher than the schema's, stop: a newer plugin built this system, so tell
the user to update the plugin and run setup again.

**Done when** the search has run and the skill has either chosen one Settings page and read its
block, or found none, or stopped with one of the messages above.

## 3. Compare

Serves the principle Stay agile: a system the schema has outgrown is brought up to date in one
step, never rebuilt.

Compare the live system with `references/notion-schema.md` and write down the **Change list**
items, grouped by where they belong. With no Settings page everything is missing, and the Settings
page and the Growth system page are the first two items. Otherwise check each of these against the
live Notion by fetching it:

1. **Databases.** For each of the seven, take `<name>_database` and `<name>_data_source` from the
   block and fetch the database.
   - **Line absent:** a run may have stopped after creating the database and before recording it.
     Look among the Growth system page's own children for a database with the exact title, and
     adopt it: record its IDs, then compare it like any other. Found more than one: ask which.
     Found none: the database is missing.
   - **Line present, database gone** (not found, or in the trash): the database is missing. Its
     rows are not recoverable by the skill. Say so, and that restoring it from Notion's trash
     first keeps them.
2. **Properties and options.** For each database that exists, match every property of its table by
   exact name. Absent: missing. Present with the schema's type: for a select or status, match every
   option by name and list each absent one as missing (extra options and other groupings stay).
   Present with another type: a **Difference**. A relation counts as present when it relates to the
   database the Relations table names.
3. **Views.** Match each row of the Views table by database and view name. Absent: missing. A view
   present under that name stays as the user has it, whatever its filter.
4. **Pages.** The Strategy map: `strategy_map_page` from the block, fetched; where the line is
   absent, a child of the Growth system page titled `Strategy map`. Absent: missing. The Growth
   system page body: missing only when the page holds nothing but its child pages and databases,
   as after an interrupted run; a page with any other content stays as the user has it.
5. **The Settings page block.** Missing lines are those the items above will add. When
   `setup_state` is `in_progress`, an earlier run did not finish.

**Done when** every database, every property and select option, every view and both pages of the
schema is on the Change list as either present, missing, or a Difference, and each missing
database, property, option, view and page is named with the database it belongs to.

## 4. Confirm

**The Change list.** Send one message, in plain words, and ask for one yes:

- **Against no system (a build):** everything the run will create: the Growth system page and where
  it will live (private, at the top level of their Notion); the Settings page; the seven databases
  by name with one line on what each is for (the Growth system glossary's definitions); their
  views; the Strategy map page; the explainer, principles and links on the Growth system page. State
  that no sample rows are created and that nothing existing is touched.
- **Against an existing system (a repair):** exactly the missing items, each with the database it
  goes in, and any **Differences**, each with what the schema expects and the line that it is left
  as it is. Where an earlier setup was interrupted, say that this run finishes it. State that
  nothing is renamed, removed or changed and that no row is touched. Name any database the
  Settings page records that Notion no longer holds as one to recreate empty, so the one yes covers it.

When the Change list is empty, `setup_state` is `complete` and `schema_version` is the schema's,
say that the system is complete and report any Differences. Change nothing and stop.
When it is empty but one of those two needs finishing, say so and go straight to step 6.

On anything but yes, change nothing and stop.

**Done when** the user has answered the one yes, or the skill has stopped without a write.

## 5. Add

Serves the principle Maximise learning: every later Learning, Decision and Insight lands in one
place the whole team's skills read.

**On the yes, add every missing item in this order, with no further question.** Each item is done
when it exists with everything `references/notion-schema.md` gives it. Items an earlier step
found present are skipped.

1. **The Settings page.**
   - **Against no system:** create the Growth system page, titled `Growth system`, private, as
     "Pages" in `references/notion-schema.md` places it: no parent page and no teamspace, even when
     the connector offers one or the user belongs to one; where the connector has a private or draft
     mode for a page with no destination, use it. Keep its ID. Then create the Settings page at once, as a child of
     it: the opening line and the fenced block as "The Settings page" in `references/notion-schema.md`
     gives them, holding the schema's `schema_version`, `setup_state: in_progress` and
     `growth_system_page`.
   - **Against an existing system:** write `setup_state: in_progress` to the block, so every other
     skill stops until this run finishes. Add any adopted IDs to the block.

   Everything after this writes into this block, so an interrupted run leaves a Settings page that
   says so and the next run resumes it.
2. **The missing databases**, each a child of the Growth system page, with every property other than a
   relation, with every select option, status group and formula of its table in
   `references/notion-schema.md`, and its icon. Create them in the order Insights, Learnings, Decisions, Issues,
   Tasks, Projects, Initiatives. After each is created, write its `<name>_database` and `<name>_data_source`
   lines to the block (replacing the old lines of a database that was gone) before creating the next.
   - **Prefix fallback.** Give each database its default `ID` prefix. When Notion refuses a prefix
     because another data source in the workspace holds it, create that database with `GS-` plus
     the default (for example `GS-TSK`) and add a `<name>_prefix` line to the block. When
     the fallback is refused too, stop and tell the user which prefix, and that setup is
     unfinished.
3. **The missing properties and options** on databases that already existed, other than relations.
   Add a formula after the properties it reads. An added property or option is blank on the rows
   already there; no row is written.
4. **The missing relations**, now that every database exists: each as the Relations table gives it,
   with its dual property named there. Where the other side of the pair is already present, add this
   side as a relation to that database, whatever Notion makes of the dual. The Decisions
   self-relation (`Supersedes` with its dual `Superseded by`) is added on the Decisions data source.
5. **The missing views**: each row of the Views table, a tab on its database.
6. **The Strategy map page**, as `references/page-layout.md` fixes it, a child of the Growth
   system page.

Give each page and database the icon `references/notion-schema.md` shows when creating it. Where the
connector cannot set an icon, carry on, and name the icons not set in step 7. Add `strategy_map_page` to the block.

When an add fails, stop. Tell the user plainly what was added, what failed and why, leave
`setup_state: in_progress` as it is, and say that running setup again picks the system up where it
stopped. Never delete or undo what was added.

**Done when** every missing item of the Change list exists, the block holds the two page lines and
`<name>_database` and `<name>_data_source` for all seven databases (fourteen lines), plus a
`<name>_prefix` line for each database that used the Prefix fallback, and no row was created, edited
or deleted.

## 6. Fill the Growth system page and finish

Serves all four principles: the page is where the team first reads what the system runs on.

1. Where step 3 found the Growth system page body missing, write it as `references/page-layout.md`
   fixes it: the explainer, the four principles as a two-by-two grid, the databases in three
   columns, and the Initiatives board inline, last. Take each principle's line from
   `references/principles.md`; the credit and the link to `https://gocrux.io/growth-system` go
   once, under the grid, as the layout gives them. Place each database, the Strategy map and the
   Settings page as the layout gives them, by the IDs in the block. Keep every child block the page
   already holds: a rewrite that leaves one out deletes it.
2. Only then write the schema's `schema_version` and `setup_state: complete`, by changing those two
   lines of the block. It is the last write of the run.

When a write fails, stop and report as step 5 does.

**Done when** the Growth system page holds every heading of `references/page-layout.md`, shows
all seven databases, the Strategy map and the Settings page, ends with the Initiatives board, and
the block reads the schema's `schema_version` and `setup_state: complete`.

## 7. Close

Tell the user, in the chat:

- **After a build:** the page is private to them. To share it, move the Growth system page into a
  teamspace, or share it with teammates, so their skills find the same system. Give the page's
  link. Notion's Free plan limits blocks once a workspace has two or more members. Next comes the
  planning chain, starting with the Strategy map: coming soon.
- **After a repair:** what was added, each with its database, and that nothing was renamed,
  removed or changed. Name each Difference again and say it was left as it is. Give the Growth
  system page's link.

**Done when** the chat message carries the points for the run's kind and the link to the Growth
system page.
