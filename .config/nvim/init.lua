	-- Импортируем основные настройки
	require('settings')
	require("autocmd")

	-- Подключаем плагины
	require("init_lazy")
	--require("plugins.colorschemes")

	-- Подгружаем горячие клавиши
	--require('keybindings/main')


-- code
require('langmapper').automapping({ global = true, buffer = true })
-- end of init.lua