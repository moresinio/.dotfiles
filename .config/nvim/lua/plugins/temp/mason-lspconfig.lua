return {
	"williamboman/mason-lspconfig.nvim",
	lazy = true,
	event = "User FileOpened",
	config = function()
		require("mason-lspconfig").setup {
			ensure_installed = { "lua_ls", }, -- "clangd", "marksman", "pyre", "lemminx",
			automatic_installation = false,
		}
	end,
}
