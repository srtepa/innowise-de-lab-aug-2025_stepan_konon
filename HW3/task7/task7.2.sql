select 
	first_name,  -- берем столбцы
	age
from 
	customers--из таблицы customers
order by 
	age;--сортируем по возрасту по убыванию
--если убрать desc, то будет сортировка по возрастанию возраста