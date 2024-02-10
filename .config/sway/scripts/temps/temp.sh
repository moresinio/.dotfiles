#!/bin/bash

# Генерация случайного цвета в формате #rrggbbaa
generate_color() {
    echo -n "#"
    for i in {1..4}; do
        echo -n $(printf "%02x" $((RANDOM % 256)))
    done
}

# Список переменных с цветами
variables=(
    "--inside-color"
    "--inside-clear-color"
    "--inside-caps-lock-color"
    "--inside-ver-color"
    "--inside-wrong-color"
    "--key-hl-color"
    "--layout-bg-color"
    "--layout-border-color"
    "--layout-text-color"
    "--line-color"
    "--line-clear-color"
    "--line-caps-lock-color"
    "--line-ver-color"
    "--line-wrong-color"
    "--ring-color"
    "--ring-clear-color"
    "--ring-caps-lock-color"
    "--ring-ver-color"
    "--ring-wrong-color"
    "--separator-color"
    "--text-color"
    "--text-clear-color"
    "--text-caps-lock-color"
    "--text-ver-color"
    "--text-wrong-color"
)

# Перебор переменных и присвоение случайного цвета
for var in "${variables[@]}"; do
    color=$(generate_color)
    echo "$var=$color"
done
