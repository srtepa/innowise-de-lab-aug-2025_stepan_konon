BEGIN; --начало транзакции

INSERT INTO projects (projectid, projectname, budget, startdate, enddate)--создаем запись о проекте
VALUES (4, 'Data Analytics Platform', 180000, '2023-12-01', '2024-05-31');

INSERT INTO employeeprojects (employeeid, projectid, hoursworked)--вставить запись
SELECT employeeid, 4,
       CASE --сделаем выбор "сколько часов должен работать сотрудник из какого-то отдела должен работать"
           WHEN department = 'HR' THEN 160--если ... то
           WHEN department = 'Finance' THEN 140
           ELSE 120
       END AS hoursworked--в качестве часов работы
FROM (
    SELECT e.employeeid, e.department
    FROM employees e
    WHERE e.department IN ('HR', 'Finance')
    LIMIT 2
);

COMMIT;--конец транзакции