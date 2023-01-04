" Set matching pairs of characters and highlight matching brackets
" https://github.com/nvim-zh/minimal_vim/blob/c4f6fa076bfea0a08eef322e97fd4fa0612f1af6/init.vim#L67
set matchpairs+=<:>,「:」

" caracteres não imprimíveis
" source https://gist.github.com/adinapoli/4723877
set listchars=tab:\ ▸,eol:¬,trail:·,space:⋅,extends:»,precedes:«
nnoremap <leader>1 :set list!<CR>
" (o número `1` é o similar mais próximo de `l`, junto ao <leader>)

augroup gui_colors
    autocmd!
    autocmd BufRead,BufNewFile * :set termguicolors 
    " FIXME as 2 linhas seguintes n estão funcionando sla fodac mein
    "autocmd colorscheme * hi clear SpellBad
    "autocmd colorscheme * hi SpellBad cterm=underline
augroup END
colorscheme nord
let g:nord_bold = 1
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
