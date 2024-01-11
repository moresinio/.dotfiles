	-- Импортируем основные настройки
	require('settings')

	-- Выключаем встроенные плагины
	require('disable_builtins')

	-- Подключаем плагины
	require('plugins/_init_lazy')

	-- Подгружаем горячие клавиши
	--require('keybindings/main')