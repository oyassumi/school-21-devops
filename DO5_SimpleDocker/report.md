## Part 1. Готовый докер

- Скачала официальный докер-образ nginx с помощью `docker pull`
- Проверила наличие докер-образа через `docker images`
- Создала и запустила контейнер на основе образа через `docker run -d [image_id]`
- Проверила запуск контейнера через `docker ps`
- Посмотрела информацию о контейнере через `docker inspect [container_id]`

![Вызов и вывод команд docker pull, docker images, docker run, docker ps, docker inspect](images/screenshot_part1_nginx.png) 


- По выводу `docker inspect` определила:
1. Размер контейнера

![Размер](images/screenshot_part1_size.png)

2. Список замапленных портов

![Порты](images/screenshot_part1_ports.png)

3. Ip контейнера

![IP](images/screenshot_part1_ip.png)


- Остановила докер контейнер через docker `stop [container_id]`
- Проверила остановку контейнера через `docker ps`

![Остановка и проверка](images/screenshot_part1_stop.png)


- Запустила докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду `run`

![Запуск с портами 80 и 443](images/screenshot_part1_run_80_443.png)


- Проверила, что в браузере по адресу localhost:80 доступна стартовая страница nginx

![Стартовая страница nginx](images/screenshot_part1_welcom_nginx.png)


- Перезапустила докер контейнер через `docker restart [container_id]`.

![Перезапуск контейнера](images/screenshot_part1_restart.png)


- Проверила, что контейнер перезапустился с помощью `docker ps`

![Проверка после перезапуска](images/screenshot_part1_status.png)


## Part 2. Операции с контейнером

- Прочитала конфигурационный файл nginx.conf внутри докер контейнера через команду `exec`

![Просмотр nginx.conf](images/screenshot_part2_exec.png)


- На локальной машине создала файл nginx.conf

![Создание файла nginx.conf](images/screenshot_part2_touch.png)


- По пути /status настроила отдачу страницы статуса сервера nginx

![Новый nginx.conf](images/screenshot_part2_new_conf.png)


- Скопировала созданный файл nginx.conf внутрь докер-контейнера через `docker cp`

![Копирование нового конфига в контейнер](images/screenshot_part2_cp.png)


- Перезапуск nginx внутри докер-контейнера через команду `exec`

![Перезапуск nginx](images/screenshot_part2_reload.png)


- Проверка отдачи странички со статусом сервера nginx в localhost:80/status

![Проверка странички status в браузере](images/screenshot_part2_status.png)


- Экспортировала контейнер в файл container.tar через команду `export`

![Экспорт контейнера в файл](images/screenshot_part2_tar.png)


- Остановила контейнер

![Остановка контейнера](images/screenshot_part2_stop.png)


- Попытка удаления образа через docker rmi [image_id] без удадения контейнера

![Попытка удаления образа без удаления контейнера](images/screenshot_part2_rmi.png)


- Принудительное удаление образа

![Принудительное удаление образа](images/screenshot_part2_rmi_f.png)


- Удалила остановленный контейнер

![Удаление контейнера](images/screenshot_part2_rm.png)


- Создала образ из файла container.tar через команду `import`

![Создание образа из файла](images/screenshot_part2_import.png)


- Создала и запустила контейнер на основе импортированного образа

![Запуск контейнера](images/screenshot_part2_run.png)


- Проверила, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

![Повторная проверка странички status в браузере](images/screenshot_part2_status2.png)
