--  TASK 1 уровень сложности: 1) Создайте таблицу staff (
-- id целое число, 
-- name, строка
-- surname, строка
-- age, целое число
-- position - строка

use learn;

create table staff (
id integer,
name varchar(128),
surname varchar(128),
age integer,
position varchar(64)
);

-- TASK 2) Заполните таблицу значениями из 10 строк по примеру :

INSERT INTO staff (id, name, surname, age, position) VALUES (1,'Alex','Alexeev',24,'worker'), 
															 (2,'Stepan','Stepanov',18,'worker'),
                                                             (3,'Boris','Borisov',30,'security'),
                                                             (4,'Anatolijs','Tolikov',43,'administration'),
                                                             (5,'Valerij','Valerov',25,'security'),
                                                             (6,'Irina','Alexeeva',48,'administration'),
                                                             (7,'Andrew','Petrov',19,'worker'),
                                                             (8,'Agara','Evseeva',57,'security'),
                                                             (9,'Alexander','Fedorov',59,'administration'),
                                                             (10,'Gregoriy','Genadjev',61,'worker');
												

SELECT *
FROM staff;


-- TASK  3 Добавьте в уже готовую и заполненную таблицу поле salary - целое число.

ALTER TABLE staff
ADD salary integer;


-- TASK 4) Проставьте значение поля salary следующим образом :
-- если сотрудник категории worker - 1000
-- если сотрудник категории administration - 5000
-- если сотрудник категории security - 2000

SET SQL_SAFE_UPDATES = 0;

UPDATE staff
SET salary = 
  CASE 
    WHEN position = 'worker' THEN 1000
    WHEN position = 'administration' THEN 5000
    WHEN position = 'security' THEN 2000
  END;



-- TASK 5) Увеличьте всем сотрудникам зарплату в два раза.


UPDATE staff
SET salary  = salary*2;

-- TASK 6) Удалите из таблицы сотрудников, чей возраст больше чем 45.

DELETE FROM staff
WHERE age > 45;


-- TASK 7) Создайте три представления(view) : первое - хранит только сотрудников типа worker, второй - security,
-- третье administration

CREATE VIEW workerss AS
SELECT *
FROM staff
WHERE position = 'worker';

SELECT * FROM workerss;

CREATE VIEW securitys AS
SELECT *
FROM staff
WHERE position = 'security';

SELECT * FROM securitys;


CREATE VIEW administrations AS
SELECT *
FROM staff
WHERE position = 'administration';

SELECT * FROM administrations;



-- 8) Создайте новую таблицу на основе выборки из таблицы staff , которая будет хранить только name,surname,position
-- сотрудников , которые относятся к administration

CREATE TABLE staff_2 AS
SELECT 
name,
surname,
position
FROM staff
WHERE position = 'administration';

SELECT * FROm staff_2;


-- 9) Удалите колонку position из новой таблицы.

ALTER TABLE staff_2
DROP COLUMN position;

SELECT * FROM staff_2

