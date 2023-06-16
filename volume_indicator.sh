#!/usr/bin/env sh

sound=$(amixer sget Master)
if echo $sound | grep -o "\[on\]"
then
    value=$(amixer sget Master | grep -o "[0-9]*\%")
    notify-send -i ~/.icons/Papirus/24x24@2x/devices/audio-speakers.svg \
    -t 800 \
    "Volume level" $value
else
    notify-send -i ~/.icons/Papirus/24x24@2x/devices/audio-speakers.svg \
    -t 800 \
    "Volume level" "Muted"
fi
