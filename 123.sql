//Вывести все операции по ApplePay, по которым не было возвратов.
Select shop.*
from shop
JOIN pay ON shop.id = pay.shop_id
where pay.status = 'REFUNDED'
group by shop.id;


//Вывести все магазины которые активны и URL содержит https. Должна быть сортировка по названию в обратном порядке.
select * from shop
where status = 'Activ' and url LIKE 'https%'
order by name desc;
