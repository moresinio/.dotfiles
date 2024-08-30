return {
	"dnlhc/glance.nvim",
	config = function()
		require('glance').setup({
			-- your configuration
			detached = false,
			border = {
				enable = true, -- Show window borders. Only horizontal borders allowed
				top_char = '>',
				bottom_char = '<',
			},
		})
	end,
}
