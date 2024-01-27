use hr;

-- 9.Вывести имя, фамилию и зарплату тех сотрудников, которые работают в городах Oxford и San Francisco
SELECT *
FROM employees;

SELECT * 
FROM locations;

SELECT *
FROM departments;

SELECT
t1.first_name,
t1.last_name,
t1.salary,
t3.city
FROM employees AS t1
INNER JOIN departments AS t2
ON t1.department_id = t2.department_id
INNER JOIN locations AS t3
ON t2.location_id = t3.location_id AND t3.city in ('Oxford','South San Francisco');


-- 10.Вывести имя, фамилию и город сотрудника

SELECT
t1.first_name,
t1.last_name,
t3.city
FROM employees AS t1
INNER JOIN departments AS t2
ON t1.department_id = t2.department_id
INNER JOIN locations AS t3
ON t2.location_id = t3.location_id;


-- 11.Вывести города и соответствующие городам страны

SELECT *
FROM countries;

SELECT
t1.city,
t2.country_name
FROM locations AS t1
INNER JOIN countries AS t2
ON t1.country_id = t2.country_id;


