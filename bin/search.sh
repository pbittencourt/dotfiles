#!/bin/bash
# A quick documentation file-finder based on rofi and zeal
# Requires: rofi, zeal, xfce4-terminal nerdfonts

files=/var/tmp/searches_term_list
engines=$HOME/dotfiles/bin/search_engines.md
browser=qutebrowser
terminal=alacritty

append_new_term() {
  # Delete term. Append on the first line.
  sed -i "/$input/d" $files
  sed -i "1i $input" "$files"
  # If file is bigger than 5MB, reset the log
  if [ $(find "$files" -type f -size +5000000c 2>/dev/null) ]; then
    echo "" > "$files"
  fi
}

if [ -e $files ]; then
  # If file list exist, use it
  #input=$(cat $files | rofi -dmenu -p "manual")
  input=$(cat $engines $files | mydmenu -l 20 -p " ")
else
  # There is no file list, create it and show menu only after that
  # The file if empty, initialize it, so we can insert on the top later
  if [ ! -s "$_file" ]
  then
    echo " " > "$files"
  fi
  input=$(cat $engines $files | mydmenu -l 20 -p " ")
fi

case "$(echo $input | cut -d " " -f 1)" in
du)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $browser "https://duckduckgo.com/?q=$mantoread" &> /dev/null &
  ;;
go)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $browser "https://www.google.com/search?q=$mantoread" &> /dev/null &
  ;;
gh)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $browser "https://github.com/search?q=$mantoread" &> /dev/null &
  ;;
im)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $browser "https://www.imdb.com/find/?q=$mantoread" &> /dev/null &
  ;;
ma)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $terminal --title 'floating' -e man $mantoread
  ;;
me)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $browser "https://medium.com/search?q=$mantoread" &> /dev/null &
  ;;
os)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $browser "https://www.opensubtitles.org/pt/search/sublanguageid-por,pob/moviename-$mantoread" &> /dev/null &
  ;;
rd)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $browser "https://www.reddit.com/search/?q=$mantoread" &> /dev/null &
  ;;
so)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $browser "https://stackoverflow.com/search?q=$mantoread" &> /dev/null &
  ;;
tl)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $terminal --title 'floating' -e tldr $mantoread &> /dev/null &
  ;;
yt)
  append_new_term
  mantoread=$(echo "$input" | cut -c 3- | xargs)
  exec $browser "https://www.youtube.com/results?search_query=$mantoread" &> /dev/null &
  ;;
esac
