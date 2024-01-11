local icons = require('plugins.icons')
require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = '•', --♥
		section_separators = { left = '', right = '' },
		disabled_filetypes = { statusline = { "nnn", "dashboard", "packer", "alpha" } },
		always_divide_middle = true,
		globalstatus = false,
	},
	sections = {
		lualine_a = {
			{ function() return "🦄" end, separator = { right = 'nil' } }, --♥
			{ 'mode', separator = { right = '' }, right_padding = 1 },
		},
		lualine_b = {
			'branch', 'diff',
			{
				'diagnostics',
				symbols = {
					error = icons.diagnostics.Error,
					warn = icons.diagnostics.Warn,
					hint = icons.diagnostics.Hint,
					info = icons.diagnostics.Info,
				},
			},
		},
		lualine_c = { 'lsp_progress',
			--{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
			{ "filename", symbols = { modified = "  ", readonly = "", unnamed = "" } },
			{ "require'lsp-status'.status()", separator = { right = '' }, right_padding = 1 },
			{ "filesize" }
		},
		lualine_x = {
		--	{
		--		require("noice").api.status.message.get_hl,
		--		cond = require("noice").api.status.message.has,
		--	},
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
		lualine_z = { function() return os.date("%R") end, },
	},
}
