#! /usr/bin/env sh

function startPipewire {
    pipewire &
    sleep 2
    pipewire-media-session &
    pipewire-pulse &

    pactl set-sink-volume @DEFAULT_SINK@ 35%
}

picom --config $HOME/.config/picom.conf &
xrandr --rate 100

startPipewire &

nm-applet &

