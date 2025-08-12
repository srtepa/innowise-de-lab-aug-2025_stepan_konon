select 
	item, --берем столбец из таблицы и применяем агрегатные ф-ции
	count(item), 
	avg(amount)
from 
	orders
group by 
	item --группируем по item
order by 
	item;--cортируем
