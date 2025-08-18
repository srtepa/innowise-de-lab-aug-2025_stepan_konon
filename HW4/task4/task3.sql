DELETE FROM employees --удалить сотрудников
WHERE employeeid NOT IN (--которые не входят в id 
	SELECT 
		employeeid
	FROM employeeprojects--в таблице
);