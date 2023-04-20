" Set matching pairs of characters and highlight matching brackets
" https://github.com/nvim-zh/minimal_vim/blob/c4f6fa076bfea0a08eef322e97fd4fa0612f1af6/init.vim#L67
set matchpairs+=<:>,「:」

" caracteres não imprimíveis
" source https://gist.github.com/adinapoli/4723877
set listchars=eol:¬,trail:░,space:·,extends:»,precedes:«
nnoremap <leader>1 :set list!<CR>
" (o número `1` é o similar mais próximo de `l`, junto ao <leader>)
set list " inicia ligado por padrão

" highlight word under cursor
" source: https://vi.stackexchange.com/a/25687
augroup highlight_current_word
  au!
  au CursorHold * :exec 'match Search /\V\<' . substitute(expand('<cword>'), '[\*\/]', '', 'g') . '\>/'
augroup END
