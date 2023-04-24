" largura de texto
" source https://vi.stackexchange.com/a/12736
fun! ToggleTW()
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
nmap <leader>tw :call ToggleTW()<CR>

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

" destaca texto sob o cursor
" source: https://vi.stackexchange.com/a/25687
fun! ToggleHighlightWord()
    if !exists('b:hw_mode')
        echo 'ATIVA o match de palavras!'
        let b:hw_mode = 1
        augroup highlight_current_word
          au! CursorHold * :exec 'match Search /\V\<' . substitute(expand('<cword>'), '[\*\/]', '', 'g') . '\>/'
        augroup END
    else
        echo 'DESATIVA o match de palavras!'
        unlet b:hw_mode
        " ainda precisa fazer essa parte; PENSAR ... "
        augroup highlight_current_word
          au! CursorHold
        augroup END
    endif
endfun
nmap <leader>hi :call ToggleHighlightWord()<CR>

" copia correspondências para o registro
" source: https://vi.stackexchange.com/questions/7357/copying-just-the-matches-to-a-register
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
