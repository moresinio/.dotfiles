return {
	"miversen33/sunglasses.nvim",
	event = "UIEnter",
	config = function()
		require('sunglasses').setup({
			filter_type = "NOSYNTAX",
			filter_percent = .40,
			excluded_filetypes = {
				"Glance",
			},
		})
	end
}
