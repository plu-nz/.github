#!/usr/bin/env bash
set -euo pipefail

workspace_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
repos_dir="$workspace_dir/repos"
mkdir -p "$repos_dir"

repo_rows="$(gh repo list plu-nz --limit 1000 --json name,url --jq '.[] | select(.name != ".github") | [.name, .url] | @tsv')"

while IFS=$'\t' read -r repo_name repo_url; do
  [[ -n "$repo_name" ]] || continue
  repo_path="$repos_dir/$repo_name"

  if [[ ! -e "$repo_path" ]]; then
    git clone -- "$repo_url" "$repo_path"
    continue
  fi

  if [[ ! -d "$repo_path/.git" ]]; then
    printf 'Skipping %s: directory exists but is not a Git checkout.\n' "$repo_path" >&2
    continue
  fi

  printf 'Updating %s\n' "$repo_name"
  git -C "$repo_path" fetch --prune origin
  if [[ -z "$(git -C "$repo_path" status --porcelain)" ]] &&
     [[ -n "$(git -C "$repo_path" rev-parse --abbrev-ref --symbolic-full-name '@{upstream}' 2>/dev/null || true)" ]]; then
    git -C "$repo_path" pull --ff-only
  else
    printf 'Leaving %s working tree unchanged (local work or no upstream).\n' "$repo_name"
  fi
done <<< "$repo_rows"
