" PYTHON especific config

" Folding
set foldmethod=indent

" Vim 81th+ column layout concerns
"if (exists('+colorcolumn'))
"    set colorcolumn=80
"    highlight ColorColumn ctermbg=white
"endif
highlight OverLength ctermfg=red
match OverLength /\%81v.\+/
