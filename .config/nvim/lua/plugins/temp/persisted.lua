return {
	"olimorris/persisted.nvim",
	event = "VeryLazy",
	lazy = true,
	keys = { { '<leader>Ss', '<cmd>SessionSave<CR>', desc = "Session Save" } },
	config = function()
		require("persisted").setup({})
	end
}
