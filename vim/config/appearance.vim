" Set matching pairs of characters and highlight matching brackets
" https://github.com/nvim-zh/minimal_vim/blob/c4f6fa076bfea0a08eef322e97fd4fa0612f1af6/init.vim#L67
set matchpairs+=<:>,「:」

" caracteres não imprimíveis
" source https://gist.github.com/adinapoli/4723877
set listchars=eol:¬,trail:·,space:·,extends:»,precedes:«
nnoremap <leader>1 :set list!<CR>
" (o número `1` é o similar mais próximo de `l`, junto ao <leader>)

" netrw
" source: https://www.akhatib.com/making-netrw-clean-and-minimally-disruptive-then-stop-using-it/
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_liststyle = 3
let g:netrw_winsize = 20

" highlight word under cursor
" source: https://vi.stackexchange.com/a/25687
augroup highlight_current_word
  au!
  au CursorHold * :exec 'match Search /\V\<' . expand('<cword>') . '\>/'
augroup END
