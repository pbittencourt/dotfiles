#!/usr/bin/env sh

# let's create a brand new fresh enviroment!
# ~ <3

echo "---------------------------"
echo " WELCOME BACK, MR MONOLITO "
echo "---------------------------\n"

echo "Daremos início à instalação do ambiente."
read -p "Deseja continuar? (y/n) __ " yn
case $yn in
    [yYsS] )
        echo "Muito bem, mestre, prosseguiremos com a instalação!\n"
        ;;
    * )
        echo "\nGoodbye!"
        exit 1
        ;;
esac

# initial update
sudo xbps-install -Su

# nonfree repo
sudo xbps-install -Sy void-repo-nonfree

# apps
apps="i3-gaps i3lock i3status i3blocks \
    git vim gvim kitty qutebrowser rsync \
    scrot feh flameshot nitrogen lxappearance inkscape \
    nm-applet redshift dunst rofi greenclip xcalc \
    mpd mpc mpv vlc ncmpcpp minidlna ranger"
for app in $apps
do
    sudo xbps-install -Syv $app
done

# clone dotfiles
dotfiles="$HOME/dotfiles"
if [ -d $dotfiles ]; then
    echo "O diretório $dotfiles já existe."
    cd $dotfiles
    if [ -d .git ]; then
        echo "Esse diretório é um repositório git. Vamos atualizá-lo."
        git pull
    else
        echo "Esse diretório não é um repositório git. Verifique!"
        exit 1
    fi
else
    echo "O diretório $dotfiles não existe. Vamos clonar o repositório."
    git clone https://github.com/pbittencourt/dotfiles.git
fi

# symlinks
# ... TODO finalizar
origem="$dotfiles/i3/config"
destino="$HOME/.config/i3/config/config"
if [ -f $destino ]; then
    echo "Arquivo $destino existe. Vamos sobrescrevê-lo"
    rm $destino
fi
sudo ln -s $origem $destino

echo "\nENJOY!"
