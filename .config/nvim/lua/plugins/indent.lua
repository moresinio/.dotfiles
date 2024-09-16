return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	enabled = false,
	event = "UIEnter",
	config = function()
		require("ibl").setup {
			indent = { char = "▏" },
		}
	end,
}
