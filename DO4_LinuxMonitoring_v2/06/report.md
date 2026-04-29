**Сортировка по коду ответа**

![HTTP status codes](images/screenshot_part6.1.png)

**Уникальные IP**

![All unique IP-addresses](images/screenshot_part6.2.png)

**Запросы с ошибками**

![All requests with errors](images/screenshot_part6.3.png)

**Уникальные IP среди ошибочных запросов**

![All unique IP-addresses found among the erroneous requests](images/screenshot_part6.4.png)

**Использовала команды:**

`goaccess ../04/nginx_log_*.log -o report.html --log-format=COMBINED`

`xdg-open report.html`

`awk '$9 ~ /^[45][0-9]{2}$/' ../04/nginx_log_*.log | goaccess --log-format=COMBINED -`
