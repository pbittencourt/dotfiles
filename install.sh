#!/usr/bin/env sh

# let's create a brand new fresh enviroment!
# ~ <3

echo "WELCOME BACK, MR MONOLITO.\n"

# initial update
sudo xbps-install -Su

# nonfree repo
sudo xbps-install -Sy void-repo-nonfree

# apps
sudo xbps-install -Sy i3-gaps i3lock i3status i3blocks \
    git vim gvim kitty qutebrowser rsync \
    scrot feh flameshot nitrogen lxappearance inkscape \
    nm-applet redshift dunst rofi greenclip xcalc \
    mpd mpc mpv vlc ncmpcpp minidlna

# final update
sudo xbps-install -Su

echo "\nENJOY!"
