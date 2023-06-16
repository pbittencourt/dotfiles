#!/usr/bin/env sh

layout=$(setxkbmap -query | grep "layout:" | sed 's/layout:[[:space:]]*//g')
variant=$(setxkbmap -query | grep "variant:" | sed 's/variant:[[:space:]]*//g')
concat="${layout}-${variant}"
result=$(echo "$concat" | tr '[:lower:]' '[:upper:]')
echo $result
