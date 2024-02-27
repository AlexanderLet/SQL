Select shop.*
from shop
JOIN pay ON shop.id = pay.shop_id
where pay.status = 'REFUNDED'
group by shop.id;