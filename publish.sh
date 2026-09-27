#!/bin/zsh
# Copy a locked brief into place and push it live.
#   ./publish.sh <folder> <path-to-locked-html>
# e.g. ./publish.sh cnsoer ~/dev/inspire/source-model-cnsoer/docs/briefing/cnsoer-brief-locked.html
set -eu
cd "${0:A:h}"
dir=$1; src=$2
[[ "$dir" =~ '^[a-z0-9][a-z0-9-]*$' ]] || { echo "folder must be lowercase words and hyphens" >&2; exit 1; }
grep -q 'PAYLOAD' "$src" 2>/dev/null || grep -q '"ct"' "$src" || { echo "refusing: $src does not look like a locked page" >&2; exit 1; }
mkdir -p "$dir"; cp "$src" "$dir/index.html"
git add "$dir/index.html"
git commit -q -m "publish: $dir $(date '+%Y-%m-%d %H:%M')" && git push -q origin main && echo "pushed $dir"
