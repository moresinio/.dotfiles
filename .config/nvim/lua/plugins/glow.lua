return {
	"ellisonleao/glow.nvim",
	cmd = "Glow",
	event = "VeryLazy",
	config = function()
		require("glow").setup({
			border = "rounded",
		})
	end
}
