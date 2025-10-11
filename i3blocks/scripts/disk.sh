#!/bin/bash

_button="${button}"

if [[ "$_button" == "1" ]]; then
  exec org.gnome.baobab
fi

df -h / | awk 'NR==2 {print "DISK: "$4}'
