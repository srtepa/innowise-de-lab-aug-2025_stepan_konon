select 
	first_name, --берем столбцы
	last_name, 
	o.amount
from 
	customers c 
left join 
	orders o --соединяем таблицы
	on c.customer_id = o.customer_id --по id
where  
	o.amount  = (--используем подзапрос для поиска максимального заказа
	select max(amount)
	from orders
	);