University: ITMO University

Faculty: FICT

Course: Introduction in routing

Year: 2024/2025

Group: K3323

Author: Belous Iaroslav Romanovich

Lab: Lab1

Date of create: 17.10.2024

Date of finished:

# Отчет по лабораторной работе №2 "Эмуляция распределенной корпоративной сети связи, настройка статической маршрутизации между филиалами" #

## Цель работы ##
Ознакомиться с принципами планирования IP адресов, настройке статической маршрутизации и сетевыми функциями устройств.

## Ход работы ##

Развернем нашу сеть, используя файл networklab2.clab.yaml:

![image](https://github.com/user-attachments/assets/30a8efb0-cce2-4548-a1bc-b626fde252e3)

Проверим, правильно ли настроилось каждое устройство согласно конфигурациям:

- Роутер в Москве:

![image](https://github.com/user-attachments/assets/b832d508-7127-4010-98dc-99c016eee9bc)

- Роутер во Франкфурте:

![image](https://github.com/user-attachments/assets/8f324a6e-ec8e-475e-9c75-8775acdd09cb)

- Роутер в Берлине:

![image](https://github.com/user-attachments/assets/652fc4fb-2434-4a58-9bdf-d6566367d511)

- Компьютер в Москве:

![Screenshot from 2024-10-21 17-49-49](https://github.com/user-attachments/assets/7c1788ba-bfa5-4498-b91b-a6005bb94261)

- Компьютер во Франкфурте:

![Screenshot from 2024-10-21 17-49-12](https://github.com/user-attachments/assets/048102fb-66b1-4503-b042-c78b5aeb6671)

- Компьютер в Берлине:

![Screenshot from 2024-10-21 17-48-53](https://github.com/user-attachments/assets/04a6ad2f-c5c0-4b33-9fb2-53a0635ed457)

Посмотрим, какие IP адреса получили наши комьютеры от своих DHCP серверов:

- Компьютер в Москве:

![image](https://github.com/user-attachments/assets/d9ed2d22-00f3-4cab-a0f1-3005e8d7c9e4)

- Компьютер во Франкфурте:

![image](https://github.com/user-attachments/assets/b826486d-2bcd-4d97-97ee-bad85a85bdc1)

- Компьютер в Берлине:

![image](https://github.com/user-attachments/assets/c97a6ae8-feb0-4878-ad60-f4198d2b7247)

Пропингуем все компьютеры:

- Компьютер в Москве:

![image](https://github.com/user-attachments/assets/80292e78-ec45-40d1-b1dd-aaac53ad8208)

- Компьютер во Франкфурте:

![image](https://github.com/user-attachments/assets/b52468d1-4d07-440b-bd6d-a123bfdc5954)

- Компьютер в Берлине:

![image](https://github.com/user-attachments/assets/4da9b6d1-c6bd-46ce-8147-f7d3a6404d92)

Как мы видим, все пинги проходят идеально, значит связь есть и всё настроено правильно.

Теперь поменяем пользователей на компьютерах:

![image](https://github.com/user-attachments/assets/4d79f47d-b391-4480-b279-1f2f7626c84b)

![image](https://github.com/user-attachments/assets/d8fc1517-b214-42fa-b21d-472f55b8c763)

На остальных компьютерах - аналогично.

Посмотрим на диаграмму топологии с помощью команды 

```sh
containerlab graph 
```

![image](https://github.com/user-attachments/assets/1ef3e6b3-88ca-4be4-a87c-5e2642c9357b)

## Вывод ##

В ходе лабораторной работы была построена сеть связи в трех геораспределенных офисах. Я ознакомился с принципами планирования IP адресов, настройкой статической маршрутизации и сетевыми функциями устройств. Помимо этого были созданы 3 DHCP сервера и изменены пользователи на комьютерах.
