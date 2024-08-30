return {
	"ellisonleao/glow.nvim",
	event = "VeryLazy",
	lazy = true,
	config = function()
		require("glow").setup({
			border = "rounded",
		})
	end
}
