local icons = require('plugins.Ui.icons')
local mode_icon_map = {
	["NORMAL"] = "󰰓",
	["O-PENDING"] = "",
	["VISUAL"] = "󰰫",
	["V-LINE"] = "󰰬",
	["V-BLOCK"] = "󰰪",
	["V-REPLACE"] = "󰬝",
	["SELECT"] = "󰰢",
	["S-LINE"] = "󰰣",
	["S-BLOCK"] = "󰰡",
	["INSERT"] = "󰰄",
	["COMMAND"] = "󰯲",
	["EX"] = "󰰱",
	["REPLACE"] = "󰰟",
	["MORE"] = "󰰐",
	["CONFIRM"] = "󰯳",
	["SHELL"] = "󰰡",
	["TERMINAL"] = "󰰤",
}
local progress_cyrcle = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
  local chars = {
      "▱▱▱▱▱▱▱▱",
      "▱▱▱▱▱▱▱▰",
      "▱▱▱▱▱▱▰▰",
      "▱▱▱▱▱▰▰▰",
      "▱▱▱▱▰▰▰▰",
      "▱▱▱▰▰▰▰▰",
      "▱▱▰▰▰▰▰▰",
      "▱▰▰▰▰▰▰▰",
      "▰▰▰▰▰▰▰▰",
    }
	--local chars = { "", "󰪞", "󰪟", "󰪠", "󰪡", "󰪢", "󰪣", "󰪤", "󰪥" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)

	return chars[index]
end

return {
	'nvim-lualine/lualine.nvim',
	event = "VimEnter",
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = "auto", --'pywal',
				component_separators = "󰨐", --'󰨐•', ◈ { left = '', right = '' }, --'•',
				section_separators = { left = '', right = '' },
				disabled_filetypes = {
					statusline = { "dashboard", "lazy", "packer", "alpha" },
					winbar = { "alpha", "nnn", "neo-tree" } },
				always_divide_middle = true,
				globalstatus = true,
			},
			--extensions = { 'lazy', 'mason', "man", "neo-tree", "nvim-tree", "nvim-dap-ui" },
			sections = {
				lualine_a = {
					{ function() return icons.emojis.a end, separator = { right = 'nil' } },
					{
						function() -- mode view
							local mode_name_upper = require("lualine.utils.mode").get_mode()
							--local mode_name_lower = mode_name_upper:lower()
							local mode_icon_raw = mode_icon_map[mode_name_upper]
							local mode_icon_safety = mode_icon_raw == nil and "" or mode_icon_raw

							return mode_icon_safety -- .. " " .. mode_name_lower
						end,
					}
				},
				lualine_b = {
					{ 'branch' },
					{
						'diagnostics',
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							hint = icons.diagnostics.Hint,
							info = icons.diagnostics.Info,
						},
						sections = { 'error', 'warn', 'info', 'hint' },
					},
				},
				lualine_c = {
				},
				lualine_x = {
				},
				lualine_y = {
					--{ 'selectioncount' },
					--{ 'location' },
					{ 'progress' },
					{ progress_cyrcle,
						separator = " ",
						padding = { left = 1, right = 1 },
					},
				},
				lualine_z = {
					--{ function() return os.date("%R") end },
					require('tomato').message,
				},
			},

			winbar = {
				lualine_c = {
					{ function() return icons.ui.Circle end,
						--separator = { right = ' ' },
						color = "Question",
					},
					{
						'filename',
						path = 3,
						color = "Comment",
					}
				},
			},
			inactive_winbar = {
				lualine_c = {
					{ function() return icons.ui.Circle end,
						--separator = { right = ' ' },
						color = { bg = "Comment", }
					},
					{
						'filename',
						path = 3,
						color = "Comment",
					}
				},
			},
		}
	end,
}
