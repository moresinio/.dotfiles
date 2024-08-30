--local icons = require('icons')
return {
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = "VeryLazy",
	config = function()
		require('lualine').setup({
			options = {
				icons_enabled = true,
				theme = "auto", --'pywal',
				component_separators = '•',
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = {
						"nnn",
						"dashboard",
						"packer",
						"alpha",
						"Lazy",
						"neotree",
						"nvimtree" }
				},
				always_divide_middle = true,
				globalstatus = false,
			},
			--extensions = {'lazy', 'mason'},
			sections = {
				lualine_a = {
					--			{ function() return icons.emojis.a end, separator = { right = 'nil' } },
					{ 'mode', separator = { right = '' }, right_padding = 1 },
				},
				lualine_b = {
					'branch', 'diff',
					{
						'diagnostics',
						-- symbols = {
						-- 	error = icons.diagnostics.Error,
						-- 	warn = icons.diagnostics.Warn,
						-- 	hint = icons.diagnostics.Hint,
						-- 	info = icons.diagnostics.Info,
						-- },
					},
				},
				lualine_c = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					--{ "filename", symbols = { modified = "  ", readonly = "", unnamed = "" } },
					--{ "require'lsp-status'.status()", separator = { right = '' }, right_padding = 1 },
					{ "filesize" }
				},
				lualine_x = {
					{
						require("noice").api.status.search.get,
						cond = require("noice").api.status.search.has,
						color = { fg = "#ff9e64" },
					},
				},
				lualine_y = {
					{ 'selectioncount' },
					{ 'progress' },
					{ 'location' },
				},
				lualine_z = {
					--{ function() return os.date("%R") end },
					require('tomato').message
				},
			},
			--	winbar = {
			--		lualine_z = { 'filename'}
			--	}
		})
	end,
}
