#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff'
DEFAULT='#ffffff'
TEXT='#ffffff'
WRONG='#ff0000'
VERIFYING='#303030'

i3lock \
-e -f \
-c '#202020' \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$BLANK          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--clock                      \
--indicator                  \
--time-str="%H:%M"        \
--date-str="%Y-%m-%d"       \
