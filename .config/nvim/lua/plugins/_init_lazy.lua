local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup({
	{
		"Mofiqul/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme dracula]])
		end,
	},
	--------------------------------------------------------------------------------->
	{ 'rcarriga/nvim-notify' },
	{
		"EdenEast/nightfox.nvim",
		config = function()
			--vim.cmd([[colorscheme carbonfox]])
			require('nightfox').setup({
				options = {
					dim_inactive = true,
				},
			})
		end
	},
	--------------------------------------------------------------------------------->
	{
		"bluz71/vim-nightfly-colors", as = "nightfly"
	},
	--------------------------------------------------------------------------------->
	{
		'goolord/alpha-nvim',
		config = function()
			require('plugins.alpha')
		end,
	},
	--------------------------------------------------------------------------------->
	{
		"chaoren/vim-wordmotion",
	},
	--------------------------------------------------------------------------------->
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require('plugins.mason')
		end,
	},
	--------------------------------------------------------------------------------->
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require('plugins.mason-lspconfig')
		end,
	},
	--------------------------------------------------------------------------------->
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		lazy = true,
		keys = {
			{ 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', desc = "Code action" },

		},
		config = function()
			require('plugins/lspconfig')
		end
	},
	--------------------------------------------------------------------------------->
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("plugins.which-key")
		end,
	},
	--------------------------------------------------------------------------------->
	{
		"folke/neoconf.nvim",
		event = "VeryLazy",
		lazy = false,
		cmd = "Neoconf",
	},
	--------------------------------------------------------------------------------->
	{
		"folke/neodev.nvim",
		event = "VeryLazy",
		lazy = true,
	},
	{ 'nvim-tree/nvim-web-devicons' },
	--------------------------------------------------------------------------------->
	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		lazy = true,
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		event = "VeryLazy",
		config = function()
			require("plugins.lualine")
		end,
	},
	--------------------------------------------------------------------------------->
	--	{
	--		'akinsho/bufferline.nvim',
	--		event = "VeryLazy",
	--		lazy = true,
	--		keys = {
	--			{ "<Tab>",     "<cmd>BufferLineCycleNext<cr>", desc = "Buffer Next" },
	--			{ "<leader>Q", "<cmd>BufferLinePick<cr>",      desc = "Buffer Pick" },
	--			{ "<S-Tab>",   "<cmd>BufferLineCyclePrev<cr>", desc = "Buff Prev" },
	--			{ "<F4>",      "<cmd>bd<cr>",                  desc = "BuffClose" },
	--		},
	--		dependencies = { 'kyazdani42/nvim-web-devicons' },
	--		config = function()
	--			require('plugins/bufferline')
	--		end,
	--	},
	--------------------------------------------------------------------------------->
	{
		"luukvbaal/nnn.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>v", "<cmd>NnnPicker %:p:h<cr>", desc = "NnnPicker" }
		},
		config = function()
			require("plugins.nnn")
		end,
	},
	-------------------------------------	
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		}
	},
	--------------------------------------------------------------------------------->
	{
		'ray-x/navigator.lua',
		--event = "VeryLazy",
		lazy = false,
		dependencies = {
			{ 'ray-x/guihua.lua',               run = 'cd lua/fzy && make' },
			{ 'neovim/nvim-lspconfig' },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require 'navigator'.setup({
				mason = true,
				width = 0.75,      -- max width ratio (number of cols for the floating window) / (window width)
				height = 0.3,      -- max list window height, 0.3 by default
				preview_height = 0.35, -- max height of preview windows
				border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
			})
		end
	},
	--------------------------------------------------------------------------------->
	--	{
	--		"folke/trouble.nvim",
	--		event = "VeryLazy",
	--		lazy = true,
	--		dependencies = { "nvim-tree/nvim-web-devicons" },
	--		config = function()
	--			require("trouble").setup {}
	--		end,
	--	},
	--------------------------------------------------------------------------------->
	{
		'hrsh7th/nvim-cmp',
		event = "VeryLazy",
		lazy = true,
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-nvim-lua',
		},
		config = function()
			require('plugins.cmp')
		end
	},
	--------------------------------------------------------------------------------->
	{
		'onsails/lspkind-nvim',
		event = "VeryLazy",
		config = function()
			require('plugins.lspkind')
		end,
	},
	--------------------------------------------------------------------------------->
	{
		'nvim-treesitter/nvim-treesitter',
		event = "VeryLazy",
		lazy = true,
		config = function()
			require('plugins.tree-sitter')
		end
	},
	--------------------------------------------------------------------------------->
	{
		'windwp/nvim-autopairs',
		event = "VeryLazy",
		lazy = true,
		config = function()
			require('nvim-autopairs').setup {}
		end
	},
	--------------------------------------------------------------------------------->
	{
		'hiphish/rainbow-delimiters.nvim',
		event = "VeryLazy",
		lazy = true,
		dependencies = 'nvim-treesitter/nvim-treesitter',
		config = function()
			require('rainbow-delimiters')
		end
	},
	--------------------------------------------------------------------------------->
	{
		"potamides/pantran.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require('plugins.pantran')
		end,
	},
	--------------------------------------------------------------------------------->
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require('colorizer').setup {}
		end,
	},
	--------------------------------------------------------------------------------->
	{ 'powerman/vim-plugin-ruscmd', },
	--------------------------------------------------------------------------------->
	--	{
	--		'ggandor/leap.nvim',
	--		event = "VeryLazy",
	--		lazy = true,
	--		config = function()
	--			require('leap').create_default_mappings()
	--		end,
	--	},
	--------------------------------------------------------------------------------->
	--	{
	--		"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
	--		config = function()
	--			require('plugins.ibl')
	--		end,
	--	},
	{
		"shellRaining/hlchunk.nvim",
		event = "UIEnter",
		lazy = true,
		config = function()
			require("plugins.hlchunk")
		end,
	},
	--------------------------------------------------------------------------------->
	--	{
	--		"lewis6991/satellite.nvim",
	--		event = "VeryLazy",
	--		lazy = true,
	--		config = function()
	--			require("sattelite").setup()
	--		end
	--	},
	{
		"petertriho/nvim-scrollbar",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("scrollbar").setup()
		end
	},
	--------------------------------------------------------------------------------->
	{
		"ellisonleao/glow.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("glow").setup({
				border = "rounded",
			})
		end
	},
	--------------------------------------------------------------------------------->
	{
		"MunifTanjim/nui.nvim",
		config = function()
			require("plugins.nui")
		end
	},
	--Session save------------------------------------------------------------------->
	{
		"olimorris/persisted.nvim",
		event = "VeryLazy",
		lazy = true,
		keys = { { '<leader>Ss', '<cmd>SessionSave<CR>', desc = "Session Save" } },
		config = function()
			require("persisted").setup({})
		end
	},
	--------------------------------------------------------------------------------->
	{
		'nvim-telescope/telescope.nvim',
		lazy = false,
		keys = {
			{ "<leader>p", "<cmd>Telescope oldfiles<cr>", desc = "OldFiles" },
			{ "<leader>b", "<cmd>Telescope buffers<cr>",  desc = "Buffers" },
			{ '<leader>E', '<cmd>Telescope noice<CR>',    desc = "Errors" },
		},
		dependencies = { { 'nvim-lua/plenary.nvim' } },
		config = function()
			require("plugins.telescope")
		end
	},
	--------------------------------------------------------------------------------->
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		keys = {
			{ "<leader>n", "<cmd>NoiceHistory<cr>", desc = "Notification" },
		},
		dependencies = { { "MunifTanjim/nui.nvim" }, },
		config = function()
			require('plugins.noice')
		end,
	},
	--------------------------------------------------------------------------------->
	{
		"utilyre/barbecue.nvim",
		event = "VeryLazy",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
			exclude_filetypes = { "netrw", "nnn", "toggleterm" },
		},
	},
	---------------------------------------------------------------------------->
	{
		'willothy/nvim-cokeline',
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",     -- Required for v0.4.0+
			"kyazdani42/nvim-web-devicons", -- If you want devicons
		},
		keys = {
			{ "<F4>", "<cmd>bd<cr>", desc = "Buffer Close" }, -- other binds see in conf
		},
		config = function()
			require("plugins.cokeline")
		end,
	},

})
