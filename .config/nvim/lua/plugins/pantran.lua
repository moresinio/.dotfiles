require('pantran').setup {
	default_engine = "argos",
	engines = {
		argos = {
			default_source = "auto",
			default_target = "ru"
		},
	},
}

local opts = { noremap = true, silent = true, expr = true }
local pantran = require("pantran")
vim.keymap.set("n", "<leader>tr", pantran.motion_translate, opts)
--vim.keymap.set("n", "<leader>trr", function() return pantran.motion_translate() .. "_" end, opts)
vim.keymap.set("x", "<leader>tr", pantran.motion_translate, opts)
