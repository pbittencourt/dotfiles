#!/usr/bin/env sh

setxkbmap -layout us -variant intl
xmodmap ~/dotfiles/xmodmap;
xcape -e 'Mode_switch=Escape';
notify-send -u low -t 900 "HJKL" "Conectado com sucesso!";
