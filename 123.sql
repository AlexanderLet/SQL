/*Вывести все операции по ApplePay, по которым не было возвратов.*/
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
