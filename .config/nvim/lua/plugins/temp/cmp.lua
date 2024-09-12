return {
	'hrsh7th/nvim-cmp',
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-path',
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*",
			build = "make install_jsregexp",
			config = function()
				-- Based on: https://github.com/MariaSolOs/dotfiles/blob/main/.config/nvim/lua/plugins/nvim-cmp.lua
				local luasnip = require("luasnip")

				vim.api.nvim_create_autocmd("ModeChanged", {
					group = vim.api.nvim_create_augroup("luasnip.config", { clear = true }),
					pattern = { "i:n", "s:n" },
					callback = function(e)
						if
								luasnip.session
								and luasnip.session.current_nodes[e.buf]
								and not luasnip.session.jump_active
								and not luasnip.choice_active()
						then
							luasnip.active_update_dependents()
							luasnip.unlink_current()
						end
					end,
				})
			end,
		},
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/cmp-nvim-lua',
	},
	config = function()
		local cmp = require('cmp')
		local lspkind = require('lspkind')
		cmp.setup {
			preselect = "None",
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require 'luasnip'.lsp_expand(args.body) -- Luasnip expand
				end,
			},
			view = {
				entries = "custom", -- can be "custom", "wildmenu" or "native"
				selection_order = "top_down",
			},
			window = {
				completion = { border = "rounded" }, --cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			-- Клавиши, которые будут взаимодействовать в nvim-cmp
			mapping = {

				-- Вызов меню автодополнения
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<CR>'] = cmp.config.disable,
				['<C-y>'] = cmp.mapping.confirm({ select = true }), -- А вот на <C-y> вполне ок

				-- Используем <C-e> для того чтобы прервать автодополнение
				['<C-e>'] = cmp.mapping({
					i = cmp.mapping.abort(), -- Прерываем автодополнение
					c = cmp.mapping.close(), -- Закрываем автодополнение
				}),
				['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
				['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
			},

			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },            -- LSP 👄
				{ name = 'nvim_lsp_signature_help' }, -- Помощь при введении параметров в методах 🚁
				{ name = 'luasnip' },             -- Luasnip 🐌
				{
					-- See: https://github.com/hrsh7th/cmp-buffer#all-buffers
					name = "buffer",
					option = {
						get_bufnrs = function()
							return vim.api.nvim_list_bufs()
						end,
					},
				},
				{ name = 'path' }, -- Пути 🪤
				{ name = "emoji" }, -- Эмодзи 😳
			}),
			formatting = {
				fields = {
					"kind",
					"abbr",
					"menu",
				},
				format = lspkind.cmp_format({
					mode = 'symbol', -- show only symbol annotations
					maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				})
			}
		}
	end
}
