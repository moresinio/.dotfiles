return {
	'Kevalin/tomato-timer.nvim',
	keys = {
		{ "<leader>ts", "<cmd>lua require('tomato').start_round()<CR>", desc = "Tomato timer start" },
		{ "<leader>tr", "<cmd>lua require('tomato').reset()<CR>",       desc = "Tomato timer reset" },
	},
}
