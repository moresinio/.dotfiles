return {
	"miversen33/sunglasses.nvim",
	enabled = true,
	event = "UIEnter",
	config = function()
		require('sunglasses').setup({
			filter_type = "NOSYNTAX",
			filter_percent = .60,
			excluded_filetypes = {
				"Glance",
				"neo-tree",
				"help",
			},
		})
	end
}
