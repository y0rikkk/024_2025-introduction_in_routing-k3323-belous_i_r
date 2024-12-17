University: ITMO University

Faculty: FICT

Course: Introduction in routing

Year: 2024/2025

Group: K3323

Author: Belous Iaroslav Romanovich

Lab: Lab4

Date of create: 14.12.2024

Date of finished: 

# Лабораторная работa №4 "Эмуляция распределенной корпоративной сети связи, настройка iBGP, организация L3VPN, VPLS" #

## Цель работы ##
Изучить протоколы BGP, MPLS и правила организации L3VPN и VPLS.
## Ход работы ##
### Первая часть ###
Воспользуемся файлом lab4.yml для развертывания сети

![image](https://github.com/user-attachments/assets/91972889-584c-4dbe-a13a-ab13aa34cf81)

1. Роутер (R01.NY)

![image](https://github.com/user-attachments/assets/9deb3e3d-fe4d-49d4-8cf7-e2ab731d1ee2)

2. Роутер (R01.LND)

![image](https://github.com/user-attachments/assets/f56ea66e-c471-4000-a1df-f6ca71fc9a96)

3. Роутер (R01.LBN)

![image](https://github.com/user-attachments/assets/bc4795c7-62d8-4d6c-b520-ccad54e287a6)

4. Роутер (R01.HKI)

![image](https://github.com/user-attachments/assets/1a9b4c26-d8d8-4ac0-b97e-8df6acea8b1a)

5. Роутер (R01.SVL)

![image](https://github.com/user-attachments/assets/12ba88a0-0f69-4243-9eb1-b6717f5272b3)

6. Роутер (R01.SPB)

![image](https://github.com/user-attachments/assets/65ff62f6-f39a-44e7-945b-2e631e217f24)

### Пинг VRF ###

![image](https://github.com/user-attachments/assets/c916bd3a-77f4-4f77-b1c6-e31f68cc89ac)

### Проверка BGP и VRF ###
![image](https://github.com/user-attachments/assets/d0a48274-7753-4344-ae10-b4d61795f9c9)

![image](https://github.com/user-attachments/assets/c0ab26ae-d6ec-4131-91fd-5bb1f9bb213d)

![image](https://github.com/user-attachments/assets/e54ef070-b96b-43c2-999d-10b3df1b7fde)

Также поменяем логин и пароль у R01.NY

![image](https://github.com/user-attachments/assets/9ffa445d-e563-4728-ac79-0b1a6a3c8f0a)

## Вторая часть ##
Первым делом разбираем VRF на R01.NY, R01.SPB и R01.SVL. Далее на этих роутерах настроили VPLS. Также настроили конфигурацию PC1, PC2 и PC3. 

1. Роутер (R01.NY)

![image](https://github.com/user-attachments/assets/db5526f9-08b6-4ee8-90df-7100a3f8a9a3)

2. Роутер (R01.SVL)

![image](https://github.com/user-attachments/assets/d687427d-8902-45a6-9a7e-661e8b248a94)

3. Роутер (R01.SPB)

![image](https://github.com/user-attachments/assets/a66adfb4-0d22-4f44-971e-104d9c72c6b4)

4. PC1

![image](https://github.com/user-attachments/assets/74c327ae-3f9f-414e-ad00-d4de3290730a)

5. PC2

![image](https://github.com/user-attachments/assets/a610a084-059b-42fd-9463-0221f71dc728)

6. PC3

![image](https://github.com/user-attachments/assets/1514df25-f18c-4dca-ab43-da7a047bef94)

### Проверим связь компьютеров ###

![image](https://github.com/user-attachments/assets/e5a61b45-9fec-4be1-8910-2ee27ebef429)

![image](https://github.com/user-attachments/assets/69154817-ae74-4460-b087-fc7516ea1358)

## Вывод ##
В ходе выполнения лабораторной работы №4, мы изучили BGP, MPLS и правила организации L3VPN и VPLS.В итоге мы получили рабочую сеть для компании "RogaIKopita Games".
