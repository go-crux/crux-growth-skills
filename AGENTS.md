# Codex entry point

Read [`CLAUDE.md`](CLAUDE.md) first: it holds the layout, the hard rules and the branching for
this repository, and points at [`docs/skill-authoring.md`](docs/skill-authoring.md), the standard
every skill is written to. Read the parent Crux `AGENTS.md` too, plus both plugin manifests,
before changing the package.

The plugin is `plugins/crux-growth-skills/`, the only folder a client installs. Keep its Claude
manifest under `.claude-plugin/` working. Put Codex compatibility in its portable `plugin.json`
or its `.codex-plugin/` overlay, and keep its skills under `skills/` compatible with both hosts.
