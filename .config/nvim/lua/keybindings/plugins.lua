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


