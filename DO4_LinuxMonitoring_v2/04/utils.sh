#!/bin/bash

# HTTP status codes:
# 200 OK — успешный запрос
# 201 Created — ресурс успешно создан
# 400 Bad Request — неверный запрос
# 401 Unauthorized — требуется авторизация
# 403 Forbidden — доступ запрещён
# 404 Not Found — ресурс не найден
# 500 Internal Server Error — ошибка сервера
# 501 Not Implemented — метод не поддерживается сервером
# 502 Bad Gateway — ошибка шлюза
# 503 Service Unavailable — сервис недоступен

generate_ip() {
  echo "$((RANDOM % 254 + 1)).$((RANDOM % 256)).$((RANDOM % 256)).$((RANDOM % 256))"
}

generate_method() {
    methods=("GET" "POST" "PUT" "PATCH" "DELETE")
    echo "${methods[$RANDOM % ${#methods[@]}]}"
}

generate_status() {
    statuses=(200 201 400 401 403 404 500 501 502 503)
    echo "${statuses[$RANDOM % ${#statuses[@]}]}"
}

generate_url() {
    urls=("/" "/index.html" "/api/data" "/login" "/logout" "/products" "/cart")
    echo "${urls[$RANDOM % ${#urls[@]}]}"
}

generate_agent() {
    agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
    echo "${agents[$RANDOM % ${#agents[@]}]}"
}
