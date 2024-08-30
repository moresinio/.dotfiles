return {

		'nvim-treesitter/nvim-treesitter',
		event = "User FileOpened",
		lazy = true,
		config = function()

-- Включаем подсветку синтаксиса
require 'nvim-treesitter.configs'.setup {

	-- Нужные парсеры
	ensure_installed = { "bash", "lua", "cmake", "vim", "css", "json", "regex", "sql", "c", "cpp", "python", "markdown",
		"markdown_inline" },

	-- Устанавливать парсеры синхронно
	sync_install = false,

	-- Подсветка
	highlight = {
		-- Включить расшируение
		enable = true,
		disable = {},
	},

	indent = {
		-- Включить indent
		enable = true,
		disable = {},
	}
}
		end
	}
