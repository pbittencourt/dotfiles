" Virtual text
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_virtual_text_delay = 200
let g:lsp_diagnostics_virtual_text_prefix = "▉ "
let g:lsp_diagnostics_virtual_text_align = "right"
let g:lsp_diagnostics_virtual_text_padding_left = 5

" Preview float
let g:lsp_preview_float = 1
let g:lsp_preview_autoclose = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_float_delay = 500

" keymaps
nno <leader>]] <plug>(lsp-next-diagnostic)
nno <leader>[[ <plug>(lsp-previous-diagnostic)
nno <leader>gd <plug>(lsp-definition)