" General appearance config (colors, fonts, so on)

" 81th column highligth
set colorcolumn=80
highlight ColorColumn ctermbg=255 

" match bracket colors
hi MatchParen cterm=bold ctermbg=green ctermfg=white

" fold colors
hi Folded ctermbg=none ctermfg=cyan

" by default, load file with all folds opened
set nofoldenable

" comments in italics
highlight Comment cterm=italic

" formatting non-printable objects
" (inspired by https://gist.github.com/adinapoli/4723877)
" toggle `set list`
nmap <leader>1 :set list!<CR>  
set listchars=tab:\ ▸,eol:¬,trail:·,space:⋅,extends:»,precedes:«

" toggle text width
" inspired by https://vi.stackexchange.com/a/12736
fun! Toggle_TW()
    if !exists('b:tw_mode')
        let b:tw_mode = 80
        set tw=80
        echo "text width 80 chars toggle on"
    else
        unlet b:tw_mode
        set tw=0
        echo "text width toggle off"
    endif
endfun
nmap <leader>tw :call Toggle_TW()<CR>  
