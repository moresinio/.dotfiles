return {
	"neovim/nvim-lspconfig",
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
		local lspconfig = require('lspconfig')
		lspconfig.clangd.setup {
			settings = {
				['clangd'] = {
				},
			},
		}

		lspconfig.lua_ls.setup {
			settings = {
				['lua_ls'] = {
				},
			},
		}
		lspconfig.marksman.setup {
			settings = {
				['marksman'] = {
				},
			},
		}

		local signs = {
			Error = '',
			Warn = '',
			Hint = '',
			Info = '',
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end


		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
			vim.lsp.handlers.hover,
			{ border = 'rounded' }
		)
		vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
			vim.lsp.handlers.signature_help,
			{ border = 'rounded' }
		)

		vim.diagnostic.config({
			virtual_text = {
				prefix = '󰀨 '
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = false,
			float = {
				border = 'rounded',
				source = 'always',
				header = '',
				prefix = '',
			},
		})

		vim.o.updatetime = 700
		vim.api.nvim_create_autocmd("CursorHold", {
			buffer = bufnr,
			callback = function()
				local opts = {
					focusable = false,
					close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
					border = 'rounded',
					source = 'always',
					prefix = ' ',
					scope = 'cursor',
				}
				vim.diagnostic.open_float(nil, opts)
			end
		})
	end
}
