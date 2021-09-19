#! /usr/bin/env sh

PWD=$(pwd)

ln -s $PWD/awesome $HOME/.config
ln -s $PWD/qtile $HOME/.config
ln -s $PWD/kitty $HOME/.config
ln -s $PWD/nvim $HOME/.config
ln -s $PWD/qtile $HOME/.config
ln -s $PWD/picom.conf $HOME/.config/picom.conf
ln -s $PWD/polybar $HOME/.config
ln -s $PWD/fish $HOME/.config

# change shell for fish
# chsh -s /usr/bin/fish

# sudo pacman -Syu --needed - < pkglist.txt
