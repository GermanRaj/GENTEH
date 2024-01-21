--  1 уровень сложности: Используйте базу данных learn;
-- Таблицы goods и goods_two
-- Вывести информацию о товарах и их стоимости.
-- Результатом должна быть таблица с названием товара(из goods), его стоимость(из goods_two) и признак наличия на складе (из goods)

use learn;

SELECT * FROM goods;
SELECT * FROM goods_two;

SELECT
t1.title,
t2.price,
t1.in_stock
FROM goods t1
INNER JOIN goods_two t2
ON t1.title = t2.title;

-- Используйте базу данных airport(скрипт есть в репозитории);
-- 2.Вывести информацию в одну таблицу о клиентах(поля id, name,) и о билетах, которые они купили (поля id(билета),price,service_class)

use airport;

SELECT *
FROM clients;

SELECT *
FROM tickets;

SELECT
t1.id,
t1.name,
t2.id,
t2.price,
t2.service_class
FROM trips t1
INNER JOIN tickets t2
ON t1.id = t2.client_id;



-- 3.Вывести информацию в одну таблицу о билетах (поля id(билета),price,service_class) и информацию откуда и куда была совершена поездка(departure, arrival)
SELECT *
FROM trips;

SELECT *
FROM tickets;

SELECT
t1.id,
t1.price,
t1.service_class,
t2.departure,
t2.arrival
FROM tickets t1
INNER JOIN trips t2
ON t1.trip_id = t2.id;

-- 4.Вывести информацию о самолетах, которые никуда не летали.

SELECT *
FROM airliners;


SELECT t1.*
FROM airliners t1
LEFT JOIN trips t2 ON t1.id = t2.airliner_id
WHERE t2.airliner_id IS NULL;

-- 5.Вывести информацию о клиентах, которые никуда не летали.

SELECT t1.*
FROM clients t1
LEFT JOIN tickets t2 ON t1.id = t2.client_id
WHERE t2.clien_id IS NULL;



-- 6.** Вывести всю информацию о клиентах, билетах которые они купил и поездках которую они совершил (join трех таблиц)

SELECT * FROM clients;
SELECT * FROM tickets;
SELECT * FROM trips;

SELECT 
t1.id,
t1.name,
t1.phone,
t1.age,
t2.id,
t2.service_class,
t2.price,
t3.trip_code,
t3.departure,
t3.arrival,
t3.status,
t3.airliner_id
FROM clients t1
INNER JOIN tickets t2
ON t1.id = t2.client_id
INNER JOIN trips t3
ON t2.trip_id = t3.id
 

