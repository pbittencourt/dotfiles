" largura de texto
" source https://vi.stackexchange.com/a/12736
fun! Toggle_TW()
    if !exists('b:tw_mode')
        let b:tw_mode = 79
        set tw=79
        echo 'LIGOU quebra de texto na 79ª coluna'
    else
        unlet b:tw_mode
        set tw=0
        echo 'DESLIGOU quebra de texto na 79ª coluna'
    endif
endfun
nmap <leader>tw :call Toggle_TW()<CR>

" cor da 80ª coluna
" source https://vi.stackexchange.com/a/6989
fun! ToggleCC()
    if &cc == ''
        set cc=80
        echo 'LIGOU destaque de cor na 80ª coluna'
    else
        set cc=
        echo 'DESLIGOU destaque de cor na 80ª coluna'
    endif
endfun
nmap <leader>8 :call ToggleCC()<CR>

" destaque de linha e coluna atuais
fun! ToggleLineColumn()
    if !exists('b:lc_mode')
        let b:lc_mode = 1
        set cursorcolumn
        set cursorline
    else
        unlet b:lc_mode
        set nocursorcolumn
        set nocursorline
    endif
endfun
nmap <leader>lc :call ToggleLineColumn()<CR>

