" TESTANDO CONCEALLs NOVOS
syn region inBold concealends matchgroup=bTag start="<b>" end="</b>"
syn match newLine "<br>" conceal cchar=}

hi inBold gui=bold
hi bTag guifg=blue
hi newLine guifg=green

syn region dotFence concealends matchgroup=dTag start="::: {" end="}"
hi dotFence cterm=bold
hi dTag ctermbg=green
hi dTag ctermfg=white

" vim:set sw=2:
