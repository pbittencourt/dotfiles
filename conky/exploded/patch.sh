#!/usr/bin/env sh

theme="$1.svg"
fg="#$2"
bg="#$3"
rs="#$4"

# foreground
sed -e "s/#ebdbb2/$fg/gI" source.svg > $theme

# background
sed -i -e "s/#fbf1c7/$bg/gI" $theme

# red spot
sed -i -e "s/#bdae93/$rs/gI" $theme

# salva png
inkscape --export-type="png" --export-filename="$1.png" $theme
