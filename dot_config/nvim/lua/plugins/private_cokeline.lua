local get_hl_attr = require("cokeline.hlgroups").get_hl_attr
--require("buffers")
--local bg_color = get_hl_attr('Normal', 'fg')
local bg_color_active = get_hl_attr('lualine_a_normal', 'bg')
local fg_color_active = get_hl_attr('lualine_a_normal', 'fg')
local bg_color_inactive = get_hl_attr('Normal', 'bg')
local bg_color = get_hl_attr('Normal', 'bg')
require('cokeline').setup({
	show_if_buffers_are_at_least = 1,
	mappings = {
		cycle_prev_next = true
	},
	default_hl = {
		bg = function(buffer)
			if buffer.is_focused then
				return bg_color_active
			end
		end,
	},
	fill_hl = "Normal",
	components = {
		--separator
		{
			text = function(buffer)
				local _text = ''
				if buffer.index > 1 then _text = ' ' end
				if buffer.is_focused or buffer.is_first then
					_text = _text .. ''
				end
				return _text
			end,
			fg = function(buffer)
				if buffer.is_focused then
					return bg_color_active
				elseif buffer.is_first then
					return bg_color_inactive
				end
			end,
			bg = function(buffer)
				if buffer.is_focused then
					if buffer.is_first then
						return bg_color_inactive
					else
						return 'none' --bg_color
					end
				elseif buffer.is_first then
					return bg_color_inactive
				end
			end
		},
		--index
		--{
		--	text = function(buffer) return buffer.index .. ' ' end,
		--	style = 'italic',
		--},
		{
			text = function(buffer)
				local status = ''
				if buffer.is_readonly then
					status = ''
				end
				return status
			end,
		},
		{
			text = function(buffer)
				return " " .. buffer.devicon.icon
			end,
			fg = function(buffer)
				if buffer.is_focused then
					return buffer.devicon.color
				end
			end
		},
		{
			text = function(buffer)
				return buffer.unique_prefix .. buffer.filename
			end,
			fg = function(buffer)
				if (buffer.diagnostics.errors > 0) then
					return '#c9515b'
				end
			end,
			style = function(buffer)
				local text_style = 'NONE'
				if buffer.is_focused then
					text_style = 'bold'
				end
				if buffer.diagnostics.errors > 0 then
					if text_style ~= 'NONE' then
						text_style = text_style .. ',underline'
					else
						text_style = 'underline'
					end
				end
				return text_style
			end
		},
		{
			---@param buffer Buffer
			text = function(buffer)
				if buffer.is_modified then
					return " "
				end
				if buffer.is_hovered then
					return " 󰅙"
				end
				return " 󰅖"
			end, 
			fg = function(buffer)
				if buffer.is_modified then
					return '#5cc951' --'#c9515b'
				elseif (buffer.diagnostics.errors > 0) then
					return '#c9515b'
				else
					return bg_color_inactive
				end
			end,
			on_click = function(_, _, _, _, buffer)
				buffer:delete()
			end,
		},
		{
			text = function(buffer)
				if buffer.is_focused or buffer.is_last then
					return ''
				else
					return ' '
				end
			end,
			fg = function(buffer)
				if buffer.is_focused then
					return bg_color_active
				elseif buffer.is_last then
					return bg_color_inactive
				else
					return bg_color_inactive
				end
			end,
			bg = function(buffer)
				if buffer.is_focused then
					if buffer.is_last then
						return bg_color
					else
						return bg_color_inactive
					end
				elseif buffer.is_last then
					return bg_color_inactive
				end
			end
		}
	},
})
