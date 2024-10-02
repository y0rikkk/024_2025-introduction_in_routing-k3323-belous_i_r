University: ITMO University

Faculty: FICT

Course: Introduction in routing

Year: 2024/2025

Group: K3323

Author: Belous Iaroslav Romanovich

Lab: Lab1

Date of create: 25.09.2024

Date of finished: 02.10.2024

# Лабораторная работ №1 "Установка ContainerLab и развертывание тестовой сети связи"

### Описание
В данной лабораторной работе вы познакомитесь с инструментом ContainerLab, развернете тестовую сеть связи, настроите оборудование на базе Linux и RouterOS.
### Цель работы
Ознакомиться с инструментом ContainerLab и методами работы с ним, изучить работу VLAN, IP адресации и т.д.
### Ход работы
###### 1. Создание топологии в ContainerLab:
#

```sh

name: enterprise-lab
mgmt:
  network: mgmt
  ipv4-subnet: 192.168.100.0/24

topology:
  nodes:
    R01.TEST:
      kind: vr-mikrotik_ros
      image: vrnetlab/vr-routeros:6.47.9
      mgmt-ipv4: 192.168.100.11
      startup-config: /home/y0rikk/Desktop/lab1/configs/Router1.rsc
    SW01.L3.01.TEST:
      kind: vr-mikrotik_ros
      image: vrnetlab/vr-routeros:6.47.9
      mgmt-ipv4: 192.168.100.22
      startup-config: /home/y0rikk/Desktop/lab1/configs/sw1.rsc
    SW02.L3.01.TEST:
      kind: vr-mikrotik_ros
      image: vrnetlab/vr-routeros:6.47.9
      mgmt-ipv4: 192.168.100.33
      startup-config: /home/y0rikk/Desktop/lab1/configs/sw2_1.rsc
    SW02.L3.02.TEST:
      kind: vr-mikrotik_ros
      image: vrnetlab/vr-routeros:6.47.9
      mgmt-ipv4: 192.168.100.44
      startup-config: /home/y0rikk/Desktop/lab1/configs/sw2_2.rsc
    PC1:
      kind: linux
      image: alpine:latest
      mgmt-ipv4: 192.168.100.55
    PC2:
      kind: linux
      image: alpine:latest
      mgmt-ipv4: 192.168.100.66

  links:
    - endpoints: ["R01.TEST:eth1", "SW01.L3.01.TEST:eth1"]
    - endpoints: ["SW01.L3.01.TEST:eth2", "SW02.L3.01.TEST:eth1"]
    - endpoints: ["SW01.L3.01.TEST:eth3", "SW02.L3.02.TEST:eth1"]
    - endpoints: ["SW02.L3.01.TEST:eth2", "PC1:eth1"]
    - endpoints: ["SW02.L3.02.TEST:eth2", "PC2:eth1"]

```

Конфигурции устройств можно найти в папке configs.

Проверим настройку каждого устройства в сети:

1. Router1

![Screenshot from 2024-10-01 22-09-17](https://github.com/user-attachments/assets/6725eb64-cc3d-4613-b0be-813af6431037)

2. Switch1

![Screenshot from 2024-10-01 22-09-36](https://github.com/user-attachments/assets/71e15a51-33cb-4ab7-9dfd-392781360def)

3. Switch2_1

![Screenshot from 2024-10-01 22-09-49](https://github.com/user-attachments/assets/f43664cd-ce3a-447e-a24b-0c43f8a0782e)

4. Switch2_2

![Screenshot from 2024-10-01 22-10-02](https://github.com/user-attachments/assets/fc4cba6b-0348-488c-800d-196f9c84ac45)


Как мы видим, все устройства настроены правильно и ошибок на этапе конфигурации не возникло.
Далее подключимся к PC1 и PC2 используя команды

```sh
    docker exec -it clab-enterprise-lab-PC1 sh
```

```sh
    docker exec -it clab-enterprise-lab-PC2 sh
```

Подключившись, получим IP адреса от нашего DHCP сервера с помощью следующих команд:

```sh
apk update
apk add busybox
udhcpc -i eth1
```

Результаты на скриншоте:

![Screenshot from 2024-10-01 21-47-10](https://github.com/user-attachments/assets/29086a6c-85cf-4be1-93d7-1830c8590be4)

Итак, IP наших устройств (их можно узнать с помощью /ip address print):

```
[admin@Router1] > ip address print 
Flags: X - disabled, I - invalid, D - dynamic 
 #   ADDRESS            NETWORK         INTERFACE                                                                                                      
 0   172.31.255.30/30   172.31.255.28   ether1                                                                                                         
 1   192.168.10.1/24    192.168.10.0    vlan10                                                                                                         
 2   192.168.20.1/24    192.168.20.0    vlan20 

[admin@sw01] > ip address print 
Flags: X - disabled, I - invalid, D - dynamic 
 #   ADDRESS            NETWORK         INTERFACE                                                                                                      
 0   172.31.255.30/30   172.31.255.28   ether1                                                                                                         
 1 D 192.168.20.254/24  192.168.20.0    bridge2                                                                                                        
 2 D 192.168.10.254/24  192.168.10.0    bridge1 

[admin@sw02_1] > ip address print 
Flags: X - disabled, I - invalid, D - dynamic 
 #   ADDRESS            NETWORK         INTERFACE                                                                                                      
 0   172.31.255.30/30   172.31.255.28   ether1                                                                                                         
 1 D 192.168.10.253/24  192.168.10.0    bridge1  

[admin@sw02_2] > ip address print   
Flags: X - disabled, I - invalid, D - dynamic 
 #   ADDRESS            NETWORK         INTERFACE                                                                                                      
 0   172.31.255.30/30   172.31.255.28   ether1                                                                                                         
 1 D 192.168.20.253/24  192.168.20.0    bridge2

pc1: 192.168.10.252

pc2: 192.168.20.252
```

Результаты пингов с PC2 (с PC1 будет зеркальная ситуация):

![Screenshot from 2024-10-01 22-06-53](https://github.com/user-attachments/assets/0dfce0be-6e74-429e-b810-81a68f5e524c)

Результаты пингов с Switch2_2 (с Switch2_1 будет зеркальная ситуация):

![Screenshot from 2024-10-01 22-08-55](https://github.com/user-attachments/assets/0351f01c-60e7-482e-9f45-4cb5f566c9b5)

Мы видим, что с компьютера проходят пинги в устройства своего Vlan, но не проходят в другие. Со свитча пинги проходят так же по своему Vlan, до другого свитча, но не до компьютера в другом Vlan.

Добавим пользователя для первого роутера:

![Screenshot from 2024-10-01 22-12-06](https://github.com/user-attachments/assets/8975301f-65a0-4ddf-a6a9-8bfbe6ca8896)

Протестируем:

![Screenshot from 2024-10-01 22-12-14](https://github.com/user-attachments/assets/4ed8c8c5-8179-417b-a299-b6da4f3bcdf7)

Посмотрим на диаграмму топологии с помощью команды 

```sh
containerlab graph -t
```

![Screenshot from 2024-10-01 22-14-36](https://github.com/user-attachments/assets/f8e0b553-890f-432e-b2d4-0933a2231384)

Схему связи можно найти в этой же директории репозитория.

## Вывод ##
В ходе лаборраторной работы была развернута сеть в ConainerLab из роутера, трех коммутаторов и двух пк. Мы настроили vlan и dhcp сервер для раздачи ip адресов и добавили пользователя для роутера. Результаты пингов подтвердили работоспособность сети.
