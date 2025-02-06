syn match Normal '`\{1}' conceal
syn match Normal '^`\{3}\w*$' conceal cchar=λ
syn match Normal '^`\{3}$' conceal cchar=−
syn match Normal '<\/\=code>' conceal

call matchadd('Conceal', '^`\{3}\w\+$', 1000, -1, {'conceal': 'λ'})
call matchadd('Conceal', '^`\{3}$', 1001, -1, {'conceal': '–'})
