# Codex entry point

Read [`CLAUDE.md`](CLAUDE.md) first: it holds the layout, the hard rules and the branching for
this repository, and points at [`docs/skill-authoring.md`](docs/skill-authoring.md), the standard
every skill is written to. Read the parent Crux `AGENTS.md` too, plus both plugin manifests,
before changing the package.

Keep the Claude manifest under `.claude-plugin/` working. Put Codex compatibility in the portable
root `plugin.json` or the `.codex-plugin/` overlay, and keep shared skills under `skills/`
compatible with both hosts.
