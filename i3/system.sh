#!/usr/bin/env sh

values="lock logout reboot shutdown suspend"
input=$(echo $values | sed -e 's/\s/\n/g' | rofi -dmenu -l 5 -p "⏻")
case $input in
    lock)
        notify-send "lock" "entrando no modo lock em instantes ..."
        i3exit lock
        ;;
    logout)
        notify-send "logout" "sairemos do sistema agora ..."
        i3-msg exit
        ;;
    reboot)
        notify-send "reboot" "o computador será reiniciado ..."
        systemctl reboot
        ;;
    shutdown)
        notify-send "shutdown" "o computador será desligado ..."
        systemctl poweroff
        ;;
    suspend)
        notify-send "suspend" "vamos suspender a sessão agora ..."
        systemctl suspend
        ;;
esac
