#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of AwesomeWM
# TODO: run_once

function run {
    if ! pgrep -x $1 ;
    then
        $@&
    fi
}

function runExact {
    exists = $(pgrep -xf $1)

    if exists; then
        pkill exists
    fi

    $@&
}

# For desktop effects
run picom --conf ~/.config/picom.conf

# Network manager tray icon
run nm-applet

# Keyboard
setxkbmap -layout "us,ca" -option "grp:alt_shift_toggle"

# nitrogen --restore
xrandr --rate 100

runExact pipewire
runExact pipewire-pulse
runExact pipewire-media-session

pactl set-sink-volume @DEFAULT_SINK@ 35%
