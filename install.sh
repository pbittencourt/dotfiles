#!/usr/bin/env sh

# let's create a brand new fresh enviroment!
# ~ <3

# {{{ SPLASH SCREEN ----------------------------------------------------------

# create log file
ahora=$(date +"%Y-%m-%d-%H-%M-%S")
logfile="$HOME/install-$ahora.log"
touch $logfile

echo "---------------------------" 2>&1 | tee -a $logfile
echo " WELCOME BACK, MR MONOLITO " 2>&1 | tee -a $logfile
echo "---------------------------\n" 2>&1 | tee -a $logfile
echo "Daremos início à instalação do ambiente." 2>&1 | tee -a $logfile
read -p "Deseja continuar? (y/n) __ " yn
case $yn in
    [yYsS] )
        echo "Processo iniciado em $ahora\n\n" 2>&1 | tee -a $logfile
        ;;
    * )
        echo "\nGoodbye!" 2>&1 | tee -a $logfile
        exit 1
        ;;
esac

# }}} ------------------------------------------------------------------------

# {{{ XPBS-INSTALL -----------------------------------------------------------

read -p "Deseja instalar pacotes? (y/n) __ " yn
case $yn in
    [yYsS] )
        echo "Pacotes serão instalados!\n" 2>&1 | tee -a $logfile

        # initial update
        sudo xbps-install -Suv 2>&1 | tee -a $logfile

        # nonfree repo
        sudo xbps-install -Syv void-repo-nonfree 2>&1 | tee -a $logfile

        # apps install
        # check if app list file exists
        if [ -f "install_list_apps" ]; then
            # read it contents and execute one line at time
            while IFS= read -r line; do
                # trail whitespaces and leading spaces
                app=$(echo "$line" | awk '{$1=$1};1')
                # ignore empty lines or lines starting with `#`
                if [ -z "$app" ] || [ "${app#\#}" != "$app" ]; then
                    continue
                fi
                # install app
                sudo xbps-install -Syv $app 2>&1 | tee -a $logfile
            done < install_list_apps
        else
            echo "Arquivo install_list_apps não encontrado." 2>&1 | tee -a $logfile
            echo "Não instalaremos pacotes." 2>&1 | tee -a $logfile
            echo "Pularemos para a próxima etapa.\n" 2>&1 | tee -a $logfile
        fi
        ;;
    * )
        echo "Não instalaremos pacotes." 2>&1 | tee -a $logfile
        echo "Pularemos para a próxima etapa.\n" 2>&1 | tee -a $logfile
        ;;
esac


# }}} ------------------------------------------------------------------------

# {{{ DOTFILES ----------------------------------------------------------------

# clone repo
dotfiles="$HOME/dotfiles"
if [ -d $dotfiles ]; then
    echo "O diretório $dotfiles já existe." 2>&1 | tee -a $logfile
    cd $dotfiles
    if [ -d .git ]; then
        echo "Esse diretório é um repositório git. Vamos atualizá-lo." 2>&1 | tee -a $logfile
        git status 2>&1 | tee -a $logfile
        git restore . 2>&1 | tee -a $logfile
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

# ~
source_path="$dotfiles"
target_path="$HOME"
files="bash_aliases bashrc git-prompt.sh inputrc xsessionrc"
for file in $files
do
    sudo ln -vsf "$source_path/$file" "$target_path/.$file" 2>&1 | tee -a $logfile
done

# alacritty
source_path="$dotfiles/alacritty"
target_path="$config/alacritty"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="alacritty.toml"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="colors.toml"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# bin
source_path="$dotfiles/bin"
target_path="$HOME/.local/bin"
if [ ! -d $target_path ]; then
    mkdir -pv $target_path 2>&1 | tee -a $logfile
fi
file="estoria"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="rxfetch"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="selcol"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="set_wallpaper"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="mydmenu"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile

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

# qutebrowser
source_path="$dotfiles/qutebrowser"
target_path="$config/qutebrowser"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="config.py"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="palette.py"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# ranger
source_path="$dotfiles/ranger"
target_path="$config/ranger"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="rc.conf"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="rifle.conf"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
file="scope.sh"
sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# ranger devicons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons

# rofi
source_path="$dotfiles/rofi"
target_path="$config/rofi"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="config.rasi"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile
sudo ln -vsf "$source_path/themes/"* $target_path 2>&1 | tee -a $logfile

# vim
source_path="$dotfiles/vim"
target_path="$HOME/.vim"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
files="after colors config ftplugin plugin snippets"
for file in $files
do
    sudo ln -vsf "$source_path/$file" $target_path 2>&1 | tee -a $logfile
done

file="base"
cp -v "$source_path/$file" "$HOME/.vimrc" 2>&1 | tee -a $logfile

# vim vundle
vundle="$HOME/.vim/bundle/Vundle.vim"
if [ -d $vundle ]; then
    echo "O diretório $vundle já existe." 2>&1 | tee -a $logfile
    cd $vundle
    if [ -d .git ]; then
        echo "Esse diretório é um repositório git. Vamos atualizá-lo." 2>&1 | tee -a $logfile
        git pull 2>&1 | tee -a $logfile
    else
        echo "Esse diretório não é um repositório git. Verifique!" 2>&1 | tee -a $logfile
        exit 1
    fi
else
    echo "O diretório $vundle não existe. Vamos clonar o repositório." 2>&1 | tee -a $logfile
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# xfce4-terminal
source_path="$dotfiles/xfce4-terminal"
target_path="$config/xfce4/terminal"
if [ ! -d $target_path ]; then
    mkdir -pv $target_path 2>&1 | tee -a $logfile
fi
file="terminalrc"
cp -v "$source_path/$file" "$HOME/.Xresources" 2>&1 | tee -a $logfile

# Xresources
source_path="$dotfiles/X"
target_path="$HOME"
file="Xresources"
cp -v "$source_path/$file" "$HOME/.Xresources" 2>&1 | tee -a $logfile

# zathura
source_path="$dotfiles/zathura"
target_path="$HOME/.config/zathura"
if [ ! -d $target_path ]; then
    mkdir -v $target_path 2>&1 | tee -a $logfile
fi
file="zathurarc"
cp -v "$source_path/$file" $target_path 2>&1 | tee -a $logfile

# }}} ------------------------------------------------------------------------

# {{{ OTHER RESOURCES ---------------------------------------------------------

# CURSORS
if [ ! -d "$HOME/.local/share/icons/Vimix-cursors" ]; then
    echo "Baixando cursores vimix ..." 2>&1 | tee -a $logfile
    git clone https://github.com/vinceliuice/Vimix-cursors 2>&1 | tee -a $logfile
    echo "Instalando cursores vimix ..." 2>&1 | tee -a $logfile
    $HOME/Vimix-cursors./install.sh 2>&1 | tee -a $logfile
fi

# THEMES AND ICONS
echo "Instalando temas e ícones GTK ..." 2>&1 | tee -a $logfile
source_path="$HOME/dotfiles/themes"
target_path="$HOME/.themes"
themes_list=$(cd $source_path; echo */ | sed -e 's/\///g')
for theme in $themes_list; do
    echo "Vamos extrair tema $theme ..." 2>&1 | tee -a $logfile
    tar -xzf "$source_path/$theme/theme.tar.gz" -C "$target_path" 2>&1 | tee -a $logfile
done
target_path="$HOME/.icons"
for theme in $themes_list; do
    echo "Vamos extrair ícones $theme ..." 2>&1 | tee -a $logfile
    tar -xzf "$source_path/$theme/icons.tar.gz" -C "$target_path" 2>&1 | tee -a $logfile
done

# FONTS
fonts_dir="$HOME/.local/share/fonts"
if [ ! -d $fonts_dir ]; then
    mkdir -v $fonts_dir 2>&1 | tee -a $logfile
fi
base_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1"

# check if font list file exists
if [ -f "install_list_fonts" ]; then
    # read it contents and execute one line at time
    while IFS= read -r line; do
        # trail whitespaces and leading spaces
        font=$(echo "$line" | awk '{$1=$1};1')
        # ignore empty lines or lines starting with `#`
        if [ -z "$font" ] || [ "${font#\#}" != "$font" ]; then
            continue
        fi
        # execute if font is not already installed
        if ! fc-list | grep -qi "$font"; then
            echo "Obtendo $font ..." | tee -a $logfile
            cd $fonts_dir
            url="${base_url}/${font}.zip"
            if [ ! -d $font ]; then
                mkdir -v $font 2>&1 | tee -a $logfile
            fi
            cd $font
            curl -fLo "${font}.zip" $url
            unzip "${font}.zip"
        else
            echo "Fonte $font já se encontra instalada." | tee -a $logfile
        fi
    done < install_list_fonts
else
    echo "Arquivo install_list_fonts não encontrado." 2>&1 | tee -a $logfile
    echo "Não instalaremos fontes." 2>&1 | tee -a $logfile
fi

fonts="apercu material"
for font in $fonts
do
    cp -vr "$HOME/dotfiles/fonts/$font" $fonts_dir 2>&1 | tee -a $logfile
done

cd $fonts_dir
fc-cache -fv . 2>&1 | tee -a $logfile

# }}} ------------------------------------------------------------------------

echo "\nENJOY!" 2>&1 | tee -a $logfile

# vim:fileencoding=utf-8:foldmethod=marker
