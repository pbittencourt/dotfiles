#!/usr/bin/env sh
#leet chars: ┤┤└└┴┴┐┐││┘┘┌┌├├┬┬┼┼┴┴── ││ ▽▼△▲▵▴▾▿

notify-send -u low -t 1800 "MPD" "Iniciando daemon ..."
echo "┌──────────────────────────────────────┐"
echo "│ MPD LAUNCHER                         │"
echo "└──────────────────────────────────────┘"
echo ""

echo "Daremos início ao programa."
read -p "Deseja continuar? (y/n) __ " yn
case $yn in
    [^yYsS] )
    exit 1
esac

# o HD externo deve estar montado, pois contém nossa biblioteca de musik
storage="/media/toshiba"
point="/dev/sdb1"
label="toshiba"
if ! mountpoint -q -- "$storage"; then
    printf "\nO HD externo não está montado em $storage.\n"
    read -p "Você deseja montá-lo agora? (y/n) __ " yn
    case $yn in
        [yYsN] )
        printf  "\nMontando o HD externo em $storage ...\n"
        if montado=$(pmount $point $label); then
            echo "Procedimento realizado com sucesso! Podemos continuar.\n"
        else
            printf '%s' "$montado"
            read -p "Pressione ENTER para sair: " byebye
            exit 1
        fi
        ;;
        * )
        echo "O HD não será montado e o programa será encerrado.\n"
        read -p "Pressione ENTER para sair: " byebye
        exit 1
    esac
else
    printf "\nHD externo montado em $storage. Podemos continuar.\n\n"
fi

if output=$(sudo service mpd stop; mpd ~/.config/mpd/mpd.conf); then
    printf '%s' "$output"
    notify-send -u normal -t 1800 "MPD" "... daemon iniciado com sucesso!"
else
    printf 'Ocorreram erros!\n\n'
fi
read -p "Pressione ENTER para sair: " byebye
