CREATE VIEW IT_Department_View AS --создать представление
SELECT
    employeeid,--выбрать столбцы
    lastname,
    salary
FROM employees --из таблицы
WHERE department = 'IT';--к которых департамент IT