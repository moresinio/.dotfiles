return {
		"olimorris/persisted.nvim",
		keys = { { '<leader>Ss', '<cmd>SessionSave<CR>', desc = "Session Save" } },
		config = function()
			require("persisted").setup({})
		end
}
