#!/usr/bin/env sh

full_path=$(realpath $0)
dir_path=$(dirname $full_path)
themes_list=$(cd $dir_path; echo */ | sed -e 's/\///g')
theme=$(echo $themes_list | sed -e 's/\s/\n/g' | rofi -dmenu -l 4 -p "")
config="$HOME/.config"

if [ ! -z "$theme" ]; then
    notify-send -u normal -t 1500 "Tema boladão" "Aplicando tema $theme ..."

    # xresources
    echo "#include \"$dir_path/$theme/xresources\"" > "$HOME/.Xresources"
    xrdb "$HOME/.Xresources"
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
    dark_black=$(cat "$dir_path/$theme/xresources" | grep "^\*color8:.*" | awk '{ print $2}')
    dark_red=$(cat "$dir_path/$theme/xresources" | grep "^\*color9:.*" | awk '{ print $2}')
    dark_green=$(cat "$dir_path/$theme/xresources" | grep "^\*color10:.*" | awk '{ print $2}')
    dark_yellow=$(cat "$dir_path/$theme/xresources" | grep "^\*color11:.*" | awk '{ print $2}')
    dark_blue=$(cat "$dir_path/$theme/xresources" | grep "^\*color12:.*" | awk '{ print $2}')
    dark_magenta=$(cat "$dir_path/$theme/xresources" | grep "^\*color13:.*" | awk '{ print $2}')
    dark_cyan=$(cat "$dir_path/$theme/xresources" | grep "^\*color14:.*" | awk '{ print $2}')
    dark_white=$(cat "$dir_path/$theme/xresources" | grep "^\*color15:.*" | awk '{ print $2}')

    # gtk
    cat "$dir_path/$theme/gtk" > "$HOME/.gtkrc-2.0"

    # kitty
    kitty="include $dir_path/$theme/kitty"
    escaped_kitty=$(printf '%s\n' "$kitty" | sed -e 's/[\/&]/\\&/g')
    sed -i -e 's/^include.*/'"${escaped_kitty}"'/g' "$config/kitty/kitty.conf"

    # alacritty
    part1="$HOME/dotfiles/alacritty/alacritty.yml"
    part2="$dir_path/$theme/alacritty"
    file="$config/alacritty/alacritty.yml"
    cat $part1 $part2 > $file

    # vim
    cat "$HOME/dotfiles/vim/base" "$dir_path/$theme/vim" > "$HOME/.vimrc"

    # rofi
    rofi="theme: \"$dir_path/$theme/rofi\";"
    escaped_rofi=$(printf '%s\n' "$rofi" | sed -e 's/[\/&]/\\&/g')
    target="$HOME/dotfiles/rofi/config.rasi"
    destination="$config/rofi/config.rasi"
    sed -e 's/theme.*/'"${escaped_rofi}"'/g' $target > $destination

    # conky
    target="$HOME/dotfiles/conky/conky.conf"
    destination="$config/conky/conky.conf"
    sed -e "s/color2.*=.*'.*'/color2 = '${yellow}'/g" $target > $destination
    sed -i -e "s/color1.*=.*'.*'/color1 = '${dark_yellow}'/g" $destination
    sed -i -e "s/default_color.*=.*'.*'/default_color = '${foreground}'/g" $destination
    target="$HOME/dotfiles/conky/music.conf"
    destination="$config/conky/music.conf"
    sed -e "s/color2.*=.*'.*'/color2 = '${yellow}'/g" $target > $destination
    sed -i -e "s/color1.*=.*'.*'/color1 = '${dark_yellow}'/g" $destination
    sed -i -e "s/default_color.*=.*'.*'/default_color = '${foreground}'/g" $destination
    target="$HOME/dotfiles/conky/system.conf"
    destination="$config/conky/system.conf"
    sed -e "s/color2.*=.*'.*'/color2 = '${yellow}'/g" $target > $destination
    sed -i -e "s/color1.*=.*'.*'/color1 = '${dark_yellow}'/g" $destination
    sed -i -e "s/default_color.*=.*'.*'/default_color = '${foreground}'/g" $destination
    sed -i -e "s/exploded\/\w*/exploded\/$theme/g" $destination

    # i3
    # i3blocks main
    target="$HOME/dotfiles/i3/i3blocks.conf"
    destination="$config/i3/i3blocks.conf"
    sed -e "s/.*title_color/color=${yellow} \#title_color/g" $target > $destination
    sed -i -e "s/.*alt_color/color=${blue} \#alt_color/g" $destination
    sed -i -e "s/.*kb_color/color=${green} \#kb_color/g" $destination
    # i3blocks keyindicator
    target="$HOME/dotfiles/i3/i3blocks/keyindicator"
    destination="$config/i3/i3blocks/keyindicator"
    sed -e 's/my \$color_on.*/my \$color_on  = \"'"${magenta}"'\";/g' $target > $destination
    sed -i -e 's/my \$color_off.*/my \$color_off = \"'"${background}"'\";/g' $destination
    # i3blocks cpu_usage
    target="$HOME/dotfiles/i3/i3blocks/cpu_usage"
    destination="$config/i3/i3blocks/cpu_usage"
    sed -e 's/.*crit_color.*/    print \"'"${red}"'\\n\"; #crit_color/g' $target > $destination
    sed -i -e 's/.*alt_color.*/    print \"'"${yellow}"'\\n\"; #alt_color/g' $destination
    i3-msg restart

    # wallpaper
    xsetroot -solid "$background"
    case $theme in
        everlight)
            #nitrogen --set-zoom-fill "$HOME/Imagens/Wallpapers/ben-neale-29w9FiMWSr8-unsplash_flip.jpg"
            ;;
        everdark)
            #nitrogen --set-zoom-fill "$HOME/Imagens/Wallpapers/roads.png"
            ;;
        gruvlight)
            #nitrogen --set-zoom-fill "$HOME/Imagens/Wallpapers/colorwalls.jpg"
            ;;
        gruvdark)
            #nitrogen --set-color=#070705 --set-centered "$HOME/Imagens/Wallpapers/ascent1500.jpg"
            ;;
    esac

    # dunst
    cat "$HOME/dotfiles/dunst/dunstrc-base" "$dir_path/$theme/dunst" > "$config/dunst/dunstrc"
    pkill dunst
    dunst -config "$config/dunst/dunstrc" &

    notify-send -u low -t 1500 "Tema boladão" "Tema $theme aplicado com sucesso!"
fi
