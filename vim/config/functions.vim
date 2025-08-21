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
        augroup highlight_current_word
          au! CursorHold
        augroup END
    endif
endfun

" copia correspondências para o registro
" source: https://vi.stackexchange.com/questions/7357/copying-just-the-matches-to-a-register
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" utiliza fzf para sugerir correções
" source: https://coreyja.com/posts/vim-spelling-suggestions-fzf
function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction
nnoremap z= :call FzfSpell()<CR>

" atualiza datas no formato 'YYYY-MM-DD hh:mm'
function! UpdateTimestamp()
  if &filetype !=# 'markdown' && &filetype !=# 'sql'
    return
  endif
  let l:save_cursor = getpos(".")
  let l:now = strftime("%Y-%m-%d %H:%M")
  " substitui a primeira ocorrência encontrada
  silent! keeppatterns %s/\d\{4}-\d\{2}-\d\{2} \d\{2}:\d\{2}/\=l:now/e
  " restaura posição original
  call setpos('.', l:save_cursor)
endfunction
augroup UpdateTimestampOnSave
  autocmd!
  autocmd BufWritePre *.md,*.sql call UpdateTimestamp()
augroup END

" ativa spell e função de capitalização para tipos específicos
augroup TXT_MD_SETTINGS
    autocmd!
    autocmd FileType text,markdown setlocal spell
    autocmd FileType text,markdown autocmd InsertCharPre <buffer> if search('\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#', 'bcnw') != 0 | let v:char = toupper(v:char) | endif
augroup END
