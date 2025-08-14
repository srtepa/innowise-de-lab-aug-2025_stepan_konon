select 
	order_id,--берем столбцы таблицы
	customer_id,
	item,
	amount,
	sum(amount) over(partition by o.customer_id) as total_by_customer--используем оконную ф-цию для подсчета
from 
	orders o
order by order_id;--сортируем по order_id

--почему partition by? он разделил на группы по customer_id и посчитал их тотал сумму заказов
--если бы мы взяли order by, то он бы просто отсортировал их по возрастанию и посчитал бы 
--нарастающий итог по порядку сортироки (что нам не подходит). поэтому в данной задаче был использован
--partition by
	
