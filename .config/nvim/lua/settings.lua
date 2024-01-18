--[[ Переменные ]]
--
local opt = vim.opt

-- Глобальные переменные
local g = vim.g
local cmd = vim.cmd            -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript

vim.o.mousemoveevent = true
--vim.keymap.set('n', '<MouseMove>', function()
--	print(vim.inspect(vim.fn.getmousepos()))
--end)

--[[ Поиск ]]
--
-- Игнорировать регистр при поиске
-- Если теперь введем "IGNORE", то он найдет и "ignore"
opt.ignorecase = true

-- Не игнорировать регистр, если есть символы в верхнем регистре
-- Если напишем "Ignore", то он будет искать только "Ignore"
opt.smartcase = true

-- Подсвечивать найденные текстовые объекты
opt.showmatch = true

--[[ Настройка панелей ]]
--
-- Вертикальные сплиты становятся справа
-- По умолчанию панели в Neovim ставятся в зависимости от расположения текущей панели. Данная настройка поможет нам держать панели в порядке
opt.splitright = true

opt.signcolumn = "yes"

-- Горизонтальные сплиты становятся снизу
opt.splitbelow = false

--[[ Настройка табов ]]
--
-- Используем табы по умолчанию
-- Иногда при <CR> создаются пробелы в виде табов. Это отвратительно, поэтому отменим данное поведение
opt.expandtab = false

-- Установка количества пробельных символов, когда сдвигаем с помощью "<", ">"
-- По сути не смотря на expandtab в терминале все равно отображаются пробельные символы, поэтому установим их количество на одно нажатие этих кнопок
opt.shiftwidth = 2

-- 1 таб == 4 пробела c новой строки
-- При нажатии <CR> будут вставлять табы. Табы рисуются как пробелы. Именно поэтому мы должны установить что каждый таб в новой строке - 4 пробела
opt.tabstop = 2

-- Подстраивать новые строки под предыдущий отступ

opt.smartindent = true

--[[ Дополнительные настройки ]]
--
-- Используем системный буфер обмена
opt.clipboard = 'unnamedplus'

-- Отключаем дополнение файлов в конце
opt.fixeol = false

-- Автодополнение (встроенное в Neovim)
opt.completeopt = 'menuone,noselect'

-- Не автокомментировать новые линии при переходе на новую строку
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

-- Подсветка строки с курсором
opt.cursorline = true

-- Нумерация строк
opt.number = true

-- Относительная нумерация строк
opt.relativenumber = true

-- Курсор всегда в центре экрана
opt.so = 999

-- 24-bit RGB colors
opt.termguicolors = true

-- Blankline
opt.list = true
-- vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]

-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)
