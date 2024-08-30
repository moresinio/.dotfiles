return {
	'hiphish/rainbow-delimiters.nvim',
	event = "VeryLazy",
	lazy = true,
	dependencies = 'nvim-treesitter/nvim-treesitter',
	config = function()
		require('rainbow-delimiters')
	end
}
