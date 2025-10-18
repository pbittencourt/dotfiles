-- {{{ APPEARANCE ------------------------------------------------------------

vim.o.list = false
vim.opt.matchpairs:append({ "<:>", "「:」" })
vim.opt.listchars = {
	trail = "░",
	nbsp = "␣",
	eol = "¬",
	tab = "  ",
}

vim.g.virtcolumn_char = "▕" -- char to display the line
vim.g.virtcolumn_priority = 10 -- priority of extmark

-- }}}
