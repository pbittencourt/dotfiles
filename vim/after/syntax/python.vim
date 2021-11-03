" PYTHON especific config

" Vim 81th+ column layout concerns
"if (exists('+colorcolumn'))
"    set colorcolumn=80
"    highlight ColorColumn ctermbg=white
"endif
highlight OverLength ctermbg=white ctermfg=red
match OverLength /\%81v.\+/
