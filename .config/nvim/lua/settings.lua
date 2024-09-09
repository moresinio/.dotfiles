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
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

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
-- Используем табы по умолчанию
-- Иногда при <CR> создаются пробелы в виде табов. Это отвратительно, поэтому отменим данное поведение
opt.expandtab = false

-- Установка количества пробельных символов, когда сдвигаем с помощью "<", ">"
-- По сути не смотря на expandtab в терминале все равно отображаются пробельные символы, поэтому установим их количество на одно нажатие этих кнопок
opt.shiftwidth = 2

-- 1 таб == 2 пробела c новой строки
-- При нажатии <CR> будут вставлять табы. Табы рисуются как пробелы. Именно поэтому мы должны установить что каждый таб в новой строке - 4 пробела
opt.tabstop = 2

-- Подстраивать новые строки под предыдущий отступ
opt.smartindent = true

opt.showmode = false --

--[[ Дополнительные настройки ]]
--
-- Используем системный буфер обмена
opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- Отключаем дополнение файлов в конце
opt.fixeol = false

-- Автодополнение (встроенное в Neovim)
opt.completeopt = "menu,preview"

opt.shiftround = true
opt.smartindent = true             -- Instert indent automatically
opt.undolevels = 10000
opt.virtualedit = "block"          -- Allow cursor to move where there is not text in visual block mode
opt.wildmode = "longest:full,full" -- Command line completion mode
opt.smoothscroll = true

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
opt.list = false
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"
