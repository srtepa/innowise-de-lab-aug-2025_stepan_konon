DELETE FROM employeeprojects --удалить из таблицы employeeprojects
WHERE employeeid = ( --где подзапрос
	SELECT --выбрать id
		employeeid
	FROM employees--из таблицы employees
	WHERE
		lastname = 'Prince');--где условие

--если мы захотим удалить из employees сотрудника, то
--у нас выдаст ошибку SQL Error [23503]: ERROR: update or delete on table "employees" 
--violates foreign key constraint "employeeprojects_employeeid_fkey" on table "employeeprojects"
--Подробности: Key (employeeid)=(4) is still referenced from table "employeeprojects".
--для избежания этого можно сначала удалить его из employeeprojects, а после из employees