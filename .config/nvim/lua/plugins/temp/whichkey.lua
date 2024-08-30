return {
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()

local wk = require("which-key")
require("which-key").setup {
}

wk.add({
    { "<leader>;", "<cmd>Alpha<CR>", desc = "Dashboard" },
    { "<leader>L", "<cmd>Lazy<CR>", desc = "Lazy" },
    { "<leader>d", group = "Debug" },
    { "<leader>dC", "<cmd>lua require'dap'.run_to_cursor()<cr>", desc = "Run To Cursor" },
    { "<leader>dU", "<cmd>lua require'dapui'.toggle({reset = true})<cr>", desc = "Toggle UI" },
    { "<leader>db", "<cmd>lua require'dap'.step_back()<cr>", desc = "Step Back" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", desc = "Continue" },
    { "<leader>dd", "<cmd>lua require'dap'.disconnect()<cr>", desc = "Disconnect" },
    { "<leader>dg", "<cmd>lua require'dap'.session()<cr>", desc = "Get Session" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", desc = "Step Into" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", desc = "Step Over" },
    { "<leader>dp", "<cmd>lua require'dap'.pause()<cr>", desc = "Pause" },
    { "<leader>dq", "<cmd>lua require'dap'.close()<cr>", desc = "Quit" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", desc = "Toggle Repl" },
    { "<leader>ds", "<cmd>lua require'dap'.continue()<cr>", desc = "Start" },
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle Breakpoint" },
    { "<leader>du", "<cmd>lua require'dap'.step_out()<cr>", desc = "Step Out" },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight" },
    { "<leader>q", "<cmd>confirm q<CR>", desc = "Quit" },
    { "<leader>s", group = "Search" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
    { "<leader>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
    { "<leader>w", "<cmd>w!<CR>", desc = "Save" },
}
)
		end,
	}
