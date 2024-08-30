return {
		"williamboman/mason.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		},
		ui = {
			border = 'rounded',
		},
	}
})
		end,
	}
