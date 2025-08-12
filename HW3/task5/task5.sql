select 
	country, --берем столбец и используем агрег. ф-ию
	count (*) 
from 
	customers c 
group by 
	country --группиркем по country
order by 
	country DESC;--сортируем в порядке убывания (Z-A)