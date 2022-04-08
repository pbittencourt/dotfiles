" Vim syntax file
" Adiciona novas marcações a documentos *.md

" Comecemos definindo as cores
highlight Conceal ctermbg=NONE ctermfg=yellow cterm=italic

" Oculta linhas que determinam `custom-styles`, utilizados pelo pandoc
" para gerar docx com outros estilos além do padrão
call matchadd('Conceal', '::: {custom-style=\p\+', 0, -1, {'conceal': '◿'})
call matchadd('Conceal', ':::$', 0, -1, {'conceal': '◹'})

" Transforma letras das alternativas em bolinhas fofoletes!
call matchadd('Conceal', '^A\.\s', 0, -1, {'conceal': '☉'})

" Serassi funciona com caracteres matemáticos?
call matchadd('Conceal', '\therefore', 0, -1, {'conceal': '∴'})
