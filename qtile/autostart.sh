#! /usr/bin/env sh

picom --config $HOME/.config/picom.conf &
pamixer --set-volume 35
xrandr --rate 100

pipewire &
sleep 1
pipewire-media-session &
pipewire-pulse &
