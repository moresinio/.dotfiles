local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require("lazy").setup({
	install = {
		-- install missing plugins on startup. This doesn't increase startup time.
		missing = false,
		-- try to load one of these colorschemes when starting an installation during startup
		--colorscheme = { "habamax" },
	},
	defaults = {
		lazy = true,
	},
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true,      -- get a notification when new updates are found
		frequency = 3600,   -- check for updates every hour
		check_pinned = false, -- check for pinned packages that can't be updated
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = false,
		notify = true, -- get a notification when changes are found
	},
	--spec = {
	--{ import = {},
	--	},
	--},

	--------------------------------------------------------------------------------->
	{
		"chaoren/vim-wordmotion",
	},
	--------------------------------------------------------------------------------->
	{
		"folke/neoconf.nvim",
		event = "VeryLazy",
		cmd = "Neoconf",
	},
	----------------------------------------------------------------------------------->
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
		end
	},
	--------------------------------------------------------------------------------->
	{
		'nvim-tree/nvim-web-devicons',
	},
	--------------------------------------------------------------------------------->
	{
	--------------------------------------------------------------------------------->
	--------------------------------------------------------------------------------->
	--	{
	--		'ray-x/navigator.lua',
	--		event = "VeryLazy",
	--		dependencies = {
	--			{ 'ray-x/guihua.lua',               run = 'cd lua/fzy && make' },
	--			{ 'neovim/nvim-lspconfig' },
	--			{ "nvim-treesitter/nvim-treesitter" },
	--		},
	--		config = function()
	--			require('plugins.navigator')
	--		end
	--	},
	--------------------------------------------------------------------------------->
	--	{
	--		"ray-x/lsp_signature.nvim",
	--		event = "VeryLazy",
	--		opts = {},
	--		config = function(_, opts) require 'lsp_signature'.setup(opts) end
	--	},
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
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		dependencies = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
		config = function()
			require('nvim-autopairs').setup {}
		end
	},
	--------------------------------------------------------------------------------->
	--------------------------------------------------------------------------------->
	-- {
	-- 	"potamides/pantran.nvim",
	-- 	event = "VeryLazy",
	-- 	lazy = true,
	-- 	config = function()
	-- 		require('plugins.pantran')
	-- 	end,
	-- },
	--------------------------------------------------------------------------------->
	{
	},
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
	--- {
	--- 	"shellRaining/hlchunk.nvim",
	--- 	event = "UIEnter",
	--- 	lazy = true,
	--- 	config = function()
	--- 		require("plugins.hlchunk")
	--- 	end,
	--- },
	--------------------------------------------------------------------------------->
	{
		"MunifTanjim/nui.nvim",
		config = function()
			require("plugins.nui")
		end
	},
	--------------------------------------------------------------------------------->
-- for telescope-fzf-native.nvim:
require('telescope').load_extension('fzf')
	--------------------------------------------------------------------------------->
	{
		"miversen33/sunglasses.nvim",
		event = "UIEnter",
		config = function()
			require('sunglasses').setup({
				filter_type = "NOSYNTAX",
				filter_percent = .55,
			})
		end
	},
	---------------------------------------------------------------------------->
	{ 'jdhao/better-escape.vim', event = 'InsertEnter' },
	---------------------------------------------------------------------------->
	{
		'mrjones2014/legendary.nvim',
		enabled = false,
		-- since legendary.nvim handles all your keymaps/commands,
		-- its recommended to load legendary.nvim before other plugins
		priority = 10000,
		lazy = false,
		-- sqlite is only needed if you want to use frecency sorting
		-- dependencies = { 'kkharji/sqlite.lua' }
	},
	---------------------------------------------------------------------------->
	{
		"p00f/clangd_extensions.nvim",
	},
	---------------------------------------------------------------------------->
	{
		'mfussenegger/nvim-dap',
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require('plugins.dap')
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		config = function()
			require("nvim-dap-virtual-text").setup()
		end
	},

	{
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
	},
	--------------------------------------------------------------------------------->
	--
	-- LOCAL
	--	
	--------------------------------------------------------------------------------->
	--{
	--	'akinsho/bufferline.nvim',
	--	dir = "/home/rengoku/.local/share/my_plugins/bufferline.nvim",
	--	version = "*",
	--	dependencies = 'nvim-tree/nvim-web-devicons',
	--	config = function()
	--		require("plugins.bufferline")
	--	end,
	--},
})

