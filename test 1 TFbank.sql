/*Тестовые таблицы*/

CREATE TABLE payments (
  id bigint PRIMARY KEY,       --ID операции
  status varchar(20) NOT NULL, --Статус операции
  amount number(10) NOT NULL,  --Сумма операции в копейках
  fee number(10) NOT NULL,     --Комиссия за операцию в копейках
  shop_id number(10) NOT NULL, --ID магазина
  type_pay varchar(20)         --Типоперации
);

INSERT INTO payments (id, status, amount, fee, shop_id, type_pay) VALUES
  (500, 'CONFIRMED', 10000, 3000, 211, 'ApplePay'),
  (501, 'REFUNDED', 540000, 20000, 211, 'GooglePay'),
  (502, 'CONFIRMED', 13281, 6934, 541, 'Card'),
  (503, 'CONFIRMED', 75608, 8687, 344, 'ApplePay'),
  (504, 'CONFIRMED', 53096, 3000, 781, 'GooglePay'),
  (505, 'REFUNDED', 22438, 4226, 234, 'Card'),
  (506, 'CONFIRMED', 74630, 3000, 189, 'ApplePay'),
  (507, 'CONFIRMED', 41299, 1020, 189, 'GooglePay'),
  (508, 'REFUNDED', 67691, 4795, 344, 'Card'),
  (509, 'REFUNDED', 39166, 3702, 211, 'ApplePay'),
  (510, 'CONFIRMED', 34126, 3442, 211, '');

CREATE TABLE shop (
  id bigint PRIMARY KEY,        --ID магазина
  name varchar(50) NOT NULL,    --Название магазина
  created date,                 --Дата создания магазина
  status varchar(20) NOT NULL,  --Статус магазина
  url varchar(250) NOT NULL     --URL адрес магазина
);

INSERT INTO shop (id, name, created, status, url) VALUES
  (211, 'Aples', '01.01.2022', 'Activ', 'https://Aples.com'),
  (212, 'Pepe', '01.01.2022', 'Delete', 'http://Pepe.com'),
  (541, 'Mamma-mia', '15.11.2020', 'Activ', 'https://Mamma-mia.com'),
  (555, 'OOOPS', '01.01.1970', 'Activ', 'http://OOOPS.ru'),
  (344, 'YES', '21.05.2000', 'Activ', 'https://YES.ru'),
  (234, 'uzoo', '11.07.2021', 'Delete', 'https://uzoo.com'),
  (189, 'WOW', '18.09.2021', 'Activ', 'https://wow.com'),
  (200, 'HA-HA', '01.04.2021', 'Activ', 'https://HA-HA.com'),
  (201, 'he_he', '01.04.2021', 'Activ', 'http://he_he.com'),
  (777, 'VIP', '07.07.2007', 'Activ', 'https://VIP.vip');


/*Выполнить задания:
Вывести все операции по ApplePay, по которым не было возвратов.*/
Select shop.*
from shop
JOIN pay ON shop.id = pay.shop_id
where pay.status = 'REFUNDED'
group by shop.id;


/*Вывести все магазины которые активны и URL содержит https. Должна быть сортировка по названию в обратном порядке.*/
select * from shop
where status = 'Activ' and url LIKE 'https%'
order by name desc;

/*Вывести все магазины у которых есть возвраты, должна быть группировка записей по ID магазина.*/
select shop.*
from shop
JOIN payments ON shop.id = payments.shop_id
where payments.status = 'REFUNDED'
group by shop.id

/*Вывести все магазины и все типы оплат, даже если у магазина нет оплаты. Сортировка должна быть по названию магазина и способу оплаты.*/
select shop.*, payments.type_pay
from shop
LEFT JOIN payments ON shop.id = payments.shop_id
Order by name, type_pay;

/*Обновить запись у магазина с названием VIP, поменять ему URL на https://VIP.com*/
update shop
set url = 'https://VIP.com'
where name = 'VIP';

/*Удалить запись об оплате, где нет типа оплаты.*/
delete from payments
where type_pay = '';

/*Добавить запись к магазинам, указать только обязательные параметры*/
INSERT INTO shop (id, name, status, url) 
VALUES
(256, 'Aples', 'Activ', 'https://Aples.com');

/*Посчитай количество по типам оплаты.*/
select count(type_pay), type_pay  
from payments
group by type_pay;

/*Посчитай сумму возвратов по магазину “Aples”*/
select SUM(payments.amount) As aples_refunded_sum
from shop
JOIN payments ON shop.id = payments.shop_id
where payments.status = 'REFUNDED' and shop.name =  'Aples'
group by shop.id;

/*Выведи средний чек(суммы операций) по магазину “Aples”*/
select AVG(payments.amount) As aples_amount_avg
from shop
JOIN payments ON shop.id = payments.shop_id
where shop.name = 'Aples';
