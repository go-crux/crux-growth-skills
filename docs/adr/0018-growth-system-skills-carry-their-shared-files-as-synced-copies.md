# Growth-system skills carry their shared files as synced copies, never a shared path

**Status:** Accepted, 2026-11-23.

The growth-system skills share a context load, a Notion schema and the principles, and S3's plugin shares them through `${CLAUDE_PLUGIN_ROOT}/references/`. That variable is Claude Code's alone: Codex reads only `skills/`, a skill uploaded on its own to claude.ai or listed in a registry carries only its folder, and a shared path that fails to resolve leaves the skill running without its context load and with no error. So the shared files have one canonical copy in `shared/growth-system/`, a script in this repo copies it into each growth-system skill's `references/`, and our own `/code-review` before a merge checks every copy matches it byte for byte. All of this happens here, before release: a user installs skills with the copies already inside and runs nothing to sync them. We accept the duplicated text for skills that each install, upload and run on their own.
