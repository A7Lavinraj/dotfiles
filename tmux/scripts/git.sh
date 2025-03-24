#!/bin/bash

git_status() {
  local branch remote added modified deleted
  branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  remote=$(git remote get-url origin 2>/dev/null | sed -E 's#(git@|https://)[^/:]+[:/]##; s#\.git$##')

  added=$(git diff --numstat | awk '{s+=$1} END {print s}')
  modified=$(git diff --name-only | wc -l)
  deleted=$(git diff --numstat | awk '{s+=$2} END {print s}')

  if [[ -z "$added" && -z "$modified" && -z "$deleted" ]]; then
    echo "#[fg=green] $branch #[fg=green]($remote)"
  else
    echo "#[fg=grey] $branch #[fg=green]($remote) #[fg=green] ${added:-0} #[fg=blue] ${modified:-0} #[fg=red] ${deleted:-0}"
  fi
}

git_status
