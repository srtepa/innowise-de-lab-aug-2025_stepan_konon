select 
	s.status, --берем колонки 
	first_name, 
	last_name
from 
	customers c
left join 
	shippings s --делаем left join с сущностью shippings
	on c. customer_id =s. customer; --no customer_id