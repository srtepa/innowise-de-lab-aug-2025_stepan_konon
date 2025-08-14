select 
	first_name||' '||last_name as full_name, --конкатируем столбцы в один
	country,
	count(o.customer_id) as total_orders,--кол-во заказов
	sum(o.amount ) as total_amount --общая сумма заказов
from customers c
left join orders o --делаем left join для сбора инфо: amount
on c.customer_id = o.customer_id 
left join shippings s --делаем второй left join для сбора инфо: 'Delivered'
on c.customer_id = s.customer 
group by --группируем по столбцам
	c.customer_id, 
	full_name, 
	c.country
having --проверяем условие
	count(o.customer_id)>=2
	and
	count(case when s.status = 'Delivered' then 1 end) >=1;
	