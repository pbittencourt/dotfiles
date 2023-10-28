#!/usr/bin/bash

notify-send -t 4000 -i "cloud" "cloud" "Starting cloud apps ..."

if dropbox start ; then
    notify-send \
        -t 5000 -i "dropboxstatus-idle" \
        "Dropbox" "Dropbox iniciado com sucesso!"
else
    notify-send \
        -u critical -t 5000 -i "dropboxstatus-x" "Dropbox" \
        "Dropbox não iniciado!\nVerifique o log para maiores informações."
fi

if rclone mount --daemon --vfs-cache-mode full gdrive:/ ./google_drive/ ; then
    notify-send \
        -t 5000 -i "emblem-synchronizing-symbolic" \
        "Rclone" "Rclone iniciado com sucesso!"
else
    notify-send \
        -u critical -t 5000 -i "emblem-unsynchronized-symbolic" "Rclone" \
        "Rclone não iniciado!\nVerifique o log para maiores informações."
fi
