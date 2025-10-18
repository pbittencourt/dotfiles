" desliga caracteres não imprimíveis
set nolist
" desliga coluna sob o cursor
set nocursorcolumn
" desliga 80a coluna
set cc=

" Databricks notebook
syntax match Commando "-- COMMAND ----------" conceal cchar=—
syntax match Magicka "-- MAGIC " conceal

" Alguns conceals meio malucos ...
" Captura 2+ espaços consecutivos:
" - que NÃO estão no começo da linha
" - que NÃO aparecem logo antes de , ou ;
syntax match ExtraSpaces /\S\zs  \{2,}\ze[^,;]/ conceal cchar= 
" 1=1: verdadeiro
syntax match OneEqualOne "1=1" conceal cchar=⊤

" Case-insensitive para combinar SELECT/Select/select etc.
syn case ignore

" Evitar interferir em strings e comentários
let s:avoid = 'ALLBUT,sqlString,sqlComment,String,Comment'

" --- Dicionário de palavras → símbolos ---
let s:sql_symbols = {
\   'CREATE':   'κ',
\   'REPLACE':  'ρ',
\   'ALTER':    'а',
\   'OWNER':    'θ',
\   'VIEW':     'ν',
\   'WITH':     'w',
\   'SELECT':   '∫',
\   'DISTINCT': 'ⅆ',
\   'FROM':     'ƒ',
\   'JOIN':     '∩',
\   'LEFT':     '◁',
\   'RIGHT':    '▷',
\   'INNER':    '○',
\   'UNION':    '∪',
\   'WHERE':    '∀',
\   'LIKE':     '≈',
\   'RLIKE':    '≅',
\   'ON':       '↔',
\   'IN':       '∈',
\   'NOT':      '!',
\   'AND':      '∧',
\   'OR':       '∨',
\   'AS':       '≡',
\   'NULL':     '∅',
\   'NONE':     '∅',
\   'GROUP':    '⊂',
\   'ORDER':    '⇅',
\   'BY':       'β',
\   'CASE':     '「',
\   'END':      '」',
\   'WHEN':     '≺',
\   'THEN':     '≻',
\   'ELSE':     '≿',
\   'TRUE':     '⊤',
\   'FALSE':    '⊥',
\   'MIN':      'μ',
\   'MAX':      'Μ',
\   'SUM':      '∑',
\   'COUNT':    'η',
\   'LOWER':    'l',
\   'UPPER':    'υ',
\   'TRY_CAST': 'τ',
\   'INT':      'ℤ',
\   'FLOAT':    'ℝ',
\   'BOOL':     '𝔹',
\   'STRING':   '𝐒',
\   'HIVE_METASTORE': '𝐻',
\   'BRONZE': '𝐵',
\   'SB_JORNADAALUNO': '𝐽',
\ }

" \   'HIVE_METASTORE': '🐝',
" \   'BRONZE': '🥉',
" \   'SB_JORNADAALUNO': '🗃',

" --- Criar sintaxes e highlights dinamicamente ---
for [word, symbol] in items(s:sql_symbols)
    " Criar grupo syntax keyword
    execute 'syntax keyword sqlNice' . word . ' ' . word . ' conceal cchar=' . symbol . ' containedin=' . s:avoid
    " Linkar highlight
    execute 'highlight def link sqlNice' . word . ' Conceal'
endfor
hi link sqlNice Operator
hi! link Conceal Operator
" hi link sqlNice Comment
" hi! link Conceal Comment

" Garantir conceal ativo neste buffer de SQL
if &l:conceallevel < 2
  setlocal conceallevel=2
endif
" (Opcional) Mostrar o símbolo também com o cursor em cima
" setlocal concealcursor=nc

" ----
" Mostrar os símbolos conceal também no terminal
hi! Conceal ctermfg=Yellow ctermbg=NONE guifg=#ffff80 guibg=NONE
setlocal concealcursor=nc
setlocal conceallevel=2
