--[[
mason.nvim is optimized to load as little as possible during setup.
Lazy-loading the plugin, or somehow deferring the setup, is not recommended.
]]
return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗"
					},
					ui = {
						border = 'rounded',
					},
				}
			})
		end,
	},
--
	{
		"williamboman/mason-lspconfig.nvim",
		event = "User FileOpened",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd", "bash" }, -- "clangd", "marksman", "pyre", "lemminx",
				automatic_installation = false,
			})
		end,
	},
}
