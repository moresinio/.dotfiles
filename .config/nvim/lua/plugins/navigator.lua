require 'navigator'.setup({
	debug = false, -- log output, set to true and log path: ~/.cache/nvim/gh.log
	-- slowdownd startup and some actions
	width = 0.75, -- max width ratio (number of cols for the floating window) / (window width)
	height = 0.3, -- max list window height, 0.3 by default
	preview_height = 0.35, -- max height of preview windows
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, -- border style, can be one of 'none', 'single', 'double',
	-- 'shadow', or a list of chars which defines the border
	-- on_attach = function(client, bufnr)
	--   -- your hook
	-- end,
	-- put a on_attach of your own here, e.g
	-- function(client, bufnr)
	--   -- the on_attach will be called at end of navigator on_attach
	-- end,
	-- The attach code will apply to all LSP clients

	ts_fold = {
		enable = false,
		comment_fold = true,                         -- fold with comment string
		max_lines_scan_comments = 20,                -- only fold when the fold level higher than this value
		disable_filetypes = { 'help', 'guihua', 'text' }, -- list of filetypes which doesn't fold using treesitter
	},                                             -- modified version of treesitter folding
	default_mapping = false,                        -- set to false if you will remap every key or if you using old version of nvim-
  keymaps = {

  { key = 'gr', func = require('navigator.reference').async_ref, desc = 'async_ref' },
  { key = '<Leader>gr', func = require('navigator.reference').reference, desc = 'reference' }, -- reference deprecated
  { mode = 'i', key = '<M-k>', func = vim.lsp.buf.signature_help, desc = 'signature_help' },
  { key = '<c-k>', func = vim.lsp.buf.signature_help, desc = 'signature_help' },
  { key = 'g0', func = require('navigator.symbols').document_symbols, desc = 'document_symbols' },
  { key = 'gW', func = require('navigator.workspace').workspace_symbol_live, desc = 'workspace_symbol_live' },
  { key = '<c-]>', func = require('navigator.definition').definition, desc = 'definition' },
  { key = 'gd', func = require('navigator.definition').definition, desc = 'definition' },
  { key = 'gD', func = vim.lsp.buf.declaration, desc = 'declaration' },
  { key = 'gt', func = vim.lsp.buf.type_definition, desc = 'type_definition' },
  { key = 'gp', func = require('navigator.definition').definition_preview, desc = 'definition_preview' },
  { key = 'gP', func = require('navigator.definition').type_definition_preview, desc = 'type_definition_preview' },
  { key = '<Leader>gt', func = require('navigator.treesitter').buf_ts, desc = 'buf_ts' },
  { key = '<Leader>gT', func = require('navigator.treesitter').bufs_ts, desc = 'bufs_ts' },
  { key = '<Leader>ct', func = require('navigator.ctags').ctags, desc = 'ctags' },
  { key = '<Space>ca', mode = 'n', func = require('navigator.codeAction').code_action, desc = 'code_action' },
  { key = '<Space>ca', mode = 'v', func = require('navigator.codeAction').range_code_action, desc = 'range_code_action' },
  -- { key = '<Leader>re', func = 'rename()' },
  { key = '<Space>rn', func = require('navigator.rename').rename, desc = 'rename' },
  { key = '<Leader>gi', func = vim.lsp.buf.incoming_calls, desc = 'incoming_calls' },
  { key = '<Leader>go', func = vim.lsp.buf.outgoing_calls, desc = 'outgoing_calls' },
  { key = 'gi', func = vim.lsp.buf.implementation, desc = 'implementation' },
  { key = '<Space>D', func = vim.lsp.buf.type_definition, desc = 'type_definition' },
  { key = 'gL', func = require('navigator.diagnostics').show_diagnostics, desc = 'show_diagnostics' },
  { key = 'gG', func = require('navigator.diagnostics').show_buf_diagnostics, desc = 'show_buf_diagnostics' },
  { key = '<Leader>dt', func = require('navigator.diagnostics').toggle_diagnostics, desc = 'toggle_diagnostics' },
  { key = ']d', func = vim.diagnostic.goto_next, desc = 'next diagnostics' },
  { key = '[d', func = vim.diagnostic.goto_prev, desc = 'prev diagnostics' },
  { key = ']O', func = vim.diagnostic.set_loclist, desc = 'diagnostics set loclist' },
  { key = ']r', func = require('navigator.treesitter').goto_next_usage, desc = 'goto_next_usage' },
  { key = '[r', func = require('navigator.treesitter').goto_previous_usage, desc = 'goto_previous_usage' },
  { key = '<C-LeftMouse>', func = vim.lsp.buf.definition, desc = 'definition' },
  { key = 'g<LeftMouse>', func = vim.lsp.buf.implementation, desc = 'implementation' },
  { key = '<Leader>k', func = require('navigator.dochighlight').hi_symbol, desc = 'hi_symbol' },
  { key = '<Space>wa', func = require('navigator.workspace').add_workspace_folder, desc = 'add_workspace_folder' },
  { key = '<Space>wr', func = require('navigator.workspace').remove_workspace_folder, desc = 'remove_workspace_folder' },
  { key = '<Space>ff', func = vim.lsp.buf.format, mode = 'n', desc = 'format' },
  { key = '<Space>ff', func = vim.lsp.buf.range_formatting, mode = 'v', desc = 'range format' },
  { key = '<Space>gm', func = require('navigator.formatting').range_format, mode = 'n', desc = 'range format operator e.g gmip' },
  { key = '<Space>wl', func = require('navigator.workspace').list_workspace_folders, desc = 'list_workspace_folders' },
  {
    key = '<Space>la', mode = 'n',
    func = require('navigator.codelens').run_action,
    desc = 'run code lens action',
  }
  -- stylua: ignore end
	}, -- e.g keymaps={{key = "GR", func = vim.lsp.buf.references}, } this replace gr default mapping
	treesitter_analysis = true,        -- treesitter variable context
	treesitter_navigation = true,      -- bool|table false: use lsp to navigate between symbol ']r/[r', table: a list of
	--lang using TS navigation
	treesitter_analysis_max_num = 100, -- how many items to run treesitter analysis
	treesitter_analysis_condense = true, -- condense form for treesitter analysis
	-- this value prevent slow in large projects, e.g. found 100000 reference in a project
	transparency = 0,                 -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil or 100 to disable it

	lsp_signature_help = false,        -- if you would like to hook ray-x/lsp_signature plugin in navigator
	-- setup here. if it is nil, navigator will not init signature help
	signature_help_cfg = nil,          -- if you would like to init ray-x/lsp_signature plugin in navigator, and pass in your own config to signature help
	icons = {                          -- refer to lua/navigator.lua for more icons config
		-- requires nerd fonts or nvim-web-devicons
		icons = true,
    -- Code Action (gutter, floating window)
    code_action_icon = '',

    -- Code Lens (gutter, floating window)
    code_lens_action_icon = '👓',

    -- Diagnostics (gutter)
    diagnostic_head = '🐛', -- prefix for other diagnostic_* icons
    diagnostic_err = '',
    diagnostic_warn = '',
    diagnostic_info = [[]],
    diagnostic_hint = [[]],

    -- Diagnostics (floating window)
    diagnostic_head_severity_1 = '🈲',
    diagnostic_head_severity_2 = '☣️',
    diagnostic_head_severity_3 = '👎',
    diagnostic_head_description = '👹', -- suffix for severities
    diagnostic_virtual_text = '🦊', -- floating text preview (set to empty to disable)
    diagnostic_file = '🚑', -- icon in floating window, indicates the file contains diagnostics

    -- Values (floating window)
    value_definition = '🐶🍡', -- identifier defined
    value_changed = '📝', -- identifier modified
    context_separator = '  ', -- separator between text and value

    -- Formatting for Side Panel
    side_panel = {
      section_separator = '󰇜',
      line_num_left = '',
      line_num_right = '',
      inner_node = '├○',
      outer_node = '╰○',
      bracket_left = '⟪',
      bracket_right = '⟫',
    },
    fold = {
      prefix = '⚡',
      separator = '',
    },

    -- Treesitter
    -- Note: many more node.type or kind may be available
    match_kinds = {
      var = ' ', -- variable -- "👹", -- Vampaire
      const = '󱀍 ',
      method = 'ƒ ', -- method --  "🍔", -- mac
      -- function is a keyword so wrap in ['key'] syntax
      ['function'] = '󰡱 ', -- function -- "🤣", -- Fun
      parameter = '  ', -- param/arg -- Pi
      parameters = '  ', -- param/arg -- Pi
      required_parameter = '  ', -- param/arg -- Pi
      associated = '🤝', -- linked/related
      namespace = '🚀', -- namespace
      type = '󰉿', -- type definition
      field = '🏈', -- field definition
      module = '📦', -- module
      flag = '🎏', -- flag
    },
    treesitter_defult = '🌲', -- default symbol when unknown node.type or kind
    doc_symbols = '', -- document
  },
	mason = true,    -- set to true if you would like use the lsp installed by williamboman/mason
	lsp = {
		enable = true, -- skip lsp setup, and only use treesitter in navigator.
		-- Use this if you are not using LSP servers, and only want to enable treesitter support.
		-- If you only want to prevent navigator from touching your LSP server configs,
		-- use `disable_lsp = "all"` instead.
		-- If disabled, make sure add require('navigator.lspclient.mapping').setup({bufnr=bufnr, client=client}) in your
		-- own on_attach
		code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
		code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
		document_highlight = true, -- LSP reference highlight,
		-- it might already supported by you setup, e.g. LunarVim
		format_on_save = false,     -- {true|false} set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
		-- table: {enable = {'lua', 'go'}, disable = {'javascript', 'typescript'}} to enable/disable specific language
		-- enable: a whitelist of language that will be formatted on save
		-- disable: a blacklist of language that will not be formatted on save
		-- function: function(bufnr) return true end to enable/disable lsp format on save
		format_options = { async = false },                -- async: disable by default, the option used in vim.lsp.buf.format({async={true|false}, name = 'xxx'})
		diagnostic = {
			underline = false,
			virtual_text = true,      -- show virtual for diagnostic message
			update_in_insert = false, -- update diagnostic message in insert mode
			float = {                 -- setup for floating windows style
				focusable = false,
				sytle = 'minimal',
				border = 'single',
				source = 'always',
				header = '',
				prefix = '',
			},
		},

		hover = {
			enable = true,
			keymap = {
				['<C-k>'] = {
					go = function()
						local w = vim.fn.expand('<cWORD>')
						vim.cmd('GoDoc ' .. w)
					end,
					default = function()
						local w = vim.fn.expand('<cWORD>')
						vim.lsp.buf.workspace_symbol(w)
					end,
				},
			},

			diagnostic_scrollbar_sign = false, -- experimental:  diagnostic status in scroll bar area; set to false to disable the diagnostic sign,
			--                for other style, set to {'╍', 'ﮆ'} or {'-', '='}
			diagnostic_virtual_text = true, -- show virtual for diagnostic message
			diagnostic_update_in_insert = false, -- update diagnostic message in insert mode
			display_diagnostic_qf = true, -- always show quickfix if there are diagnostic errors, set to false if you want to ignore it
			-- set to 'trouble' to show diagnositcs in Trouble
			ctags = {
				cmd = 'ctags',
				tagfile = 'tags',
				options = '-R --exclude=.git --exclude=node_modules --exclude=test --exclude=vendor --excmd=number',
			},
			lua_ls = {
				sumneko_root_path = vim.fn.expand("$HOME") .. "/github/sumneko/lua-language-server",
				sumneko_binary = vim.fn.expand("$HOME") .. "/github/sumneko/lua-language-server/bin/macOS/lua-language-server",
			},
			--servers = { 'cmake', 'ltex' }, -- by default empty, and it should load all LSP clients avalible based on filetype
			-- but if you whant navigator load  e.g. `cmake` and `ltex` for you , you
			-- can put them in the `servers` list and navigator will auto load them.
			-- you could still specify the custom config  like this
			-- cmake = {filetypes = {'cmake', 'makefile'}, single_file_support = false},
		}
	}
})
