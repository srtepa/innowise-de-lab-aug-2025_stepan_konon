UPDATE employees--обновить таблицу
SET department = 'Senior IT'--установить новый департамент
WHERE salary>70000.00 AND department = 'IT';--у сотрудников IT, у которых зп>70000