---
name: setup-growth-system
description: Set up the growth system in the user's own Notion. Use when the user asks to set up, create or start a growth system, or to get a Notion workspace for planning and tracking growth work. Needs a Notion connector; no Growth Brain needed.
---

# Set up the growth system

Build a complete growth system in the user's own Notion: a fresh private Growth system page holding
seven databases, their views, a Strategy map page and a Settings page, with no sample rows. The
user answers one confirmation and no questions. The skill writes only to the user's Notion and
never uses a Growth Brain (ADR-0001). The user sees only the chat and their Notion, never this
skill or its references: say what is being created in plain words, and never name a file,
a key or a tool.

The terms Growth system, Growth system page, Settings page, Schema version, Strategy map and the
rest are those of `references/growth-system-glossary.md`; Build list and Prefix fallback are those
of `references/glossary.md`. Use them as written. `references/notion-schema.md` is the one
home of the schema (every property, option, formula, relation and view), the Settings page block and
"Finding the system"; this skill states none of it again. Every Notion action here is a capability
(search, create a page, create a database, create a view, update a page); use whichever tool in
the session does it.

## 1. Check the connector

Check that the session can search Notion and create pages, databases and views.

Without it, stop and create nothing. Tell the user in plain words that the growth system runs on
their own Notion, and how to add it: in their app's connector settings, add the Notion connector,
sign in, give it access to the workspace, then ask again. Name no tool.

**Done when** the session can do all four, or the skill has stopped with that message and made no Notion call that writes.

## 2. Find an existing system

Search Notion for the exact title `Growth system settings`, the first move of "Finding the system"
in `references/notion-schema.md`. Count only pages with that exact title.

- **None:** go to step 3.
- **One or more:** a growth system already exists, so a second must not be built. Tell the user,
  give each page's link (title, parent page, last edited where there is more than one), and stop.
  Re-running setup to repair or resume a system is not available yet.

**Done when** the search has run and the skill has either named what it found and stopped, or
found none.

## 3. Build

Serves the principle Maximise learning: every later Learning, Decision and Insight lands in one
place the whole team's skills read.

**The Build list.** Send one message listing everything the build will create, in plain words:
the Growth system page and where it will live (private, at the top level of their Notion); the
Settings page; the seven databases by name with one line on what each is for (the Growth system
glossary's definitions); their views; the Strategy map page; the explainer, principles and links on the
Growth system page. State that no sample rows are created and that nothing existing is touched.
End by asking for one yes. On anything but yes, create nothing and stop.

**On the yes, create everything in this order, with no further question.** Items 1 to 5 are here; the body and
the final state are step 4. Each item is done when it exists with everything
`references/notion-schema.md` gives it.

1. **The Growth system page**, titled `Growth system`, with no parent so it lands private. Keep its ID.
2. **The Settings page**, at once, as a child of the Growth system page: the opening line and the
   fenced block as "The Settings page" in `references/notion-schema.md` gives them, holding
   `schema_version: 1`, `setup_state: in_progress` and `growth_system_page`. Everything after this
   writes into this block, so an interrupted run leaves a Settings page that says so.
3. **The seven databases**, each a child of the Growth system page, with every property, select
   option, status group and formula of its table in `references/notion-schema.md`. Create them in the order
   Insights, Learnings, Decisions, Tasks, Projects, Initiatives, so a relation always points at a
   database that exists: define each relation, with its dual property named as the Relations table
   gives it, on the later database of the pair. Then add the Decisions self-relation (`Supersedes`
   with its dual `Superseded by`) as a second step on the created Decisions data source. After
   each database is created, add its `<name>_database` and `<name>_data_source` lines to the
   Settings page block before creating the next.
   - **Prefix fallback.** Give each database its default `ID` prefix. When Notion refuses a prefix
     because another data source in the workspace holds it, create that database with `GS-` plus
     the default (for example `GS-TSK`) and add a `<name>_prefix` line to the block. When
     the fallback is refused too, stop and tell the user which prefix, and that the build is
     unfinished.
4. **The views**: every row of the Views table in `references/notion-schema.md`, each a tab on its database.
5. **The Strategy map page**, as `references/page-layout.md` fixes it, a child of the Growth
   system page. Add `strategy_map_page` to the block.

The Growth system page body and `setup_state: complete` come next, in step 4.

When a create fails, stop. Tell the user plainly what exists, what failed and why, leave
`setup_state: in_progress` as it is, and say that setup will pick the system up again once
repair is available. Never delete what was created.

**Done when** the Settings page block holds `schema_version: 1`, `setup_state: in_progress`, the two
page lines, and `<name>_database` and `<name>_data_source` for all seven databases (fourteen lines),
plus a `<name>_prefix` line for each database that used the Prefix fallback; and every database
holds zero rows.

## 4. Fill the Growth system page and finish

Serves all four principles: the page is where the team first reads what the system runs on.

1. Write the body as `references/page-layout.md` fixes it: the explainer, the four principles, the
   links, and the Tasks and Projects boards inline. Take each principle's line from
   `references/principles.md`; the credit and the link to `https://gocrux.io/growth-system` go once,
   under the list, as the layout gives them. Link each database and the Strategy map by its Notion
   link, taken from the IDs this run created.
2. Only then write `setup_state: complete`, by changing that one line of the block. It is the last
   write of the build.

When a write fails, stop and report as step 3 does.

**Done when** every heading of `references/page-layout.md` is on the page, the page links all
seven databases and the Strategy map, the Tasks and Projects boards show inline, and the Settings
page block reads `setup_state: complete`.

## 5. Close

Tell the user, in the chat:

- The page is private to them. To share it, move the Growth system page into a teamspace, or
  share it with teammates, so their skills find the same system. Give the page's link.
- Notion's Free plan limits blocks once a workspace has two or more members.
- Next comes the planning chain, starting with the Strategy map: coming soon.

**Done when** the three points are in the chat message and the link to the Growth system page is
with them.
