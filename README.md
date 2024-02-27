# SQL
Тестовые данные таблицы

CREATE TABLE payments (<br>
  id bigint PRIMARY KEY,       --ID операции                      <br>
  status varchar(20) NOT NULL, --Статус операции  <br>
  amount number(10) NOT NULL,  --Сумма операции в копейках  <br>
  fee number(10) NOT NULL,     --Комиссия за операцию в копейках  <br>
  shop_id number(10) NOT NULL, --ID магазина<br>
  type_pay varchar(20)         --Типоперации<br>
);<br><br>

INSERT INTO payments (id, status, amount, fee, shop_id, type_pay) VALUES <br>
  (500, 'CONFIRMED', 10000, 3000, 211, 'ApplePay'), <br>
  (501, 'REFUNDED', 540000, 20000, 211, 'GooglePay'), <br>
  (502, 'CONFIRMED', 13281, 6934, 541, 'Card'), <br>
  (503, 'CONFIRMED', 75608, 8687, 344, 'ApplePay'), <br>
  (504, 'CONFIRMED', 53096, 3000, 781, 'GooglePay'), <br>
  (505, 'REFUNDED', 22438, 4226, 234, 'Card'), <br>
  (506, 'CONFIRMED', 74630, 3000, 189, 'ApplePay'), <br>
  (507, 'CONFIRMED', 41299, 1020, 189, 'GooglePay'), <br>
  (508, 'REFUNDED', 67691, 4795, 344, 'Card'), <br>
  (509, 'REFUNDED', 39166, 3702, 211, 'ApplePay'), <br>
  (510, 'CONFIRMED', 34126, 3442, 211, ''); <br><br><br>



CREATE TABLE shop ( <br>
  id bigint PRIMARY KEY,        --ID магазина <br>
  name varchar(50) NOT NULL,    --Название магазина <br>
  created date,                 --Дата создания магазина <br>
  status varchar(20) NOT NULL,  --Статус магазина <br>
  url varchar(250) NOT NULL     --URL адрес магазина <br>
);<br><br>
INSERT INTO shop (id, name, created, status, url) VALUES<br>
(211, 'Aples', '01.01.2022', 'Activ', 'https://Aples.com'),<br>
(212, 'Pepe', '01.01.2022', 'Delete', 'http://Pepe.com'),<br>
(541, 'Mamma-mia', '15.11.2020', 'Activ', 'https://Mamma-mia.com'),<br>
(555, 'OOOPS', '01.01.1970', 'Activ', 'http://OOOPS.ru'),<br>
(344, 'YES', '21.05.2000', 'Activ', 'https://YES.ru'),<br>
(234, 'uzoo', '11.07.2021', 'Delete', 'https://uzoo.com'),<br>
(189, 'WOW', '18.09.2021', 'Activ', 'https://wow.com'),<br>
(200, 'HA-HA', '01.04.2021', 'Activ', 'https://HA-HA.com'),<br>
(201, 'he_he', '01.04.2021', 'Activ', 'http://he_he.com'),<br>
(777, 'VIP', '07.07.2007', 'Activ', 'https://VIP.vip');<br>
