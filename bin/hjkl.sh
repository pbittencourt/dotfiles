#!/usr/bin/env sh

setxkbmap -layout us -variant intl;
#xmodmap ~/dotfiles/xmodmap_original;
#xcape -e 'Mode_switch=Escape';
notify-send -u low -t 1800 -i "keyboard" "HJKL" "Conectado com sucesso!";
