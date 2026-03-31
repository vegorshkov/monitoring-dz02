# monitoring-dz02
Домашнее задание к занятию 14 «Средство визуализации Grafana»

Шаг 0  создаем окружение

![alt text](image.png)

Примерная структура
Думаю реализовать, для открытия с хоста следующие сервисы:
http://localhost:9090 — Prometheus
http://localhost:9093 — Alertmanager
http://localhost:3000 — Grafana
http://localhost:9100 — node-exporter (метрики)

Запускаем сборку:
![alt text](image-1.png)
![alt text](image-2.png)
![alt text](image-3.png)

База подготовлена, переходим к заданиям.

![alt text](image-4.png)

Добавляем connection
![alt text](image-5.png)

![alt text](image-6.png)
![alt text](image-7.png)

![alt text](image-8.png)
![alt text](image-9.png)

Подключение корректное.


Добавим дашборд.

![alt text](image-10.png)

добавим визуализацию
![alt text](image-11.png)

Источник прометеус
![alt text](image-12.png)

Создаем запрос, оформляем панель
![alt text](image-13.png)

![alt text](image-14.png)

Создаем следующую новую панель на дашборде Load Average с тремя графиками
![alt text](image-15.png)

Выполняем настройку панели оперативной памяти, переводим единицы в настройках Unit в значение Гигабайты
![alt text](image-16.png)
![alt text](image-17.png)

Сейчас node_memory_MemAvailable_bytes, переводим это в % соотношение
(node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100
и unit меняем на  1-100%  Percent (0-100)
![alt text](image-18.png)

Настроим диск:
Получаем процент используемого места в % на диске.
(1 - (
  node_filesystem_avail_bytes{fstype!~"tmpfs|overlay", mountpoint="/"} 
  / 
  node_filesystem_size_bytes{fstype!~"tmpfs|overlay", mountpoint="/"}
)) * 100

![alt text](image-19.png)

проверяем:

![alt text](image-20.png)

![alt text](image-21.png)

