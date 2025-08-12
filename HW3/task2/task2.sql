select 
	order_id, --берем столбцы из таблицы
	item, amount, 
	customer_id 
from 
	orders o--из таблицы
where 
	o. amount>1000; -- где условие