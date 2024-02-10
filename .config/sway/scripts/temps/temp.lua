-- Функция для генерации случайного цвета в формате #rrggbbaa
local function generate_color()
    local color = "#"
    for i = 1, 4 do
        color = color .. string.format("%02x", math.random(0, 255))
    end
    return color
end

-- Список переменных с цветами
local variables = {
    "--inside-color",
    "--inside-clear-color",
    "--inside-caps-lock-color",
    "--inside-ver-color",
    "--inside-wrong-color",
    "--key-hl-color",
    "--layout-bg-color",
    "--layout-border-color",
    "--layout-text-color",
    "--line-color",
    "--line-clear-color",
    "--line-caps-lock-color",
    "--line-ver-color",
    "--line-wrong-color",
    "--ring-color",
    "--ring-clear-color",
    "--ring-caps-lock-color",
    "--ring-ver-color",
    "--ring-wrong-color",
    "--separator-color",
    "--text-color",
    "--text-clear-color",
    "--text-caps-lock-color",
    "--text-ver-color",
    "--text-wrong-color"
}

-- Перебор переменных и присвоение случайного цвета
for _, var in ipairs(variables) do
    local color = generate_color()
    print(var .. "=" .. color)
end
