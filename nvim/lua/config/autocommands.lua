-- {{{ AUTOCOMMANDS ----------------------------------------------------------
-- See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--   Try it with `yap` in normal mode
--   See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Ativa spell e função de capitalização para markdown e txt
vim.api.nvim_create_augroup("TXT_MD_SETTINGS", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "TXT_MD_SETTINGS",
	pattern = { "text", "markdown" },
	callback = function()
		vim.opt_local.spell = true

		-- cria autocmd para capitalização automática
		vim.api.nvim_create_autocmd("InsertCharPre", {
			buffer = 0,
			callback = function()
				local pat = [[\v(%^|[.!?]\_s+|\_^\-\s|\_^title\:\s|\n\n)%#]]
				if vim.fn.search(pat, "bcnw") ~= 0 then
					vim.v.char = string.upper(vim.v.char)
				end
			end,
		})
	end,
})

-- Atualiza datas no formato 'YYYY-MM-DD hh:mm'
local function UpdateTimestamp()
	local ft = vim.bo.filetype
	if ft ~= "markdown" and ft ~= "sql" then
		return
	end
	-- salva posição do cursor
	local save_cursor = vim.fn.getpos(".")
	-- timestamp atual
	local now = os.date("%Y-%m-%d %H:%M")
	-- pega todas as linhas do buffer
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local updated = false
	for i, line in ipairs(lines) do
		-- substitui apenas a primeira ocorrência encontrada
		local new_line, n = line:gsub("%d%d%d%d%-%d%d%-%d%d %d%d:%d%d", now, 1)
		if n > 0 then
			lines[i] = new_line
			updated = true
			break -- só troca a primeira ocorrência no buffer inteiro
		end
	end
	if updated then
		vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
	end
	-- restaura posição original
	vim.fn.setpos(".", save_cursor)
end
-- cria grupo e autocmd
vim.api.nvim_create_augroup("UpdateTimestampOnSave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "UpdateTimestampOnSave",
	pattern = { "*.md", "*.sql" },
	callback = UpdateTimestamp,
})

-- Exibe linha vertical nas posições 80 e 100 para tipos específicos
vim.api.nvim_create_augroup("ColorColumnSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "ColorColumnSettings",
	pattern = { "markdown", "python" },
	callback = function()
		vim.opt_local.colorcolumn = { 80, 100 } -- usa só nesse buffer
	end,
})

-- Ajusta `iskeyword` para considerar palavras acentuadas
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "text", "tex", "rst", "org", "gitcommit" },
	callback = function()
		-- vim.opt_local.iskeyword:append("@-@")
		-- NOTE: a configuração anterior não é suficiente;
		-- conforme indica nosso amigo GePeTreta:
		-- o intervalo 192-255 cobre muitos caracteres acentuados latinos,
		-- mas não necessariamente todos do UTF-8, especialmente os compostos
		-- (como “ã” = a + ~ no Unicode)
		vim.opt_local.iskeyword:append({
			"á",
			"à",
			"â",
			"ã",
			"é",
			"ê",
			"í",
			"ó",
			"ô",
			"õ",
			"ú",
			"ü",
			"ç",
			"Á",
			"À",
			"Â",
			"Ã",
			"É",
			"Ê",
			"Í",
			"Ó",
			"Ô",
			"Õ",
			"Ú",
			"Ü",
			"Ç",
		})
	end,
})

-- Autocomando para netrw
vim.api.nvim_create_augroup("netrw", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "netrw",
	pattern = "netrw",
	command = "setlocal bufhidden=wipe",
})

-- Copy matches to buffer
vim.api.nvim_create_user_command("CopySearch", function(args)
	vim.fn.setreg(args.reg, "")
	vim.api.nvim_cmd({
		cmd = "substitute",
		args = { string.format([[//\=setreg('%s', submatch(0), 'al')/n]], args.reg) },
		range = { args.line1, args.line2 },
	}, {})
end, { range = true, register = true })

-- }}}
