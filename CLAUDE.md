# CLAUDE.md: working notes for `crux-growth-skills`

**Crux growth skills** (the plugin `crux-growth-skills`): free skills anyone installs in their own Claude (the desktop app's
plugins, Claude Code, or Codex). Each skill carries Crux craft, such as a Black Friday plan or a
report worth reading. They work best on a brand's own **Growth Brain** connector, but the plugin
never requires one: it doubles as a lead magnet for brands that are not yet clients, so a skill
that needs a brain says so and points at gocrux.io. The boundary is
mcp_brain ADR-0026: **the brain ships mechanism, the plugin ships craft**. The brain owns the
tools and the data, and a skill owns the interview, the method and the page it produces.

Read [`GLOSSARY.md`](GLOSSARY.md) and the skill's own `references/glossary.md` before planning or building; a PRD's terms sit on its integration branch until its promote. Before writing or reviewing a
skill, read [`docs/skill-authoring.md`](docs/skill-authoring.md) **whole**: it is the standard
every skill here is held to. Decisions live in `docs/adr/` once there are any.

**This file is navigation, hard rules and pointers only.**

## Layout

| Path | What it is |
|---|---|
| `plugins/crux-growth-skills/` | **the plugin: the only folder a client installs** |
| `plugins/crux-growth-skills/skills/<name>/SKILL.md` | one skill: its frontmatter and its steps |
| `plugins/crux-growth-skills/skills/<name>/references/` | material that skill reads only when a step points at it, its `glossary.md` included |
| `plugins/crux-growth-skills/.claude-plugin/plugin.json` | the Claude Code manifest |
| `plugins/crux-growth-skills/plugin.json` | the portable manifest (agent-plugins schema) |
| `plugins/crux-growth-skills/.codex-plugin/plugin.json` | the Codex overlay; `skills: "./skills/"` |
| `.claude-plugin/marketplace.json` | the marketplace `crux`, listing the plugin `crux-growth-skills` at `source: "./plugins/crux-growth-skills"` |
| `README.md` | the **client-facing** install guide and skill list, read on GitHub |
| `CLAUDE.md`, `AGENTS.md`, `GLOSSARY.md`, `docs/` | for us; outside the plugin folder, so never installed |

There is no code, no package manager and no test suite. A skill is prose an agent runs.

## Commands

```bash
claude plugin validate .                              # the marketplace manifest
claude plugin validate plugins/crux-growth-skills     # the plugin; run both after any manifest edit
claude --plugin-dir ~/code/crux/growth-skills/plugins/crux-growth-skills   # a session with this checkout's plugin loaded, for a dry run
```

A dry run needs a Growth Brain connector (`<Client> - Growth Brain`) in that session, so it runs
from Matt's own Claude, never from a cold run. Method in
[`docs/skill-authoring.md`](docs/skill-authoring.md#testing-a-skill).

## Sharp edges

- **This repo is public.** Every commit is readable by anyone, and stays readable once deleted.
  A client's name, figures, table contents or brain URL never go in a skill, an example, an issue
  quote copied into a file, or a commit message. Examples use invented brands and round numbers.
- **`main` is the release.** Clients install from `main`, and Claude pulls updates on its own
  after a session starts, so a merge to `main` reaches every client. Only a promote PR merges
  there.
- **Only `plugins/crux-growth-skills/` installs.** Everything a client's agent needs goes inside
  it, and each skill reads nothing outside its own folder. Nothing for us (this file, `AGENTS.md`,
  `GLOSSARY.md`, `docs/`, notes) goes inside it. The repo is still public, so the split controls
  what installs, not what is readable on GitHub.
- **The version lives in four places**: `.claude-plugin/marketplace.json` (on the plugin entry)
  and the plugin's `.claude-plugin/plugin.json`, `plugin.json` and `.codex-plugin/plugin.json`. A release bumps all four
  together (minor for a new skill, patch for a fix), and the manifest descriptions say what
  the plugin now carries.
- **A merged skill is not live in a running session.** A client gets it after
  `/plugin marketplace update crux`, `/plugin update crux-growth-skills` and `/reload-plugins`. When a
  run behaves like the old version, check the installed commit before debugging the skill.
- **A skill reaches the brain only by contract.** It names the tools (`list_tables`,
  `list_metrics`, `search_examples`, `run_sql`) and the marts (`<client>-orders`) and reads
  columns from `list_tables` on every run. This repo has no CI link to `mcp_brain`, so a renamed
  tool or column breaks a skill silently; treat a brain rename as a change with an out-of-repo
  caller (ADR-0026).
- **Both hosts read the plugin's `skills/`.** Keep a skill free of Claude-only syntax the Codex host cannot
  follow, and keep the plugin's Claude manifest under `.claude-plugin/` working.
- **Anyone reads the README.** It is written for a non-technical reader at any ecommerce brand, client or not (founder, head of growth, ecommerce or marketing manager), leads with the desktop app's plugin install, and says what each skill needs. It is in Crux house style
  (British English, no em dashes) and lists only skills that have shipped to `main`.

## Branching & PRs

- **A PRD slice** (`prd:prd<id>-<slug>` label): cut from the integration branch `prd<id>-<slug>`
  (it holds the PRD's glossary terms), and PR `--base prd<id>-<slug>` with the `no-review` label at
  open. Run `/code-review` against `docs/skill-authoring.md` before pushing. Squash-merge, and leave
  the issue open.
- **The promote** is one `prd<id>-<slug>` → `main` PR, opened only after the PRD's dry runs on
  real brains pass. It's the release.
- **Local review only: this repo has no Greptile.** `/code-review` before every push is the whole
  review, the promote included, and nobody waits on a bot or comments `@greptileai`.
- **A standalone fix** (no `prd:` label): cut from `main`, PR `--base main`, and bump the patch
  version in the same PR.
- **Every slice commit subject carries `Closes #<n>`.** Never put `no-review` on an issue.

## PRDs and programme

PRDs are `prd-doc` issues in `go-crux/crux-growth-skills`, sliced into `[PRD<id>][Slice]` issues and run by
`/implement` or crux-engineer. Seasonal and growth skills belong to programme PGM003 (spine
go-crux/crux-workspace#52). The public skills repo and lead-magnet versions are go-crux/crux-growth-skills#1.
