#!/usr/bin/env sh

playing=$(mpc --format '%artist% - %title%' current)
if [ ! -z "$playing" ]; then
    if [ ! -z "$(mpc | grep "playing")" ]; then
        image=""
    else
        image=""
    fi
    echo "$image  $playing"
fi
