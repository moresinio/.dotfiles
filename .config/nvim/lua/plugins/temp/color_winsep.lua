--local get_hl_attr = require("plugins.temp.Ui.hlgroups").get_hl_attr
return {
	"nvim-zh/colorful-winsep.nvim",
	config = true,
	event = { "WinNew" },
	opts = {
		no_exec_files = { "packer", "neotree", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
		symbols = { "─", "│", "╭", "╮", "╰", "╯" },
		hi = {
			--bg = "#16161E",
		},
	}
}
