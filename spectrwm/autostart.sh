#! /usr/bin/env sh

picom --config $HOME/.config/picom.conf &
nitrogen --restore
$HOME/.config/spectrwm/polybar.sh
amixer sset Master 35%
