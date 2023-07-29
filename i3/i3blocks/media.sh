#!/usr/bin/env sh

music=$(mpc --format '%artist%-%album%-%track%-%title%' current)
if [ ! -z "$music" ]; then
    #artist=$(echo $music | awk 'BEGIN{FS="-"} {print $1}')
    #album=$(echo $music | awk 'BEGIN{FS="-"} {print $2}')
    #track=$(echo $music | awk 'BEGIN{FS="-"} {print $3}')
    #title=$(echo $music | awk 'BEGIN{FS="-"} {print $4}')
    #sep="   "
    #if [ ! -z "$(mpc | grep "playing")" ]; then
    #    icon=""
    #else
    #    icon=""
    #fi
    #if [ ! -z "$track" ]; then
    #    num=$(printf '%02d - ' "$track")
    #else
    #    num=""
    #fi
    #echo "$icon  $artist\n$sep$album\n$sep$num$title"
    config_file="/home/monolito/.ncmpcpp/config"
    music_dir=$(cat $config_file | sed -n "/^mpd_music_dir/p" | awk 'BEGIN{FS=" = "} {print $2}' | sed "s/\"//g")
    current_rel_dir=$(ncmpcpp --current-song="%D")
    current_abs_dir="$music_dir/$current_rel_dir"
    cover_name=$(ls "$current_abs_dir" | grep -Ei "albumart|cover|folder" | head -1)
    cover_path="$current_abs_dir/$cover_name"
    echo $cover_path
    cp "$cover_path" "/home/monolito/.cover/"
    mv "/home/monolito/.cover/$cover_name" "/home/monolito/.cover/albumart.jpg"
else
    echo "No music playing"
fi
