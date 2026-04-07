# Part 1. Инструмент ipcalc

## 1.1. Сети и маски

1. Ответ: 192.160.0.0

2. Ответ:
   - Префикс: /24, двоичная запись: 1111111111.11111111.111111.00000000
   - Обычная: 255.254.0.0, двоичная: 1111111111.11111110.00000000.00000000 
   - Обычная: 255.255.255.240, префиксная: /28 

3. Минимальный и максимальный хост в сети 12.167.38.4 при маске /8:
   - HostMin: 12.0.0.1
   - HostMax: 12.255.255.254  

   При маске 11111111.11111111.00000000.00000000:
   - HostMin: 12.167.0.1  
   - HostMax: 12.167.255.254

   При маске 255.255.254.0:
   - HostMin:   12.167.38.1 
   - HostMax:   12.167.39.254

   При маске /4:
   - HostMin: 0.0.0.1 
   - HostMax: 15.255.255.254

## 1.2. localhost

- 194.34.23.100 — нет
- 127.0.0.2 — да
- 127.1.0.1 — да
- 128.0.0.1 — нет

## 1.3. Диапазоны и сегменты сетей

1) Публичные: 
- 134.43.0.2
- 172.0.2.1
- 192.172.0.1
- 172.68.0.2
- 192.169.168.1

   Частные:
- 10.0.0.45 
- 192.168.4.2
- 172.20.250.4
- 172.16.255.255
- 10.10.10.10

2) У сети 10.10.0.0/18 возможны IP-адресов шлюза:
- 10.10.0.2
- 10.10.10.10
- 10.10.1.255

Невозможны:
- 10.0.0.1
- 10.10.100.1

# Part 2. Статическая маршрутизация между двумя машинами

## Просмотр существующих сетевых интерфейсов с помощью команды `ip a`

**Просмотр сетевых интерфейсов у ws1**

![Просмотр сетевых интерфейсов у ws1](screenshot_part2_ws1.png)

**Просмотр сетевых интерфейсов у ws2**

![Просмотр сетевых интерфейсов у ws2](screenshot_part2_ws2.png)

## Создала внутреннюю сеть на обеих машинах и задала следующие адреса и маски: ws1 — 192.168.100.10, маска /16, ws2 — 172.24.116.8, маска /12

**Содержание файла `/etc/netplan/00-installer-config.yaml` на ws1 после изменений**

![Содержание netplan на ws1](screenshot_part2_netplan_ws1.png)

**Содержание файла `/etc/netplan/00-installer-config.yaml` на ws2 после изменений**

![Содержание netplan на ws2](screenshot_part2_netplan_ws2.png)

## Выполнила команду `netplan apply` для перезапуска сервиса сети

**Выполнение команды `netplan apply` на ws1**

![Применение netplan на ws1](screenshot_part2_apply_ws1.png)

**Выполнение команды `netplan apply` на ws2**

![Применение netplan на ws2](screenshot_part2_apply_ws2.png)

## 2.1. Добавление статического маршрута вручную и пинг от одной машины до другой и обратно

**Добавление маршрута и результат пинга с ws1 до ws2**

![Пинг ws1 -> ws2](screenshot_part2_ping_ws1_to_ws2.png)

**Добавление маршрута и результат пинга с ws2 до ws1**

![Пинг ws2 -> ws1](screenshot_part2_ping_ws2_to_ws1.png)

## 2.2. Добавление статического маршрута с сохранением

**Содержание файла `/etc/netplan/00-installer-config.yaml` на ws1 после добавления маршрута**

![Netplan ws1](screenshot_part2_2_netplan_ws1.png)

**Содержание файла `/etc/netplan/00-installer-config.yaml` на ws2 после добавления маршрута**

![Netplan ws2](screenshot_part2_2_netplan_ws2.png)

**Проверка соединения: пинг с ws1 до ws2 (172.24.116.8)**

![Пинг ws1 -> ws2](screenshot_part2_2_ping_ws1.png)

**Проверка соединения: пинг с ws2 до ws1 (192.168.100.10)**

![Пинг ws2 -> ws1](screenshot_part2_2_ping_ws2.png)

# Part 3. Утилита iperf3

## 3.1. Скорость соединения

- 8 Mbps = 1 MB/s
- 100 MB/s = 800 000 Kbps
- 1 Gbps = 1000 Mbps

## Измерила скорость соединения между ws1 и ws2 с помощью `iperf3`

## 3.2. Утилита iperf3

**Запуск сервера iperf3 на ws1**

![Сервер на ws1](screenshot_part3_iperf3_server_ws1.png)

**Запуск клиента на ws2 и измерение скорости до ws1 (192.168.100.10)**

![Клиент ws2 -> ws1](screenshot_part3_iperf3_client_ws2_to_ws1.png)

**Запуск сервера iperf3 на ws2**

![Сервер на ws2](screenshot_part3_iperf3_server_ws2.png)

**Запуск клиента на ws1 и измерение скорости до ws2 (172.24.116.8)**

![Клиент ws1 -> ws2](screenshot_part3_iperf3_client_ws1_to_ws2.png)

# Part 4. Сетевой экран

## 4.1. Утилита iptables

**Содержимое файла `/etc/firewall.sh` на ws1**

![Содержимое firewall.sh на ws1](screenshot_part4_firewall_ws1.png)

**Содержимое файла `/etc/firewall.sh` на ws2**

![Содержимое firewall.sh на ws2](screenshot_part4_firewall_ws2.png)

**Запуск скрипта на ws1**

![Запуск firewall.sh на ws1](screenshot_part4_run_ws1.png)

**Запуск скрипта на ws2**

![Запуск firewall.sh на ws2](screenshot_part4_run_ws2.png)

## Описание разницы между стратегиями

На `ws1` применена стратегия «сначала запрет, потом разрешение» для `echo reply`: первое правило в OUTPUT запрещает ответ на ping, поэтому машина не пингуется.  
На `ws2` стратегия обратная — «сначала разрешение, потом запрет»: разрешающее правило срабатывает первым, поэтому ping проходит, а запрет игнорируется.

Порядок правил в `iptables` определяет результат: приоритет имеет первое подходящее правило.

## 4.2. Утилита nmap

**Пинг с ws2 до ws1 — машина не отвечает (блокировка echo-reply на ws1)**

![Пинг ws2 → ws1](screenshot_part4_ping_ws2_to_ws1.png)

**Проверка nmap: хост ws1 запущен, несмотря на блокировку ping**

![Nmap ws1](screenshot_part4_nmap_ws2_to_ws1.png)

# Part 5. Статическая маршрутизация сети

## 5.1. Настройка адресов машин

## Настройка конфигурации машин в `/etc/netplan/00-installer-config.yaml`

**Рабочая станция ws11**

![netplan ws11](screenshot_part5_1_netplan_ws11.png)

**Рабочая станция ws21**

![netplan ws21](screenshot_part5_1_netplan_ws21.png)

**Рабочая станция ws22**

![netplan ws22](screenshot_part5_1_netplan_ws22.png)

**Роутер r1**

![netplan r1](screenshot_part5_1_netplan_r1.png)

**Роутер r2**

![netplan r2](screenshot_part5_1_netplan_r2.png)

## Перезапуск сети с помощью `sudo netplan apply` и  проверка назначенных IP-адресов `ip -4 a`

**Рабочая станция ws11**

![ip -4 a ws11](screenshot_part5_1_ip_ws11.png)

**Рабочая станция ws21**

![ip -4 a ws21](screenshot_part5_1_ip_ws21.png)

**Рабочая станция ws22**

![ip -4 a ws22](screenshot_part5_1_ip_ws22.png)

**Роутер r1**

![ip -4 a r1](screenshot_part5_1_ip_r1.png)

**Роутер r2**

![ip -4 a r2](screenshot_part5_1_ip_r2.png)

## Проверка доступности (ping)

**Пинг с ws21 до ws22**

![ping ws21 → ws22](screenshot_part5_1_ping_ws21_to_ws22.png)

**Пинг с ws11 до роутера r1**

![ping ws11 → r1](screenshot_part5_1_ping_ws11_to_r1.png)

## 5.2 Включение переадресации IP-адресов

**Вызов и вывод команды `sysctl -w net.ipv4.ip_forward=1` на r1**

![sysctl cmd r1](screenshot_part5_2_sysctl_cmd_r1.png)

**Вызов и вывод команды `sysctl -w net.ipv4.ip_forward=1` на r2**

![sysctl cmd r2](screenshot_part5_2_sysctl_cmd_r2.png)

**Изменённый файл `/etc/sysctl.conf` на r1**

![sysctl conf r1](screenshot_part5_2_sysctl_conf_r1.png)

**Изменённый файл `/etc/sysctl.conf` на r2**

![sysctl conf r2](screenshot_part5_2_sysctl_conf_r2.png)

## 5.3 Установка маршрута по умолчанию

**Содержание `/etc/netplan/00-installer-config.yaml` на ws11:**

![netplan ws11](screenshot_part5_3_netplan_ws11.png)

**Содержание `/etc/netplan/00-installer-config.yaml` на ws21:**

![netplan ws21](screenshot_part5_3_netplan_ws21.png)

**Содержание `/etc/netplan/00-installer-config.yaml` на ws22:**

![netplan ws22](screenshot_part5_3_netplan_ws22.png)

**Вывод `ip r` на ws11:**

![ip r ws11](screenshot_part5_3_ip_r_ws11.png)

**Вывод `ip r` на ws21:**

![ip r ws21](screenshot_part5_3_ip_r_ws21.png)

**Вывод `ip r` на ws22:**

![ip r ws22](screenshot_part5_3_ip_r_ws22.png)

**Пинг с ws11 до r2:**

![ping ws11 to r2](screenshot_part5_3_ping_ws11_to_r2.png)

**Захват пакетов на r2 с помощью команды `tcpdump -tn -i enp0s9`**

![tcpdump r2](screenshot_part5_3_tcpdump_r2.png)

## 5.4 Добавление статических маршрутов

**Содержание `/etc/netplan/00-installer-config.yaml` на r1:**

![netplan r1](screenshot_part5_4_netplan_r1.png)

**Содержание `/etc/netplan/00-installer-config.yaml` на r2:** 

![netplan r2](screenshot_part5_4_netplan_r2.png)

**Вывод `ip r` на r1:**

![ip r r1](screenshot_part5_4_ip_r_r1.png)

**Вывод `ip r` на r2:**

![ip r r2](screenshot_part5_4_ip_r_r2.png)


**Запросы маршрутов к сети 10.10.0.0/18 и к 0.0.0.0/0 на ws11:**

![ip r list ws11](screenshot_part5_4_ip_r_list_ws11.png)

### Объяснение выбора маршрута

При наличии нескольких маршрутов, покрывающих один и тот же адрес, предпочтение отдаётся маршруту с наиболее длинной маской — он точнее. Маршрут к сети 10.10.0.0/18 имеет маску 18, что длиннее, чем маска 0 у маршрута по умолчанию, поэтому используется именно он.

## 5.5. Построение списка маршрутизаторов

**Tcpdump -tnv -i enp0s8 на r1:**

![tcpdump r1](screenshot_part5_5_tcpdump_r1.png)

**Traceroute с ws11 до ws21:**

![traceroute ws11 to ws21](screenshot_part5_5_traceroute_ws11_to_ws21.png)

### Объяснение принципа работы построения пути при помощи traceroute

Утилита `traceroute` отправляет последовательность UDP-пакетов с увеличивающимися значениями TTL, начиная с 1. Каждый маршрутизатор на пути уменьшает TTL на 1, и при обнулении отправляет обратно ICMP-сообщение `Time Exceeded`.

Когда пакет достигает целевого хоста, последний отвечает ICMP-сообщением `Destination Port Unreachable` (так как используется редко занимаемый порт), что сигнализирует о завершении трассировки.

В полученном выводе `tcpdump` на r1 это подтверждается наличием UDP-пакетов от ws11 10.10.0.2 с TTL=1 и финальных ICMP-ответов от ws21 10.20.0.10 о недоступности порта, что доказывает корректную работу сети и маршрутизации.

## 5.6. Использование протокола ICMP при маршрутизации


**Запуск tcpdump на r1 и его вывод:**

![tcpdump r1](screenshot_part5_6_tcpdump_r1.png)


**Выполнение ping с ws11 на 10.30.0.111:**

![ping ws11](screenshot_part5_6_ping_ws11.png)


# Part 6. Динамическая настройка IP с помощью DHCP

## Настройка DHCP-сервера на r2

**Содержание `/etc/dhcp/dhcpd.conf` на r2:**

![dhcpd r2](screenshot_part6_dhcpd_r2.png)

**Содержание `/etc/resolv.conf` на r2:**

![resolv r2](screenshot_part6_resolv_r2.png)

**Перезапуск DHCP-сервера на r2:**

![systemctl restart r2](screenshot_part6_systemctl_restart_r2.png)

**Перезагрузка ws21:**

![reboot ws21](screenshot_part6_reboot_ws21.png)

**Вывод `ip a` на ws21:**

![ip a ws21](screenshot_part6_ip_a_ws21.png)

**Пинг с ws21 до ws22:**

![ping ws21 to ws22](screenshot_part6_ping_ws21_to_ws22.png)

## Настройка DHCP-сервера на r1

**Содержание `/etc/netplan/00-installer-config.yaml` на ws11:**

![netplan ws11 mac](screenshot_part6_netplan_ws11_mac.png)

**Содержание `/etc/dhcp/dhcpd.conf` на r1:**

![dhcpd r1](screenshot_part6_dhcpd_r1.png)

**Перезапуск DHCP-сервера на r1:**

![systemctl restart r1](screenshot_part6_systemctl_restart_r1.png)

**Вывод `ip a` на ws11:**

![ip a ws11](screenshot_part6_ip_a_ws11.png)

## Пример обновления IP-адреса на ws21

**Вывод `ip a` на ws21 до обновления:**

![ip before renew](screenshot_part6_ip_before_renew_ws21.png)

**Запрос нового IP-адреса на ws21:**

![dhclient ws21](screenshot_part6_dhclient_ws21.png)

**Вывод `ip a` на ws21 после обновления:**

![ip after renew](screenshot_part6_ip_after_renew_ws21.png)

Для обновления IP-адреса на ws21 использовались команды dhclient -r и dhclient. В конфигурации DHCP-сервера для выдачи параметров сети применялись опции option routers (шлюз) и option domain-name-servers (DNS).

# Part 7. NAT

## Настройка веб-сервера Apache

**Содержание `/etc/apache2/ports.conf` на r1:**

![ports conf r1](screenshot_part7_ports_conf_r1.png)

**Содержание `/etc/apache2/ports.conf` на ws22:**

![ports conf ws22](screenshot_part7_ports_conf_ws22.png)

**Запуск Apache на r1:**

![apache start r1](screenshot_part7_apache_start_r1.png)

**Запуск Apache на ws22:**

![apache start ws22](screenshot_part7_apache_start_ws22.png)


## Настройка фаервола на r2

**Содержание скрипта фаервола с правилами:**

![firewall r2 drop](screenshot_part7_firewall_r2_drop.png)

**Выдача прав и запуск фаервола на r2:**

![firewall apply r2](screenshot_part7_firewall_apply_r2.png)

**Пинг с ws22 до r1 (не должен проходить):**

![ping drop](screenshot_part7_ping_ws22_to_r1_drop.png)


## Добавление разрешения ICMP

**Содержание скрипта фаервола с добавленным правилом ICMP:**

![firewall r2 icmp](screenshot_part7_firewall_r2_icmp.png)

**Пинг с ws22 до r1 (успешный):**

![ping icmp](screenshot_part7_ping_ws22_to_r1_icmp.png)


## Добавление SNAT и DNAT

**Содержание скрипта фаервола с SNAT и DNAT:**

![firewall r2 nat](screenshot_part7_firewall_r2_nat.png)

**Проверка SNAT:**

![telnet snat](screenshot_part7_telnet_ws22_to_r1_snat.png)

**Проверка DNAT:**

![telnet dnat](screenshot_part7_telnet_r1_to_ws22_dnat.png)


# Part 8. Дополнительно. Знакомство с SSH Tunnels



**Изменение конфигурации Apache на ws22 `Listen localhost:80`:**

![ports_conf_ws22](screenshot_part8_ports_conf_ws22_localhost.png)

**Перезапуск Apache на ws22:**

![apache_restart_ws22](screenshot_part8_apache_restart_ws22.png)

**Local TCP forwarding с ws21 до ws22:**

![local_forwarding_ws21](screenshot_part8_local_forwarding_ws21.png)

**Проверка подключения с помощью команды `telnet 127.0.0.1` на ws21):**

![telnet_local_ws21](screenshot_part8_telnet_local_ws21.png)

**Remote TCP forwarding с ws11 до ws22:**

![remote_forwarding_ws11](screenshot_part8_remote_forwarding_ws11.png)

**Проверка подключения с помощью команды `telnet 127.0.0.1` на ws11):**

![telnet_remote_ws11](screenshot_part8_telnet_remote_ws11.png)
