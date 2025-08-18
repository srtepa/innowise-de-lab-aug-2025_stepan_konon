SELECT
	e.employeeid,
	e.salary,
	CalculateAnnualBonus(e.employeeid, e.salary ) AS bonus-- посчитаем бонус для каждого работника
FROM employees e;