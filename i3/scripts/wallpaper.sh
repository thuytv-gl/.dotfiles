#!/bin/bash
set -o nounset
pushd ~/.dotfiles/wallpapers > /dev/null

[ ! -f .current ] && touch .current

set_next=0
first=$(ls | head -1)
last=$(ls | tail -1)

set_wallpaper() {
    wp_file=$(realpath "${1:-}")
    feh --bg-scale "${wp_file}"
    echo ${wp_file} > .current
}

get_next_wallpaper() {
  local current_wp=$(basename $1)
  if [ "$current_wp" == "$last" ] ; then
    echo $first
    exit 0
  fi 
  ls | while read file; do
    if [ $set_next == 1 ];then
      realpath $file
      exit 0
    fi

    if [ "$current_wp" == "$file" ]; then
      set_next=1
    fi
  done
}

get_current_wallpaper() {
  local current=$(cat .current)
  if [ -z "$current" ] || [ ! -f "$current" ]; then
    echo $(realpath $first)
    exit 0
  fi
  echo $(realpath $current)
}

current_wp=$(get_current_wallpaper)
opt=${1:-""}

if [ "$opt" == "--load" ]; then
  set_wallpaper "$current_wp"
else
  set_wallpaper `get_next_wallpaper $current_wp`
fi
popd > /dev/null
