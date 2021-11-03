" Nvim-R config

" Set space to to send line (in normal mode) or selection (in visual mode)
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

let R_objbr_place = 'console,above'
let R_objbr_opendf = 1    " Show data.frames elements
let R_objbr_openlist = 0  " Show lists elements
let R_objbr_allnames = 0  " Show hidden objects

