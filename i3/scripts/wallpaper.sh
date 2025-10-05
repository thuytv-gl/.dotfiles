#!/bin/bash

WALL_DIR=~/.dotfiles/wallpapers/poseidon

if [ "$opt" == "--load" ]; then
  source ~/.fehbg
else
  exec feh -r --randomize --bg-scale $WALL_DIR 
fi
