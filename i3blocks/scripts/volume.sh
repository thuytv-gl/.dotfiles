#!/bin/bash

_button="${button}"

unmute() {
  if pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes; then
      pactl set-sink-mute @DEFAULT_SINK@ toggle
  fi
}

case $_button in
  "1")
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;

  "4")
    unmute
    pactl set-sink-volume @DEFAULT_SINK@ +1%
    ;;

  "5")
    unmute
    pactl set-sink-volume @DEFAULT_SINK@ -1%
    ;;
esac

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q yes; then
  echo "VOLUME: 0%"
else
  pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+(?=%)' | head -1 | awk '{print "VOLUME: "$1"%"}';
fi
