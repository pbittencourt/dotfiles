#!/usr/bin/bash

filepath=$(realpath $0)
directory=$(dirname $filepath)
theme="$1"

if [[ ! -n "$theme" ]]; then
   echo "You need to specify a theme!"
   exit 0
fi

xresources="$directory/$theme/xresources"
if [[ ! -f "$xresources" ]]; then
   echo "File xresources do not exist in directory!"
   exit 0
fi

background=$(cat "$xresources" | grep -Ei "\*background" | awk '{ print $2} ')
foreground=$(cat "$xresources" | grep -Ei "\*foreground" | awk '{ print $2} ')
color0=$(cat "$xresources" | grep -Ei "\*color0:" | awk '{ print $2} ')
color1=$(cat "$xresources" | grep -Ei "\*color1:" | awk '{ print $2} ')
color2=$(cat "$xresources" | grep -Ei "\*color2:" | awk '{ print $2} ')
color3=$(cat "$xresources" | grep -Ei "\*color3:" | awk '{ print $2} ')
color4=$(cat "$xresources" | grep -Ei "\*color4:" | awk '{ print $2} ')
color5=$(cat "$xresources" | grep -Ei "\*color5:" | awk '{ print $2} ')
color6=$(cat "$xresources" | grep -Ei "\*color6:" | awk '{ print $2} ')
color7=$(cat "$xresources" | grep -Ei "\*color7:" | awk '{ print $2} ')
color8=$(cat "$xresources" | grep -Ei "\*color8:" | awk '{ print $2} ')
color9=$(cat "$xresources" | grep -Ei "\*color9:" | awk '{ print $2} ')
color10=$(cat "$xresources" | grep -Ei "\*color10:" | awk '{ print $2} ')
color11=$(cat "$xresources" | grep -Ei "\*color11:" | awk '{ print $2} ')
color12=$(cat "$xresources" | grep -Ei "\*color12:" | awk '{ print $2} ')
color13=$(cat "$xresources" | grep -Ei "\*color13:" | awk '{ print $2} ')
color14=$(cat "$xresources" | grep -Ei "\*color14:" | awk '{ print $2} ')
color15=$(cat "$xresources" | grep -Ei "\*color15:" | awk '{ print $2} ')

# alacritty
output="$directory/$theme/colors.toml"
if [ -f "$output" ]; then
    echo "INFO Alacritty config already exists. Skipping ..."
else
    echo "# alacritty theme nord" > $output
    echo "[colors.primary]" >> $output
    echo "background = \"$(echo $background | sed 's/#/0x/g')\"" >> $output
    echo "foreground = \"$(echo $foreground | sed 's/#/0x/g')\"" >> $output
    echo "[colors.normal]" >> $output
    echo "black = \"$(echo $color0 | sed 's/#/0x/g')\"" >> $output
    echo "red = \"$(echo $color1 | sed 's/#/0x/g')\"" >> $output
    echo "green = \"$(echo $color2 | sed 's/#/0x/g')\"" >> $output
    echo "yellow = \"$(echo $color3 | sed 's/#/0x/g')\"" >> $output
    echo "blue = \"$(echo $color4 | sed 's/#/0x/g')\"" >> $output
    echo "magenta = \"$(echo $color5 | sed 's/#/0x/g')\"" >> $output
    echo "cyan = \"$(echo $color6 | sed 's/#/0x/g')\"" >> $output
    echo "white = \"$(echo $color7 | sed 's/#/0x/g')\"" >> $output
    echo "[colors.bright]" >> $output
    echo "black = \"$(echo $color8 | sed 's/#/0x/g')\"" >> $output
    echo "red = \"$(echo $color9 | sed 's/#/0x/g')\"" >> $output
    echo "green = \"$(echo $color10 | sed 's/#/0x/g')\"" >> $output
    echo "yellow = \"$(echo $color11 | sed 's/#/0x/g')\"" >> $output
    echo "blue = \"$(echo $color12 | sed 's/#/0x/g')\"" >> $output
    echo "magenta = \"$(echo $color13 | sed 's/#/0x/g')\"" >> $output
    echo "cyan = \"$(echo $color14 | sed 's/#/0x/g')\"" >> $output
    echo "white = \"$(echo $color15 | sed 's/#/0x/g')\"" >> $output
fi

# dunst
output="$directory/$theme/dunst"
if [ -f "$output" ]; then
    echo "INFO Dunst config already exists. Skipping ..."
else
    echo "[global]" > $output
    echo "     icon_theme = \"nord, breeze\"" >> $output
    echo "" >> $output
    echo "[urgency_low]" >> $output
    echo "     background = \"$background\"" >> $output
    echo "     foreground = \"$color2\"" >> $output
    echo "     frame_color = \"$color2\"" >> $output
    echo "     highlight = \"$color2\"" >> $output
    echo "     timeout = 10" >> $output
    echo "[urgency_normal]" >> $output
    echo "     background = \"$background\"" >> $output
    echo "     foreground = \"$color3\"" >> $output
    echo "     frame_color = \"$color3\"" >> $output
    echo "     highlight = \"$color3\"" >> $output
    echo "     timeout = 10" >> $output
    echo "[urgency_critical]" >> $output
    echo "     background = \"$color5\"" >> $output
    echo "     foreground = \"$background\"" >> $output
    echo "     frame_color = \"$background\"" >> $output
    echo "     highlight = \"$background\"" >> $output
    echo "     timeout = 10" >> $output
fi

# rofi
output="$HOME/dotfiles/rofi/themes/$theme.rasi"
if [ -f "$output" ]; then
    echo "INFO Rofi config already exists. Skipping ..."
else
    echo "* {" > $output
    echo "    color0: $background;" >> $output
    echo "    color1: $foreground;" >> $output
    echo "    color2: $color0;" >> $output
    echo "    color3: $color7;" >> $output
    echo "}" >> $output
    sudo ln -vsf $output "$directory/$theme/rofi"
    sudo ln -vsf $output "$HOME/.config/rofi"
fi

# vim
output="$directory/$theme/vim"
if [ -f "$output" ]; then
    echo "INFO Vim config already exists. Skipping ..."
else
    echo "set background=dark" > $output
    echo "colorscheme $theme" >> $output
fi

theme_dir="$HOME/.themes/$theme"
if [ ! -d $theme_dir ]; then
    echo "WARNING! Theme '$theme' not located in .themes directory."
    echo "Fallback to Adwaita theme."
    gtk="Adwaita-dark"
else
    gtk="$theme"
fi

# gtk2
output="$directory/$theme/gtk2"
if [ -f "$output" ]; then
    echo "INFO GTK2 config already exists. Skipping ..."
else
    echo "gtk-theme-name=\"$gtk\"" > $output
    echo "gtk-icon-theme-name=\"$gtk\"" >> $output
    echo "gtk-cursor-theme-name=\"Vimix-white-cursors\"" >> $output
fi

# gtk3
output="$directory/$theme/gtk3"
if [ -f "$output" ]; then
    echo "INFO GTK3 config already exists. Skipping ..."
else
    echo "gtk-theme-name=$gtk" > $output
    echo "gtk-icon-theme-name=$gtk" >> $output
    echo "gtk-cursor-theme-name=Vimix-white-cursors" >> $output
fi
