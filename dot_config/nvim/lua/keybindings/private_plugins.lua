require('keybindings/utils')

vim.g.mapleader = ' ' -- Используем Space, как клавишу для альтернативных хотекеев

-- for cokeline
--local map = vim.api.nvim_set_keymap
--map('n', '<S-Tab>', '<Plug>(cokeline-focus-prev)', { silent = false })
----map('n', '<Tab>', '<Plug>(cokeline-focus-next)', { silent = false })
--map('n', '<F1>', '<Plug>(cokeline-switch-prev)', { silent = true })
--map('n', '<F2>', '<Plug>(cokeline-switch-next)', { silent = true })
--
--vim.keymap.set('n', '<tab>', function()
--	return ('<Plug>(cokeline-focus-%s)'):format(vim.v.count > 0 and vim.v.count or 'next')
--end, { silent = true, expr = true })
--

nm('<F4>', '<cmd>bd<CR>')             -- Закрыть буффер

 BufferLine
nm('<S-Tab>', '<cmd>BufferLineCyclePrev<CR>') -- Перейти в предыдущий буффер
nm('<Tab>', '<cmd>BufferLineCycleNext<CR>')   -- Перейти в следующий буффер
nm('<F1>', '<cmd>BufferLineMovePrev<CR>')     -- Переместить буффер влево
nm('<F2>', '<cmd>BufferLineMoveNext<CR>')     -- Переместить буффер вправо-- Trouble

-- LSP (все горячие клавиши начинаются с g), кроме ховера
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>')        -- Ховер для объекта
nm('gf', '<cmd>lua vim.lsp.buf.format()<CR>')      -- Форматировать документ
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>') -- Действия с кодом
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')      -- Переименовать объект

-- Открыть Nnn проводник
--nm('<leader>v', '<cmd>NnnExplorer %:p:h<CR>')
nm('<leader>v', '<cmd>NnnPicker %:p:h<CR>')

-- SessionManager
nm('<leader>Ss', '<cmd>SessionSave<CR>')

-- Telescope
nm('gd', '<cmd>Telescope lsp_definitions<CR>')     -- Объявления в LSP
nm('<leader>p', '<cmd>Telescope oldfiles<CR>')     -- Просмотр недавних файлов
nm('<leader>o', '<cmd>Telescope git_files<CR>')    -- Поиск файлов
nm('<leader>b', '<cmd>Telescope git_branches<CR>') -- Ветки в Git
nm('<leader>f', '<cmd>Telescope live_grep<CR>')    -- Поиск строки
nm('<leader>q', '<cmd>Telescope buffers<CR>')      -- Буфферы
nm('<leader>E', '<cmd>Telescope noice<CR>')        -- Буфферы

-- Git
nm('<leader>gp', '<cmd>Gitsigns preview_hunk<CR>')
nm('<leader>gb', '<cmd>Gitsigns blame_line<CR>')

-- SymbolsOutline
nm('<leader>cv', '<cmd>SymbolsOutline<CR>') -- Структура для файла

nm('<leader>s', '<cmd>:w!<CR>')

nm('<leader>x', '<cmd>TroubleToggle<CR>')     -- Открыть меню с проблемами LSP

-- nm('gr', '<cmd>Trouble lsp_references<CR>') -- Референсы в LSP

-- Packer
nm('<leader>PP', '<cmd>PackerSync<CR>')

-- Minimap
--    <leader>mo - open minimap
--    <leader>mc - close
--    <leader>mf - focus/unfocus
--    <leader>mm - toggle minimap

vim.keymap.set('n', '<leader>i', function()
	-- If we find a floating window, close it.
	local found_float = false
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		if vim.api.nvim_win_get_config(win).relative ~= '' then
			vim.api.nvim_win_close(win, true)
			found_float = true
		end
	end

	if found_float then
		return
	end

	vim.diagnostic.open_float(nil, { focus = false, scope = 'cursor' })
end, { desc = 'Toggle Diagnostics' })
