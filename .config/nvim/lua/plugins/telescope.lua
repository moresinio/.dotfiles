local actions = require("telescope.actions")
require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				["`"] = actions.close
			},
		},
		layout_strategy = "horizontal",
		layout_config = {
			height = 0.95,
			width = 0.95,
			horizontal = {
				prompt_position = "bottom",
				preview_cutoff = 120,
			},
			vertical = {
				mirror = false,
				preview_cutoff = 10,
				prompt_position = "bottom",
				-- other layout configuration here
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,               -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case",   -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		}
	}
}
