return
{
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
	event = "User DirOpened",
	config = function()
		require("nvim-tree").setup()
	end,
}
