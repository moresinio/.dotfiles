return {
		"nvim-zh/colorful-winsep.nvim",
		config = true,
		event = { "WinNew" },
		opts = {
	  no_exec_files = { "packer", "neotree", "TelescopePrompt", "mason", "CompetiTest", "NvimTree" },
	  symbols = { "─", "│", "╭", "╮", "╰", "╯" },
		}
}
