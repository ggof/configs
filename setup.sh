#! /usr/bin/env sh

ln -s alacritty $HOME/.config/alacritty
ln -s nvim $HOME/.config/nvim
ln -s spectrwm $HOME/.config/spectrwm
ln -s qtile $HOME/.config/qtile
ln -s picom.conf $HOME/.config/picom.conf
ln -s polybar $HOME/.config/polybar
ln -s zsh/config.zsh $HOME/.zshrc
sudo pacman -Syu --needed - < pkglist.txt
