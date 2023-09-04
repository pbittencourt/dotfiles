" Set matching pairs of characters and highlight matching brackets
" https://github.com/nvim-zh/minimal_vim/blob/c4f6fa076bfea0a08eef322e97fd4fa0612f1af6/init.vim#L67
set matchpairs+=<:>,「:」

" caracteres não imprimíveis
set listchars=eol:¬,trail:░,space:·,extends:»,precedes:«
" inicia ligado por padrão
set list

" caracteres para preencher texto da dobra e separator vertical
set fillchars+=fold:\ ,vert:│

" custom folding
" source: https://jdhao.github.io/2019/08/16/nvim_config_folding
function! MyFoldText()
    let line = getline(v:foldstart)
    let folded_line_num = v:foldend - v:foldstart
    let line_text = trim(substitute(line, '^"{\+', '', 'g'))
    " let fillcharcount = &textwidth - len(line_text) - len(folded_line_num)
    let fillcharcount = &textwidth - len(line_text) - 10
    " return '§'. line_text . repeat('⋅', fillcharcount) . ' (' . folded_line_num . ' L) '
    return '↪ '. line_text . ' (' . folded_line_num . ' L) ' . repeat('⋅', fillcharcount)
endfunction
set foldtext=MyFoldText()
