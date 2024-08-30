return {
	"lewis6991/satellite.nvim",
	event = "VeryLazy",
	lazy = true,
	config = function()
		require("satellite").setup()
	end
}
