#!/usr/bin/env sh

full_path=$(realpath $0)
echo "fullpath: $full_path"
dir_path=$(dirname $full_path)
echo "dirpath: $dir_path"
themes_list=$(cd $dir_path; echo */ | sed -e 's/\///g')
echo "themeslist: $themes_list"
theme=$(echo $themes_list | sed -e 's/\s/\n/g' | mydmenu -p "  theme:")
#theme=$(echo $themes_list | sed -e 's/\s/\n/g' | rofi -dmenu -l 4 -p "")
echo "theme: $theme"
config="$HOME/.config"
logfile="$HOME/theme.log"
touch $logfile

if [ ! -z "$theme" ]; then
    echo "Escolhido tema $theme!" 2>&1 | tee -a $logfile
    notify-send -u low -t 3600 -i "applications-graphics" \
    "Tema boladão" "Aplicando tema $theme ..."

    # xresources
    echo "Alterando arquivo Xresources ..." 2>&1 | tee -a $logfile
    #echo "#include \"$dir_path/$theme/xresources\"" > "$HOME/.Xresources"
    cat $dir_path/$theme/xresources > "$HOME/.Xresources"
    echo "... arquivo Xresources alterado!" 2>&1 | tee -a $logfile
    xrdb "$HOME/.Xresources"
    echo "Comando xrdb executado." 2>&1 | tee -a $logfile
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

    # gtk2
    echo "Alterando arquivo GTK2 ..." 2>&1 | tee -a $logfile
    cat "$dir_path/$theme/gtk2" > "$HOME/.gtkrc-2.0.mine"
    cat "$dir_path/gtk2-base" > "$HOME/.gtkrc-2.0"
    echo "... arquivo GTK2 alterado!" 2>&1 | tee -a $logfile

    # gtk3
    echo "Alterando arquivo GTK3 ..." 2>&1 | tee -a $logfile
    cat "$dir_path/gtk3-base" > "$config/gtk-3.0/settings.ini"
    cat "$dir_path/$theme/gtk3" >> "$config/gtk-3.0/settings.ini"
    echo "... arquivo GTK3 alterado!" 2>&1 | tee -a $logfile

    # kitty
    echo "Alterando configurações para kitty ..." 2>&1 | tee -a $logfile
    kitty="include $dir_path/$theme/kitty"
    escaped_kitty=$(printf '%s\n' "$kitty" | sed -e 's/[\/&]/\\&/g')
    sed -i -e 's/^include.*/'"${escaped_kitty}"'/g' "$config/kitty/kitty.conf"
    echo "... kitty configurado!" 2>&1 | tee -a $logfile

    # alacritty
    echo "Alterando configurações para alacritty ..." 2>&1 | tee -a $logfile
    part1="$HOME/dotfiles/alacritty/alacritty.toml"
    part2="$dir_path/$theme/colors.toml"
    file="$config/alacritty/alacritty.toml"
    cat $part1 $part2 > $file
    echo "... alacritty configurado!" 2>&1 | tee -a $logfile

    # xfce4-terminal
    echo "Alterando configurações para xfce4-terminal ..." 2>&1 | tee -a $logfile
    colors=$(cat "$dir_path/$theme/xresources" | \
    grep "^\*color[0-7]:" | \
    sed 's/\*color[0-7]:\s\+//g' | \
    tr '\n' ';' | \
    sed 's/;$//g'
    )
    palette="$colors;$colors"
    sed -i 's/^ColorPalette.*/ColorPalette='${palette}'/g' "$config/xfce4/terminal/terminalrc"
    sed -i 's/^ColorBackground.*/ColorBackground='${background}'/g' "$config/xfce4/terminal/terminalrc"
    sed -i 's/^ColorForeground.*/ColorForeground='${foreground}'/g' "$config/xfce4/terminal/terminalrc"
    echo "... xfce4-terminal configurado!" 2>&1 | tee -a $logfile

    # vim
    echo "Alterando configurações para vim ..." 2>&1 | tee -a $logfile
    cat "$HOME/dotfiles/vim/base" "$dir_path/$theme/vim" > "$HOME/.vimrc"
    echo "... vim configurado!" 2>&1 | tee -a $logfile

    # rofi
    echo "Alterando configurações para rofi ..." 2>&1 | tee -a $logfile
    target="$HOME/dotfiles/rofi/config.rasi"
    destination="$config/rofi/config.rasi"
    sed -e 's/@import.*/@import \"'${theme}'\"/g' $target > $destination
    echo "... rofi configurado!" 2>&1 | tee -a $logfile

    # mydmenu
    echo "Alterando configurações para mydmenu ..." 2>&1 | tee -a $logfile
    target="$HOME/.local/bin/mydmenu"
    sed -i -e 's/nb=\".*"/nb=\"'${background}'\"/g' $target
    sed -i -e 's/nf=\".*"/nf=\"'${foreground}'\"/g' $target
    sed -i -e 's/sb=\".*"/sb=\"'${yellow}'\"/g' $target
    sed -i -e 's/sf=\".*"/sf=\"'${background}'\"/g' $target
    echo "... mydmenu configurado!" 2>&1 | tee -a $logfile

    # conky
    echo "Alterando configurações para conky..." 2>&1 | tee -a $logfile
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
    echo "... conky configurado!" 2>&1 | tee -a $logfile

    # i3
    echo "Alterando configurações para i3..." 2>&1 | tee -a $logfile
    # i3blocks main
    target="$HOME/dotfiles/i3/i3blocks.conf"
    destination="$config/i3/i3blocks.conf"
    sed -e "s/.*color1/color=${blue} \#color1/g" $target > $destination
    sed -i -e "s/.*color2/color=${green} \#color2/g" $destination
    sed -i -e "s/.*kb_color/color=${cyan} \#kb_color/g" $destination
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
    echo "... i3 configurado!" 2>&1 | tee -a $logfile
    i3-msg restart

    # wallpaper
    echo "Alterando wallpaper..." 2>&1 | tee -a $logfile
    target="$HOME/dotfiles/bin/set_wallpaper"
    destination="$HOME/.local/bin/set_wallpaper"
    sed -e 's/theme=.*/theme=\"'${theme}'\"/g' $target > $destination
    feh --no-fehbg --bg-fill "$HOME/dotfiles/themes/$theme/wallpapers/default.jpg" &
    echo "... wallpaper configurado!" 2>&1 | tee -a $logfile

    # qutebrowser
    target="$config/qutebrowser/palette.py"
    sed -i "/background/s/#[a-f0-9]*/${background}/" $target
    sed -i "/foreground/s/#[a-f0-9]*/${foreground}/" $target
    sed -i "/color0/s/#[a-f0-9]*/${black}/" $target
    sed -i "/color1/s/#[a-f0-9]*/${red}/" $target
    sed -i "/color2/s/#[a-f0-9]*/${green}/" $target
    sed -i "/color3/s/#[a-f0-9]*/${yellow}/" $target
    sed -i "/color4/s/#[a-f0-9]*/${blue}/" $target
    sed -i "/color5/s/#[a-f0-9]*/${magenta}/" $target
    sed -i "/color6/s/#[a-f0-9]*/${cyan}/" $target
    sed -i "/color7/s/#[a-f0-9]*/${white}/" $target
    sed -i "/color8/s/#[a-f0-9]*/${dark_black}/" $target
    sed -i "/color9/s/#[a-f0-9]*/${dark_red}/" $target
    sed -i "/color10/s/#[a-f0-9]*/${dark_green}/" $target
    sed -i "/color11/s/#[a-f0-9]*/${dark_yellow}/" $target
    sed -i "/color12/s/#[a-f0-9]*/${dark_blue}/" $target
    sed -i "/color13/s/#[a-f0-9]*/${dark_magenta}/" $target
    sed -i "/color14/s/#[a-f0-9]*/${dark_cyan}/" $target
    sed -i "/color15/s/#[a-f0-9]*/${dark_white}/" $target
    case "$theme" in
      *light*)
        sed -i "/darkmode_contrast/s/=.*/= 0/" $target
        sed -i "/darkmode_enabled/s/=.*/= False/" $target
        sed -i "/darkmode_grayscale_images/s/=.*/= 0/" $target
        sed -i "/preferred_color_scheme/s/=.*/= 'light'/" $target
      ;;
      *dark*)
        sed -i "/darkmode_contrast/s/=.*/= 0.5/" $target
        sed -i "/darkmode_enabled/s/=.*/= True/" $target
        sed -i "/darkmode_grayscale_images/s/=.*/= 0.5/" $target
        sed -i "/preferred_color_scheme/s/=.*/= 'dark'/" $target
      ;;
    esac

    # zathura
    target="$config/zathura/zathurarc"
    sed -i "/# background/s/#[a-f0-9]*/${background}/" $target
    sed -i "/# foreground/s/#[a-f0-9]*/${foreground}/" $target
    sed -i "/# color0/s/#[a-f0-9]*/${black}/" $target
    sed -i "/# color1/s/#[a-f0-9]*/${red}/" $target
    sed -i "/# color2/s/#[a-f0-9]*/${green}/" $target
    sed -i "/# color3/s/#[a-f0-9]*/${yellow}/" $target
    sed -i "/# color4/s/#[a-f0-9]*/${blue}/" $target
    sed -i "/# color5/s/#[a-f0-9]*/${magenta}/" $target
    sed -i "/# color6/s/#[a-f0-9]*/${cyan}/" $target
    sed -i "/# color7/s/#[a-f0-9]*/${white}/" $target
    sed -i "/# color8/s/#[a-f0-9]*/${dark_black}/" $target
    sed -i "/# color9/s/#[a-f0-9]*/${dark_red}/" $target
    sed -i "/# color10/s/#[a-f0-9]*/${dark_green}/" $target
    sed -i "/# color11/s/#[a-f0-9]*/${dark_yellow}/" $target
    sed -i "/# color12/s/#[a-f0-9]*/${dark_blue}/" $target
    sed -i "/# color13/s/#[a-f0-9]*/${dark_magenta}/" $target
    sed -i "/# color14/s/#[a-f0-9]*/${dark_cyan}/" $target
    sed -i "/# color15/s/#[a-f0-9]*/${dark_white}/" $target

    # dunst
    echo "Alterando configurações para dunst..." 2>&1 | tee -a $logfile
    cat "$HOME/dotfiles/dunst/dunstrc-base" "$dir_path/$theme/dunst" > "$config/dunst/dunstrc"
    pkill dunst
    dunst -config "$config/dunst/dunstrc" &
    echo "... dunst configurado!" 2>&1 | tee -a $logfile

    notify-send -u low -t 3600 -i "applications-graphics" \
    "Tema boladão" "Tema $theme aplicado com sucesso!"
    echo "Tema $theme aplicado com sucesso!" 2>&1 | tee -a $logfile
fi
