return {
	'windwp/nvim-autopairs',
	event = "InsertEnter",
	dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
	config = function()
		require('nvim-autopairs').setup {}
	end
}
