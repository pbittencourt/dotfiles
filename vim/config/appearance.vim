" General appearance config (colors, fonts, so on)

set conceallevel=2

" Vim 81th+ column layout concerns
if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=white
endif
highlight OverLength ctermbg=white ctermfg=red
match OverLength /\%81v.\+/

" match bracket colors
hi MatchParen cterm=bold ctermbg=none ctermfg=green

" change fold colors
hi Folded ctermbg=none ctermfg=green

" comments in italics
highlight Comment cterm=italic

" Um teste de conceal, deixar aqui pra entender depois
" (caso apareça esse zerinho aí, lembro de ter visto antes)
""syntax match Normal '\v<[[:alpha:]_]+[^_[:digit:]]*0>'ms=e conceal cchar=₀

" Para executar o pandoc sem plugin
""" source: https://piware.de/2014/07/vim-config-for-markdownlatex-pandoc-editing
""function s:MDSettings()
""    nnoremap <leader>b :! pandoc -t beamer % -o %<.pdf<CR><CR>
""    nnoremap <leader>l :! pandoc -t latex % -o %<.pdf<CR>
""    nnoremap <leader>v :! zathura %<.pdf 2>&1 >/dev/null &<CR><CR>
""
""    " adjust syntax highlighting for LaTeX parts
""    "   inline formulas:
""    syntax region Statement oneline matchgroup=Delimiter start="\$" end="\$"
""    "   environments:
""    syntax region Statement matchgroup=Delimiter start="\\begin{.*}" end="\\end{.*}" contains=Statement
""    "   commands:
""    syntax region Statement matchgroup=Delimiter start="{" end="}" contains=Statement
""endfunction
""
""autocmd BufRead,BufNewFile *.md setfiletype markdown
""autocmd FileType markdown :call <SID>MDSettings()
