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
	{
		"Mofiqul/dracula.nvim",
		lazy = true,
		event = "VimEnter",
		priority = 1000,
		config = function()
			--vim.cmd([[colorscheme dracula]])
		end,
	},
	{
		'glepnir/zephyr-nvim',
		lazy = true,
		event = "VimEnter",
		config = function()
			--vim.cmd([[colorscheme zephyr]])
		end,
	},
	{
		"tiagovla/tokyodark.nvim",
		lazy = true,
		event = "VimEnter",
		opts = {
			-- custom options here
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			--vim.cmd [[colorscheme tokyodark]]
		end,
	},
	{
		"lmburns/kimbox",
		priority = 1000,
		config = function()
			require("kimbox").setup({
				style = "eerie" -- 'burnt_coffee', no 'cannon', 'used_oil', 'deep', 'zinnwaldite', 'eerie',
			})
			vim.cmd [[colorscheme kimbox]]
		end,
	},
	--------------------------------------------------------------------------------->
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
	--------------------------------------------------------------------------------->
	{
		'rcarriga/nvim-notify',
		lazy = false,
		config = function()
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
			require('plugins.notify')
		end
	},
	--------------------------------------------------------------------------------->
	{
		'goolord/alpha-nvim',
		event = "VimEnter",
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
		lazy = true,
		event = "User FileOpened",
		config = function()
			require('plugins.mason-lspconfig')
		end,
	},
	--------------------------------------------------------------------------------->
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		dependencies = { "nlsp-settings.nvim" },
		keys = {
			{ '<leader>D',  '<cmd>lua vim.diagnostic.open_float()<cr>',  desc = "Diagnostic" },
			{ '[d',         '<cmd>lua vim.diagnostic.goto_prev()<cr>',   desc = "Prev diagnostic" },
			{ ']d',         '<cmd>lua vim.diagnostic.goto_next()<cr>',   desc = "Next diagnostic" },
			{ 'ga',         '<cmd>lua vim.lsp.buf.code_action()<cr>',    desc = "Code action" },
			{ 'gr',         '<cmd>lua vim.lsp.buf.rename()<cr>',         desc = "Rename" },
			{ 'gR',         '<cmd>lua vim.lsp.buf.references()<cr>',     desc = "References" },
			{ '<leader>ff', '<cmd>lua vim.lsp.buf.format()<cr>',         desc = "Format" },
			{ 'gD',         '<cmd>lua vim.lsp.buf.declaration()<cr>',    desc = "Declaration" },
			{ 'gd',         '<cmd>lua vim.lsp.buf.definition()<cr>',     desc = "Definition" },
			{ 'K',          '<cmd>lua vim.lsp.buf.hover()<cr>',          desc = "Hover" },
			{ 'gi',         '<cmd>lua vim.lsp.buf.implementation()<cr>', desc = "Implementation" },
			{ '<C-k>',      '<cmd>lua vim.lsp.buf.signature_help()<cr>', desc = "help" },
		},
		config = function()
			require('plugins/lspconfig')
		end
	},
	{ "tamago324/nlsp-settings.nvim",             cmd = "LspSettings",                                                                                                                   lazy = true },
	--------------------------------------------------------------------------------->
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
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
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
		end
	},
	--------------------------------------------------------------------------------->
	{
		'nvim-tree/nvim-web-devicons',
		lazy = true,
	},
	--------------------------------------------------------------------------------->
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		event = "VimEnter",
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
	--	{
	--		"nvim-neo-tree/neo-tree.nvim",
	--		branch = "v3.x",
	--		dependencies = {
	--			"nvim-lua/plenary.nvim",
	--			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	--			"MunifTanjim/nui.nvim",
	--			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	--		}
	--	},
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
		'hrsh7th/nvim-cmp',
		event = { "InsertEnter", "CmdlineEnter" },
		lazy = true,
		dependencies = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			-- 'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-nvim-lua',
		},
		config = function()
			require('plugins.cmp')
		end
	},
	{ 'L3MON4D3/LuaSnip',                    lazy = true },
	{ 'saadparwaiz1/cmp_luasnip',            lazy = true },
	{ 'hrsh7th/cmp-nvim-lsp',                lazy = true },
	{ 'hrsh7th/cmp-path',                    lazy = true },
	{ 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
	{ 'hrsh7th/cmp-nvim-lua',                lazy = true },
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
		event = "User FileOpened",
		lazy = true,
		config = function()
			require('plugins.tree-sitter')
		end
	},
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
	--{
	--	"aveplen/ruscmd.nvim",
	--	lazy = false,
	--	config = function()
	--		require('ruscmd').setup {}
	--	end,
	--},
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
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require('plugins.ibl')
		end,
	},
	--- {
	--- 	"shellRaining/hlchunk.nvim",
	--- 	event = "UIEnter",
	--- 	lazy = true,
	--- 	config = function()
	--- 		require("plugins.hlchunk")
	--- 	end,
	--- },
	--------------------------------------------------------------------------------->
	--	{
	--		"lewis6991/satellite.nvim",
	--		event = "VeryLazy",
	--		lazy = true,
	--	 -- config = function()
	--	 -- 	require("sattelite").setup()
	--	 -- end
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
		lazy = true,
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
		lazy = true,
		dependencies = { { 'nvim-lua/plenary.nvim' }, "telescope-fzf-native.nvim" },
		keys = {
			{ "<leader>o", "<cmd>Telescope oldfiles<cr>", desc = "OldFiles" },
			{ "<leader>B", "<cmd>Telescope buffers<cr>",  desc = "Buffers" },
			{ '<leader>E', '<cmd>Telescope noice<CR>',    desc = "Errors" },
		},
		config = function()
			require("plugins.telescope")
		end
	},
	{ "nvim-lua/plenary.nvim", cmd = { "PlenaryBustedFile", "PlenaryBustedDirectory" }, lazy = true },
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
	---------------------------------------------------------------------------->
	{
		"p00f/clangd_extensions.nvim",
	},
	---------------------------------------------------------------------------->
	{
		'mfussenegger/nvim-dap',
		lazy = true,
		dependencies = {
			"rcarriga/nvim-dap-ui",
		},
		config = function()
			require('plugins.dap')
		end
	},
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		config = function()
			require("dapui").setup()
		end
	},
	{
		'theHamsta/nvim-dap-virtual-text',
		lazy = true,
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
})

-- for telescope-fzf-native.nvim:
require('telescope').load_extension('fzf')
-- for langmapper
--require('langmapper').automapping({ global = true, buffer = true })
