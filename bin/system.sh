#!/usr/bin/env sh

values="logout reboot shutdown suspend"
input=$(echo $values | sed -e 's/\s/\n/g' | rofi -dmenu -l 4 -p "⏻")
case $input in
    logout)
        notify-send "logout" "sairemos do sistema agora ..."
        i3-msg exit
        ;;
    reboot)
        notify-send "reboot" "o computador será reiniciado ..."
        loginctl reboot
        ;;
    shutdown)
        notify-send "shutdown" "o computador será desligado ..."
        loginctl poweroff
        ;;
    suspend)
        notify-send "suspend" "vamos suspender a sessão agora ..."
        loginctl suspend
        ;;
esac
