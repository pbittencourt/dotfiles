" General appearance config (colors, fonts, so on)

" match bracket colors
hi MatchParen cterm=bold ctermbg=none ctermfg=green

" change fold colors
hi Folded ctermbg=none ctermfg=green

" comments in italics
highlight Comment cterm=italic

" formatting non-printable objects
" (inspired by https://gist.github.com/adinapoli/4723877)
" toggle `set list`
nmap <leader>1 :set list!<CR>  
set listchars=tab:\ ▸,eol:¬,trail:·,space:⋅,extends:»,precedes:«

set conceallevel=2

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
