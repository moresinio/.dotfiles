return {
	"ptdewey/pendulum-nvim",
	enabled = false,
	event = "VeryLazy",
	config = function()
		require("pendulum").setup()
	end,
}
