#!/bin/sh

dir="${1:=$HOME}"
found=$(fd -td -H -E 'node_modules' '.git$' --exec sh -c 'realpath "$(dirname "{}")"' \; $dir | fzf)
if [[ -z "$found" ]];then
  exit 0
fi

tmux neww -c "$found"
