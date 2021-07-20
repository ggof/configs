#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of AwesomeWM
# TODO: run_once

function run {
    if ! pgrep $1 ;
    then
        $@&
    fi
}

# Load terminal colorscheme and settings
#xrdb ~/.Xresources

# Volume notification daemon
#run volume-daemon

# For desktop effects
run picom --conf ~/.config/picom.conf

# Enable numlock on login
run numlockx

# Network manager tray icon
run nm-applet

# Keyboard
setxkbmap -layout "us,ca" -option "grp:alt_shift_toggle"
#setxkbmap -layout "us,gr,ru" -option "grp:alt_shift_toggle"

nitrogen --restore
xrandr --rate 100

pipewire &
sleep 1
pipewire-media-session &
pipewire-pulse &

pactl set-sink-volume @DEFAULT_SINK@ 35%
