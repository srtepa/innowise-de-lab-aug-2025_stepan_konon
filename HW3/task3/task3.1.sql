select 
	first_name, --берем стобцы из таблицы customers
	last_name, 
	o.item, 
	o.amount
from 
	customers c 
left join 
	orders o -- делаем left join с таблицей orders
	on c.customer_id = o.customer_id --по id
order by 
	c.customer_id;--сортируем по id

--заметим, что нам выводятся также люди, которые ничего не покупали.
--если мы хотим видеть только тех, кто что-то купил - используем right join