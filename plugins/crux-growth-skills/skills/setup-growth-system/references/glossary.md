# Glossary

The terms `SKILL.md` and `page-layout.md` use beyond the growth system's own, which are in `growth-system-glossary.md`. Each has one meaning.

- **Change list**: the one message, sent before anything is created or added, naming every page, database, property, option and view the run will add to the user's Notion and asking for a single yes. Against a Notion with no growth system it names everything; against an existing system it names only what is missing. _Avoid_: build list, plan, preview, summary.

- **Difference**: something the live system holds that is unlike `notion-schema.md`: a property of another type, or a relation pointing at another database. It is reported in the Change list and left exactly as it is. _Avoid_: conflict, mismatch, fix.

- **Prefix fallback**: creating a database with `GS-` plus its default `ID` prefix (for example `GS-TSK`) because Notion allows each prefix on only one data source per workspace and another already holds it; the prefix used is recorded on the Settings page as `<name>_prefix`. _Avoid_: custom prefix, rename.
