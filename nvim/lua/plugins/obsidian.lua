return {
	{ -- obsidian
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim", -- Required
			"hrsh7th/nvim-cmp",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = function()
			local sysname = vim.loop.os_uname().sysname
			local workspace_path
			if sysname:match("Windows") then
				workspace_path = "~/Sync/secondbrain"
			else
				workspace_path = "~/Documentos/secondbrain"
			end
			return {
				workspaces = {
					{
						name = "secondbrain",
						path = workspace_path,
					},
				},
				disable_frontmatter = true,
				completion = {
					nvim_cmp = true,
					min_chars = 2,
				},
				daily_notes = {
					folder = "7 daily-notes",
					date_format = "%Y-%m-%d",
					alias_format = "%B %-d, %Y",
					default_tags = { "daily-note" },
					template = "template_daily-note.md",
				},
				picker = {
					name = "telescope.nvim",
					note_mappings = {
						-- Create a new note from your query.
						new = "<C-x>",
						-- Insert a link to the selected note.
						insert_link = "<C-l>",
					},
					tag_mappings = {
						-- Add tag(s) to current note.
						tag_note = "<C-x>",
						-- Insert a tag at the current location.
						insert_tag = "<C-l>",
					},
				},
				mappings = {
					["gf"] = {
						action = function()
							return require("obsidian").util.gf_passthrough()
						end,
						opts = { noremap = false, expr = true, buffer = true },
					},
					["<leader>ch"] = {
						action = function()
							return require("obsidian").util.toggle_checkbox()
						end,
						opts = { buffer = true },
					},
					["<cr>"] = {
						action = function()
							return require("obsidian").util.smart_action()
						end,
						opts = { buffer = true, expr = true },
					},
				},
				new_notes_location = "current_dir",
				ui = {
					enable = true,
					update_debounce = 200,
					max_file_length = 5000,
					checkboxes = {
						[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
						["x"] = { char = "", hl_group = "ObsidianDone" },
						[">"] = { char = "", hl_group = "ObsidianRightArrow" },
						["/"] = { char = "⏳", hl_group = "ObsidianRightArrow" },
						["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
						["!"] = { char = "", hl_group = "ObsidianImportant" },
					},
					bullets = { char = "•", hl_group = "ObsidianBullet" },
					external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
					reference_text = { hl_group = "ObsidianRefText" },
					highlight_text = { hl_group = "ObsidianHighlightText" },
					tags = { hl_group = "ObsidianTag" },
					block_ids = { hl_group = "ObsidianBlockID" },
				},
				---@return table
				note_frontmatter_func = function(note)
					if note.title then
						note:add_alias(note.title)
					end
					local out = { id = note.id, aliases = note.aliases, tags = note.tags }
					if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
						for k, v in pairs(note.metadata) do
							out[k] = v
						end
					end
					return out
				end,
				templates = {
					folder = "0 sistema/09 templates",
					date_format = "%Y-%m-%d",
					time_format = "%H:%M:%S",
					substitutions = {},
				},
			}
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			local cmp = require("cmp")
			opts.mapping = opts.mapping or {}
			opts.sources = vim.list_extend({ { name = "obsidian" } }, opts.sources or {})
			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
			})
			return opts
		end,
	},
}
