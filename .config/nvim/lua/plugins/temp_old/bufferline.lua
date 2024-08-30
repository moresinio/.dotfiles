return {
	"akinsho/bufferline.nvim",
	-- version = "*", -- Using master while fix of `tbl_islist` is not added to release
	event = "VeryLazy",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{ filetype = "neo-tree", text = "File Explorer" },
					{ filetype = "aerial",   text = "Document Symbols" },
				},
			},
		})
	end,
}
