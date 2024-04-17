local wk = require("which-key")
require("which-key").setup {
	window = {
		border = "rounded",     -- none, single, double, shadow
		position = "bottom",    -- bottom, top
		margin = { 1, 1, 1, 1 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
		padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,           -- value between 0-100 0 for fully opaque and 100 for fully transparent
		zindex = 1000,          -- positive value to position WhichKey above other floating windows.
	},
}

wk.register({
	["<leader>"] = {
		[";"] = { "<cmd>Alpha<CR>", "Dashboard" },
		["L"] = { "<cmd>Lazy<CR>", "Lazy" },
		["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
		q = {
			name = "+Quit or write",
			["w"] = { "<cmd>w!<CR>", "Save" },
			["q"] = { "<cmd>confirm q<CR>", "Quit" },
		},
		d = {
			name = "Debug",
			t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
			b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
			c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
			C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
			d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
			g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
			i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
			o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
			u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
			p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
			r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
			s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
			q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
			U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
		},
		s = {
			name = "Search",
			b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
			c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
			f = { "<cmd>Telescope find_files<cr>", "Find File" },
			h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
			H = { "<cmd>Telescope highlights<cr>", "Find highlight groups" },
			M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
			r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			R = { "<cmd>Telescope registers<cr>", "Registers" },
			t = { "<cmd>Telescope live_grep<cr>", "Text" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			C = { "<cmd>Telescope commands<cr>", "Commands" },
			l = { "<cmd>Telescope resume<cr>", "Resume last search" },
			p = {
				"<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>",
				"Colorscheme with Preview",
			},
		},
	},
})
