#!/usr/bin/env sh

xresources="$1/xresources"

background=$(cat "$xresources" | grep "^\*background:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
foreground=$(cat "$xresources" | grep "^\*foreground:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color0=$(cat "$xresources" | grep "^\*color0:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color1=$(cat "$xresources" | grep "^\*color1:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color2=$(cat "$xresources" | grep "^\*color2:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color3=$(cat "$xresources" | grep "^\*color3:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color4=$(cat "$xresources" | grep "^\*color4:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color5=$(cat "$xresources" | grep "^\*color5:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color6=$(cat "$xresources" | grep "^\*color6:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color7=$(cat "$xresources" | grep "^\*color7:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color8=$(cat "$xresources" | grep "^\*color8:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color9=$(cat "$xresources" | grep "^\*color9:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color10=$(cat "$xresources" | grep "^\*color10:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color11=$(cat "$xresources" | grep "^\*color11:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color12=$(cat "$xresources" | grep "^\*color12:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color13=$(cat "$xresources" | grep "^\*color13:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color14=$(cat "$xresources" | grep "^\*color14:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")
color15=$(cat "$xresources" | grep "^\*color15:.*" | awk '{ print $2}' | sed -e "s/\#/'0x/g" | sed -e "s/$/'/g")

saida="$1/alacritty"
echo "# alacritty theme $1" > $saida
echo "colors:" >> $saida
echo "  primary:" >> $saida
echo "    background: $background" >> $saida
echo "    foreground: $foreground" >> $saida
echo "  normal:" >> $saida
echo "    black: $color0" >> $saida
echo "    red: $color1" >> $saida
echo "    green: $color2" >> $saida
echo "    yellow: $color3" >> $saida
echo "    blue: $color4" >> $saida
echo "    magenta: $color5" >> $saida
echo "    cyan: $color6" >> $saida
echo "    white: $color7" >> $saida
echo "  bright:" >> $saida
echo "    black: $color8" >> $saida
echo "    red: $color9" >> $saida
echo "    green: $color10" >> $saida
echo "    yellow: $color11" >> $saida
echo "    blue: $color12" >> $saida
echo "    magenta: $color13" >> $saida
echo "    cyan: $color14" >> $saida
echo "    white: $color15" >> $saida
