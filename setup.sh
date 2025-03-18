#!/bin/sh
set +x

DOT_ROOT=$HOME/.dotfiles

ln -s $DOT_ROOT/tmux/.tmux.conf $HOME/
ln -s $DOT_ROOT/tmux/pjrun.sh $HOME/pjrun.sh
ln -s $DOT_ROOT/alacritty.yml $HOME/.alacritty.yml
ln -s $DOT_ROOT/zsh/* $HOME/
ln -s $DOT_ROOT/i3/.i3status.conf $HOME/
ln -s $DOT_ROOT/i3/config $HOME/.config/i3/
ln -s $DOT_ROOT/ranger $HOME/.config

