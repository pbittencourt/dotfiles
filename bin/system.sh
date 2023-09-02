#!/usr/bin/env sh

values="logout reboot shutdown suspend"
#input=$(echo $values | sed -e 's/\s/\n/g' | rofi -dmenu -l 4 -p "⏻")
input=$(echo $values | sed -e 's/\s/\n/g' | mydmenu -p "⏻  system:")
case $input in
    logout)
        notify-send -i "system-log-out" \
        "logout" "sairemos do sistema agora ..."
        i3-msg exit
        ;;
    reboot)
        notify-send -i "system-restart-panel" \
        "reboot" "o computador será reiniciado ..."
        loginctl reboot
        ;;
    shutdown)
        notify-send -i "system-shutdown" \
        "shutdown" "o computador será desligado ..."
        loginctl poweroff
        ;;
    suspend)
        notify-send -i "system-lock-screen" \
        "suspend" "vamos suspender a sessão agora ..."
        loginctl suspend
        ;;
esac
