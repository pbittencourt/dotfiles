#!/usr/bin/env sh

repo="$HOME/dotfiles/themes"
themes_list=$(ls $HOME/.themes)
themes_dir="$HOME/.themes"
icons_dir="$HOME/.icons"

for theme in $themes_list; do
    echo "Vamos copiar tema $theme para o repositório ..."
    cd $themes_dir
    tar -czf "$theme.tar.gz" $theme
    cp "$theme.tar.gz" "$repo/$theme/theme.tar.gz"

    echo "Vamos copiar ícones $theme para o repositório ..."
    cd $icons_dir
    tar -czf "$theme.tar.gz" $theme
    cp "$theme.tar.gz" "$repo/$theme/icons.tar.gz"
done
