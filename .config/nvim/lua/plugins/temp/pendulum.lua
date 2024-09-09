return {
	"ptdewey/pendulum-nvim",
	event = "VeryLazy",
	config = function()
		require("pendulum").setup()
	end,
}
