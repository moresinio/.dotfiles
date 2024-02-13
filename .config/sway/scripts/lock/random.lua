#!/usr/bin/env lua

-- Функция для получения списка файлов в директории
local function get_files_in_directory(directory)
	local files = {}
	for file in io.popen('ls -p "' .. directory .. '"'):lines() do
		table.insert(files, file)
	end
	return files
end

-- Функция для случайного выбора файла из списка
local function choose_random_file(files)
	return files[math.random(#files)]
end

-- Путь к домашней директории
local home = os.getenv("HOME")

-- Путь к папке, содержащей файлы
local directory_path = home .. "/Pictures"

-- Получаем список файлов в директории
local files = get_files_in_directory(directory_path)

-- Случайно выбираем один файл
local random_file = choose_random_file(files)

-- Заменяем часть пути к файлу на '$HOME' и добавляем в начало 'wallpaper='
local modified_path = 'wallpaper="' .. random_file:gsub(home, "$HOME") .. '"'

-- Записываем результат в другой файл
local output_file_path = home .. "./config/sway/scripts/lock/wall-source.sh"
local output_file = io.open(output_file_path, "w")
output_file:write(modified_path)
output_file:close()
