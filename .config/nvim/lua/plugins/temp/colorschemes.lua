return {
	{	"Mofiqul/dracula.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[colorscheme dracula]])
	end,
},
	{
		"lmburns/kimbox",
		lazy = false,
		priority = 1000,
		config = function()
			require("kimbox").setup({
				style = "eerie" -- 'burnt_coffee', no 'cannon', 'used_oil', 'deep', 'zinnwaldite', 'eerie',
			})
		--	vim.cmd [[colorscheme kimbox]]
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.cmd [[colorscheme tokyonight]]
		end,
		opts = {
		}
	},
	{
		"neanias/everforest-nvim",
		version = false,
		lazy = false,
		priority = 1000, -- make sure to load this before all the other start plugins
		-- Optional; default configuration will be used if setup isn't called.
		config = function()
			require("everforest").setup({
				---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
				---Default is "medium".
				background = "soft", -- Your config here
				italics = false,
				--vim.cmd([[colorscheme everforest]])
			})
		end,
	},
}
