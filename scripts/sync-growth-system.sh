#!/usr/bin/env bash
# Copies shared/growth-system/*.md into each target skill's references/ (ADR-0018).
# --check copies nothing: it prints each drifted or missing copy and exits 1 if any.
set -u

root="$(cd "$(dirname "$0")/.." && pwd)"
src="$root/shared/growth-system"
skills="plugins/crux-growth-skills/skills"
files="context-load.md notion-schema.md principles.md growth-system-glossary.md initiative-contract.md"

check=0
case "${1:-}" in
  "") ;;
  --check) check=1 ;;
  *) echo "usage: $0 [--check]" >&2; exit 2 ;;
esac

for f in $files; do
  if [ ! -f "$src/$f" ]; then
    echo "missing canonical file: shared/growth-system/$f" >&2
    exit 2
  fi
done

targets=""
while IFS= read -r line || [ -n "$line" ]; do
  line="${line%$'\r'}"
  line="$(printf '%s' "$line" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
  case "$line" in
    ""|"#"*) continue ;;
  esac
  targets="$targets
$line"
done < "$src/targets.txt"

drift=0
default_ifs="$IFS"
IFS='
'
for t in $targets; do
  IFS="$default_ifs"
  dir="$root/$skills/$t"
  if [ ! -d "$dir" ]; then
    echo "$skills/$t: target skill folder not found" >&2
    drift=1
    continue
  fi
  for f in $files; do
    dest="$dir/references/$f"
    rel="$skills/$t/references/$f"
    if [ "$check" -eq 1 ]; then
      if [ ! -f "$dest" ]; then
        echo "$rel (missing)"
        drift=1
      elif ! cmp -s "$src/$f" "$dest"; then
        echo "$rel (drifted)"
        drift=1
      fi
    else
      mkdir -p "$dir/references"
      cp "$src/$f" "$dest"
    fi
  done
done

[ "$drift" -eq 0 ] || exit 1
