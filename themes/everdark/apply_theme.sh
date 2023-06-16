#!/usr/bin/env sh

full_path=$(realpath $0)
dir_path=$(dirname $full_path)

notify-send -u normal -t 900 "Theme changing" "Aplicando tema EVERDARK.."

# xresources
echo "#include \"$dir_path/xresources\"" > ~/.Xresources
xrdb ~/.Xresources

# gtk
cat "$dir_path/gtk" > ~/.gtkrc-2.0

# kitty
sed -i -e "s/^include.*/include \.\/themes\/everforest_dark.conf/g" ~/dotfiles/kitty/kitty.conf

# vim
cat ~/.vimrc-base "$dir_path/vim" > ~/.vimrc

# rofi
sed -i -e "s/theme.*/theme: \".\/themes\/everforest-dark-hard.rasi\";/g" ~/.config/rofi/config.rasi

# wallpaper
nitrogen --set-zoom-fill ~/Imagens/Wallpapers/roads.png

# conky
sed -i -e "s/default_color = '.*'/default_color = '#4f5b58'/g" ~/.config/conky/conky.conf
sed -i -e "s/color1 = '.*'/color1 = '#a7c080'/g" ~/.config/conky/conky.conf
sed -i -e "s/color2 = '.*'/color2 = '#83c092'/g" ~/.config/conky/conky.conf

# i3
# i3blocks main
sed -i -e 's/.*title_color/color=\#076678 \#title_color/g' ~/.config/i3/i3blocks.conf
sed -i -e 's/.*alt_color/color=\#a89984 \#alt_color/g' ~/.config/i3/i3blocks.conf
sed -i -e 's/.*kb_color/color=\#98971a \#kb_color/g' ~/.config/i3/i3blocks.conf
# i3blocks keyindicator
sed -i -e 's/my \$color_on.*/my \$color_on  = \"#d65d0e\";/g' ~/.config/i3/i3blocks/keyindicator
sed -i -e 's/my \$color_off.*/my \$color_off = \"#fbf1c7\";/g' ~/.config/i3/i3blocks/keyindicator
# i3blocks cpu_usage
sed -i -e 's/.*crit_color.*/    print \"#8f3f71\\n\"; #crit_color/g' ~/.config/i3/i3blocks/cpu_usage
sed -i -e 's/.*alt_color.*/    print \"#b57614\\n\"; #alt_color/g' ~/.config/i3/i3blocks/cpu_usage
#i3-msg restart
i3-msg reload

notify-send -u low -t 1800 "Theme changing" "Tema EVERDARK aplicado com sucesso!"
