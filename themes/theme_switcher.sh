#!/usr/bin/env sh

full_path=$(realpath $0)
echo $full_path
dir_path=$(dirname $full_path)
echo $dir_path

themes_list=$(cd $dir_path; echo */ | sed -e 's/\///g')
echo $themes_list
theme=$(echo $themes_list | sed -e 's/\s/\n/g' | rofi -dmenu -l 4 -p "")
echo $theme

if [ ! -z "$theme" ]; then
    notify-send -u normal -t 1500 "Tema boladão" "Aplicando tema $theme ..."

    # xresources
    echo "#include \"$dir_path/$theme/xresources\"" > ~/.Xresources
    xrdb ~/.Xresources
    background=$(cat "$dir_path/$theme/xresources" | grep "^\*background:.*" | awk '{ print $2}')
    foreground=$(cat "$dir_path/$theme/xresources" | grep "^\*foreground:.*" | awk '{ print $2}')
    black=$(cat "$dir_path/$theme/xresources" | grep "^\*color0:.*" | awk '{ print $2}')
    red=$(cat "$dir_path/$theme/xresources" | grep "^\*color1:.*" | awk '{ print $2}')
    green=$(cat "$dir_path/$theme/xresources" | grep "^\*color2:.*" | awk '{ print $2}')
    yellow=$(cat "$dir_path/$theme/xresources" | grep "^\*color3:.*" | awk '{ print $2}')
    blue=$(cat "$dir_path/$theme/xresources" | grep "^\*color4:.*" | awk '{ print $2}')
    magenta=$(cat "$dir_path/$theme/xresources" | grep "^\*color5:.*" | awk '{ print $2}')
    cyan=$(cat "$dir_path/$theme/xresources" | grep "^\*color6:.*" | awk '{ print $2}')
    white=$(cat "$dir_path/$theme/xresources" | grep "^\*color7:.*" | awk '{ print $2}')

    # gtk
    cat "$dir_path/$theme/gtk" > ~/.gtkrc-2.0

    # kitty
    kitty="include $dir_path/$theme/kitty"
    escaped_kitty=$(printf '%s\n' "$kitty" | sed -e 's/[\/&]/\\&/g')
    sed -i -e 's/^include.*/'"${escaped_kitty}"'/g' ~/.config/kitty/kitty.conf

    # vim
    cat ~/.vimrc-base "$dir_path/$theme/vim" > ~/.vimrc

    # rofi
    rofi="theme: \"$dir_path/$theme/rofi\";"
    escaped_rofi=$(printf '%s\n' "$rofi" | sed -e 's/[\/&]/\\&/g')
    sed -i -e 's/theme.*/'"${escaped_rofi}"'/g' ~/.config/rofi/config.rasi

    # conky
    sed -i -e "s/default_color = '.*'/default_color = '${foreground}'/g" ~/.config/conky/conky.conf
    sed -i -e "s/color1 = '.*'/color1 = '${green}'/g" ~/.config/conky/conky.conf
    sed -i -e "s/color2 = '.*'/color2 = '${cyan}'/g" ~/.config/conky/conky.conf

    # i3
    # i3blocks main
    sed -i -e "s/.*title_color/color=${yellow} \#title_color/g" ~/.config/i3/i3blocks.conf
    sed -i -e "s/.*alt_color/color=${blue} \#alt_color/g" ~/.config/i3/i3blocks.conf
    sed -i -e "s/.*kb_color/color=${green} \#kb_color/g" ~/.config/i3/i3blocks.conf
    # i3blocks keyindicator
    sed -i -e 's/my \$color_on.*/my \$color_on  = \"'"${magenta}"'\";/g' ~/.config/i3/i3blocks/keyindicator
    sed -i -e 's/my \$color_off.*/my \$color_off = \"'"${background}"'\";/g' ~/.config/i3/i3blocks/keyindicator
    # i3blocks cpu_usage
    sed -i -e 's/.*crit_color.*/    print \"'"${yellow}"'\\n\"; #crit_color/g' ~/.config/i3/i3blocks/cpu_usage
    sed -i -e 's/.*alt_color.*/    print \"'"${red}"'\\n\"; #alt_color/g' ~/.config/i3/i3blocks/cpu_usage
    i3-msg restart

    case $theme in
        everlight)
            # wallpaper
            nitrogen --set-zoom-fill ~/Imagens/Wallpapers/ben-neale-29w9FiMWSr8-unsplash_flip.jpg
            ;;
        everdark)
            # wallpaper
            nitrogen --set-zoom-fill ~/Imagens/Wallpapers/roads.png
            ;;
        gruvlight)
            # wallpaper
            nitrogen --set-zoom-fill ~/Imagens/Wallpapers/wallhaven-mdqkyk.png
            ;;
        gruvdark)
            # wallpaper
            nitrogen --set-color=#070705 --set-centered ~/Imagens/Wallpapers/ascent1500.jpg
            ;;
    esac

    # dunst
    dunst="
    [urgency_low]\n
        background = \"${background}\"\n
        foreground = \"${green}\"\n
        frame_color = \"${green}\"\n
        timeout = 5\n
    [urgency_normal]\n
        background = \"${background}\"\n
        foreground = \"${yellow}\"\n
        frame_color = \"${yellow}\"\n
        timeout = 5\n
    [urgency_critical]\n
        background = \"${red}\"\n
        foreground = \"${white}\"\n
        frame_color = \"${white}\"\n
        timeout = 0\n
    "
    echo $dunst > "$dir_path/$theme/dunst"
    cat ~/dotfiles/dunst/dunstrc-base "$dir_path/$theme/dunst" > ~/.config/dunst/dunstrc
    pkill dunst
    dunst -config ~/.config/dunst/dunstrc &

    notify-send -u low -t 1500 "Tema boladão" "Tema $theme aplicado com sucesso!"
fi
