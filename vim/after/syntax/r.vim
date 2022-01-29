" R syntax

" 81th column highligth
highlight OverLength ctermfg=red
match OverLength /\%81v.\+/

" Foldings
let r_syntax_folding = 1
if exists("g:r_syntax_folding")
  syn region rRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError fold
  syn region rRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError fold
  syn region rRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError fold
else
  syn region rRegion matchgroup=Delimiter start=/(/ matchgroup=Delimiter end=/)/ transparent contains=ALLBUT,rError,rBraceError,rCurlyError
  syn region rRegion matchgroup=Delimiter start=/{/ matchgroup=Delimiter end=/}/ transparent contains=ALLBUT,rError,rBraceError,rParenError
  syn region rRegion matchgroup=Delimiter start=/\[/ matchgroup=Delimiter end=/]/ transparent contains=ALLBUT,rError,rCurlyError,rParenError
endif  
