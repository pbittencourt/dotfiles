#!/usr/bin/env sh

# let's create a brand new fresh enviroment!
# ~ <3

# {{{ SPLASH SCREEN ----------------------------------------------------------

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

# }}} ------------------------------------------------------------------------

# {{{ XPBS-INSTALL -----------------------------------------------------------

# create log file
ahora=$(date +"%Y-%m-%d-%H-%M-%S")
logfile="$HOME/install-$ahora.log"
touch $logfile
echo "Instalação iniciada em $logfile" 2>&1 | tee -a $logfile

# initial update
sudo xbps-install -Suv 2>&1 | tee -a $logfile

# nonfree repo
sudo xbps-install -Syv void-repo-nonfree 2>&1 | tee -a $logfile

# apps
apps="i3-gaps i3lock i3status i3blocks \
    git vim gvim kitty qutebrowser rsync \
    scrot feh flameshot nitrogen lxappearance inkscape \
    nm-applet redshift dunst rofi xcalc \
    mpd mpc mpv vlc ncmpcpp minidlna ranger zathura"
for app in $apps
do
    sudo xbps-install -Syv $app 2>&1 | tee -a $logfile
done

# }}} ------------------------------------------------------------------------

# {{{ DOTFILES ----------------------------------------------------------------

# clone repo
dotfiles="$HOME/dotfiles"
if [ -d $dotfiles ]; then
    echo "O diretório $dotfiles já existe." 2>&1 | tee -a $logfile
    cd $dotfiles
    if [ -d .git ]; then
        echo "Esse diretório é um repositório git. Vamos atualizá-lo." 2>&1 | tee -a $logfile
        git pull 2>&1 | tee -a $logfile
    else
        echo "Esse diretório não é um repositório git. Verifique!" 2>&1 | tee -a $logfile
        exit 1
    fi
else
    echo "O diretório $dotfiles não existe. Vamos clonar o repositório." 2>&1 | tee -a $logfile
    git clone https://github.com/pbittencourt/dotfiles.git 2>&1 | tee -a $logfile
fi

# }}} ------------------------------------------------------------------------

# {{{ SYMLINKS AND COPIES -----------------------------------------------------

config="$HOME/.config"
if [ ! -d $config ]; then
    mkdir -v $config 2>&1 | tee -a $logfile
fi

# conky
source_path="$dotfiles/conky"
target_path="$config/conky"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="system.conf"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# dunst
source_path="$dotfiles/dunst"
target_path="$config/dunst"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="dunstrc"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# i3
source_path="$dotfiles/i3"
target_path="$config/i3"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="config"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="i3blocks.conf"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# i3blocks
source_path="$dotfiles/i3/i3blocks"
target_path="$config/i3/i3blocks"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="cpu_usage"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="keyindicator"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="keylayout.sh"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="volume"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# kitty
source_path="$dotfiles/kitty"
target_path="$config/kitty"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="kitty.conf"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# mpd
source_path="$dotfiles/mpd"
target_path="$config/mpd"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="mpd.conf"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="songinfo"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# rofi
source_path="$dotfiles/rofi"
target_path="$config/rofi"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="config.rasi"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# vim
source_path="$dotfiles/vim"
target_path="$HOME/.vim"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="after"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="colors"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="config"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="plugin"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="snippets"
sudo ln -vsf "$source_path/$file" "$target_path/UltiSnips" 2>&1 | tee -a $logfile
file="base"
cp -v "$source_path/$file" "$HOME/.vimrc" 2>&1 | tee -a $logfile

# X
source_path="$dotfiles/X"
target_path="$HOME"
file="Xresources"
cp -v "$source_path/$file" "$HOME/.Xresources" 2>&1 | tee -a $logfile

# zathura
source_path="$dotfiles"
target_path="$HOME/.config"
file="zathura"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# }}} ------------------------------------------------------------------------

echo "\nENJOY!" 2>&1 | tee -a $logfile

# vim:fileencoding=utf-8:foldmethod=marker
