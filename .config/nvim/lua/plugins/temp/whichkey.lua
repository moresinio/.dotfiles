return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>d",  group = "DAP" },
			{ "<leader>b",  group = "Buffers" },
			{ "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
		},
		opts = {
			preset = "helix",
			win = {
				border = "rounded",
			},
		},
	},
}
