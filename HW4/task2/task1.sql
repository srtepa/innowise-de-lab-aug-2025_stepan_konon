CREATE TABLE departments (--создать таблицу departments
	departmentid SERIAL PRIMARY KEY,--задаем столбцы с ограниченими и PK
	departmentname VARCHAR(50) UNIQUE NOT NULL,
	location VARCHAR(50) 
);