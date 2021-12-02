" PYTHON especific config

" Vim 81th+ column layout concerns
"if (exists('+colorcolumn'))
"    set colorcolumn=80
"    highlight ColorColumn ctermbg=white
"endif
highlight OverLength ctermfg=red
match OverLength /\%81v.\+/

" Folding-like Rstudio
" https://stackoverflow.com/questions/41329617
""set foldmethod=expr
""set foldexpr=RFoldexpr(v:lnum)
""
""function! RFoldexpr(lnum)
""  if getline(a:lnum) =~ '^#\s\(\w\+\s\+\)\+-\+$'
""    " Start a new level-one fold
""    return '>1'
""  else
""    " Use the same foldlevel as the previous line
""    return '='
""  endif
""endfunction

set foldmethod=indent
