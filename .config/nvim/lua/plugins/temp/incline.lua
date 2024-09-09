return 
	{
		'b0o/incline.nvim',
		enabled = false,
		config = function()
			require('incline').setup()
		end,
		-- Optional: Lazy load Incline
		event = 'VeryLazy',
	}
