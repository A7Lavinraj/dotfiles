#!/bin/bash

git_status() {
  local branch dirty added modified deleted
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return

  added=$(git diff --numstat | awk '{s+=$1} END {print s}')
  modified=$(git diff --name-only | wc -l)
  deleted=$(git diff --numstat | awk '{s+=$2} END {print s}')

  if [[ -z "$added" && -z "$modified" && -z "$deleted" ]]; then
    echo "#[fg=green] $branch"
  else
    echo "#[fg=grey] $branch #[fg=yellow] ${added:-0} #[fg=blue] ${modified:1} #[fg=red] ${deleted:-0}"
  fi
}

git_status
