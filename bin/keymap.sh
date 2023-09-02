#!/usr/bin/env sh
grep -i "^bindsym \$mod+" ~/.config/i3/config | \
sed -e 's/\s\+/ /g' | \
cut -c 10- | \
#rofi -dmenu -l 10 -i -p ""
mydmenu -p "  i3 keybindings" -l 20
