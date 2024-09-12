local map = vim.keymap.set

map("n", "<Leader>q", "<Cmd>qa<Cr>", { desc = "Close neovim" })
map("n", "<Leader>w", "<Cmd>w<Cr>", { desc = "Save file" })

map("n", "<C-h>", "<C-w>h", { desc = "Focus to left-side window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus to right-side window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus to top-side window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus to bottom-side window" })

map("n", "<Tab>", "<Cmd>bn<Cr>", { desc = "Go to next buffer" })
map("n", "<S-Tab>", "<Cmd>bp<Cr>", { desc = "Go to prev buffer" })

map("n", "<leader>\\", "<c-w>v", { desc = "Split window right" })

map("n", "S", '"_S', { desc = "'S' without copying to clipboard" })
map("n", "C", '"_C', { desc = "'C' without copying to clipboard" })
map("n", "D", '"_D', { desc = "'D' without copying to clipboard" })

local wk = require("which-key")
wk.add({
	{ "<leader>b",  group = "Buffers" },
	{ "<leader>bb", "<cmd>Telescope buffers<cr>",                                                     desc = "Buffers" },
	{ "<leader>;",  "<cmd>Alpha<CR>",                                                                 desc = "Dashboard" },
	{ "<leader>L",  "<cmd>Lazy<CR>",                                                                  desc = "Lazy" },
	{ "<leader>h",  "<cmd>nohlsearch<CR>",                                                            desc = "No Highlight" },

	{ "<leader>s",  group = "Search" },
	{ "<leader>sC", "<cmd>Telescope commands<cr>",                                                    desc = "Commands" },
	{ "<leader>sH", "<cmd>Telescope highlights<cr>",                                                  desc = "Find highlight groups" },
	{ "<leader>sM", "<cmd>Telescope man_pages<cr>",                                                   desc = "Man Pages" },
	{ "<leader>sR", "<cmd>Telescope registers<cr>",                                                   desc = "Registers" },
	{ "<leader>sb", "<cmd>Telescope git_branches<cr>",                                                desc = "Checkout branch" },
	{ "<leader>sc", "<cmd>Telescope colorscheme<cr>",                                                 desc = "Colorscheme" },
	{ "<leader>sf", "<cmd>Telescope find_files<cr>",                                                  desc = "Find File" },
	{ "<leader>sh", "<cmd>Telescope help_tags<cr>",                                                   desc = "Find Help" },
	{ "<leader>sk", "<cmd>Telescope keymaps<cr>",                                                     desc = "Keymaps" },
	{ "<leader>sl", "<cmd>Telescope resume<cr>",                                                      desc = "Resume last search" },
	{ "<leader>sp", "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", desc = "Colorscheme with Preview" },
	{ "<leader>sr", "<cmd>Telescope oldfiles<cr>",                                                    desc = "Open Recent File" },
	{ "<leader>st", "<cmd>Telescope live_grep<cr>",                                                   desc = "Text" },
})
