require('noice').setup({
	cmdline = {
		enabled = true,
		view = "cmdline_popup",

	},
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
	},
	presets = {
		bottom_search = false,
		long_message_to_split = true,
		lsp_doc_border = true,
	},

	views = {
		cmdline_popup = {
			position = {
				row = "60%",
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
			border = {
				style = "rounded",
				padding = { 0, 0 },
			},
		},
		popupmenu = {
			enabled = true, -- enables the Noice popupmenu UI
			backend = "nui", -- backend to use to show regular cmdline completions
			relative = "editor",
			position = {
				row = "80%",
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 0 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
		commands = {
			history = {
				-- options for the message history that you get with `:Noice`
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp",      kind = "message" },
					},
				},
			},
		},
		markdown = {
			hover = {
				["|(%S-)|"] = vim.cmd.help,                   -- vim help links
				["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
			},
			highlights = {
				["|%S-|"] = "@text.reference",
				["@%S+"] = "@parameter",
				["^%s*(Parameters:)"] = "@text.title",
				["^%s*(Return:)"] = "@text.title",
				["^%s*(See also:)"] = "@text.title",
				["{%S-}"] = "@parameter",
			},
		},
	},
})
