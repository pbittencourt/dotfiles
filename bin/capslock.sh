#!/usr/bin/env sh

caps=$(xset q | grep -oi "caps lock: [^0-9]*" | sed 's/.*://g' | sed 's/ //g')
case "$caps" in
    on)
        notify-send -u critical -t 2400 "CAPS LOUCO" "ATENÇÃO, ligado!"
        ;;
    off)
        notify-send -u low -t 1200 "caps louco" "desligado"
        ;;
esac
