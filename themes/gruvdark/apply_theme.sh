#!/usr/bin/env sh

full_path=$(realpath $0)
dir_path=$(dirname $full_path)

notify-send -u normal -t 900 "Theme changing" "Aplicando tema GRUVDARK ..."

# xresources
echo "#include \"$dir_path/xresources\"" > ~/.Xresources
xrdb ~/.Xresources

# gtk
cat "$dir_path/gtk" > ~/.gtkrc-2.0

# kitty
sed -i -e "s/^include.*/include \.\/themes\/gruvbox_dark.conf/g" ~/dotfiles/kitty/kitty.conf

# vim
cat ~/.vimrc-base "$dir_path/vim" > ~/.vimrc

# rofi
sed -i -e "s/theme.*/theme: \".\/themes\/gruvbox-dark.rasi\";/g" ~/.config/rofi/config.rasi

# wallpaper
nitrogen --set-color=#070705 --set-centered ~/Imagens/Wallpapers/ascent1500.jpg

# conky
sed -i -e "s/default_color = '.*'/default_color = '#fffbef'/g" ~/.config/conky/conky.conf
sed -i -e "s/color1 = '.*'/color1 = '#8ec07c'/g" ~/.config/conky/conky.conf
sed -i -e "s/color2 = '.*'/color2 = '#a89984'/g" ~/.config/conky/conky.conf

# i3
# i3blocks main
sed -i -e 's/.*title_color/color=\#d79921 \#title_color/g' ~/.config/i3/i3blocks.conf
sed -i -e 's/.*alt_color/color=\#a89984 \#alt_color/g' ~/.config/i3/i3blocks.conf
sed -i -e 's/.*kb_color/color=\#8ec07c \#kb_color/g' ~/.config/i3/i3blocks.conf
# i3blocks keyindicator
sed -i -e 's/my \$color_on.*/my \$color_on  = \"#d79921\";/g' ~/.config/i3/i3blocks/keyindicator
sed -i -e 's/my \$color_off.*/my \$color_off = \"#282828\";/g' ~/.config/i3/i3blocks/keyindicator
# i3blocks cpu_usage
sed -i -e 's/.*crit_color.*/    print \"#d3869b\\n\"; #crit_color/g' ~/.config/i3/i3blocks/cpu_usage
sed -i -e 's/.*alt_color.*/    print \"#d79921\\n\"; #alt_color/g' ~/.config/i3/i3blocks/cpu_usage
i3-msg restart

notify-send -u low -t 1800 "Theme changing" "Tema GRUVDARK aplicado com sucesso!"
