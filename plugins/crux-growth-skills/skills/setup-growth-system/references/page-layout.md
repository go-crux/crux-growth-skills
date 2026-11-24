# Page layout

The two pages this skill writes content to, with their headings fixed so two brands' systems read
the same and an empty heading stays visible. Terms are in `growth-system-glossary.md`. The
Settings page is not here: its content is "The Settings page" in `notion-schema.md`.

## The Growth system page

Titled `Growth system`, with its icon from `notion-schema.md`. Body, in this order, in the user's Notion (headings are
second-level). Build it from Notion's own blocks (callouts, columns, dividers), so it reads as a home
page rather than a document. Notion has no grid block: a two-by-two grid is two columns of two
callouts each. Where the connector cannot make a callout or a column, write the same text as plain
paragraphs in the same order; nothing is dropped.

**Opening callout, no heading,** icon 🌱, grey background: "The growth system: how this team plans, runs and learns from its growth work. The skills read and write it, so everyone's session starts from what the team has already decided and learned."

**## How it fits together**

One callout, icon 🪜, blue background, holding the hierarchy line in bold: "**Objective → Initiative → Project → Task**". Under it, a bulleted list. In the callout and the list, each bold name is a plain text link to its page: Objective, Initiative, Project, Task, Issues, Decisions, Learnings and Insights to their databases, by the IDs in the Settings page block. A link, never a page mention or a database block, so the line reads as text.

- "**Objective**: a quarter's qualitative direction, served by 3 to 5 Initiatives."
- "**Initiative**: serves one Objective, and carries one Key result."
- "**Project**: the whole context of one piece of work, hanging from an Initiative."
- "**Task**: the action somebody, or Claude, actually does; an Experiment is a Task that tests a hypothesis."
- "**Issues** are open problems nobody has the answer to yet. Solving one creates Tasks or a Decision."
- "**Decisions** are choices the team complies with or breaches. A new one supersedes an old one; none is edited into another."
- "**Learnings** are what the team has concluded and could be wrong about, rated on the evidence ladder (Proven, Validated, Directional, Anecdotal)."
- "**Insights** are what customers say, banked in their own words."

**## The four principles**

A two-by-two grid: two columns of equal width, each holding two callouts, one per principle.
Left column: Maximise learning (icon 🔬, green background), then Balance art and science (icon
🎨, purple background). Right column: Seek impact (icon 📈, orange background), then Stay agile (icon
⚡, yellow background). Each callout holds the principle's name in bold on its first line and, under
it, one line condensed from its text in `principles.md`. Under the grid, outside it, one paragraph:
"From Brian Balfour. [How Crux reads them](https://gocrux.io/growth-system)."

A divider.

**## The databases**

Three columns of equal width, so they read as one row of three. Each column opens with its label
as a third-level heading on a coloured background, the column's header bar: Plan on blue, Do on
orange, Learn on green. Under it, its entries in the order given, each followed by its grey line,
as written here.

- **Plan:** Objectives ("A quarter's direction, served by 3 to 5 Initiatives."), Strategy map ("Each quarter's growth model and weakest steps."), Initiatives ("Workstreams, each with one Key result."), Projects ("The whole context of each piece of work.").
- **Do:** Tasks ("The board: tasks and experiments."), Issues ("Open problems nobody has the answer to yet.").
- **Learn:** Decisions ("Choices the team complies with."), Learnings ("What we concluded, rated on evidence."), Insights ("What customers say, verbatim.").

Under the columns, outside them: the Settings page, then one grey line, "Kept by setup; do not edit."

The databases, the Strategy map and the Settings page are children of this page, so Notion already
shows each as a block on it. Each entry is that block itself, moved into its column and still carrying its icon, so every
child appears once and the page holds no loose list of them. A rewrite of the page must name every
child block it keeps, because a child left out is deleted; never drop one. Where the connector
cannot move a child block into a column, the entry is a link to it instead and the child blocks
stay where Notion put them, so each shows twice: better than a child lost.


## The Strategy map page

Titled `Strategy map`, with its icon from `notion-schema.md`, a child of the Growth system page. Body: empty. It holds no section until `/to-objectives` writes the first, one `## <quarter>` per quarter as "Pages" in `notion-schema.md` fixes it. A Strategy map that an earlier version of this skill created keeps the headings it has.
