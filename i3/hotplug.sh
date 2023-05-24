#!/usr/bin/bash

export DISPLAY=:0
export XAUTHORITY=/home/thuytv/.Xauthority

function connect() {
    xrandr --output $1 --left-of eDP-1 --auto
    # this moves the current workspace to the new created one from i3
    i3 move workspace to output left
}

function disconnect() {
    xrandr --output $1 --off
}

function main() {
    # list of all different HDMI ports on docking stations etc.
    for disp in "HDMI-1" "eDP-1" ;
    do
        xrandr --query | grep "$disp connected" &> /dev/null && connect $disp || disconnect $disp
    done

    # restart window manager
    i3 restart
}

# start it forked so the monitor is active
# this is needed because udev activates the monitor
# AFTER this script returns
main &
